Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B368757C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPQ-0008Dx-Qr; Thu, 02 Feb 2023 00:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPO-0008DJ-Ou
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPN-0007Cj-5Z
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:18 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124iC11007366; Thu, 2 Feb 2023 05:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=iz+MH8zmguRnMEdN7jN/X9r4epUcgK6W52eyxmfWeLo=;
 b=XkVUf0ThypsAiF2dfLAehlwl+/bB/e27NnOWQyJcZ9Fi0lGP22iRetqy7dCF1Q3bTRit
 pL+0eJZ5oen7FTr+0HqM/pk+5Yr7ybf5ifb/p0rfLnytLhmtY6eWOn+gP/O9UCXqEarA
 Geyl9Z2Frw3+5rgj4CpKqBvxiPKy9QFziX6Kkft6vN3S/apVrX5p7074BxC3aBT7IzJP
 3JMV4ZBmrHpd34Q49ISi9emZv23t1rafpqlGF364YE5FshXfvQBPIuvX31DuhVHgHhSn
 H09z7ywYfOatFSAw3S/5f82NtyqXzzw88CE3eB7/7h1QNtNxPdin6IJZPdAJ4Ej49EPq fg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfn9yj84k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:15 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppx013015; Thu, 2 Feb 2023 05:45:15 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-23
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:15 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 22/23] vfio-user: add 'x-msg-timeout' option that specifies
 msg wait times
Date: Wed,  1 Feb 2023 21:55:58 -0800
Message-Id: <ea58be3d4cda7c2f833365024ce8997341dbc094.1675228037.git.john.g.johnson@oracle.com>
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
X-Proofpoint-ORIG-GUID: wTfl4qQnxUKCYmFORrYrxv_q1gbZ6XfC
X-Proofpoint-GUID: wTfl4qQnxUKCYmFORrYrxv_q1gbZ6XfC
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
 hw/vfio/user.h     | 1 +
 hw/vfio/user-pci.c | 4 ++++
 hw/vfio/user.c     | 7 ++++---
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index b7a9f57..52b3f89 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -62,6 +62,7 @@ typedef struct VFIOUserProxy {
     uint64_t max_bitmap;
     uint64_t migr_pgsize;
     int flags;
+    uint32_t wait_time;
     QemuCond close_cv;
     AioContext *ctx;
     QEMUBH *req_bh;
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index ee018db..5d0b224 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -43,6 +43,7 @@ struct VFIOUserPCIDevice {
     bool no_direct_dma; /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
+    uint32_t wait_time; /* timeout for message replies */
 };
 
 /*
@@ -280,6 +281,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (udev->no_post) {
         proxy->flags |= VFIO_PROXY_NO_POST;
     }
+    /* user specified or 5 sec default */
+    proxy->wait_time = udev->wait_time;
 
     vfio_user_validate_version(proxy, &err);
     if (err != NULL) {
@@ -400,6 +403,7 @@ static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_BOOL("no-direct-dma", VFIOUserPCIDevice, no_direct_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
+    DEFINE_PROP_UINT32("x-msg-timeout", VFIOUserPCIDevice, wait_time, 5000),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 9b51686..af5471b 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -44,7 +44,6 @@
 #define VFIO_USER_MAX_REGIONS   100
 #define VFIO_USER_MAX_IRQS      50
 
-static int wait_time = 5000;   /* wait up to 5 sec for busy servers */
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOUserProxy *proxy);
@@ -735,7 +734,8 @@ static void vfio_user_send_wait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
 
     if (ret == 0) {
         while (!msg->complete) {
-            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock,
+                                     proxy->wait_time)) {
                 VFIOUserMsgQ *list;
 
                 list = msg->pending ? &proxy->pending : &proxy->outgoing;
@@ -778,7 +778,8 @@ static void vfio_user_wait_reqs(VFIOUserProxy *proxy)
         msg->type = VFIO_MSG_WAIT;
         proxy->last_nowait = NULL;
         while (!msg->complete) {
-            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock,
+                                     proxy->wait_time)) {
                 VFIOUserMsgQ *list;
 
                 list = msg->pending ? &proxy->pending : &proxy->outgoing;
-- 
1.9.4


