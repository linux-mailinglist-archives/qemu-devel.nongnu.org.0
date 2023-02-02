Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E268757F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPJ-00089R-G7; Thu, 02 Feb 2023 00:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPF-00088f-TQ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:09 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPD-00079j-G3
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:09 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124ifgC027422; Thu, 2 Feb 2023 05:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=2MyLpRHFvnjahjePJwG1QRaYxN8Mw3IsbhhrOXXY0aA=;
 b=f8W3snUW2oOCFWPutG+bxgDtr/E8M8pJdILkmemD66Nv3JxKL3eUShM19In2x1tuR5pN
 ABBYfMwM40oI5ttv1KCwBmn/d5U60Ssuex4xJ4Gy28OU4tA2SvjvUGsRerrJjWVXT2jp
 x2zrQ6TNC0DrsZGX1apme0x8FGBWHuaGdw85Z1pTVW1s1ElwThDds6Fi4coEm/7hFx24
 gGrI7Ar6fdm4xfQmgYVRYuPCn3GqHYfSqtB2RWyBjoJh7OU7ofPy59u90aZqA4c67uey
 Ok+gzsyb6k2NXwRyDJJKmiPIS7wgC1ELd8Ftn0aAKSqcSiGkjsnGNRl8X1cpPfpfX3rI jw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfpywj0vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppf013015; Thu, 2 Feb 2023 05:45:03 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:03 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 10/23] vfio-user: get device info
Date: Wed,  1 Feb 2023 21:55:46 -0800
Message-Id: <8bc3133469b42eecc3a8af8200b5ce9692e6f3e9.1675228037.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: RaVbJov5FYWjNFvk822WJVxOF5orHqSc
X-Proofpoint-ORIG-GUID: RaVbJov5FYWjNFvk822WJVxOF5orHqSc
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h       | 12 ++++++++++
 hw/vfio/user.h                |  1 +
 include/hw/vfio/vfio-common.h |  3 +++
 hw/vfio/common.c              | 23 +++++++++++-------
 hw/vfio/user-pci.c            |  6 +++++
 hw/vfio/user.c                | 55 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 7 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 5de5b20..5f9ef17 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -113,4 +113,16 @@ typedef struct {
  */
 #define VFIO_USER_DEF_MAX_BITMAP (256 * 1024 * 1024)
 
+/*
+ * VFIO_USER_DEVICE_GET_INFO
+ * imported from struct vfio_device_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t num_regions;
+    uint32_t num_irqs;
+} VFIOUserDeviceInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 038e5e3..d148661 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -90,6 +90,7 @@ void vfio_user_disconnect(VFIOUserProxy *proxy);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
+int vfio_user_get_device(VFIODevice *vbasedev, Error **errp);
 int vfio_user_validate_version(VFIOUserProxy *proxy, Error **errp);
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e1ee0ac..0962e37 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -254,6 +254,9 @@ void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
 
+void vfio_init_device(VFIODevice *vbasedev, VFIOGroup *group,
+                      struct vfio_device_info *info);
+
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 45b950a..792e247 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2369,6 +2369,20 @@ void vfio_get_all_regions(VFIODevice *vbasedev)
     }
 }
 
+void vfio_init_device(VFIODevice *vbasedev, VFIOGroup *group,
+                      struct vfio_device_info *info)
+{
+    vbasedev->group = group;
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+
+    vbasedev->num_irqs = info->num_irqs;
+    vbasedev->num_regions = info->num_regions;
+    vbasedev->flags = info->flags;
+    vbasedev->reset_works = !!(info->flags & VFIO_DEVICE_FLAGS_RESET);
+
+    vfio_get_all_regions(vbasedev);
+}
+
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp)
 {
@@ -2414,18 +2428,11 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     }
 
     vbasedev->fd = fd;
-    vbasedev->group = group;
-    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
-
-    vbasedev->num_irqs = dev_info.num_irqs;
-    vbasedev->num_regions = dev_info.num_regions;
-    vbasedev->flags = dev_info.flags;
+    vfio_init_device(vbasedev, group, &dev_info);
 
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
 
-    vfio_get_all_regions(vbasedev);
-    vbasedev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
     return 0;
 }
 
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index 0fe2593..e5a9450 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -77,6 +77,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOUserProxy *proxy;
+    int ret;
     Error *err = NULL;
 
     /*
@@ -116,6 +117,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
 
+    ret = vfio_user_get_device(vbasedev, errp);
+    if (ret) {
+        goto error;
+    }
+
     return;
 
 error:
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 2d60f99..d0ec14c 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -32,6 +32,14 @@
 #include "user.h"
 #include "trace.h"
 
+
+/*
+ * These are to defend against a malign server trying
+ * to force us to run out of memory.
+ */
+#define VFIO_USER_MAX_REGIONS   100
+#define VFIO_USER_MAX_IRQS      50
+
 static int wait_time = 5000;   /* wait up to 5 sec for busy servers */
 static IOThread *vfio_user_iothread;
 
@@ -55,6 +63,9 @@ static void vfio_user_send_wait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
 
+static int vfio_user_get_info(VFIOUserProxy *proxy,
+                              struct vfio_device_info *info);
+
 static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
 {
     hdr->flags |= VFIO_USER_ERROR;
@@ -807,6 +818,30 @@ void vfio_user_disconnect(VFIOUserProxy *proxy)
     g_free(proxy);
 }
 
+int vfio_user_get_device(VFIODevice *vbasedev, Error **errp)
+{
+    struct vfio_device_info info = { .argsz = sizeof(info) };
+    int ret;
+
+    ret = vfio_user_get_info(vbasedev->proxy, &info);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        return ret;
+    }
+
+    /* defend against a malicious server */
+    if (info.num_regions > VFIO_USER_MAX_REGIONS ||
+        info.num_irqs > VFIO_USER_MAX_IRQS) {
+        error_printf("vfio_user_get_info: invalid reply\n");
+        return -EINVAL;
+    }
+
+    vbasedev->fd = -1;
+    vfio_init_device(vbasedev, NULL, &info);
+
+    return 0;
+}
+
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags)
 {
@@ -1088,3 +1123,23 @@ int vfio_user_validate_version(VFIOUserProxy *proxy, Error **errp)
     trace_vfio_user_version(msgp->major, msgp->minor, msgp->capabilities);
     return 0;
 }
+
+static int vfio_user_get_info(VFIOUserProxy *proxy,
+                              struct vfio_device_info *info)
+{
+    VFIOUserDeviceInfo msg;
+    uint32_t argsz = sizeof(msg) - sizeof(msg.hdr);
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
+    msg.argsz = argsz;
+
+    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+    trace_vfio_user_get_info(msg.num_regions, msg.num_irqs);
+
+    memcpy(info, &msg.argsz, argsz);
+    return 0;
+}
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index e3640bc..ff903c0 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -173,3 +173,4 @@ vfio_user_recv_read(uint16_t id, int read) " id 0x%x read 0x%x"
 vfio_user_recv_request(uint16_t cmd) " command 0x%x"
 vfio_user_send_write(uint16_t id, int wrote) " id 0x%x wrote 0x%x"
 vfio_user_version(uint16_t major, uint16_t minor, const char *caps) " major %d minor %d caps: %s"
+vfio_user_get_info(uint32_t nregions, uint32_t nirqs) " #regions %d #irqs %d"
-- 
1.9.4


