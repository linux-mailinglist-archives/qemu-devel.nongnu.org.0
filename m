Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BC62200C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:06:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbo-00051K-0G; Tue, 08 Nov 2022 18:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbi-0004yS-0K
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:14 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbZ-0003jJ-Ez
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:13 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtnVD007240
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=orL4bGgxgEu4kwlgauMm/RRXSDU3ehPDvGQNDpAAI0o=;
 b=A6pX8E506QdEyk2Ly95bRqUE576DqyzUpS9x2j+lRuRBY8aPXIP6Eo4I2rOr6SoCCo+h
 y92nG2La6WU+t/y4sRsa52hscGDpdA8HomE1HMuAW8+ZBl325DG8y9Bbd7FWYSA7QbIO
 4ZwtcqoqOuQaB+nSJFP6/pdLWdYoU0QYNsD1r/u9sPb8igOkZ8O7FVT9izwZrd/7n5VW
 0ly1c7h48xETMYfiMKNcEx5IFWmObXapM4eHwiP0OL6AUEERBMhZ71+4NKQZPPF7lm/a
 8QfnMB9EKd1UUbxBOvw9hIBq1bHuyawSrQxcWi8hLRumCxn9zxF8wMoKuBUgvlIHcYP+ bQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy1846b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:53 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6b004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:51 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-23
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:51 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 22/24] vfio-user: add 'x-msg-timeout' option that specifies
 msg wait times
Date: Tue,  8 Nov 2022 15:13:44 -0800
Message-Id: <c7fc9005cc61d7ca53156ee5ece4c17980a78b15.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: u1WdzF6_n_7yB5PP0a6fsAgR3Z1HDmqY
X-Proofpoint-ORIG-GUID: u1WdzF6_n_7yB5PP0a6fsAgR3Z1HDmqY
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

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c  | 4 ++++
 hw/vfio/pci.h  | 1 +
 hw/vfio/user.c | 7 +++++--
 hw/vfio/user.h | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 005fcf8..3ae3a13 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3729,6 +3729,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (udev->no_post) {
         proxy->flags |= VFIO_PROXY_NO_POST;
     }
+    if (udev->wait_time) {
+        proxy->wait_time = udev->wait_time;
+    }
 
     vfio_user_validate_version(proxy, &err);
     if (err != NULL) {
@@ -3848,6 +3851,7 @@ static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
+    DEFINE_PROP_UINT32("x-msg-timeout", VFIOUserPCIDevice, wait_time, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index c4b8e5c..48b19ee 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -199,6 +199,7 @@ struct VFIOUserPCIDevice {
     bool secure_dma;    /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
+    uint32_t wait_time; /* timeout for message replies */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index ddf9e13..a9e6cf5 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -717,7 +717,8 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
 
     if (ret == 0) {
         while (!msg->complete) {
-            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock,
+                                     proxy->wait_time)) {
                 VFIOUserMsgQ *list;
 
                 list = msg->pending ? &proxy->pending : &proxy->outgoing;
@@ -759,7 +760,8 @@ static void vfio_user_wait_reqs(VFIOProxy *proxy)
         msg = proxy->last_nowait;
         msg->type = VFIO_MSG_WAIT;
         while (!msg->complete) {
-            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock,
+                                     proxy->wait_time)) {
                 VFIOUserMsgQ *list;
 
                 list = msg->pending ? &proxy->pending : &proxy->outgoing;
@@ -881,6 +883,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
 
     proxy->flags = VFIO_PROXY_CLIENT;
     proxy->state = VFIO_PROXY_CONNECTED;
+    proxy->wait_time = wait_time;
 
     qemu_mutex_init(&proxy->lock);
     qemu_cond_init(&proxy->close_cv);
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index d88ffe5..f711861 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -62,6 +62,7 @@ typedef struct VFIOProxy {
     uint64_t max_bitmap;
     uint64_t migr_pgsize;
     int flags;
+    uint32_t wait_time;
     QemuCond close_cv;
     AioContext *ctx;
     QEMUBH *req_bh;
-- 
1.8.3.1


