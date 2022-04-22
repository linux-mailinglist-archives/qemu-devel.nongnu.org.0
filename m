Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4455650B79A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:46:14 +0200 (CEST)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsft-000483-Bu
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrrE-0001th-6c
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:55 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39394)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrrB-0005FE-Bw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:51 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id CC1B94076267;
 Fri, 22 Apr 2022 11:53:25 +0000 (UTC)
Subject: [PATCH 3/9] replay: rewrite async event handling
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 22 Apr 2022 14:53:25 +0300
Message-ID: <165062840564.526882.15249141058569885051.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch decouples checkpoints and async events.
It was a tricky part of replay implementation. Now it becomes
much simpler and easier to maintain.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 accel/tcg/tcg-accel-ops-icount.c |    5 +--
 docs/replay.txt                  |   11 ++----
 include/sysemu/replay.h          |    9 ++++-
 replay/replay-events.c           |   20 +++--------
 replay/replay-internal.h         |    6 +--
 replay/replay-snapshot.c         |    1 -
 replay/replay.c                  |   72 +++++++++++++++-----------------------
 softmmu/icount.c                 |    4 ++
 8 files changed, 52 insertions(+), 76 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 24520ea112..8f1dda4344 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -84,8 +84,7 @@ void icount_handle_deadline(void)
      * Don't interrupt cpu thread, when these events are waiting
      * (i.e., there is no checkpoint)
      */
-    if (deadline == 0
-        && (replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint())) {
+    if (deadline == 0) {
         icount_notify_aio_contexts();
     }
 }
@@ -109,7 +108,7 @@ void icount_prepare_for_run(CPUState *cpu)
 
     replay_mutex_lock();
 
-    if (cpu->icount_budget == 0 && replay_has_checkpoint()) {
+    if (cpu->icount_budget == 0) {
         icount_notify_aio_contexts();
     }
 }
diff --git a/docs/replay.txt b/docs/replay.txt
index 5b008ca491..6c9fdff09d 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -366,11 +366,9 @@ Here is the list of events that are written into the log:
    Argument: 4-byte number of executed instructions.
  - EVENT_INTERRUPT. Used to synchronize interrupt processing.
  - EVENT_EXCEPTION. Used to synchronize exception handling.
- - EVENT_ASYNC. This is a group of events. They are always processed
-   together with checkpoints. When such an event is generated, it is
-   stored in the queue and processed only when checkpoint occurs.
-   Every such event is followed by 1-byte checkpoint id and 1-byte
-   async event id from the following list:
+ - EVENT_ASYNC. This is a group of events. When such an event is generated,
+   it is stored in the queue and processed in icount_account_warp_timer().
+   Every such event has it's own id from the following list:
      - REPLAY_ASYNC_EVENT_BH. Bottom-half callback. This event synchronizes
        callbacks that affect virtual machine state, but normally called
        asynchronously.
@@ -405,6 +403,5 @@ Here is the list of events that are written into the log:
  - EVENT_CLOCK + clock_id. Group of events for host clock read operations.
    Argument: 8-byte clock value.
  - EVENT_CHECKPOINT + checkpoint_id. Checkpoint for synchronization of
-   CPU, internal threads, and asynchronous input events. May be followed
-   by one or more EVENT_ASYNC events.
+   CPU, internal threads, and asynchronous input events.
  - EVENT_END. Last event in the log.
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 032256533b..9af0ac32f0 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -161,9 +161,14 @@ void replay_shutdown_request(ShutdownCause cause);
     Returns 0 in PLAY mode if checkpoint was not found.
     Returns 1 in all other cases. */
 bool replay_checkpoint(ReplayCheckpoint checkpoint);
-/*! Used to determine that checkpoint is pending.
+/*! Used to determine that checkpoint or async event is pending.
     Does not proceed to the next event in the log. */
-bool replay_has_checkpoint(void);
+bool replay_has_event(void);
+/*
+ * Processes the async events added to the queue (while recording)
+ * or reads the events from the file (while replaying).
+ */
+void replay_async_events(void);
 
 /* Asynchronous events queue */
 
diff --git a/replay/replay-events.c b/replay/replay-events.c
index ac47c89834..db1decf9dd 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -170,12 +170,11 @@ void replay_block_event(QEMUBH *bh, uint64_t id)
     }
 }
 
-static void replay_save_event(Event *event, int checkpoint)
+static void replay_save_event(Event *event)
 {
     if (replay_mode != REPLAY_MODE_PLAY) {
         /* put the event into the file */
         replay_put_event(EVENT_ASYNC);
-        replay_put_byte(checkpoint);
         replay_put_byte(event->event_kind);
 
         /* save event-specific data */
@@ -206,34 +205,27 @@ static void replay_save_event(Event *event, int checkpoint)
 }
 
 /* Called with replay mutex locked */
-void replay_save_events(int checkpoint)
+void replay_save_events(void)
 {
     g_assert(replay_mutex_locked());
-    g_assert(checkpoint != CHECKPOINT_CLOCK_WARP_START);
-    g_assert(checkpoint != CHECKPOINT_CLOCK_VIRTUAL);
     while (!QTAILQ_EMPTY(&events_list)) {
         Event *event = QTAILQ_FIRST(&events_list);
-        replay_save_event(event, checkpoint);
+        replay_save_event(event);
         replay_run_event(event);
         QTAILQ_REMOVE(&events_list, event, events);
         g_free(event);
     }
 }
 
-static Event *replay_read_event(int checkpoint)
+static Event *replay_read_event(void)
 {
     Event *event;
     if (replay_state.read_event_kind == -1) {
-        replay_state.read_event_checkpoint = replay_get_byte();
         replay_state.read_event_kind = replay_get_byte();
         replay_state.read_event_id = -1;
         replay_check_error();
     }
 
-    if (checkpoint != replay_state.read_event_checkpoint) {
-        return NULL;
-    }
-
     /* Events that has not to be in the queue */
     switch (replay_state.read_event_kind) {
     case REPLAY_ASYNC_EVENT_BH:
@@ -294,11 +286,11 @@ static Event *replay_read_event(int checkpoint)
 }
 
 /* Called with replay mutex locked */
-void replay_read_events(int checkpoint)
+void replay_read_events(void)
 {
     g_assert(replay_mutex_locked());
     while (replay_state.data_kind == EVENT_ASYNC) {
-        Event *event = replay_read_event(checkpoint);
+        Event *event = replay_read_event();
         if (!event) {
             break;
         }
diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index dada623527..59797c86cf 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -87,8 +87,6 @@ typedef struct ReplayState {
     int32_t read_event_kind;
     /*! Asynchronous event id read from the log */
     uint64_t read_event_id;
-    /*! Asynchronous event checkpoint id read from the log */
-    int32_t read_event_checkpoint;
 } ReplayState;
 extern ReplayState replay_state;
 
@@ -151,9 +149,9 @@ void replay_finish_events(void);
 /*! Returns true if there are any unsaved events in the queue */
 bool replay_has_events(void);
 /*! Saves events from queue into the file */
-void replay_save_events(int checkpoint);
+void replay_save_events(void);
 /*! Read events from the file into the input queue */
-void replay_read_events(int checkpoint);
+void replay_read_events(void);
 /*! Adds specified async event to the queue */
 void replay_add_event(ReplayAsyncEventKind event_kind, void *opaque,
                       void *opaque2, uint64_t id);
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index e8767a1937..7e935deb15 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -61,7 +61,6 @@ static const VMStateDescription vmstate_replay = {
         VMSTATE_UINT64(block_request_id, ReplayState),
         VMSTATE_INT32(read_event_kind, ReplayState),
         VMSTATE_UINT64(read_event_id, ReplayState),
-        VMSTATE_INT32(read_event_checkpoint, ReplayState),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/replay/replay.c b/replay/replay.c
index 2d3607998a..cb1b68c46d 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -22,7 +22,7 @@
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
-#define REPLAY_VERSION              0xe0200a
+#define REPLAY_VERSION              0xe0200b
 /* Size of replay log header */
 #define HEADER_SIZE                 (sizeof(uint32_t) + sizeof(uint64_t))
 
@@ -171,64 +171,47 @@ void replay_shutdown_request(ShutdownCause cause)
 
 bool replay_checkpoint(ReplayCheckpoint checkpoint)
 {
-    bool res = false;
-    static bool in_checkpoint;
     assert(EVENT_CHECKPOINT + checkpoint <= EVENT_CHECKPOINT_LAST);
 
-    if (!replay_file) {
-        return true;
-    }
-
-    if (in_checkpoint) {
-        /*
-           Recursion occurs when HW event modifies timers.
-           Prevent performing icount warp in this case and
-           wait for another invocation of the checkpoint.
-        */
-        g_assert(replay_mode == REPLAY_MODE_PLAY);
-        return false;
-    }
-    in_checkpoint = true;
-
     replay_save_instructions();
 
     if (replay_mode == REPLAY_MODE_PLAY) {
         g_assert(replay_mutex_locked());
         if (replay_next_event_is(EVENT_CHECKPOINT + checkpoint)) {
             replay_finish_event();
-        } else if (replay_state.data_kind != EVENT_ASYNC) {
-            res = false;
-            goto out;
+        } else {
+            return false;
         }
-        replay_read_events(checkpoint);
-        /* replay_read_events may leave some unread events.
-           Return false if not all of the events associated with
-           checkpoint were processed */
-        res = replay_state.data_kind != EVENT_ASYNC;
     } else if (replay_mode == REPLAY_MODE_RECORD) {
         g_assert(replay_mutex_locked());
         replay_put_event(EVENT_CHECKPOINT + checkpoint);
-        /* This checkpoint belongs to several threads.
-           Processing events from different threads is
-           non-deterministic */
-        if (checkpoint != CHECKPOINT_CLOCK_WARP_START
-            /* FIXME: this is temporary fix, other checkpoints
-                      may also be invoked from the different threads someday.
-                      Asynchronous event processing should be refactored
-                      to create additional replay event kind which is
-                      nailed to the one of the threads and which processes
-                      the event queue. */
-            && checkpoint != CHECKPOINT_CLOCK_VIRTUAL) {
-            replay_save_events(checkpoint);
-        }
-        res = true;
     }
-out:
-    in_checkpoint = false;
-    return res;
+    return true;
+}
+
+void replay_async_events(void)
+{
+    static bool processing = false;
+    /* If we are already processing the events, recursion may occur
+        in case of incorrect implementation when HW event modifies timers.
+        Timer modification may invoke the icount warp, event processing,
+        and cause the recursion. */
+    g_assert(!processing);
+    processing = true;
+
+    replay_save_instructions();
+
+    if (replay_mode == REPLAY_MODE_PLAY) {
+        g_assert(replay_mutex_locked());
+        replay_read_events();
+    } else if (replay_mode == REPLAY_MODE_RECORD) {
+        g_assert(replay_mutex_locked());
+        replay_save_events();
+    }
+    processing = false;
 }
 
-bool replay_has_checkpoint(void)
+bool replay_has_event(void)
 {
     bool res = false;
     if (replay_mode == REPLAY_MODE_PLAY) {
@@ -236,6 +219,7 @@ bool replay_has_checkpoint(void)
         replay_account_executed_instructions();
         res = EVENT_CHECKPOINT <= replay_state.data_kind
               && replay_state.data_kind <= EVENT_CHECKPOINT_LAST;
+        res = res || replay_state.data_kind == EVENT_ASYNC;
     }
     return res;
 }
diff --git a/softmmu/icount.c b/softmmu/icount.c
index 880ed04900..3c9ff8164b 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -322,7 +322,7 @@ void icount_start_warp_timer(void)
              * to vCPU was processed in advance and vCPU went to sleep.
              * Therefore we have to wake it up for doing someting.
              */
-            if (replay_has_checkpoint()) {
+            if (replay_has_event()) {
                 qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
             }
             return;
@@ -404,6 +404,8 @@ void icount_account_warp_timer(void)
         return;
     }
 
+    replay_async_events();
+
     /* warp clock deterministically in record/replay mode */
     if (!replay_checkpoint(CHECKPOINT_CLOCK_WARP_ACCOUNT)) {
         return;


