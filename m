Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBD3BF38A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:24:56 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Imd-0007ZD-4x
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILF-0002tK-Sm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:57610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILE-0007LH-CZ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101746"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101746"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:56:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770130"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:59 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 43/44] i386/tdx: disallow level interrupt and
 SMI/INIT/SIPI delivery mode
Date: Wed,  7 Jul 2021 17:55:13 -0700
Message-Id: <b3d3f090addefaef29d2027024cb6c4056e5996d.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

TDX doesn't allow level interrupt and SMI/INIT/SIPI interrupt delivery
mode.  So disallow them.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/x86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 24af05c313..c372403b87 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1307,6 +1307,9 @@ static int x86_kvm_type(MachineState *ms, const char *vm_type)
         kvm_type = KVM_X86_LEGACY_VM;
     } else if (!g_ascii_strcasecmp(vm_type, "tdx")) {
         kvm_type = KVM_X86_TDX_VM;
+        X86_MACHINE(ms)->eoi_intercept_unsupported = true;
+        X86_MACHINE(ms)->smi_unsupported = true;
+        X86_MACHINE(ms)->init_sipi_unsupported = true;
     } else {
         error_report("Unknown kvm-type specified '%s'", vm_type);
         exit(1);
-- 
2.25.1


