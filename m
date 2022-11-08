Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EA622023
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:10:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXba-0004tv-Hu; Tue, 08 Nov 2022 18:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbO-0004oV-NE
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbJ-0003f5-5d
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:01:54 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx3cg026328
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=pY5869GH3HPdHXOF+8kv/1lhzUTZ1ZalLkfpptMmFMQ=;
 b=l0gmhDOVBMT/VPD4UD9W2D6l8/JGTZL9/y1Dj19dQbVpCx+AbfkoNN7rIfzmUcEZd25i
 3axcKrCVo+ioYJIXSu8oVILG/d79WCZQSgAnGFFwyzNicjLHQ0iiiHHyoq1KL+zQ0sHE
 T3+Lyaf7Ify8SC3BnUkyxZ86jVDLdfsql0SEWMHHLn+5KYuPTHphf7depgzuOzXJ2rDU
 GTXOuOz6Jq9c2+BNsyNmX+aSIq87WtbcJpHxJ9AGNpR+mHkgvXKTGSqGFsi6MendTeNG
 2PfOlXaZ8gJNGEgxKeZBIrniK3z7fBW5GdtoOhgxvlVV7P55Xt4LzzYO2fc65/6elNih VA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:47 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6O004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:47 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:46 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/24] vfio-user: get device info
Date: Tue,  8 Nov 2022 15:13:32 -0800
Message-Id: <d0fcc3415ab22bf66bbd86c1d69d4dade8c023bb.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: PfPmXObVnljTmyAz9nOHxxvSl6Oor3Pp
X-Proofpoint-ORIG-GUID: PfPmXObVnljTmyAz9nOHxxvSl6Oor3Pp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 hw/vfio/pci.c           | 15 ++++++++++++++
 hw/vfio/user-protocol.h | 13 ++++++++++++
 hw/vfio/user.c          | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.h          |  2 ++
 4 files changed, 85 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index b2534b3..2e0e41d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3465,6 +3465,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    struct vfio_device_info info;
+    int ret;
     Error *err = NULL;
 
     /*
@@ -3503,6 +3505,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->ops = &vfio_user_pci_ops;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->dev = DEVICE(vdev);
+    vbasedev->io_ops = &vfio_dev_io_sock;
+
+    ret = VDEV_GET_INFO(vbasedev, &info);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        goto error;
+    }
+
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
 
     return;
 
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 5de5b20..43912a5 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -113,4 +113,17 @@ typedef struct {
  */
 #define VFIO_USER_DEF_MAX_BITMAP (256 * 1024 * 1024)
 
+/*
+ * VFIO_USER_DEVICE_GET_INFO
+ * imported from struct_device_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t num_regions;
+    uint32_t num_irqs;
+    uint32_t cap_offset;
+} VFIOUserDeviceInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 31bcc93..7873534 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -31,6 +31,14 @@
 #include "qapi/qmp/qbool.h"
 #include "user.h"
 
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
 
@@ -1075,3 +1083,50 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
 
     return 0;
 }
+
+static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
+{
+    VFIOUserDeviceInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
+    msg.argsz = sizeof(struct vfio_device_info);
+
+    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
+
+
+/*
+ * Socket-based io_ops
+ */
+
+static int vfio_user_io_get_info(VFIODevice *vbasedev,
+                                 struct vfio_device_info *info)
+{
+    int ret;
+
+    ret = vfio_user_get_info(vbasedev->proxy, info);
+    if (ret) {
+        return ret;
+    }
+
+    /* defend against a malicious server */
+    if (info->num_regions > VFIO_USER_MAX_REGIONS ||
+        info->num_irqs > VFIO_USER_MAX_IRQS) {
+        error_printf("vfio_user_get_info: invalid reply\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+VFIODevIO vfio_dev_io_sock = {
+    .get_info = vfio_user_io_get_info,
+};
+
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 8ce3cd9..2547cf6 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -92,4 +92,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
                            void *reqarg);
 int vfio_user_validate_version(VFIOProxy *proxy, Error **errp);
 
+extern VFIODevIO vfio_dev_io_sock;
+
 #endif /* VFIO_USER_H */
-- 
1.8.3.1


