Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701DD519D49
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:47:01 +0200 (CEST)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCX6-0001nF-GI
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTW-0004tH-Ha
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:14 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37138)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nmBTU-00062k-Fc
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:39:14 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 0FDEB4076253;
 Wed,  4 May 2022 09:39:11 +0000 (UTC)
Subject: [PATCH v2 4/9] replay: simplify async event processing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, pbonzini@redhat.com, alex.bennee@linaro.org,
 crosa@redhat.com, f4bug@amsat.org
Date: Wed, 04 May 2022 12:39:10 +0300
Message-ID: <165165715084.1062896.10448117624180064580.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
References: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch joins replay event id and async event id into single byte in the log.
It makes processing a bit faster and log a bit smaller.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

--

v2: minor enum fixes (suggested by Richard Henderson)
---
 replay/replay-events.c   |   36 ++++++++++++++----------------------
 replay/replay-internal.h |   31 ++++++++++++++-----------------
 replay/replay-snapshot.c |    1 -
 replay/replay.c          |    5 +++--
 4 files changed, 31 insertions(+), 42 deletions(-)

diff --git a/replay/replay-events.c b/replay/replay-events.c
index db1decf9dd..af0721cc1a 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -174,8 +174,8 @@ static void replay_save_event(Event *event)
 {
     if (replay_mode != REPLAY_MODE_PLAY) {
         /* put the event into the file */
-        replay_put_event(EVENT_ASYNC);
-        replay_put_byte(event->event_kind);
+        g_assert(event->event_kind < REPLAY_ASYNC_COUNT);
+        replay_put_event(EVENT_ASYNC + event->event_kind);
 
         /* save event-specific data */
         switch (event->event_kind) {
@@ -220,14 +220,10 @@ void replay_save_events(void)
 static Event *replay_read_event(void)
 {
     Event *event;
-    if (replay_state.read_event_kind == -1) {
-        replay_state.read_event_kind = replay_get_byte();
-        replay_state.read_event_id = -1;
-        replay_check_error();
-    }
+    ReplayAsyncEventKind event_kind = replay_state.data_kind - EVENT_ASYNC;
 
     /* Events that has not to be in the queue */
-    switch (replay_state.read_event_kind) {
+    switch (event_kind) {
     case REPLAY_ASYNC_EVENT_BH:
     case REPLAY_ASYNC_EVENT_BH_ONESHOT:
         if (replay_state.read_event_id == -1) {
@@ -236,17 +232,17 @@ static Event *replay_read_event(void)
         break;
     case REPLAY_ASYNC_EVENT_INPUT:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = replay_read_input_event();
         return event;
     case REPLAY_ASYNC_EVENT_INPUT_SYNC:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = 0;
         return event;
     case REPLAY_ASYNC_EVENT_CHAR_READ:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = replay_event_char_read_load();
         return event;
     case REPLAY_ASYNC_EVENT_BLOCK:
@@ -256,18 +252,17 @@ static Event *replay_read_event(void)
         break;
     case REPLAY_ASYNC_EVENT_NET:
         event = g_new0(Event, 1);
-        event->event_kind = replay_state.read_event_kind;
+        event->event_kind = event_kind;
         event->opaque = replay_event_net_load();
         return event;
     default:
-        error_report("Unknown ID %d of replay event",
-            replay_state.read_event_kind);
+        error_report("Unknown ID %d of replay event", event_kind);
         exit(1);
         break;
     }
 
     QTAILQ_FOREACH(event, &events_list, events) {
-        if (event->event_kind == replay_state.read_event_kind
+        if (event->event_kind == event_kind
             && (replay_state.read_event_id == -1
                 || replay_state.read_event_id == event->id)) {
             break;
@@ -276,12 +271,8 @@ static Event *replay_read_event(void)
 
     if (event) {
         QTAILQ_REMOVE(&events_list, event, events);
-    } else {
-        return NULL;
     }
 
-    /* Read event-specific data */
-
     return event;
 }
 
@@ -289,13 +280,14 @@ static Event *replay_read_event(void)
 void replay_read_events(void)
 {
     g_assert(replay_mutex_locked());
-    while (replay_state.data_kind == EVENT_ASYNC) {
+    while (replay_state.data_kind >= EVENT_ASYNC
+        && replay_state.data_kind <= EVENT_ASYNC_LAST) {
         Event *event = replay_read_event();
         if (!event) {
             break;
         }
         replay_finish_event();
-        replay_state.read_event_kind = -1;
+        replay_state.read_event_id = -1;
         replay_run_event(event);
 
         g_free(event);
@@ -304,7 +296,7 @@ void replay_read_events(void)
 
 void replay_init_events(void)
 {
-    replay_state.read_event_kind = -1;
+    replay_state.read_event_id = -1;
 }
 
 void replay_finish_events(void)
diff --git a/replay/replay-internal.h b/replay/replay-internal.h
index 59797c86cf..301131c1e6 100644
--- a/replay/replay-internal.h
+++ b/replay/replay-internal.h
@@ -12,6 +12,19 @@
  *
  */
 
+/* Asynchronous events IDs */
+
+typedef enum ReplayAsyncEventKind {
+    REPLAY_ASYNC_EVENT_BH,
+    REPLAY_ASYNC_EVENT_BH_ONESHOT,
+    REPLAY_ASYNC_EVENT_INPUT,
+    REPLAY_ASYNC_EVENT_INPUT_SYNC,
+    REPLAY_ASYNC_EVENT_CHAR_READ,
+    REPLAY_ASYNC_EVENT_BLOCK,
+    REPLAY_ASYNC_EVENT_NET,
+    REPLAY_ASYNC_COUNT
+} ReplayAsyncEventKind;
+
 /* Any changes to order/number of events will need to bump REPLAY_VERSION */
 enum ReplayEvents {
     /* for instruction event */
@@ -22,6 +35,7 @@ enum ReplayEvents {
     EVENT_EXCEPTION,
     /* for async events */
     EVENT_ASYNC,
+    EVENT_ASYNC_LAST = EVENT_ASYNC + REPLAY_ASYNC_COUNT - 1,
     /* for shutdown requests, range allows recovery of ShutdownCause */
     EVENT_SHUTDOWN,
     EVENT_SHUTDOWN_LAST = EVENT_SHUTDOWN + SHUTDOWN_CAUSE__MAX,
@@ -49,21 +63,6 @@ enum ReplayEvents {
     EVENT_COUNT
 };
 
-/* Asynchronous events IDs */
-
-enum ReplayAsyncEventKind {
-    REPLAY_ASYNC_EVENT_BH,
-    REPLAY_ASYNC_EVENT_BH_ONESHOT,
-    REPLAY_ASYNC_EVENT_INPUT,
-    REPLAY_ASYNC_EVENT_INPUT_SYNC,
-    REPLAY_ASYNC_EVENT_CHAR_READ,
-    REPLAY_ASYNC_EVENT_BLOCK,
-    REPLAY_ASYNC_EVENT_NET,
-    REPLAY_ASYNC_COUNT
-};
-
-typedef enum ReplayAsyncEventKind ReplayAsyncEventKind;
-
 typedef struct ReplayState {
     /*! Cached clock values. */
     int64_t cached_clock[REPLAY_CLOCK_COUNT];
@@ -83,8 +82,6 @@ typedef struct ReplayState {
     uint64_t block_request_id;
     /*! Prior value of the host clock */
     uint64_t host_clock_last;
-    /*! Asynchronous event type read from the log */
-    int32_t read_event_kind;
     /*! Asynchronous event id read from the log */
     uint64_t read_event_id;
 } ReplayState;
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index 7e935deb15..10a7cf7992 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -59,7 +59,6 @@ static const VMStateDescription vmstate_replay = {
         VMSTATE_UINT32(has_unread_data, ReplayState),
         VMSTATE_UINT64(file_offset, ReplayState),
         VMSTATE_UINT64(block_request_id, ReplayState),
-        VMSTATE_INT32(read_event_kind, ReplayState),
         VMSTATE_UINT64(read_event_id, ReplayState),
         VMSTATE_END_OF_LIST()
     },
diff --git a/replay/replay.c b/replay/replay.c
index ccd7edec76..4c396bb376 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -22,7 +22,7 @@
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
-#define REPLAY_VERSION              0xe0200b
+#define REPLAY_VERSION              0xe0200c
 /* Size of replay log header */
 #define HEADER_SIZE                 (sizeof(uint32_t) + sizeof(uint64_t))
 
@@ -221,7 +221,8 @@ bool replay_has_event(void)
         replay_account_executed_instructions();
         res = EVENT_CHECKPOINT <= replay_state.data_kind
               && replay_state.data_kind <= EVENT_CHECKPOINT_LAST;
-        res = res || replay_state.data_kind == EVENT_ASYNC;
+        res = res || (EVENT_ASYNC <= replay_state.data_kind
+                     && replay_state.data_kind <= EVENT_ASYNC_LAST);
     }
     return res;
 }


