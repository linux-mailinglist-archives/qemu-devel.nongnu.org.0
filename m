Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1474B83DC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:23:15 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGWn-0005UA-Lz
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5e-0005ML-J8
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:10 -0500
Received: from mga14.intel.com ([192.55.52.115]:10641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5b-0002zd-Kj
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001707; x=1676537707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o84uKWKMQfEn4ExBF+qBe2pAQYKLeDqkmI267vu6PGw=;
 b=E3xV4GGvg5KqcOeAkdPv9kOLlF0MAAq8BC8zRsjuQo4fS3hpJ32Bv9Xd
 MJKqmBYdLUJx4z4+JaVx7rMT7pYfM7NEhLwq8bP8T1gwVYA2/u5HvKd73
 Y7WCgFQRSZU3rvKKu6txjq57AwXhf1tPF100TCdJ8rmPfNmOV49LDvGqF
 Z1KPtV0aPIka0WawP2ohoj3czRC9SLErLHiUKuIhMwzmOoMLslS8KJ7+I
 i4OzuXuATCcm70E9C7do9yoLaPit/JT0yVRvVqqZoHwpcgJ/9gcz4Ex9q
 rr5B0gvumSsqj2HmhC/FqOUikBqbd7GHY6UfAY4eg/l7GuI77rGk2/0kX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250756920"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="250756920"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418293"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:07 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 7/8] target/i386: Enable Arch LBR migration states in vmstate
Date: Tue, 15 Feb 2022 14:52:57 -0500
Message-Id: <20220215195258.29149-8-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215195258.29149-1-weijiang.yang@intel.com>
References: <20220215195258.29149-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=weijiang.yang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The Arch LBR record MSRs and control MSRs will be migrated
to destination guest if the vcpus were running with Arch
LBR active.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/machine.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index 1f9d0c46f1..08db7d3629 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -136,6 +136,22 @@ static const VMStateDescription vmstate_mtrr_var = {
 #define VMSTATE_MTRR_VARS(_field, _state, _n, _v)                    \
     VMSTATE_STRUCT_ARRAY(_field, _state, _n, _v, vmstate_mtrr_var, MTRRVar)
 
+static const VMStateDescription vmstate_lbr_records_var = {
+    .name = "lbr_records_var",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(from, LBR_ENTRY),
+        VMSTATE_UINT64(to, LBR_ENTRY),
+        VMSTATE_UINT64(info, LBR_ENTRY),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_LBR_VARS(_field, _state, _n, _v)                    \
+    VMSTATE_STRUCT_ARRAY(_field, _state, _n, _v, vmstate_lbr_records_var, \
+                         LBR_ENTRY)
+
 typedef struct x86_FPReg_tmp {
     FPReg *parent;
     uint64_t tmp_mant;
@@ -1523,6 +1539,27 @@ static const VMStateDescription vmstate_amx_xtile = {
     }
 };
 
+static bool arch_lbr_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR);
+}
+
+static const VMStateDescription vmstate_arch_lbr = {
+    .name = "cpu/arch_lbr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = arch_lbr_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.msr_lbr_ctl, X86CPU),
+        VMSTATE_UINT64(env.msr_lbr_depth, X86CPU),
+        VMSTATE_LBR_VARS(env.lbr_records, X86CPU, ARCH_LBR_NR_ENTRIES, 1),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1664,6 +1701,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_pdptrs,
         &vmstate_msr_xfd,
         &vmstate_amx_xtile,
+        &vmstate_arch_lbr,
         NULL
     }
 };
-- 
2.27.0


