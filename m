Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936538FC5F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:13:03 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSBS-00021K-Ba
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1llS5d-000381-LI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:07:01 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:26035
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1llS5W-0003NV-Mo
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:07:01 -0400
IronPort-Data: =?us-ascii?q?A9a23=3AV+L836J8F0ZFe4DJFE+R65clxSXFcZb7ZxGrkP8?=
 =?us-ascii?q?bfHDv0GsngzMGzWAZCG3TbKnbZmv1KNgjYIrlpxhX7MCEyoNqS1BcGVNFFSwT8?=
 =?us-ascii?q?ZWfbTi6wuYcBwvLd4ubChsPA/w2MrEsF+hpCC+GzvuRGuK59yAkiPvUHuGU5NP?=
 =?us-ascii?q?sYUideyc1EU/Ntjozw4bVsqYw6TSIK1vlVeHa+qUzC3f5s9JACV/43orYwP9ZU?=
 =?us-ascii?q?FsejxtD1rA2TagjUFYzDBD5BrpHTU26ByOQroW5goeHq+j/ILGRpgs1/j8mDJW?=
 =?us-ascii?q?rj7T6blYXBLXVOGBiiFIPA+773EcE/Xd0j87XN9JFAatTozGIjdBwytREs7S+V?=
 =?us-ascii?q?AUoIrbR3u8aVnG0FgknZf0ZqOKdeiDXXcu7iheun2HX6+xjCVxzMYAG9+JfB2Z?=
 =?us-ascii?q?I+voFbjcXYXiri+23xLi2UPVEnMkvLMD3eogYvxlI1CzYC+orRZnrWajG5dZEm?=
 =?us-ascii?q?jw3g6hz8Vz2DyYCQWM3Kk2ePFsUYRFKYK/SVdyA3hHXGwC0YnrPzUbv31Xu8Q?=
 =?us-ascii?q?=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AY+HixqkO72UPr6sjbuDPnuCPswLpDfI53DAb?=
 =?us-ascii?q?v31ZSRFFG/FwWfrCoB1p726QtN9xYhEdcL+7V5VoLUm2yXcX2+gs1NWZMjUO0V?=
 =?us-ascii?q?HARL2KhrGP/9SUIVydygcy781dmtBFeb7NMWQ=3D?=
X-IronPort-AV: E=Sophos;i="5.82,327,1613404800"; d="scan'208";a="108785230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 May 2021 16:06:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7C5C54C369FD;
 Tue, 25 May 2021 16:06:50 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 May 2021 16:06:39 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 25 May 2021 16:06:39 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 4/4] migration/rdma: source: poll cm_event from return path
Date: Tue, 25 May 2021 16:05:52 +0800
Message-ID: <20210525080552.28259-4-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525080552.28259-1-lizhijian@cn.fujitsu.com>
References: <20210525080552.28259-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 7C5C54C369FD.ABB6D
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

Let source side have chance to cancel this migration

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
V2: utilize poll to check cm event
---
 migration/rdma.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index d829d08d076..f67e21b4f54 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -36,6 +36,7 @@
 #include <rdma/rdma_cma.h>
 #include "trace.h"
 #include "qom/object.h"
+#include <poll.h>
 
 /*
  * Print and error on both the Monitor and the Log file.
@@ -2460,7 +2461,36 @@ err_rdma_source_init:
     return -1;
 }
 
-static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
+static int qemu_get_cm_event_timeout(RDMAContext *rdma,
+                                     struct rdma_cm_event **cm_event,
+                                     long msec, Error **errp)
+{
+    int ret;
+    struct pollfd poll_fd = {
+                                .fd = rdma->channel->fd,
+                                .events = POLLIN,
+                                .revents = 0
+                            };
+
+    do {
+        ret = poll(&poll_fd, 1, msec);
+    } while (ret < 0 && errno == EINTR);
+
+    if (ret == 0) {
+        ERROR(errp, "poll cm event timeout");
+        return -1;
+    } else if (ret < 0) {
+        ERROR(errp, "failed to pull cm event, errno=%i", errno);
+        return -1;
+    } else if (poll_fd.revents & POLLIN) {
+        return rdma_get_cm_event(rdma->channel, cm_event);
+    } else {
+        ERROR(errp, "no POLLIN event, revent=%x", poll_fd.revents);
+        return -1;
+    }
+}
+
+static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
 {
     RDMACapabilities cap = {
                                 .version = RDMA_CONTROL_VERSION_CURRENT,
@@ -2498,7 +2528,11 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
         goto err_rdma_source_connect;
     }
 
-    ret = rdma_get_cm_event(rdma->channel, &cm_event);
+    if (return_path) {
+        ret = qemu_get_cm_event_timeout(rdma, &cm_event, 5000, errp);
+    } else {
+        ret = rdma_get_cm_event(rdma->channel, &cm_event);
+    }
     if (ret) {
         perror("rdma_get_cm_event after rdma_connect");
         ERROR(errp, "connecting to destination!");
@@ -4111,7 +4145,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     trace_rdma_start_outgoing_migration_after_rdma_source_init();
-    ret = qemu_rdma_connect(rdma, errp);
+    ret = qemu_rdma_connect(rdma, errp, false);
 
     if (ret) {
         goto err;
@@ -4132,7 +4166,7 @@ void rdma_start_outgoing_migration(void *opaque,
             goto return_path_err;
         }
 
-        ret = qemu_rdma_connect(rdma_return_path, errp);
+        ret = qemu_rdma_connect(rdma_return_path, errp, true);
 
         if (ret) {
             goto return_path_err;
-- 
2.30.2




