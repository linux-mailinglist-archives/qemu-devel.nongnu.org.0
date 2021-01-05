Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48512EAFEF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:23:02 +0100 (CET)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp6r-0005dh-OV
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwovT-0007GR-Lw
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:11:15 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:36236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwovR-0005bC-JC
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:11:15 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FsjxD094287;
 Tue, 5 Jan 2021 16:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=z85cdhwotBobm6YDCbt1oMvBoAzWYnbUbEJ6VIxWcfk=;
 b=k5iHWbD5lTEOArbR13Yx5fbQLzJ/9LBORpXQma5FeS8pu9xCRVtsYlmt0sErFhjF2J8c
 pusGxWkxNSivqw6CHHGIiVMIKVakWDSoLv8jbMWLKLuVmp4e2Hwz6FZesCLixatbpi2C
 FZwtHZGaI2bqgcqxX5KwhNT0YyLCzqTAxgXCqJHIOwxEQqoY9R59XjdV0/XRG21N+xCL
 6tRwylcYLMPqO/0Ymm++oUb9a21thZACF42DZ/v92/1UElRoQIgc27Ys6mWJIW4fslNW
 Z8uhPLJjfXjv70z93qSMpb2l6EglAgCL4YgQG/Ri94Rxz7OlJoe172cPVx1wFEJXs6Ou +g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35tebask64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:11:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuRAF026647;
 Tue, 5 Jan 2021 16:09:09 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35v4rbjffa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:09 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G99ug003462;
 Tue, 5 Jan 2021 16:09:09 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:08 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 11/22] vfio-pci: refactor for cpr
Date: Tue,  5 Jan 2021 07:41:59 -0800
Message-Id: <1609861330-129855-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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

Export vfio_address_spaces and vfio_listener_skipped_section.
Add optional eventfd arg to vfio_add_kvm_msi_virq.
Refactor vector use into a helper vfio_vector_init.
All for use by cpr in a subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              |  4 ++--
 hw/vfio/pci.c                 | 36 +++++++++++++++++++++++++-----------
 include/hw/vfio/vfio-common.h |  3 +++
 3 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3335714..7f8768d 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,7 +40,7 @@
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
-static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
+VFIOAddressSpaceList vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
 #ifdef CONFIG_KVM
@@ -393,7 +393,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     return -1;
 }
 
-static bool vfio_listener_skipped_section(MemoryRegionSection *section)
+bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2e561c0..9b57ffa 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -412,7 +412,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 }
 
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
-                                  int vector_n, bool msix)
+                                  int vector_n, bool msix, int eventfd)
 {
     int virq;
 
@@ -420,7 +420,9 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (eventfd >= 0) {
+        event_notifier_init_fd(&vector->kvm_interrupt, eventfd);
+    } else if (event_notifier_init(&vector->kvm_interrupt, 0)) {
         return;
     }
 
@@ -456,6 +458,22 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
     kvm_irqchip_commit_routes(kvm_state);
 }
 
+static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    PCIDevice *pdev = &vdev->pdev;
+
+    vector->vdev = vdev;
+    vector->virq = -1;
+    if (eventfd >= 0) {
+        event_notifier_init_fd(&vector->interrupt, eventfd);
+    } else if (event_notifier_init(&vector->interrupt, 0)) {
+        error_report("vfio: Error: event_notifier_init failed");
+    }
+    vector->use = true;
+    msix_vector_use(pdev, nr);
+}
+
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
@@ -467,14 +485,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
 
     vector = &vdev->msi_vectors[nr];
 
+    vfio_vector_init(vdev, nr, -1);
+
     if (!vector->use) {
-        vector->vdev = vdev;
-        vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
-        }
-        vector->use = true;
-        msix_vector_use(pdev, nr);
+        vfio_vector_init(vdev, nr, -1);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -492,7 +506,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
         }
     }
 
@@ -628,7 +642,7 @@ retry:
          * Attempt to enable route through KVM irqchip,
          * default to userspace handling if unavailable.
          */
-        vfio_add_kvm_msi_virq(vdev, vector, i, false);
+        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
     }
 
     /* Set interrupt type prior to possible interrupts */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c78f3ff..ab87df4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -182,6 +182,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
+typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
+extern VFIOAddressSpaceList vfio_address_spaces;
 
 #ifdef CONFIG_LINUX
 int vfio_get_region_info(VFIODevice *vbasedev, int index,
@@ -193,6 +195,7 @@ struct vfio_info_cap_header *
 vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
+bool vfio_listener_skipped_section(MemoryRegionSection *section);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1


