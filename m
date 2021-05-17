Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169D382979
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:08:45 +0200 (CEST)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaB2-0007Us-95
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8O-0004pj-0i; Mon, 17 May 2021 06:06:00 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8L-0001h0-5D; Mon, 17 May 2021 06:05:59 -0400
Received: by mail-ed1-x534.google.com with SMTP id l7so6169865edb.1;
 Mon, 17 May 2021 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HgVN9JuTcPWGk6l9eQ7hl/THl658HFq7ITeS5EdxUw=;
 b=ZiNhWEvI/pP8FsWtcGpigj8iocqMUfwtz5BPkd5+Ja4vrwzcFoUw0p3GW0kLl0cavV
 Jam00zkqYN7kZaSKr7uZwkq+J6MjOzYGacuc0BqIO0s830hMdCaAr0RtqimYQ21L1hge
 BIKY9z540szSfcrd5jFSscZCe+uvKCCV9SDdrhLrPLTYj0Q7AM1F8DmYa03HaQ6CmSw+
 S5TGdKuHyH35UemdrE8Fiw0aBn+0WLefcH47uCQ7tGYglUQzhcyUPt65PCZeJJDVEmu8
 54trXvbtxiGrPVKunZB17qcJb5WHsqVOezFvdMeraTk9X43BWAMgh5owXNGgk+4Qqt43
 DqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9HgVN9JuTcPWGk6l9eQ7hl/THl658HFq7ITeS5EdxUw=;
 b=cLoCYU/N/vZ6aiSyyT0eBUyvjPTsmhYvd12O59Gehc6vc0fWES6KMMGy3SNNGwKKrZ
 69/d4FuSuwgMuhTYvBC7zmPUghLQWwfa0Ugvtll74nYaMwyJvrhbeZpRsFMCOuRJu2wg
 23/AqFOXuyiTHZ8cKPcr6XenOWt7P8H9jqbdwdqO9hWLmhTFO2HOGFk6+f2kP9wNygh8
 rBLHDT7HGSIixIkDEH5yIL4URe/oTPidJOV9RKQbTTJv9Qv3jac9D1MhKm60yB+9jwOW
 Y1QQ5HVTw4JW2s/1ryBLQidb8a0hDHeiRAyBqpx73i/wXvAUgHY1dWj+W4R6uCOSoapW
 6QRQ==
X-Gm-Message-State: AOAM532EZ9DAxtrJ9XSN+JBnf4WdD4qgmHkxygYnVg8bzTKjcwb+vrmy
 2E/DjjlGGBostSMgXcBHohQD3V2EYvIjVA==
X-Google-Smtp-Source: ABdhPJyjn2ZpzTIeH1HxLr5H1py+Z8GZirhgvAm05ucNA1PL87KypNMEEx/y19t8/DXeHrOb0IGypg==
X-Received: by 2002:a05:6402:22e8:: with SMTP id
 dn8mr27681120edb.191.1621245955119; 
 Mon, 17 May 2021 03:05:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] coroutine-sleep: replace QemuCoSleepState pointer with
 struct in the API
Date: Mon, 17 May 2021 12:05:47 +0200
Message-Id: <20210517100548.28806-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now, users of qemu_co_sleep_ns_wakeable are simply passing
a pointer to QemuCoSleepState by reference to the function.  But
QemuCoSleepState really is just a Coroutine*; making the
content of the struct public is just as efficient and lets us
skip the user_state_pointer indirection.

Since the usage is changed, take the occasion to rename the
struct to QemuCoSleep.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-copy.c          |  8 ++++----
 block/nbd.c                 | 10 ++++-----
 include/qemu/coroutine.h    | 23 +++++++++++----------
 util/qemu-coroutine-sleep.c | 41 ++++++++++++++++---------------------
 4 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index f896dc56f2..c2e5090412 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -50,7 +50,7 @@ typedef struct BlockCopyCallState {
     /* State */
     int ret;
     bool finished;
-    QemuCoSleepState *sleep_state;
+    QemuCoSleep sleep;
     bool cancelled;
 
     /* OUT parameters */
@@ -625,8 +625,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
                 if (ns > 0) {
                     block_copy_task_end(task, -EAGAIN);
                     g_free(task);
-                    qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, ns,
-                                              &call_state->sleep_state);
+                    qemu_co_sleep_ns_wakeable(&call_state->sleep,
+                                              QEMU_CLOCK_REALTIME, ns);
                     continue;
                 }
             }
@@ -674,7 +674,7 @@ out:
 
 void block_copy_kick(BlockCopyCallState *call_state)
 {
-    qemu_co_sleep_wake(call_state->sleep_state);
+    qemu_co_sleep_wake(&call_state->sleep);
 }
 
 /*
diff --git a/block/nbd.c b/block/nbd.c
index 1c6315b168..616f9ae6c4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -116,7 +116,7 @@ typedef struct BDRVNBDState {
     CoQueue free_sema;
     Coroutine *connection_co;
     Coroutine *teardown_co;
-    QemuCoSleepState *connection_co_sleep_ns_state;
+    QemuCoSleep reconnect_sleep;
     bool drained;
     bool wait_drained_end;
     int in_flight;
@@ -289,7 +289,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     s->drained = true;
-    qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
+    qemu_co_sleep_wake(&s->reconnect_sleep);
 
     nbd_co_establish_connection_cancel(bs, false);
 
@@ -328,7 +328,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
 
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
-        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
+        qemu_co_sleep_wake(&s->reconnect_sleep);
         nbd_co_establish_connection_cancel(bs, true);
     }
     if (qemu_in_coroutine()) {
@@ -685,8 +685,8 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
             }
             bdrv_inc_in_flight(s->bs);
         } else {
-            qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, timeout,
-                                      &s->connection_co_sleep_ns_state);
+            qemu_co_sleep_ns_wakeable(&s->reconnect_sleep,
+                                      QEMU_CLOCK_REALTIME, timeout);
             if (s->drained) {
                 continue;
             }
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c5d7742989..82c0671f80 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -291,21 +291,22 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock);
  */
 void qemu_co_rwlock_unlock(CoRwlock *lock);
 
-typedef struct QemuCoSleepState QemuCoSleepState;
+typedef struct QemuCoSleep {
+    Coroutine *to_wake;
+} QemuCoSleep;
 
 /**
- * Yield the coroutine for a given duration. During this yield, @sleep_state
- * is set to an opaque pointer, which may be used for
- * qemu_co_sleep_wake(). Be careful, the pointer is set back to zero when the
- * timer fires. Don't save the obtained value to other variables and don't call
- * qemu_co_sleep_wake from another aio context.
+ * Yield the coroutine for a given duration. Initializes @w so that,
+ * during this yield, it can be passed to qemu_co_sleep_wake() to
+ * terminate the sleep.
  */
-void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
-                                            QemuCoSleepState **sleep_state);
+void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+                                            QEMUClockType type, int64_t ns);
+
 static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
 {
-    QemuCoSleepState *unused = NULL;
-    qemu_co_sleep_ns_wakeable(type, ns, &unused);
+    QemuCoSleep w = { 0 };
+    qemu_co_sleep_ns_wakeable(&w, type, ns);
 }
 
 /**
@@ -314,7 +315,7 @@ static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
  * qemu_co_sleep_ns() and should be checked to be non-NULL before calling
  * qemu_co_sleep_wake().
  */
-void qemu_co_sleep_wake(QemuCoSleepState *sleep_state);
+void qemu_co_sleep_wake(QemuCoSleep *w);
 
 /**
  * Yield until a file descriptor becomes readable
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 1d25019620..89c3b758c5 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -19,42 +19,37 @@
 
 static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
-struct QemuCoSleepState {
+void qemu_co_sleep_wake(QemuCoSleep *w)
+{
     Coroutine *co;
-    QemuCoSleepState **user_state_pointer;
-};
 
-void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
-{
-    if (sleep_state) {
+    co = w->to_wake;
+    w->to_wake = NULL;
+    if (co) {
         /* Write of schedule protected by barrier write in aio_co_schedule */
-        const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
+        const char *scheduled = qatomic_cmpxchg(&co->scheduled,
                                                 qemu_co_sleep_ns__scheduled, NULL);
 
         assert(scheduled == qemu_co_sleep_ns__scheduled);
-        *sleep_state->user_state_pointer = NULL;
-        aio_co_wake(sleep_state->co);
+        aio_co_wake(co);
     }
 }
 
 static void co_sleep_cb(void *opaque)
 {
-    QemuCoSleepState **sleep_state = opaque;
-    qemu_co_sleep_wake(*sleep_state);
+    QemuCoSleep *w = opaque;
+    qemu_co_sleep_wake(w);
 }
 
-void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
-                                            QemuCoSleepState **sleep_state)
+void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+                                            QEMUClockType type, int64_t ns)
 {
+    Coroutine *co = qemu_coroutine_self();
     AioContext *ctx = qemu_get_current_aio_context();
     QEMUTimer ts;
-    QemuCoSleepState state = {
-        .co = qemu_coroutine_self(),
-        .user_state_pointer = sleep_state,
-    };
 
-    const char *scheduled = qatomic_cmpxchg(&state.co->scheduled, NULL,
-                                           qemu_co_sleep_ns__scheduled);
+    const char *scheduled = qatomic_cmpxchg(&co->scheduled, NULL,
+                                            qemu_co_sleep_ns__scheduled);
     if (scheduled) {
         fprintf(stderr,
                 "%s: Co-routine was already scheduled in '%s'\n",
@@ -62,12 +57,12 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
         abort();
     }
 
-    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, sleep_state);
-    *sleep_state = &state;
+    w->to_wake = co;
+    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, w),
     timer_mod(&ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
     timer_del(&ts);
 
-    /* qemu_co_sleep_wake clears *sleep_state before resuming this coroutine.  */
-    assert(*sleep_state == NULL);
+    /* w->to_wake is cleared before resuming this coroutine.  */
+    assert(w->to_wake == NULL);
 }
-- 
2.31.1



