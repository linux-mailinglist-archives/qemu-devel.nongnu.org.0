Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA17581769
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:26:58 +0200 (CEST)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNOb-0008S6-LO
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9s-0002za-UG
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9q-0006DE-RW
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:44 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnNVu026401;
 Tue, 26 Jul 2022 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=aDWQYJpJCnKr22HSJhWfvccK9PK7+j3qIffHAXxEly4=;
 b=0EMy5l5Js2/gTAeqjZP357y/zt0+TMOgGmA/O5NAZOqtn4MujN5lFf+v8qKTIB4bZUYB
 yQZbT3vAxBQlDvYLx6bqp3zoYR7GPhPvl/VIZGXGJOcbXt3lPvn8loRqsPGZTq82vAYt
 NXRp5xVkoK/uyRHBG89mHxPdjMZK5P605XrLVk4LOBSc7D6Inho41azCJKJI7j8egTnh
 z3l5gUdlhiMXJU37nGzASNY5DNXGPf/hogQtraJ/UG2dFhRkET+9EcvunEDC2Pzb+o8w
 gmsgG0yglffSInu04R54R8w3pjCSfJL/NvF6NYs0VYVqEB2G/f1EP6zc1jvdNcymi0jy uA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg94gevy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:34 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF5NqU006270; Tue, 26 Jul 2022 16:11:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:33 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTF023334;
 Tue, 26 Jul 2022 16:11:32 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-34; Tue, 26 Jul 2022 16:11:32 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 33/46] vfio-pci: cpr part 3 (intx)
Date: Tue, 26 Jul 2022 09:10:30 -0700
Message-Id: <1658851843-236870-34-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: qZ7t_517AqiL5UAndSdf7jmnqw0_bCNX
X-Proofpoint-ORIG-GUID: qZ7t_517AqiL5UAndSdf7jmnqw0_bCNX
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
follows:
  pin : Recover this from the vfio config in kernel space
  interrupt : Preserve its eventfd descriptor across exec.
  unmask : Ditto
  route.irq : This could perhaps be recovered in vfio_pci_post_load by
    calling pci_device_route_intx_to_irq(pin), whose implementation reads
    config space for a bridge device such as ich9.  However, there is no
    guarantee that the bridge vmstate is read before vfio vmstate.  Rather
    than fiddling with MigrationPriority for vmstate handlers, explicitly
    save route.irq in vfio vmstate.
  pending : save in vfio vmstate.
  mmap_timeout, mmap_timer : Re-initialize
  bool kvm_accel : Re-initialize

In vfio_realize, defer calling vfio_intx_enable until the vmstate
is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
vfio_intx_kvm_enable to skip vfio initialization, but still perform
kvm initialization.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 81 ++++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 20 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1d0e8db..906e3cb 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -179,11 +179,13 @@ static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
         return;
     }
 
-    /* Get to a known interrupt state */
-    qemu_set_fd_handler(irq_fd, NULL, NULL, vdev);
-    vfio_mask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
-    vdev->intx.pending = false;
-    pci_irq_deassert(&vdev->pdev);
+    if (!vdev->vbasedev.reused) {
+        /* Get to a known interrupt state */
+        qemu_set_fd_handler(irq_fd, NULL, NULL, vdev);
+        vfio_mask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
+        vdev->intx.pending = false;
+        pci_irq_deassert(&vdev->pdev);
+    }
 
     /* Get an eventfd for resample/unmask */
     if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
@@ -199,15 +201,17 @@ static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
         goto fail_irqfd;
     }
 
-    if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
-                               VFIO_IRQ_SET_ACTION_UNMASK,
-                               event_notifier_get_fd(&vdev->intx.unmask),
-                               errp)) {
-        goto fail_vfio;
-    }
+    if (!vdev->vbasedev.reused) {
+        if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
+                                   VFIO_IRQ_SET_ACTION_UNMASK,
+                                   event_notifier_get_fd(&vdev->intx.unmask),
+                                   errp)) {
+            goto fail_vfio;
+        }
 
-    /* Let'em rip */
-    vfio_unmask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
+        /* Let'em rip */
+        vfio_unmask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
+    }
 
     vdev->intx.kvm_accel = true;
 
@@ -323,7 +327,13 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
         return 0;
     }
 
-    vfio_disable_interrupts(vdev);
+    /*
+     * Do not alter interrupt state during vfio_realize and cpr load.  The
+     * reused flag is cleared thereafter.
+     */
+    if (!vdev->vbasedev.reused) {
+        vfio_disable_interrupts(vdev);
+    }
 
     vdev->intx.pin = pin - 1; /* Pin A (1) -> irq[0] */
     pci_config_set_interrupt_pin(vdev->pdev.config, pin);
@@ -348,7 +358,8 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
     qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
 
-    if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
+    if (!vdev->vbasedev.reused &&
+        vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
         vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
@@ -3189,9 +3200,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
                                              vfio_intx_routing_notifier);
         vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
         kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
+
+        /* Wait until cpr load reads intx routing data to enable */
+        if (!vdev->vbasedev.reused) {
+            ret = vfio_intx_enable(vdev, errp);
+            if (ret) {
+                goto out_deregister;
+            }
         }
     }
 
@@ -3471,6 +3486,7 @@ static int vfio_pci_post_load(void *opaque, int version_id)
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
     int nr_vectors;
+    int ret = 0;
 
     if (msix_enabled(pdev)) {
         msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
@@ -3483,10 +3499,34 @@ static int vfio_pci_post_load(void *opaque, int version_id)
         vfio_claim_vectors(vdev, nr_vectors, false);
 
     } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
-        assert(0);      /* completed in a subsequent patch */
+        Error *err = 0;
+        ret = vfio_intx_enable(vdev, &err);
+        if (ret) {
+            error_report_err(err);
+        }
     }
 
-    return 0;
+    return ret;
+}
+
+static const VMStateDescription vfio_intx_vmstate = {
+    .name = "vfio-intx",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(pending, VFIOINTx),
+        VMSTATE_UINT32(route.mode, VFIOINTx),
+        VMSTATE_INT32(route.irq, VFIOINTx),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_VFIO_INTX(_field, _state) {                         \
+    .name       = (stringify(_field)),                              \
+    .size       = sizeof(VFIOINTx),                                 \
+    .vmsd       = &vfio_intx_vmstate,                               \
+    .flags      = VMS_STRUCT,                                       \
+    .offset     = vmstate_offset_value(_state, _field, VFIOINTx),   \
 }
 
 static bool vfio_pci_needed(void *opaque)
@@ -3505,6 +3545,7 @@ static const VMStateDescription vfio_pci_vmstate = {
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
         VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
+        VMSTATE_VFIO_INTX(intx, VFIOPCIDevice),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


