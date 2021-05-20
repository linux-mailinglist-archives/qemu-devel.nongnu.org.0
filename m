Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28646389FBB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:25:28 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdzj-0007Le-4X
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljdnR-0002D6-TQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:12:45 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:10757
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljdnP-0002OH-Vt
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:12:45 -0400
IronPort-Data: =?us-ascii?q?A9a23=3AAiDMPqJRWBnNQUKUFE+R65clxSXFcZb7ZxGrkP8?=
 =?us-ascii?q?bfHC6gjp23zVWzGceC2CAPf2MY2agcop/b4Sy8UoB68fczYNqS1BcGVNFFSwT8?=
 =?us-ascii?q?ZWfbTi6wuYcBwvLd4ubChsPA/w2MrEsF+hpCC+GzvuRGuK59yAkiPjZHuSU5NP?=
 =?us-ascii?q?sYUideyc1EU/Ntjozw4bVsqYw6TSIK1vlVeHa+qUzC3f5s9JACV/43orYwP9ZU?=
 =?us-ascii?q?FsejxtD1rA2TagjUFYzDBD5BrpHTU26ByOQroW5goeHq+j/ILGRpgs1/j8mDJW?=
 =?us-ascii?q?rj7T6blYXBLXVOGBiiFIPA+773EcE/Xd0j87XN9JFAatTozGIjdBwytREs7S+V?=
 =?us-ascii?q?AUoIrbR3u8aVnG0FgknZf0boOCffiLXXcu7iheun2HX6+xjCVxzMYAG9+JfB2Z?=
 =?us-ascii?q?I+voFbjcXYXiri+23xLi2UPVEnMkvLMD3eogYvxlI1CzYC+orRZnrWajG5dZEm?=
 =?us-ascii?q?jw3g6hz8Vz2DyYCQWM3Kk2ePFsUYRFKYK/SVdyA3hHXGwC0YnrPzUbv31Xu8Q?=
 =?us-ascii?q?=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A3t+FF69ehFddy2NnOstuk+DkI+orL9Y04lQ7?=
 =?us-ascii?q?vn2ZKCYlFvBw8vrCoB1173HJYUkqMk3I9ergBEDiewK4yXcW2/hzAV7KZmCP11?=
 =?us-ascii?q?dAR7sSj7cKrQeBJwTOssZZ1YpFN5N1EcDMCzFB5vrS0U2VFMkBzbC8nJyVuQ?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="108507072"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2021 16:12:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4D5F4499D6C0;
 Thu, 20 May 2021 16:12:38 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:12:38 +0800
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:12:37 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 20 May 2021 16:12:39 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH RESEND 4/4] migration/rdma: source: get accept cm_event from
 return path in non-block mode
Date: Thu, 20 May 2021 16:11:48 +0800
Message-ID: <20210520081148.17001-4-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
References: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 4D5F4499D6C0.AEDD5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

source side always blocks if postcopy is only enabled at source side.
users are not able to cancel this migration in this case.

Here we try to get the cm_event every 100ms tile timeout.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 59 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 3b228c46eb..181ad03849 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2458,7 +2458,54 @@ err_rdma_source_init:
     return -1;
 }
 
-static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
+#define RDMA_GET_EVENT_INTERVAL 100000 /* 100ms */
+static int qemu_get_cm_event_timeout(RDMAContext *rdma,
+                                     struct rdma_cm_event **cm_event,
+                                     long sec, Error **errp)
+{
+    long wait_ns = 0;
+    int ret;
+    int flags = fcntl(rdma->channel->fd, F_GETFL), save_flags;
+
+    if (flags == -1) {
+        perror("failed to get file flags");
+        return flags;
+    }
+    save_flags = flags;
+    flags |= O_NONBLOCK;
+    ret = fcntl(rdma->channel->fd, F_SETFL, flags);
+    if (ret) {
+        perror("failed to set file flags nonblocking");
+        return ret;
+    }
+
+retry:
+    ret = rdma_get_cm_event(rdma->channel, cm_event);
+    if (ret && errno == EAGAIN) {
+        if (wait_ns < sec * 1000000) {
+            perror("rdma_get_cm_event after rdma_connect");
+            wait_ns += RDMA_GET_EVENT_INTERVAL;
+            usleep(RDMA_GET_EVENT_INTERVAL);
+            goto retry;
+        }
+    }
+    if (ret) {
+        perror("rdma_get_cm_event after rdma_connect");
+        ERROR(errp, "connecting to destination!");
+        return ret;
+    }
+
+    /* restore flags */
+    ret = fcntl(rdma->channel->fd, F_SETFL, save_flags);
+    if (ret) {
+        rdma_ack_cm_event(*cm_event);
+        perror("failed to restore file flags");
+    }
+
+    return ret;
+}
+
+static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
 {
     RDMACapabilities cap = {
                                 .version = RDMA_CONTROL_VERSION_CURRENT,
@@ -2496,7 +2543,11 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
         goto err_rdma_source_connect;
     }
 
-    ret = rdma_get_cm_event(rdma->channel, &cm_event);
+    if (return_path) {
+        ret = qemu_get_cm_event_timeout(rdma, &cm_event, 2, errp);
+    } else {
+        ret = rdma_get_cm_event(rdma->channel, &cm_event);
+    }
     if (ret) {
         perror("rdma_get_cm_event after rdma_connect");
         ERROR(errp, "connecting to destination!");
@@ -4108,7 +4159,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     trace_rdma_start_outgoing_migration_after_rdma_source_init();
-    ret = qemu_rdma_connect(rdma, errp);
+    ret = qemu_rdma_connect(rdma, errp, false);
 
     if (ret) {
         goto err;
@@ -4129,7 +4180,7 @@ void rdma_start_outgoing_migration(void *opaque,
             goto return_path_err;
         }
 
-        ret = qemu_rdma_connect(rdma_return_path, errp);
+        ret = qemu_rdma_connect(rdma_return_path, errp, true);
 
         if (ret) {
             goto return_path_err;
-- 
2.30.2




