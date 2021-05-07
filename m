Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E8376573
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:47:50 +0200 (CEST)
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leztV-0008BO-7b
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbV-0000jA-Dg
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:13 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:49960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbO-0001Tb-HR
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:13 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDbak148649;
 Fri, 7 May 2021 12:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=610NsNf8Rel74OcPl+ylnlOHqqH7HT/kL5NeuPJY+JI=;
 b=j0KOGWgVqgKYSTzHigOSMhBFaRpM0DugtnEprUyh5GhWomyRiU6a/Rl6Z+rH4hhMPzl8
 sMdXjqYBNBXXh3C+lBFUntMkKTq5TiVf72L5DCYxl1PWHjx45Enq1WG0ggteiUEvfEdn
 MK9q2iGTX3tM4ML3Og57NvYyBdqdtQWcnTWsoNNF85p0EUFNMGCRJ5TDm2D4BKH2hajI
 44TLsin0hb/ranaK71qjHgxabQ2elxeVt19sgwuB5O3V04DVNuGzUg87cBBeTF6ynyNm
 VcxJcwCtxsFRTnY4JJahJTqEBz1sHkqzdEsx3VA9t6tqKB2mfH87Antm5z0GeW+giDYZ Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 38csrd9ewj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFX6F068826;
 Fri, 7 May 2021 12:29:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38csrev2km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:03 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CPqAF098030;
 Fri, 7 May 2021 12:29:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 38csrev2ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:02 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CT0Wd016424;
 Fri, 7 May 2021 12:29:00 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:00 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 13/22] vfio-pci: cpr part 2
Date: Fri,  7 May 2021 05:25:11 -0700
Message-Id: <1620390320-301716-14-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: HWA7JgLFdeHbHGWQkC6ZWdiRPq-r1QqF
X-Proofpoint-GUID: HWA7JgLFdeHbHGWQkC6ZWdiRPq-r1QqF
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finish cpr for vfio-pci by preserving eventfd's and vector state.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 108 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f7ac9f03..e983db4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2661,6 +2661,27 @@ static void vfio_put_device(VFIOPCIDevice *vdev)
     vfio_put_base_device(&vdev->vbasedev);
 }
 
+static void setenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name,
+                            EventNotifier *ev)
+{
+    char envname[256];
+    int fd = event_notifier_get_fd(ev);
+    const char *vfname = vdev->vbasedev.name;
+
+    if (fd >= 0) {
+        snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+        setenv_fd(envname, fd);
+    }
+}
+
+static int getenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name)
+{
+    char envname[256];
+    const char *vfname = vdev->vbasedev.name;
+    snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+    return getenv_fd(envname);
+}
+
 static void vfio_err_notifier_handler(void *opaque)
 {
     VFIOPCIDevice *vdev = opaque;
@@ -2692,7 +2713,13 @@ static void vfio_err_notifier_handler(void *opaque)
 static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
 {
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = getenv_event_fd(vdev, 0, "err");
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->err_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
+        return;
+    }
 
     if (!vdev->pci_aer) {
         return;
@@ -2753,7 +2780,14 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
                                       .index = VFIO_PCI_REQ_IRQ_INDEX };
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = getenv_event_fd(vdev, 0, "req");
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->req_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
+        vdev->req_enabled = true;
+        return;
+    }
 
     if (!(vdev->features & VFIO_FEATURE_ENABLE_REQ)) {
         return;
@@ -3286,12 +3320,82 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static int vfio_pci_pre_save(void *opaque)
+{
+    VFIOPCIDevice *vdev = opaque;
+    int i;
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+        if (vector->use) {
+            setenv_event_fd(vdev, i, "interrupt", &vector->interrupt);
+            if (vector->virq >= 0) {
+                setenv_event_fd(vdev, i, "kvm_interrupt",
+                                &vector->kvm_interrupt);
+            }
+        }
+    }
+    setenv_event_fd(vdev, 0, "err", &vdev->err_notifier);
+    setenv_event_fd(vdev, 0, "req", &vdev->req_notifier);
+    return 0;
+}
+
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
+        fd = getenv_event_fd(vdev, i, "interrupt");
+        if (fd >= 0) {
+            vfio_vector_init(vdev, i, fd);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        fd = getenv_event_fd(vdev, i, "kvm_interrupt");
+        if (fd >= 0) {
+            vfio_add_kvm_msi_virq(vdev, vector, i, msix, fd);
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
 static int vfio_pci_post_load(void *opaque, int version_id)
 {
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
     bool enabled;
 
+    if (msix_enabled(pdev)) {
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        error_report("vfio_pci_post_load does not support INTX");
+    }
+
     pdev->reused = false;
     enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
     memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
@@ -3310,8 +3414,10 @@ static const VMStateDescription vfio_pci_vmstate = {
     .version_id = 0,
     .minimum_version_id = 0,
     .post_load = vfio_pci_post_load,
+    .pre_save = vfio_pci_pre_save,
     .needed = vfio_pci_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_MSIX(pdev, VFIOPCIDevice),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


