Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC2376543
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:37:12 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezjD-0005ux-6S
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbS-0000cA-IW
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:10 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbO-0001SH-F3
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:10 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CShcL050046;
 Fri, 7 May 2021 12:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=f/cR7RLpqsrjRgoH2IWPRKzglwS0GQnd3dK2jT120EE=;
 b=yYrSLnYlzhsd3Mact83+9B5Of9qALF5jyUVjltULY5UVlfDiWOtRHQvmY7K3umAk8v+h
 F/1M0hjzZdC9rCP4/3N6xo400D56hprKeJmMpY9MtsWTcvvtPtgxsIameRFDEDd43I0u
 kHHUlMpIteQNKjAggl1/pMuUtguyUMyK3FsWl5IMizZ90Zp2XboiVFUHJBtdKLhhTZZ/
 ivQXDYDQ0iGvulkDUVK++Cp1MEI9yxFWlAzm03Xr5+93tzoebXX6IhmKh+vJbTbI57Bf
 TjAl5EPx4pvNeimq2NLwN2NhyAtSMzfk5WLNG285sgqVBXO45v5G/YMyzJopCWpJNacm LQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 38csqvhemk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFZHg069027;
 Fri, 7 May 2021 12:29:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38csrev2hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:00 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CPtJq098147;
 Fri, 7 May 2021 12:28:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 38csrev2h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:59 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSwHl017215;
 Fri, 7 May 2021 12:28:58 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:58 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 11/22] vfio-pci: refactor for cpr
Date: Fri,  7 May 2021 05:25:09 -0700
Message-Id: <1620390320-301716-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: AB5i8mQ0ama1AVLRf4LM7YdKOINJfE1l
X-Proofpoint-GUID: AB5i8mQ0ama1AVLRf4LM7YdKOINJfE1l
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070086
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=steven.sistare@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
index ae5654f..9220e64 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -42,7 +42,7 @@
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
-static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
+VFIOAddressSpaceList vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
 #ifdef CONFIG_KVM
@@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     return -1;
 }
 
-static bool vfio_listener_skipped_section(MemoryRegionSection *section)
+bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5c65aa0..7a4fb6c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -411,7 +411,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 }
 
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
-                                  int vector_n, bool msix)
+                                  int vector_n, bool msix, int eventfd)
 {
     int virq;
 
@@ -419,7 +419,9 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (eventfd >= 0) {
+        event_notifier_init_fd(&vector->kvm_interrupt, eventfd);
+    } else if (event_notifier_init(&vector->kvm_interrupt, 0)) {
         return;
     }
 
@@ -455,6 +457,22 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
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
@@ -466,14 +484,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
 
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
@@ -491,7 +505,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
         }
     }
 
@@ -641,7 +655,7 @@ retry:
          * Attempt to enable route through KVM irqchip,
          * default to userspace handling if unavailable.
          */
-        vfio_add_kvm_msi_virq(vdev, vector, i, false);
+        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
     }
 
     /* Set interrupt type prior to possible interrupts */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162..00acb85 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -204,6 +204,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
+typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
+extern VFIOAddressSpaceList vfio_address_spaces;
 
 bool vfio_mig_active(void);
 int64_t vfio_mig_bytes_transferred(void);
@@ -222,6 +224,7 @@ struct vfio_info_cap_header *
 vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
+bool vfio_listener_skipped_section(MemoryRegionSection *section);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1


