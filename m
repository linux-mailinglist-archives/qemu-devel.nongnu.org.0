Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05212C6710
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:42:19 +0100 (CET)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kie0w-0002xu-De
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvp-0006LW-25; Fri, 27 Nov 2020 08:37:02 -0500
Received: from relay.sw.ru ([185.231.240.75]:52608 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvm-0003I8-SN; Fri, 27 Nov 2020 08:37:00 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvK-00AfjY-N5; Fri, 27 Nov 2020 16:36:30 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v3 2/5] monitor: drain requests queue with 'channel closed'
 event
Date: Fri, 27 Nov 2020 16:35:43 +0300
Message-Id: <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

When CHR_EVENT_CLOSED comes, the QMP requests queue may still contain
unprocessed commands. It can happen with QMP capability OOB enabled.
Let the dispatcher complete handling requests rest in the monitor
queue.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 monitor/qmp.c | 46 +++++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 7169366..a86ed35 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -75,36 +75,32 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
     }
 }
 
-static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
+/*
+ * Let unprocessed QMP commands be handled.
+ */
+static void monitor_qmp_drain_queue(MonitorQMP *mon)
 {
-    qemu_mutex_lock(&mon->qmp_queue_lock);
+    bool q_is_empty = false;
 
-    /*
-     * Same condition as in monitor_qmp_dispatcher_co(), but before
-     * removing an element from the queue (hence no `- 1`).
-     * Also, the queue should not be empty either, otherwise the
-     * monitor hasn't been suspended yet (or was already resumed).
-     */
-    bool need_resume = (!qmp_oob_enabled(mon) ||
-        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX)
-        && !g_queue_is_empty(mon->qmp_requests);
+    while (!q_is_empty) {
+        qemu_mutex_lock(&mon->qmp_queue_lock);
+        q_is_empty = g_queue_is_empty(mon->qmp_requests);
+        qemu_mutex_unlock(&mon->qmp_queue_lock);
 
-    monitor_qmp_cleanup_req_queue_locked(mon);
+        if (!q_is_empty) {
+            if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
+                /* Kick the dispatcher coroutine */
+                aio_co_wake(qmp_dispatcher_co);
+            } else {
+                /* Let the dispatcher do its job for a while */
+                g_usleep(40);
+            }
+        }
+    }
 
-    if (need_resume) {
-        /*
-         * handle_qmp_command() suspended the monitor because the
-         * request queue filled up, to be resumed when the queue has
-         * space again.  We just emptied it; resume the monitor.
-         *
-         * Without this, the monitor would remain suspended forever
-         * when we get here while the monitor is suspended.  An
-         * unfortunately timed CHR_EVENT_CLOSED can do the trick.
-         */
+    if (qatomic_mb_read(&mon->common.suspend_cnt)) {
         monitor_resume(&mon->common);
     }
-
-    qemu_mutex_unlock(&mon->qmp_queue_lock);
 }
 
 void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
@@ -418,7 +414,7 @@ static void monitor_qmp_event(void *opaque, QEMUChrEvent event)
          * stdio, it's possible that stdout is still open when stdin
          * is closed.
          */
-        monitor_qmp_cleanup_queue_and_resume(mon);
+        monitor_qmp_drain_queue(mon);
         json_message_parser_destroy(&mon->parser);
         json_message_parser_init(&mon->parser, handle_qmp_command,
                                  mon, NULL);
-- 
1.8.3.1


