Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2AB3BF33E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:04:37 +0200 (CEST)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ISy-0000R0-A7
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0001zE-8d
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKk-0007L4-OD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534895"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534895"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770027"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 12/44] target/i386/tdx: Finalize the TD's measurement
 when machine is done
Date: Wed,  7 Jul 2021 17:54:42 -0700
Message-Id: <a9948a7cd4f002ba4c3161287b366f4378523502.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Xiaoyao Li <xiaoyao.li@intel.com>

Invoke KVM_TDX_FINALIZEMR to finalize the TD's measurement and make
the TD vCPUs runnable once machine initialization is complete.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/kvm.c |  7 +++++++
 target/i386/kvm/tdx.c | 21 +++++++++++++++++++++
 target/i386/kvm/tdx.h |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index be0b96b120..5742fa4806 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -53,6 +53,7 @@
 #include "migration/blocker.h"
 #include "exec/memattrs.h"
 #include "trace.h"
+#include "tdx.h"
 
 //#define DEBUG_KVM
 
@@ -2246,6 +2247,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         return ret;
     }
 
+    ret = tdx_kvm_init(ms->cgs, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
+
     if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
         error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
         return -ENOTSUP;
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index c50a0dcf11..f8c7560fc8 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -58,6 +58,27 @@ static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
 #define tdx_ioctl(ioctl_no, metadata, data) \
         __tdx_ioctl(ioctl_no, stringify(ioctl_no), metadata, data)
 
+static void tdx_finalize_vm(Notifier *notifier, void *unused)
+{
+    tdx_ioctl(KVM_TDX_FINALIZE_VM, 0, NULL);
+}
+
+static Notifier tdx_machine_done_late_notify = {
+    .notify = tdx_finalize_vm,
+};
+
+int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(cgs),
+                                                    TYPE_TDX_GUEST);
+    if (!tdx) {
+        return 0;
+    }
+
+    qemu_add_machine_init_done_late_notifier(&tdx_machine_done_late_notify);
+    return 0;
+}
+
 void tdx_pre_create_vcpu(CPUState *cpu)
 {
     struct {
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 6ad6c9a313..e15657d272 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -2,6 +2,7 @@
 #define QEMU_I386_TDX_H
 
 #include "qom/object.h"
+#include "qapi/error.h"
 #include "exec/confidential-guest-support.h"
 
 #define TYPE_TDX_GUEST "tdx-guest"
@@ -21,4 +22,6 @@ typedef struct TdxGuest {
     bool debug;
 } TdxGuest;
 
+int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
+
 #endif
-- 
2.25.1


