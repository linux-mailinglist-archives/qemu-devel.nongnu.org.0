Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D0622016
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbj-0004zc-0x; Tue, 08 Nov 2022 18:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbZ-0004tg-RJ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbW-0003fg-SX
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:04 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtnV2007240
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=97kWlY886aIJJyBo4JJNkA/gv4j3hxaPWeITljzb5jA=;
 b=16a9NgwTrWs/MKtSZGhJL7I3I8p03Ag8WJnl4FpaMmfj8gWonG1jrstm1semwFe3cQo8
 b+pD7lfTekQzjRouNcpTub/bQyj8objtYwrVmfX7VMlej9yrFDEbIDQy/GUuV3qmPhDF
 Z8zAUfM32LXBiUe6sG4laLGz5G8CkU7Mlax/qrZYWcfXR9Tfo6QmD6vicq4nKraMCyuD
 Hp5ATXXA+UyMlybFCUbvqWs06pp77hmXKoIi3WxJWX06IYxmwNq9JlGFNZhO0PE5mMRT
 R4NQKAuk9l/WO4IMSqp0cZV+b28JvP7s84fOL0n8XJgajzsAiBbQDLpEYh54tDW1iN8p YQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy18461-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:49 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6S004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:48 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:48 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/24] vfio-user: get and set IRQs
Date: Tue,  8 Nov 2022 15:13:36 -0800
Message-Id: <5532e8b1721cdf68d8932c747dc6b5f42738e139.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: UEvQscNjFyEDrwK9niUXQT97Z9T2uaKn
X-Proofpoint-ORIG-GUID: UEvQscNjFyEDrwK9niUXQT97Z9T2uaKn
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
 hw/vfio/pci.c           |   7 ++-
 hw/vfio/user-protocol.h |  25 +++++++++
 hw/vfio/user.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7abe44e..be39a4e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -713,7 +713,8 @@ retry:
     ret = vfio_enable_vectors(vdev, false);
     if (ret) {
         if (ret < 0) {
-            error_report("vfio: Error: Failed to setup MSI fds: %m");
+            error_report("vfio: Error: Failed to setup MSI fds: %s",
+                         strerror(-ret));
         } else {
             error_report("vfio: Error: Failed to enable %d "
                          "MSI vectors, retry with %d", vdev->nr_vectors, ret);
@@ -2712,6 +2713,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
+
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -3593,6 +3595,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto out_teardown;
     }
 
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
     return;
 
 out_teardown:
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 124340c..31704cf 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -141,6 +141,31 @@ typedef struct {
 } VFIOUserRegionInfo;
 
 /*
+ * VFIO_USER_DEVICE_GET_IRQ_INFO
+ * imported from struct vfio_irq_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t count;
+} VFIOUserIRQInfo;
+
+/*
+ * VFIO_USER_DEVICE_SET_IRQS
+ * imported from struct vfio_irq_set
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t start;
+    uint32_t count;
+} VFIOUserIRQSet;
+
+/*
  * VFIO_USER_REGION_READ
  * VFIO_USER_REGION_WRITE
  */
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 1453bb5..815385b 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1164,6 +1164,117 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_get_irq_info(VFIOProxy *proxy,
+                                  struct vfio_irq_info *info)
+{
+    VFIOUserIRQInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
+                          sizeof(msg), 0);
+    msg.argsz = info->argsz;
+    msg.index = info->index;
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
+static int irq_howmany(int *fdp, uint32_t cur, uint32_t max)
+{
+    int n = 0;
+
+    if (fdp[cur] != -1) {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] != -1);
+    } else {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] == -1);
+    }
+
+    return n;
+}
+
+static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
+{
+    g_autofree VFIOUserIRQSet *msgp = NULL;
+    uint32_t size, nfds, send_fds, sent_fds, max;
+
+    if (irq->argsz < sizeof(*irq)) {
+        error_printf("vfio_user_set_irqs argsz too small\n");
+        return -EINVAL;
+    }
+
+    /*
+     * Handle simple case
+     */
+    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
+        size = sizeof(VFIOUserHdr) + irq->argsz;
+        msgp = g_malloc0(size);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start;
+        msgp->count = irq->count;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+
+        return 0;
+    }
+
+    /*
+     * Calculate the number of FDs to send
+     * and adjust argsz
+     */
+    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
+    irq->argsz = sizeof(*irq);
+    msgp = g_malloc0(sizeof(*msgp));
+    /*
+     * Send in chunks if over max_send_fds
+     */
+    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
+        VFIOUserFDs *arg_fds, loop_fds;
+
+        /* must send all valid FDs or all invalid FDs in single msg */
+        max = nfds - sent_fds;
+        if (max > proxy->max_send_fds) {
+            max = proxy->max_send_fds;
+        }
+        send_fds = irq_howmany((int *)irq->data, sent_fds, max);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
+                              sizeof(*msgp), 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start + sent_fds;
+        msgp->count = send_fds;
+
+        loop_fds.send_fds = send_fds;
+        loop_fds.recv_fds = 0;
+        loop_fds.fds = (int *)irq->data + sent_fds;
+        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, arg_fds, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+    }
+
+    return 0;
+}
+
 static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
                                  uint32_t count, void *data)
 {
@@ -1277,6 +1388,28 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_user_io_get_irq_info(VFIODevice *vbasedev,
+                                     struct vfio_irq_info *irq)
+{
+    int ret;
+
+    ret = vfio_user_get_irq_info(vbasedev->proxy, irq);
+    if (ret) {
+        return ret;
+    }
+
+    if (irq->index > vbasedev->num_irqs) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int vfio_user_io_set_irqs(VFIODevice *vbasedev,
+                                 struct vfio_irq_set *irqs)
+{
+    return vfio_user_set_irqs(vbasedev->proxy, irqs);
+}
+
 static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
                                     off_t off, uint32_t size, void *data)
 {
@@ -1294,6 +1427,8 @@ static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .get_irq_info = vfio_user_io_get_irq_info,
+    .set_irqs = vfio_user_io_set_irqs,
     .region_read = vfio_user_io_region_read,
     .region_write = vfio_user_io_region_write,
 };
-- 
1.8.3.1


