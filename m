Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482D389D52
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:49:14 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbYX-00067h-Ky
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTM-0005DA-M8
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:52 -0400
Received: from mga06.intel.com ([134.134.136.31]:7413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTI-00075Z-PJ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:52 -0400
IronPort-SDR: zvxsxowZnXSbSNbsKaka1LGPgVNRWuP/cX2k0zisKgpDNZ0671vEYw4ekMqLtUJiKMvkoUrwwL
 dSKji7RQK/2A==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262370947"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262370947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:43:46 -0700
IronPort-SDR: cZqagD11VLjzvRbUJKGY9KOcyv4K/5+8Y9LtWZYrUvk5ioCiMlyXY9HtqzEq7i5y3jXfHMf0u9
 rQwx8W9shfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440160324"
Received: from michael-optiplex-9020.sh.intel.com ([10.239.159.172])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2021 22:43:44 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 5/6] target/i386: Add CET state support for guest migration
Date: Thu, 20 May 2021 13:57:10 +0800
Message-Id: <1621490231-4765-6-git-send-email-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621490231-4765-1-git-send-email-weijiang.yang@intel.com>
References: <1621490231-4765-1-git-send-email-weijiang.yang@intel.com>
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=weijiang.yang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save the MSRs being used on source machine and restore them
on destination machine.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/machine.c | 161 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index 137604ddb8..4d63340931 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1000,6 +1000,159 @@ static const VMStateDescription vmstate_umwait = {
     }
 };
 
+static bool u_cet_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->u_cet != 0;
+}
+
+static const VMStateDescription vmstate_u_cet = {
+    .name = "cpu/u_cet",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = u_cet_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.u_cet, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool s_cet_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->s_cet != 0;
+}
+
+static const VMStateDescription vmstate_s_cet = {
+    .name = "cpu/s_cet",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = s_cet_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.s_cet, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool pl0_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->pl0_ssp != 0;
+}
+
+static const VMStateDescription vmstate_pl0_ssp = {
+    .name = "cpu/pl0_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl0_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.pl0_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool pl1_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->pl1_ssp != 0;
+}
+
+static const VMStateDescription vmstate_pl1_ssp = {
+    .name = "cpu/pl1_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl1_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.pl1_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool pl2_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->pl2_ssp != 0;
+}
+
+static const VMStateDescription vmstate_pl2_ssp = {
+    .name = "cpu/pl2_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl2_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.pl2_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+
+static bool pl3_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->pl3_ssp != 0;
+}
+
+static const VMStateDescription vmstate_pl3_ssp = {
+    .name = "cpu/pl3_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl3_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.pl3_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool ssp_tbl_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->ssp_tbl != 0;
+}
+
+static const VMStateDescription vmstate_ssp_tbl = {
+    .name = "cpu/ssp_tbl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ssp_tbl_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.ssp_tbl, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool guest_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->guest_ssp != 0;
+}
+
+static const VMStateDescription vmstate_guest_ssp = {
+    .name = "cpu/guest_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = guest_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.guest_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool pkru_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -1531,6 +1684,14 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_nested_state,
 #endif
         &vmstate_msr_tsx_ctrl,
+        &vmstate_u_cet,
+        &vmstate_s_cet,
+        &vmstate_pl0_ssp,
+        &vmstate_pl1_ssp,
+        &vmstate_pl2_ssp,
+        &vmstate_pl3_ssp,
+        &vmstate_ssp_tbl,
+        &vmstate_guest_ssp,
         NULL
     }
 };
-- 
2.26.2


