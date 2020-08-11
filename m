Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66800241A23
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 13:07:37 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5S80-0005tB-EJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 07:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1k5S2U-0003sA-VS
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:01:54 -0400
Received: from mail.ispras.ru ([83.149.199.84]:42422)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1k5S2T-0003OG-2v
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:01:54 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 303AB4089F07;
 Tue, 11 Aug 2020 11:01:51 +0000 (UTC)
Subject: [PATCH v2 10/14] replay: flush rr queue before loading the vmstate
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Aug 2020 14:01:50 +0300
Message-ID: <159714371090.18946.17522377300666666629.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159714365354.18946.2967871683340522027.stgit@pasha-ThinkPad-X280>
References: <159714365354.18946.2967871683340522027.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 07:00:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

Non-empty record/replay queue prevents saving and loading the VM state,
because it includes pending bottom halves and block coroutines.
But when the new VM state is loaded, we don't have to preserve the consistency
of the current state anymore. Therefore this patch just flushes the queue
allowing the coroutines to finish and removes checking for empty rr queue
for load_snapshot function.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 include/sysemu/replay.h  |    2 ++
 migration/savevm.c       |   12 ++++++------
 replay/replay-events.c   |    4 ++++
 replay/replay-internal.h |    2 --
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index e00ed2f4a5..239c01e7df 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -149,6 +149,8 @@ void replay_disable_events(void);
 void replay_enable_events(void);
 /*! Returns true when saving events is enabled */
 bool replay_events_enabled(void);
+/* Flushes events queue */
+void replay_flush_events(void);
 /*! Adds bottom half event to the queue */
 void replay_bh_schedule_event(QEMUBH *bh);
 /* Adds oneshot bottom half event to the queue */
diff --git a/migration/savevm.c b/migration/savevm.c
index d56d9729bd..25df75179a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2880,12 +2880,6 @@ int load_snapshot(const char *name, Error **errp)
     AioContext *aio_context;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
-    if (!replay_can_snapshot()) {
-        error_setg(errp, "Record/replay does not allow loading snapshot "
-                   "right now. Try once more later.");
-        return -EINVAL;
-    }
-
     if (!bdrv_all_can_snapshot(&bs)) {
         error_setg(errp,
                    "Device '%s' is writable but does not support snapshots",
@@ -2919,6 +2913,12 @@ int load_snapshot(const char *name, Error **errp)
         return -EINVAL;
     }
 
+    /*
+     * Flush the record/replay queue. Now the VM state is going
+     * to change. Therefore we don't need to preserve its consistency
+     */
+    replay_flush_events();
+
     /* Flush all IO requests so they don't interfere with the new state.  */
     bdrv_drain_all_begin();
 
diff --git a/replay/replay-events.c b/replay/replay-events.c
index 302b84043a..a1c6bb934e 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -77,6 +77,10 @@ bool replay_has_events(void)
 
 void replay_flush_events(void)
 {
+    if (replay_mode == REPLAY_MODE_NONE) {
+        return;
+    }
+
     g_assert(replay_mutex_locked());
 
     while (!QTAILQ_EMPTY(&events_list)) {
diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index 2f6145ec7c..97649ed8d7 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -149,8 +149,6 @@ void replay_read_next_clock(unsigned int kind);
 void replay_init_events(void);
 /*! Clears internal data structures for events handling */
 void replay_finish_events(void);
-/*! Flushes events queue */
-void replay_flush_events(void);
 /*! Returns true if there are any unsaved events in the queue */
 bool replay_has_events(void);
 /*! Saves events from queue into the file */


