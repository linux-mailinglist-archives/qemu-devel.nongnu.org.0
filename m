Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18031C567
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:20:49 +0100 (CET)
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpyq-0002wS-Ja
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpte-0006Qz-Er
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:27 -0500
Received: from mga17.intel.com ([192.55.52.151]:25639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptS-0001Zp-0c
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:26 -0500
IronPort-SDR: nAF/eMzQxn9Fru3NSKJtzma/vrNDrq6xRazvrccDeim+THm2mQ3Uw+G+2eo2HL8DWw7l7RxJZ9
 b8Tn0mSUgnGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558764"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558764"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
IronPort-SDR: kw8wE7s6+1sJZg0EIihC7z+FLtmQXjavIVVEEbyL0obw9oaHQZtE4rbedZzQvxn66xqMa+dJ3a
 7R9ofpfY3eSw==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705419"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 12/23] target/i386/tdx: Finalize the TD's measurement when
 machine is done
Date: Mon, 15 Feb 2021 18:13:08 -0800
Message-Id: <73044bc1f696b1409445b6fe35712044c875928c.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaoyao Li <xiaoyao.li@intel.com>

Invoke KVM_TDX_FINALIZEMR to finalize the TD's measurement and make the
TD vCPUs runnable once machine initialization is complete.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/kvm.c |  7 +++++++
 target/i386/kvm/tdx.c | 20 ++++++++++++++++++++
 target/i386/kvm/tdx.h |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index beb768a7d3..018a757dc6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -51,6 +51,7 @@
 #include "migration/blocker.h"
 #include "exec/memattrs.h"
 #include "trace.h"
+#include "tdx.h"
 
 //#define DEBUG_KVM
 
@@ -2184,6 +2185,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
index 00eda80725..d8b79e975f 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -56,6 +56,26 @@ static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
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
+    if (tdx) {
+        qemu_add_machine_init_done_late_notifier(
+            &tdx_machine_done_late_notify);
+    }
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
2.17.1


