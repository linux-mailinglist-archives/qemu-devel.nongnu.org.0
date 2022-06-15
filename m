Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14A54CC96
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:21:06 +0200 (CEST)
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UpN-0002zG-RA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOc-0007Oc-DD
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOZ-00016C-Ss
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:26 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE3B9q000856;
 Wed, 15 Jun 2022 14:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=+mphpuKAc3NlR4KCnTDoo1E2ZOtc0VgbfuV5Tqgwm1Y=;
 b=XhHGi9hro9ffh8piXEHvrqhVxbzRdz3+PLaBvzlVwhGHHMp488htZRxIJBRCSMRFEZlx
 dAz0nyTpHZ094Hh02Wy5cMiJw8QR7Z28HkNH5xUUA4AN2gcuIGGtxw2Wfc4oN/Co2g4w
 dcvuFFptYPIMtqaSUB+kZjbRtRRomW47wdLsIBEujO/k33QeVfnsAch1utZ1AHnsg3bx
 fNhhnytWIzjVetsJBQmDqdOn2svi9BqibMS8mQ7yfTAvGVmhbjOpDLlSrJP+hTxtqUng
 dSffbq5kI5sJIERRTLDPtDRO9p7MvsRqODlSr1Ng1uJZGZ9HN8FmIE0H+OYc/4ISPmWJ NQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9gng5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:03 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7Ma023112; Wed, 15 Jun 2022 14:53:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:02 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNd018501;
 Wed, 15 Jun 2022 14:53:02 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-29; Wed, 15 Jun 2022 14:53:02 +0000
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
Subject: [PATCH V8 28/39] vfio-pci: cpr part 2 (msi)
Date: Wed, 15 Jun 2022 07:52:15 -0700
Message-Id: <1655304746-102776-29-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: 1NvWswczFMGoAQcS8js6Ztusq7cWiwao
X-Proofpoint-GUID: 1NvWswczFMGoAQcS8js6Ztusq7cWiwao
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

Finish cpr for vfio-pci MSI/MSI-X devices by preserving eventfd's and
vector state.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 237231b..2fd7121 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -53,17 +53,53 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 static void vfio_msi_disable_common(VFIOPCIDevice *vdev);
 
+#define EVENT_FD_NAME(vdev, name)   \
+    g_strdup_printf("%s_%s", (vdev)->vbasedev.name, (name))
+
+static int save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
+                         EventNotifier *ev)
+{
+    int fd = event_notifier_get_fd(ev);
+
+    if (fd >= 0) {
+        Error *err;
+        g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
+
+        if (cpr_resave_fd(fdname, nr, fd, &err)) {
+            error_report_err(err);
+            return 1;
+        }
+    }
+    return 0;
+}
+
+static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
+    int fd = cpr_find_fd(fdname, nr);
+    return fd;
+}
+
+static void delete_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    g_autofree char *fdname = EVENT_FD_NAME(vdev, name);
+    cpr_delete_fd(fdname, nr);
+}
+
 /* Create new or reuse existing eventfd */
 static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
                               const char *name, int nr)
 {
-    int fd = -1;   /* placeholder until a subsequent patch */
     int ret = 0;
+    int fd = load_event_fd(vdev, name, nr);
 
     if (fd >= 0) {
         event_notifier_init_fd(e, fd);
     } else {
         ret = event_notifier_init(e, 0);
+        if (!ret) {
+            save_event_fd(vdev, name, nr, e);
+        }
     }
     return ret;
 }
@@ -71,6 +107,7 @@ static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
 static void vfio_notifier_cleanup(VFIOPCIDevice *vdev, EventNotifier *e,
                                   const char *name, int nr)
 {
+    delete_event_fd(vdev, name, nr);
     event_notifier_cleanup(e);
 }
 
@@ -511,6 +548,15 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     VFIOMSIVector *vector;
     int ret;
 
+    /*
+     * Ignore the callback from msix_set_vector_notifiers during resume.
+     * The necessary subset of these actions is called from vfio_claim_vectors
+     * during post load.
+     */
+    if (vdev->vbasedev.reused) {
+        return 0;
+    }
+
     trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
 
     vector = &vdev->msi_vectors[nr];
@@ -2784,6 +2830,11 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
     fd = event_notifier_get_fd(&vdev->err_notifier);
     qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
 
+    /* Do not alter irq_signaling during vfio_realize for cpr */
+    if (vdev->vbasedev.reused) {
+        return;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_ERR_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -2849,6 +2900,12 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     fd = event_notifier_get_fd(&vdev->req_notifier);
     qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
 
+    /* Do not alter irq_signaling during vfio_realize for cpr */
+    if (vdev->vbasedev.reused) {
+        vdev->req_enabled = true;
+        return;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_REQ_IRQ_INDEX, 0,
                            VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -3357,6 +3414,43 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
+{
+    int i, fd;
+    bool pending = false;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vdev->nr_vectors = nr_vectors;
+    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
+    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
+
+    for (i = 0; i < nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+
+        fd = load_event_fd(vdev, "interrupt", i);
+        if (fd >= 0) {
+            vfio_vector_init(vdev, i);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
+            vfio_route_change = kvm_irqchip_begin_route_changes(kvm_state);
+            vfio_add_kvm_msi_virq(vdev, vector, i, msix);
+            kvm_irqchip_commit_route_changes(&vfio_route_change);
+            vfio_connect_kvm_msi_virq(vector, i);
+        }
+
+        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+            set_bit(i, vdev->msix->pending);
+            pending = true;
+        }
+    }
+
+    if (msix) {
+        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
+    }
+}
+
 /*
  * The kernel may change non-emulated config bits.  Exclude them from the
  * changed-bits check in get_pci_config_device.
@@ -3375,6 +3469,29 @@ static int vfio_pci_pre_load(void *opaque)
     return 0;
 }
 
+static int vfio_pci_post_load(void *opaque, int version_id)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
+
+    if (msix_enabled(pdev)) {
+        msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        assert(0);      /* completed in a subsequent patch */
+    }
+
+    return 0;
+}
+
 static bool vfio_pci_needed(void *opaque)
 {
     return cpr_get_mode() == CPR_MODE_RESTART;
@@ -3387,8 +3504,11 @@ static const VMStateDescription vfio_pci_vmstate = {
     .minimum_version_id = 0,
     .priority = MIG_PRI_VFIO_PCI,       /* must load before container */
     .pre_load = vfio_pci_pre_load,
+    .post_load = vfio_pci_post_load,
     .needed = vfio_pci_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
+        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


