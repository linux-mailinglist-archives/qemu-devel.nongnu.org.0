Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3700934497B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:43:45 +0100 (CET)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMiW-0001Wc-7B
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lOMfb-0008NB-M8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:40:48 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:52970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lOMfY-0004bl-Fg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:40:43 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 7F35B42697;
 Mon, 22 Mar 2021 16:40:37 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v2] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Date: Mon, 22 Mar 2021 16:40:24 +0100
Message-Id: <20210322154024.15011-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QMP dispatcher coroutine holds the qmp_queue_lock over a yield
point, where it expects to be rescheduled from the main context. If a
CHR_EVENT_CLOSED event is received just then, it can race and block the
main thread on the mutex in monitor_qmp_cleanup_queue_and_resume.

monitor_resume does not need to be called from main context, so we can
call it immediately after popping a request from the queue, which allows
us to drop the qmp_queue_lock mutex before yielding.

Suggested-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

v2:
* different approach: move everything that needs the qmp_queue_lock mutex before
  the yield point, instead of moving the event handling to a different context

 monitor/qmp.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2b0308f933..092c527b6f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -257,24 +257,6 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
         trace_monitor_qmp_in_band_dequeue(req_obj,
                                           req_obj->mon->qmp_requests->length);
 
-        if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
-            /*
-             * Someone rescheduled us (probably because a new requests
-             * came in), but we didn't actually yield. Do that now,
-             * only to be immediately reentered and removed from the
-             * list of scheduled coroutines.
-             */
-            qemu_coroutine_yield();
-        }
-
-        /*
-         * Move the coroutine from iohandler_ctx to qemu_aio_context for
-         * executing the command handler so that it can make progress if it
-         * involves an AIO_WAIT_WHILE().
-         */
-        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
-        qemu_coroutine_yield();
-
         /*
          * @req_obj has a request, we hold req_obj->mon->qmp_queue_lock
          */
@@ -298,8 +280,30 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             monitor_resume(&mon->common);
         }
 
+        /*
+         * Drop the queue mutex now, before yielding, otherwise we might
+         * deadlock if the main thread tries to lock it.
+         */
         qemu_mutex_unlock(&mon->qmp_queue_lock);
 
+        if (qatomic_xchg(&qmp_dispatcher_co_busy, true) == true) {
+            /*
+             * Someone rescheduled us (probably because a new requests
+             * came in), but we didn't actually yield. Do that now,
+             * only to be immediately reentered and removed from the
+             * list of scheduled coroutines.
+             */
+            qemu_coroutine_yield();
+        }
+
+        /*
+         * Move the coroutine from iohandler_ctx to qemu_aio_context for
+         * executing the command handler so that it can make progress if it
+         * involves an AIO_WAIT_WHILE().
+         */
+        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
+        qemu_coroutine_yield();
+
         /* Process request */
         if (req_obj->req) {
             if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
-- 
2.20.1



