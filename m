Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04030D479
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:58:33 +0100 (CET)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7D3Y-00045U-4M
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpl-0003BD-JN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:17 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpj-0008MY-Px
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:17 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVtv06V3xzjJgc;
 Wed,  3 Feb 2021 15:42:36 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:41 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 09/18] migration/rdma: add multifd_rdma_load_setup() to
 setup multifd rdma
Date: Wed, 3 Feb 2021 16:01:42 +0800
Message-ID: <1612339311-114805-10-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index e0ea86d..996afb0 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4011,6 +4011,48 @@ static void rdma_accept_incoming_migration(void *opaque)
     }
 }
 
+static bool multifd_rdma_load_setup(const char *host_port,
+                                    RDMAContext *rdma, Error **errp)
+{
+    int thread_count;
+    int i;
+    int idx;
+    MultiFDRecvParams *multifd_recv_param;
+    RDMAContext *multifd_rdma;
+
+    if (!migrate_use_multifd()) {
+        return true;
+    }
+
+    if (multifd_load_setup(errp) != 0) {
+        /*
+         * We haven't been able to create multifd threads
+         * nothing better to do
+         */
+        return false;
+    }
+
+    thread_count = migrate_multifd_channels();
+    for (i = 0; i < thread_count; i++) {
+        if (get_multifd_recv_param(i, &multifd_recv_param) < 0) {
+            ERROR(errp, "rdma: error getting multifd_recv_param(%d)", i);
+            return false;
+        }
+
+        multifd_rdma = qemu_rdma_data_init(host_port, errp);
+        for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
+            multifd_rdma->wr_data[idx].control_len = 0;
+            multifd_rdma->wr_data[idx].control_curr = NULL;
+        }
+        /* the CM channel and CM id is shared */
+        multifd_rdma->channel = rdma->channel;
+        multifd_rdma->listen_id = rdma->listen_id;
+        multifd_recv_param->rdma = (void *)multifd_rdma;
+    }
+
+    return true;
+}
+
 void rdma_start_incoming_migration(const char *host_port, Error **errp)
 {
     int ret;
@@ -4058,6 +4100,16 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
         qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
     }
 
+    /* multifd rdma setup */
+    if (!multifd_rdma_load_setup(host_port, rdma, &local_err)) {
+        /*
+         * We haven't been able to create multifd threads
+         * nothing better to do
+         */
+        error_report_err(local_err);
+        goto err;
+    }
+
     qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                         NULL, (void *)(intptr_t)rdma);
     return;
-- 
1.8.3.1


