Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3A2CD0A5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 08:57:31 +0100 (CET)
Received: from localhost ([::1]:57212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkjUY-0007C0-Qb
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 02:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPn-0002Sl-79; Thu, 03 Dec 2020 02:52:35 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPl-0004C5-07; Thu, 03 Dec 2020 02:52:34 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cmp2d2Jbvzhldb;
 Thu,  3 Dec 2020 15:52:09 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 15:52:21 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 4/4] block/iscsi: Use lock guard macros
Date: Thu, 3 Dec 2020 15:50:55 +0800
Message-ID: <20201203075055.127773-5-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203075055.127773-1-ganqixin@huawei.com>
References: <20201203075055.127773-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, armbru@redhat.com,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/iscsi.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 block/iscsi.c | 50 ++++++++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index e30a7e3606..7d4b3b56d5 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -322,25 +322,23 @@ iscsi_aio_cancel(BlockAIOCB *blockacb)
     IscsiAIOCB *acb = (IscsiAIOCB *)blockacb;
     IscsiLun *iscsilun = acb->iscsilun;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    WITH_QEMU_LOCK_GUARD(&iscsilun->mutex) {
 
-    /* If it was cancelled or completed already, our work is done here */
-    if (acb->cancelled || acb->status != -EINPROGRESS) {
-        qemu_mutex_unlock(&iscsilun->mutex);
-        return;
-    }
+        /* If it was cancelled or completed already, our work is done here */
+        if (acb->cancelled || acb->status != -EINPROGRESS) {
+            return;
+        }
 
-    acb->cancelled = true;
+        acb->cancelled = true;
 
-    qemu_aio_ref(acb); /* released in iscsi_abort_task_cb() */
+        qemu_aio_ref(acb); /* released in iscsi_abort_task_cb() */
 
-    /* send a task mgmt call to the target to cancel the task on the target */
-    if (iscsi_task_mgmt_abort_task_async(iscsilun->iscsi, acb->task,
-                                         iscsi_abort_task_cb, acb) < 0) {
-        qemu_aio_unref(acb); /* since iscsi_abort_task_cb() won't be called */
+        /* send a task mgmt call to the target to cancel the task on the target */
+        if (iscsi_task_mgmt_abort_task_async(iscsilun->iscsi, acb->task,
+                                             iscsi_abort_task_cb, acb) < 0) {
+            qemu_aio_unref(acb); /* since iscsi_abort_task_cb() won't be called */
+        }
     }
-
-    qemu_mutex_unlock(&iscsilun->mutex);
 }
 
 static const AIOCBInfo iscsi_aiocb_info = {
@@ -375,22 +373,22 @@ static void iscsi_timed_check_events(void *opaque)
 {
     IscsiLun *iscsilun = opaque;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    WITH_QEMU_LOCK_GUARD(&iscsilun->mutex) {
+        /* check for timed out requests */
+        iscsi_service(iscsilun->iscsi, 0);
 
-    /* check for timed out requests */
-    iscsi_service(iscsilun->iscsi, 0);
+        if (iscsilun->request_timed_out) {
+            iscsilun->request_timed_out = false;
+            iscsi_reconnect(iscsilun->iscsi);
+        }
 
-    if (iscsilun->request_timed_out) {
-        iscsilun->request_timed_out = false;
-        iscsi_reconnect(iscsilun->iscsi);
+        /*
+         * newer versions of libiscsi may return zero events. Ensure we are
+         * able to return to service once this situation changes.
+         */
+        iscsi_set_events(iscsilun);
     }
 
-    /* newer versions of libiscsi may return zero events. Ensure we are able
-     * to return to service once this situation changes. */
-    iscsi_set_events(iscsilun);
-
-    qemu_mutex_unlock(&iscsilun->mutex);
-
     timer_mod(iscsilun->event_timer,
               qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + EVENT_INTERVAL);
 }
-- 
2.27.0


