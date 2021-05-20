Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A1389F88
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:10:56 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdlf-000718-Nf
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljdhC-0001oY-PC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:06:18 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:38222
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljdhA-0006HZ-H0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:06:18 -0400
IronPort-Data: =?us-ascii?q?A9a23=3ASHwbfamePHJVnyFQZxM5/JPo5gy7JERdPkR7XQ2?=
 =?us-ascii?q?eYbTBsI5bp2dWn2AXXWDVPfqNMWP3ftwib4i19ktV68KGyoVgTFc++CA2RRqmi?=
 =?us-ascii?q?+KfW43BcR2Y0wB+jyH7ZBs+qZ1YM7EsFehsJpPnjkrrYuKJQUVUj/nSH+KhUb+?=
 =?us-ascii?q?cZEideCc/IMsfoUM68wIGqt4w6TSJK1vlVeLa+6UzCnf8s9JHGj58B5a4lf9al?=
 =?us-ascii?q?K+aVAX0EbAJTasjUFf2zxH5BX+ETE27ByOQroJ8RoZWSwtfpYxV8F81/z91Yj+?=
 =?us-ascii?q?kur39NEMXQL/OJhXIgX1TM0SgqkEa4HVsjeBgb7xBAatUo2zhc9RZzNRftZ2yS?=
 =?us-ascii?q?A4vFqPRmuUBSAQeGCZ7VUFD0OafcSXn75PNkyUqdFOpmZ2CFnoeJIAd56N7DH9?=
 =?us-ascii?q?D8dQeLzYCaA3FgPi5qJq3RehojMk5MOHxMY8fs20mxjbcZd4/XJHFX6jO7PdC0?=
 =?us-ascii?q?Tswj9wIFvHbD/f1wxIHgA/oOkUJYwlITsll2rrAu5U2SBUAwHr9mEb9yzG7INR?=
 =?us-ascii?q?N7YXQ?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AQJsPRaqF6q1bYdp9acVsC3EaV5oXeYIsimQD?=
 =?us-ascii?q?101hICG9E/bo8/xG+c536faaslgssQ4b8+xoVJPgfZq+z+8R3WByB8bAYOCOgg?=
 =?us-ascii?q?LBQ72KhrGSoQEIdRefysdtkY9kc4VbTOb7FEVGi6/BizWQIpINx8am/cmT6dvj?=
 =?us-ascii?q?8w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="108506764"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2021 16:06:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5F4054D0C138;
 Thu, 20 May 2021 16:06:10 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:06:10 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 20 May 2021 16:06:11 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH 1/4] migration/rdma: cleanup rmda in
 rdma_start_incoming_migration error path
Date: Thu, 20 May 2021 16:05:33 +0800
Message-ID: <20210520080536.16048-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 5F4054D0C138.ACDA0
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

the error path after calling qemu_rdma_dest_init() should do rdma cleanup

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 41726cc74a..7e7595faab 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4040,7 +4040,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
 
     if (ret) {
         ERROR(errp, "listening on socket!");
-        goto err;
+        goto cleanup_rdma;
     }
 
     trace_rdma_start_incoming_migration_after_rdma_listen();
@@ -4050,7 +4050,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
         rdma_return_path = qemu_rdma_data_init(host_port, &local_err);
 
         if (rdma_return_path == NULL) {
-            goto err;
+            goto cleanup_rdma;
         }
 
         qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
@@ -4059,6 +4059,9 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
     qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                         NULL, (void *)(intptr_t)rdma);
     return;
+
+cleanup_rdma:
+    qemu_rdma_cleanup(rdma);
 err:
     error_propagate(errp, local_err);
     if (rdma) {
-- 
2.30.2




