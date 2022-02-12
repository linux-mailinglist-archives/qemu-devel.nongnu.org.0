Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21C4B353D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:11:53 +0100 (CET)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIsBs-0007Ky-F5
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1nIs8E-0006W4-G8
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:08:07 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1nIs87-00053t-H0
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:08:03 -0500
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JwrNC2yW1zbhWV;
 Sat, 12 Feb 2022 21:06:35 +0800 (CST)
Received: from localhost (10.174.151.225) by canpemm500006.china.huawei.com
 (7.192.105.130) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Sat, 12 Feb
 2022 21:07:38 +0800
To: <qemu-devel@nongnu.org>
CC: <dgilbert@redhat.com>, <quintela@redhat.com>, <weidong.huang@huawei.com>, 
 Wang Xin <wangxinxin.wang@huawei.com>, Huangyu Zhai <zhaihuanyu@huawei.com>
Subject: [PATCH] multifd: ensure multifd threads are terminated before cleanup
 params
Date: Sat, 12 Feb 2022 21:07:35 +0800
Message-ID: <20220212130735.3236-1-wangxinxin.wang@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.151.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500006.china.huawei.com (7.192.105.130)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxinxin.wang@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Wang Xin <wangxinxin.wang@huawei.com>
From:  Wang Xin via <qemu-devel@nongnu.org>

In multifd_save_cleanup(), we terminate all multifd threads and destroy
the 'p->mutex', while the mutex may still be held by multifd send thread,
this causes qemu to crash.

It's because the multifd_send_thread maybe scheduled out after setting
'p->running' to false. To reproduce the problem, we put
'multifd_send_thread' to sleep seconds before unlock 'p->mutex':

function multifd_send_thread()
{
    ...
    qemu_mutex_lock(&p->mutex);
    p->running = false;
    usleep(5000000);
    ^^^^^^^^^^^^^^^^
    qemu_mutex_unlock(&p->mutex);
    ...
}

As the 'p->running' is used to indicate whether the multifd_send/recv thread
is created, it should be set to false after the thread terminate.

Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
Signed-off-by: Huangyu Zhai <zhaihuanyu@huawei.com>

diff --git a/migration/multifd.c b/migration/multifd.c
index 76b57a7177..d8fc7d319e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -526,6 +526,7 @@ void multifd_save_cleanup(void)
 
         if (p->running) {
             qemu_thread_join(&p->thread);
+            p->running = false;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -707,10 +708,6 @@ out:
         qemu_sem_post(&multifd_send_state->channels_ready);
     }
 
-    qemu_mutex_lock(&p->mutex);
-    p->running = false;
-    qemu_mutex_unlock(&p->mutex);
-
     rcu_unregister_thread();
     trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
 
@@ -995,6 +992,7 @@ int multifd_load_cleanup(Error **errp)
              */
             qemu_sem_post(&p->sem_sync);
             qemu_thread_join(&p->thread);
+            p->running = false;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1110,9 +1108,6 @@ static void *multifd_recv_thread(void *opaque)
         multifd_recv_terminate_threads(local_err);
         error_free(local_err);
     }
-    qemu_mutex_lock(&p->mutex);
-    p->running = false;
-    qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
     trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages);
-- 
2.26.0.windows.1


