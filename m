Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E46A4115
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:42:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpQ-0007HA-0t; Mon, 27 Feb 2023 06:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboL-0005ob-TS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboJ-0005hE-W7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kz7LWZv3Gn6BhTfJMFWIyqQhBIgiL0+d16XedkP5M4w=;
 b=iSRLeDVROq1+Rd9H3qVc5YbypHZutYVMOKlYl0Sr4+OR8KfApUbcFte+zZWs4c967NuAep
 GVXbzja6XBthRVLOqYQW4zTF7+1O+a0zWm+3lRJYZMO9uOcltnEtXuU0ij9vfoieO3/2+6
 3tb5///m/qG03u3lGhEBzi8T2GL5vFE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-BRYDWKNUMvCP5O5y7Aww3A-1; Mon, 27 Feb 2023 06:36:45 -0500
X-MC-Unique: BRYDWKNUMvCP5O5y7Aww3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C192B183B3C6;
 Mon, 27 Feb 2023 11:36:43 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05ADC1121314;
 Mon, 27 Feb 2023 11:36:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PULL 17/33] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Mon, 27 Feb 2023 12:36:05 +0100
Message-Id: <20230227113621.58468-18-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Imbrenda <imbrenda@linux.ibm.com>

This patch adds support for the asynchronous teardown for reboot for
protected VMs.

When attempting to tear down a protected VM, try to use the new
asynchronous interface first. If that fails, fall back to the classic
synchronous one.

The asynchronous interface involves invoking the new
KVM_PV_ASYNC_DISABLE_PREPARE command for the KVM_S390_PV_COMMAND ioctl.

This will prepare the current protected VM for asynchronous teardown.
Once the protected VM is prepared for teardown, execution can continue
immediately.

Once the protected VM has been prepared, a new thread is started to
actually perform the teardown. The new thread uses the new
KVM_PV_ASYNC_DISABLE command for the KVM_S390_PV_COMMAND ioctl. The
previously prepared protected VM is torn down in the new thread.

Once KVM_PV_ASYNC_DISABLE is invoked, it is possible to use
KVM_PV_ASYNC_DISABLE_PREPARE again. If a protected VM has already been
prepared and its cleanup has not started, it will not be possible to
prepare a new VM. In that case the classic synchronous teardown has to
be performed.

The synchronous teardown will now also clean up any prepared VMs whose
asynchronous teardown has not been initiated yet.

This considerably speeds up the reboot of a protected VM; for large VMs
especially, it could take a long time to perform a reboot with the
traditional synchronous teardown, while with this patch it is almost
immediate.

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230214163035.44104-3-imbrenda@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/pv.h      |  2 ++
 hw/s390x/pv.c              | 28 ++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 9360aa1091..966306a9db 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -41,6 +41,7 @@ static inline bool s390_is_pv(void)
 int s390_pv_query_info(void);
 int s390_pv_vm_enable(void);
 void s390_pv_vm_disable(void);
+bool s390_pv_vm_try_disable_async(void);
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
 int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
 void s390_pv_prep_reset(void);
@@ -60,6 +61,7 @@ static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
 static inline int s390_pv_vm_enable(void) { return 0; }
 static inline void s390_pv_vm_disable(void) {}
+static inline bool s390_pv_vm_try_disable_async(void) { return false; }
 static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
 static inline int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { return 0; }
 static inline void s390_pv_prep_reset(void) {}
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8a1c71436b..49ea38236c 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/cpus.h"
 #include "qom/object_interfaces.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
@@ -108,6 +109,33 @@ void s390_pv_vm_disable(void)
      s390_pv_cmd_exit(KVM_PV_DISABLE, NULL);
 }
 
+static void *s390_pv_do_unprot_async_fn(void *p)
+{
+     s390_pv_cmd_exit(KVM_PV_ASYNC_CLEANUP_PERFORM, NULL);
+     return NULL;
+}
+
+bool s390_pv_vm_try_disable_async(void)
+{
+    /*
+     * t is only needed to create the thread; once qemu_thread_create
+     * returns, it can safely be discarded.
+     */
+    QemuThread t;
+
+    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
+        return false;
+    }
+    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
+        return false;
+    }
+
+    qemu_thread_create(&t, "async_cleanup", s390_pv_do_unprot_async_fn, NULL,
+                       QEMU_THREAD_DETACHED);
+
+    return true;
+}
+
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length)
 {
     struct kvm_s390_pv_sec_parm args = {
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index f22f61b8b6..503f212a31 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -41,6 +41,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/s390x/tod.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/cpus.h"
 #include "hw/s390x/pv.h"
 #include "migration/blocker.h"
 #include "qapi/visitor.h"
@@ -329,7 +330,9 @@ static inline void s390_do_cpu_ipl(CPUState *cs, run_on_cpu_data arg)
 
 static void s390_machine_unprotect(S390CcwMachineState *ms)
 {
-    s390_pv_vm_disable();
+    if (!s390_pv_vm_try_disable_async()) {
+        s390_pv_vm_disable();
+    }
     ms->pv = false;
     migrate_del_blocker(pv_mig_blocker);
     error_free_or_abort(&pv_mig_blocker);
-- 
2.31.1


