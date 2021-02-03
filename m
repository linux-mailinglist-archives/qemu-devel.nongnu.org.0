Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C56930D45E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:54:08 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CzH-00070s-Lu
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpn-0003Fr-DY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:19 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpl-0008N6-25
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:19 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVtv070QGzjJgd;
 Wed,  3 Feb 2021 15:42:36 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:46 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 17/18] migration/rdma: send data for both rdma-pin-all and
 NOT rdma-pin-all mode
Date: Wed, 3 Feb 2021 16:01:50 +0800
Message-ID: <1612339311-114805-18-git-send-email-zhengchuan@huawei.com>
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

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/rdma.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 2097839..c19a91f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2002,6 +2002,20 @@ static int qemu_rdma_write_one(QEMUFile *f, RDMAContext *rdma,
                                .repeat = 1,
                              };
 
+    /* use multifd to send data */
+    if (migrate_use_multifd()) {
+        int channel = get_multifd_RDMA_channel();
+        int ret = 0;
+        MultiFDSendParams *multifd_send_param = NULL;
+        ret = get_multifd_send_param(channel, &multifd_send_param);
+        if (ret) {
+            error_report("rdma: error getting multifd_send_param(%d)", channel);
+            return -EINVAL;
+        }
+        rdma = (RDMAContext *)multifd_send_param->rdma;
+        block = &(rdma->local_ram_blocks.block[current_index]);
+    }
+
 retry:
     sge.addr = (uintptr_t)(block->local_host_addr +
                             (current_addr - block->offset));
@@ -2197,6 +2211,27 @@ retry:
     return 0;
 }
 
+static int multifd_rdma_write_flush(void)
+{
+    /* The multifd RDMA threads send data */
+    MultiFDSendParams *multifd_send_param = NULL;
+    RDMAContext *rdma = NULL;
+    MigrationState *s = migrate_get_current();
+    int ret = 0;
+
+    ret = get_multifd_send_param(s->rdma_channel,
+                                 &multifd_send_param);
+    if (ret) {
+        error_report("rdma: error getting multifd_send_param(%d)",
+                     s->rdma_channel);
+        return ret;
+    }
+    rdma = (RDMAContext *)(multifd_send_param->rdma);
+    rdma->nb_sent++;
+
+    return ret;
+}
+
 /*
  * Push out any unwritten RDMA operations.
  *
@@ -2219,8 +2254,15 @@ static int qemu_rdma_write_flush(QEMUFile *f, RDMAContext *rdma)
     }
 
     if (ret == 0) {
-        rdma->nb_sent++;
-        trace_qemu_rdma_write_flush(rdma->nb_sent);
+        if (migrate_use_multifd()) {
+            ret = multifd_rdma_write_flush();
+            if (ret) {
+                return ret;
+            }
+        } else {
+            rdma->nb_sent++;
+            trace_qemu_rdma_write_flush(rdma->nb_sent);
+        }
     }
 
     rdma->current_length = 0;
@@ -4062,6 +4104,7 @@ wait_reg_complete:
             }
 
             qemu_sem_post(&multifd_send_param->sem_sync);
+            qemu_sem_wait(&multifd_send_param->sem);
         }
     }
 
@@ -4443,6 +4486,7 @@ static void *multifd_rdma_send_thread(void *opaque)
     Error *local_err = NULL;
     int ret = 0;
     RDMAControlHeader head = { .len = 0, .repeat = 1 };
+    RDMAContext *rdma = p->rdma;
 
     trace_multifd_send_thread_start(p->id);
     if (multifd_send_initial_packet(p, &local_err) < 0) {
@@ -4451,7 +4495,7 @@ static void *multifd_rdma_send_thread(void *opaque)
 
     /* wait for semaphore notification to register memory */
     qemu_sem_wait(&p->sem_sync);
-    if (qemu_rdma_registration(p->rdma) < 0) {
+    if (qemu_rdma_registration(rdma) < 0) {
         goto out;
     }
     /*
@@ -4466,12 +4510,25 @@ static void *multifd_rdma_send_thread(void *opaque)
                 break;
             }
         }
+        /* To complete polling(CQE) */
+        while (rdma->nb_sent) {
+            ret = qemu_rdma_block_for_wrid(rdma, RDMA_WRID_RDMA_WRITE, NULL);
+            if (ret < 0) {
+                error_report("multifd RDMA migration: "
+                             "complete polling error!");
+                return NULL;
+            }
+        }
         /* Send FINISHED to the destination */
         head.type = RDMA_CONTROL_REGISTER_FINISHED;
-        ret = qemu_rdma_exchange_send(p->rdma, &head, NULL, NULL, NULL, NULL);
+        ret = qemu_rdma_exchange_send(rdma, &head, NULL, NULL, NULL, NULL);
         if (ret < 0) {
+            error_report("multifd RDMA migration: "
+                         "sending remote error!");
             return NULL;
         }
+        /* sync main thread */
+        qemu_sem_post(&p->sem);
     }
 
 out:
-- 
1.8.3.1


