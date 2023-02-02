Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862BE687582
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPk-0008Gz-LB; Thu, 02 Feb 2023 00:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPX-0008Gm-O6
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPW-0007CK-2Q
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:27 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124hvch023776; Thu, 2 Feb 2023 05:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=FXkLIaylQSY+fsgEo66NE8CdytHAaTrGU2IVfBvGFTA=;
 b=p/5N4NlXXNSFXXfGdycL1XRgO5tg7rv7wQGUrT+MEVHouS+0tLyUI6bOZLVwFTFQUK4g
 Hu4MjfTvT7sQrg5lW6ZQlk2MvVs2hj42pLYYHySEgHzjsLjafisKhvsDLKHGLoBStQWZ
 9VJoU/G/zuHhJDPWU9UDMfkVzUFuK7UfV2yRADhCi58a/hG+u0QcZzfW2521uegHdw1G
 TLHXBym81bijHbCwbs7YO1+I2y0Ibbn28XaL3pBFGeKhxWU0UD3VE2v4MMNO35XCMO6B
 4OUxRmV0h4eXSySNSPdVtxwSw3utZ/ChoVLaCLbwEMSU2a+RzOUs47Js0HxF6rPnV9RW 7A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkd1tfda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:13 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppt013015; Thu, 2 Feb 2023 05:45:12 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:12 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 19/23] vfio-user: no-mmap DMA support
Date: Wed,  1 Feb 2023 21:55:55 -0800
Message-Id: <fd72fb2ae20724145f72ca6f2308f712603738e1.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-GUID: yPNTGllkWCm0OS6uZ5gxUgN__ANGEEBJ
X-Proofpoint-ORIG-GUID: yPNTGllkWCm0OS6uZ5gxUgN__ANGEEBJ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Force remote process to use DMA r/w messages instead
of directly mapping guest memory.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h     | 1 +
 hw/vfio/user-pci.c | 5 +++++
 hw/vfio/user.c     | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index b89e5ca..fe0115b 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -83,6 +83,7 @@ typedef struct VFIOUserProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_NO_MMAP       0x2
 #define VFIO_PROXY_FORCE_QUEUED  0x4
 #define VFIO_PROXY_NO_POST       0x8
 
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index a0aa320..bf84d7c 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -40,6 +40,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
+    bool no_direct_dma; /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
 };
@@ -160,6 +161,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->no_direct_dma) {
+        proxy->flags |= VFIO_PROXY_NO_MMAP;
+    }
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
@@ -269,6 +273,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("no-direct-dma", VFIOUserPCIDevice, no_direct_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index fe6e476..0a7b354 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1806,7 +1806,7 @@ static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
      * map->vaddr enters as a QEMU process address
      * make it either a file offset for mapped areas or 0
      */
-    if (fd != -1) {
+    if (fd != -1 && (container->proxy->flags & VFIO_PROXY_NO_MMAP) == 0) {
         void *addr = (void *)(uintptr_t)map->vaddr;
 
         map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
-- 
1.9.4


