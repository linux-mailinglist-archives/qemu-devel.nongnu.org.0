Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A454CC8B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:19:35 +0200 (CEST)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Unu-0008KM-9E
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOg-0007Vn-4T
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOc-000156-Uf
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:28 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDwp4T026591;
 Wed, 15 Jun 2022 14:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=PSJWekmjFYoSMJvI8bg2b39oWZpHq6LD9ykDjH4iW9k=;
 b=VhYJnadYUQS9kgn6DgXrwKMsTggTvnXRoKguX856g3rrxkwFicewj8HIM3ZHj47x+sLn
 Cd28ED8BDijU78gbr0fKreNaPoug15qtDZDZkufMiHybco3oYKycsBHSWGYtuel2kvNy
 K/u5RGgOZkb4gf8I9I4AbF21HFUNEjCZ+nzxWYxHntzUWo4F8jlMchLQI24uAxrNzzKr
 0v/AOFjPN+iy8MnPwRh0nwQ8o5SKFluDYBd6eZvj9wMQBem8qVyu02s4uRkI82ebQuMB
 T+fWNxJETBtHR6LCu2+0EMZ0h6EjFRxxuibnguX8xUZ9vL20BEO1dnUMDrOgBjAMNpRx Lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:01 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7pm023118; Wed, 15 Jun 2022 14:53:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:00 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNZ018501;
 Wed, 15 Jun 2022 14:52:59 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-27; Wed, 15 Jun 2022 14:52:59 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 26/39] vfio-pci: refactor for cpr
Date: Wed, 15 Jun 2022 07:52:13 -0700
Message-Id: <1655304746-102776-27-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: NbEBZYCb09Pxm1-ATdw51DjTknIaqfYg
X-Proofpoint-ORIG-GUID: NbEBZYCb09Pxm1-ATdw51DjTknIaqfYg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor vector use into a helper vfio_vector_init.
Add vfio_notifier_init and vfio_notifier_cleanup for named notifiers,
and pass additional arguments to vfio_remove_kvm_msi_virq.

All for use by cpr in a subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 99 +++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 66 insertions(+), 33 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3..0143c9a 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -52,6 +52,27 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 static void vfio_msi_disable_common(VFIOPCIDevice *vdev);
 
+/* Create new or reuse existing eventfd */
+static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
+                              const char *name, int nr)
+{
+    int fd = -1;   /* placeholder until a subsequent patch */
+    int ret = 0;
+
+    if (fd >= 0) {
+        event_notifier_init_fd(e, fd);
+    } else {
+        ret = event_notifier_init(e, 0);
+    }
+    return ret;
+}
+
+static void vfio_notifier_cleanup(VFIOPCIDevice *vdev, EventNotifier *e,
+                                  const char *name, int nr)
+{
+    event_notifier_cleanup(e);
+}
+
 /*
  * Disabling BAR mmaping can be slow, but toggling it around INTx can
  * also be a huge overhead.  We try to get the best of both worlds by
@@ -132,8 +153,8 @@ static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
     pci_irq_deassert(&vdev->pdev);
 
     /* Get an eventfd for resample/unmask */
-    if (event_notifier_init(&vdev->intx.unmask, 0)) {
-        error_setg(errp, "event_notifier_init failed eoi");
+    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
+        error_setg(errp, "vfio_notifier_init intx-unmask failed");
         goto fail;
     }
 
@@ -165,7 +186,7 @@ fail_vfio:
     kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vdev->intx.interrupt,
                                           vdev->intx.route.irq);
 fail_irqfd:
-    event_notifier_cleanup(&vdev->intx.unmask);
+    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
 fail:
     qemu_set_fd_handler(irq_fd, vfio_intx_interrupt, NULL, vdev);
     vfio_unmask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
@@ -194,7 +215,7 @@ static void vfio_intx_disable_kvm(VFIOPCIDevice *vdev)
     }
 
     /* We only need to close the eventfd for VFIO to cleanup the kernel side */
-    event_notifier_cleanup(&vdev->intx.unmask);
+    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
 
     /* QEMU starts listening for interrupt events. */
     qemu_set_fd_handler(event_notifier_get_fd(&vdev->intx.interrupt),
@@ -285,9 +306,10 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     }
 #endif
 
-    ret = event_notifier_init(&vdev->intx.interrupt, 0);
+    ret = vfio_notifier_init(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
     if (ret) {
-        error_setg_errno(errp, -ret, "event_notifier_init failed");
+        error_setg_errno(errp, -ret,
+                         "vfio_notifier_init intx-interrupt failed");
         return ret;
     }
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
@@ -296,7 +318,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
-        event_notifier_cleanup(&vdev->intx.interrupt);
+        vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
         return -errno;
     }
 
@@ -324,7 +346,7 @@ static void vfio_intx_disable(VFIOPCIDevice *vdev)
 
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
     qemu_set_fd_handler(fd, NULL, NULL, vdev);
-    event_notifier_cleanup(&vdev->intx.interrupt);
+    vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
 
     vdev->interrupt = VFIO_INT_NONE;
 
@@ -424,13 +446,15 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
                                              vector_n, &vdev->pdev);
 }
 
-static void vfio_connect_kvm_msi_virq(VFIOMSIVector *vector)
+static void vfio_connect_kvm_msi_virq(VFIOMSIVector *vector, int nr)
 {
+    const char *name = "kvm_interrupt";
+
     if (vector->virq < 0) {
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (vfio_notifier_init(vector->vdev, &vector->kvm_interrupt, name, nr)) {
         goto fail_notifier;
     }
 
@@ -442,19 +466,20 @@ static void vfio_connect_kvm_msi_virq(VFIOMSIVector *vector)
     return;
 
 fail_kvm:
-    event_notifier_cleanup(&vector->kvm_interrupt);
+    vfio_notifier_cleanup(vector->vdev, &vector->kvm_interrupt, name, nr);
 fail_notifier:
     kvm_irqchip_release_virq(kvm_state, vector->virq);
     vector->virq = -1;
 }
 
-static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
+static void vfio_remove_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
+                                     int nr)
 {
     kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                           vector->virq);
     kvm_irqchip_release_virq(kvm_state, vector->virq);
     vector->virq = -1;
-    event_notifier_cleanup(&vector->kvm_interrupt);
+    vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, "kvm_interrupt", nr);
 }
 
 static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
@@ -464,6 +489,20 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
     kvm_irqchip_commit_routes(kvm_state);
 }
 
+static void vfio_vector_init(VFIOPCIDevice *vdev, int nr)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    PCIDevice *pdev = &vdev->pdev;
+
+    vector->vdev = vdev;
+    vector->virq = -1;
+    if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", nr)) {
+        error_report("vfio: vfio_notifier_init interrupt failed");
+    }
+    vector->use = true;
+    msix_vector_use(pdev, nr);
+}
+
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
@@ -476,13 +515,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     vector = &vdev->msi_vectors[nr];
 
     if (!vector->use) {
-        vector->vdev = vdev;
-        vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
-        }
-        vector->use = true;
-        msix_vector_use(pdev, nr);
+        vfio_vector_init(vdev, nr);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -494,7 +527,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
      */
     if (vector->virq >= 0) {
         if (!msg) {
-            vfio_remove_kvm_msi_virq(vector);
+            vfio_remove_kvm_msi_virq(vdev, vector, nr);
         } else {
             vfio_update_kvm_msi_virq(vector, *msg, pdev);
         }
@@ -506,7 +539,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                 vfio_route_change = kvm_irqchip_begin_route_changes(kvm_state);
                 vfio_add_kvm_msi_virq(vdev, vector, nr, true);
                 kvm_irqchip_commit_route_changes(&vfio_route_change);
-                vfio_connect_kvm_msi_virq(vector);
+                vfio_connect_kvm_msi_virq(vector, nr);
             }
         }
     }
@@ -602,7 +635,7 @@ static void vfio_commit_kvm_msi_virq_batch(VFIOPCIDevice *vdev)
     kvm_irqchip_commit_route_changes(&vfio_route_change);
 
     for (i = 0; i < vdev->nr_vectors; i++) {
-        vfio_connect_kvm_msi_virq(&vdev->msi_vectors[i]);
+        vfio_connect_kvm_msi_virq(&vdev->msi_vectors[i], i);
     }
 }
 
@@ -681,8 +714,8 @@ retry:
         vector->virq = -1;
         vector->use = true;
 
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
+        if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", i)) {
+            error_report("vfio: Error: vfio_notifier_init failed");
         }
 
         qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -737,11 +770,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
         VFIOMSIVector *vector = &vdev->msi_vectors[i];
         if (vdev->msi_vectors[i].use) {
             if (vector->virq >= 0) {
-                vfio_remove_kvm_msi_virq(vector);
+                vfio_remove_kvm_msi_virq(vdev, vector, i);
             }
             qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
                                 NULL, NULL, NULL);
-            event_notifier_cleanup(&vector->interrupt);
+            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
         }
     }
 
@@ -2740,7 +2773,7 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->err_notifier, 0)) {
+    if (vfio_notifier_init(vdev, &vdev->err_notifier, "err_notifier", 0)) {
         error_report("vfio: Unable to init event notifier for error detection");
         vdev->pci_aer = false;
         return;
@@ -2753,7 +2786,7 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
-        event_notifier_cleanup(&vdev->err_notifier);
+        vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
         vdev->pci_aer = false;
     }
 }
@@ -2772,7 +2805,7 @@ static void vfio_unregister_err_notifier(VFIOPCIDevice *vdev)
     }
     qemu_set_fd_handler(event_notifier_get_fd(&vdev->err_notifier),
                         NULL, NULL, vdev);
-    event_notifier_cleanup(&vdev->err_notifier);
+    vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
 }
 
 static void vfio_req_notifier_handler(void *opaque)
@@ -2806,7 +2839,7 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->req_notifier, 0)) {
+    if (vfio_notifier_init(vdev, &vdev->req_notifier, "req_notifier", 0)) {
         error_report("vfio: Unable to init event notifier for device request");
         return;
     }
@@ -2818,7 +2851,7 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
                            VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
-        event_notifier_cleanup(&vdev->req_notifier);
+        vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
     } else {
         vdev->req_enabled = true;
     }
@@ -2838,7 +2871,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     }
     qemu_set_fd_handler(event_notifier_get_fd(&vdev->req_notifier),
                         NULL, NULL, vdev);
-    event_notifier_cleanup(&vdev->req_notifier);
+    vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
 
     vdev->req_enabled = false;
 }
-- 
1.8.3.1


