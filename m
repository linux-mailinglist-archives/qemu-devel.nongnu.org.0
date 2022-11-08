Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2711C621FEF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:04:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbk-00050O-Aq; Tue, 08 Nov 2022 18:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbf-0004wP-3A
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003gO-G3
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:10 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx5Z5026348
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=hd4aEALKyclLDlvpT6pQNFSk4YsrCJ4SyhP00fq6sWQ=;
 b=XoqCrojMK/z4b1McxWF9gwwiZ0WeYhuF9OZhNFxjM7H+2rm6CK8DTkBRMsSOSmLIIFpR
 Fk4nrdQOu+eX5hyGKdi3I+zRTIsOc1PSlPiL+S2fnZIY3pYqGVjV7ZIxpuvdwvZWPHvL
 H7IUTIVM4Y9qzZFsFQs1Zi+IXn2KDi06WzKcw8GjCd84oRtb8Lujxe+QEtJpiz9J2SHl
 FTGt/ZhvIso5qmb1Ux+FqAtk2cKoM+2P5gbcSzHTQh3EKmFDh82f5gYrzrjWjUIYENTJ
 SC0DIgN2uEj2e0mVcZqHMes45A6/voupCYyZkttq6NNsEVI0Lj8/uqhlnt+Bn+DSSWYl Dw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:52 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6Y004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:50 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:50 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 19/24] vfio-user: secure DMA support
Date: Tue,  8 Nov 2022 15:13:41 -0800
Message-Id: <f01a4df56f967ab0ecb32087165c3cbd7167f384.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: SU88HGpi6nsX1nt1RyMsuKOKOuHujBYi
X-Proofpoint-ORIG-GUID: SU88HGpi6nsX1nt1RyMsuKOKOuHujBYi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Secure DMA forces the remote process to use DMA r/w messages
instead of directly mapping guest memeory.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c  | 4 ++++
 hw/vfio/pci.h  | 1 +
 hw/vfio/user.c | 2 +-
 hw/vfio/user.h | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 53e3bb8..ce6776b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3610,6 +3610,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->secure_dma) {
+        proxy->flags |= VFIO_PROXY_SECURE;
+    }
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
@@ -3718,6 +3721,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index c04fa58..c4b8e5c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -196,6 +196,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
+    bool secure_dma;    /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
 };
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index d62fe05..0c5493e 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1627,7 +1627,7 @@ static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
      * map->vaddr enters as a QEMU process address
      * make it either a file offset for mapped areas or 0
      */
-    if (fd != -1) {
+    if (fd != -1 && (container->proxy->flags & VFIO_PROXY_SECURE) == 0) {
         void *addr = (void *)(uintptr_t)map->vaddr;
 
         map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 19b8a29..6bd9fd3 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -83,6 +83,7 @@ typedef struct VFIOProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_SECURE        0x2
 #define VFIO_PROXY_FORCE_QUEUED  0x4
 #define VFIO_PROXY_NO_POST       0x8
 
-- 
1.8.3.1


