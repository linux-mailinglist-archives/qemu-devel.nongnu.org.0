Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBA348FE1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:32:22 +0100 (CET)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPODt-0005Kd-3G
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBS-0003Xu-9R
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBQ-0006jS-Fh
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e18so1911096wrt.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YblhuIkh5xNVfWBJe+b/yvre1lCOLi6tB8Zxn3pXVkg=;
 b=q88GcfOOfiXffF6LWs4q7qXeIJdgWOaP24oJfo/I+ttEauM0dD9g0NGHQuB6x1U0wF
 tKAZvXkIeURimuimFepfpLoAj3+CrfyBXX27LokdKYVFO6pLljGCh+UGIAlTQ3ddH3QZ
 pI1aQ0zwPXaJ6BBwfQRgua/6R+yEgDxyKC8rajWFmQToqXwD15H/FS4EtjdrbR0llL3y
 1du/Bn65CjodjbvYffxKwXoPWdZKBymaMCsKv0deYYH3W6Z9kxdpzhA9kqLR1Wiurf4T
 s3Tnq36vxCw0Ey7Cnec40kq++o1HIty/eLsabltATwXXarliKlZsmCAdQUi/sTdjNPuu
 s+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YblhuIkh5xNVfWBJe+b/yvre1lCOLi6tB8Zxn3pXVkg=;
 b=O7SrE1QALa7fnIYqlvZ7vPy+Yt9mHx6726bXBijn2yJpIg5d82IudMY6u94ZdSDBFM
 pY5ECTushPv+mVlHfta1xp5jNhsYvIlT0T0rDIqV1VrZ5uvHdGdPb1zNe6rQ+K4FQQzn
 cgH13dsRMZRVIWXGo7QMSl5Vow1AWWNszCe7Y9TUrPBIbIXJUdL0Lmh8EN4A/wqTAlPS
 V15OCkcilLjkEVYjG6op9R3TOraOiQCDjMkqvB1uJJX6RKTkT+Gola9WllNkTCSPhAQX
 FfihKiPJlCwpCpyiC3+GwA9TY6O5NA/bUxTT9WADGgUCr1f/jEpaBcGLWDxuwbVhebuB
 mmng==
X-Gm-Message-State: AOAM530Wk42ZqrGEyIpqFQ7Vqv/hhAO4fFs2YSlUURGOT83IWmuSYNmV
 rU/5IcxKY2hfl4pQox7wtC2Vrb/3jCE=
X-Google-Smtp-Source: ABdhPJwq/jUCn6d4namddk4lU6gocc2tG2HlDiNEFvXH231LLHucVv5rF+Ejqf7bQt0PDt8MWfVJyA==
X-Received: by 2002:adf:e809:: with SMTP id o9mr8643086wrm.110.1616671787207; 
 Thu, 25 Mar 2021 04:29:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/6] coroutine-lock: Reimplement CoRwlock to fix downgrade
 bug
Date: Thu, 25 Mar 2021 12:29:39 +0100
Message-Id: <20210325112941.365238-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: david.edmondson@oracle.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An invariant of the current rwlock is that if multiple coroutines hold a
reader lock, all must be runnable. The unlock implementation relies on
this, choosing to wake a single coroutine when the final read lock
holder exits the critical section, assuming that it will wake a
coroutine attempting to acquire a write lock.

The downgrade implementation violates this assumption by creating a
read lock owning coroutine that is exclusively runnable - any other
coroutines that are waiting to acquire a read lock are *not* made
runnable when the write lock holder converts its ownership to read
only.

More in general, the old implementation had lots of other fairness bugs.
The root cause of the bugs was that CoQueue would wake up readers even
if there were pending writers, and would wake up writers even if there
were readers.  In that case, the coroutine would go back to sleep *at
the end* of the CoQueue, losing its place at the head of the line.

To fix this, keep the queue of waiters explicitly in the CoRwlock
instead of using CoQueue, and store for each whether it is a
potential reader or a writer.  This way, downgrade can look at the
first queued coroutines and wake it only if it is a reader, causing
all other readers in line to be released in turn.

Reported-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v3->v4: clean up the code and fix upgrade logic.  Fix upgrade comment too.

 include/qemu/coroutine.h   |  17 +++--
 util/qemu-coroutine-lock.c | 148 ++++++++++++++++++++++++-------------
 2 files changed, 106 insertions(+), 59 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 84eab6e3bf..7919d3bb62 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -237,11 +237,15 @@ bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock);
 bool qemu_co_queue_empty(CoQueue *queue);
 
 
+typedef struct CoRwTicket CoRwTicket;
 typedef struct CoRwlock {
-    int pending_writer;
-    int reader;
     CoMutex mutex;
-    CoQueue queue;
+
+    /* Number of readers, or -1 if owned for writing.  */
+    int owners;
+
+    /* Waiting coroutines.  */
+    QSIMPLEQ_HEAD(, CoRwTicket) tickets;
 } CoRwlock;
 
 /**
@@ -260,10 +264,9 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock);
 /**
  * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
  * @qemu_co_rwlock_unlock followed by a separate @qemu_co_rwlock_wrlock.
- * However, if the lock cannot be upgraded immediately, control is transferred
- * to the caller of the current coroutine.  Also, @qemu_co_rwlock_upgrade
- * only overrides CoRwlock fairness if there are no concurrent readers, so
- * another writer might run while @qemu_co_rwlock_upgrade blocks.
+ * Note that if the lock cannot be upgraded immediately, control is transferred
+ * to the caller of the current coroutine; another writer might run while
+ * @qemu_co_rwlock_upgrade blocks.
  */
 void qemu_co_rwlock_upgrade(CoRwlock *lock);
 
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index eb73cf11dc..2669403839 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -327,11 +327,51 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
     trace_qemu_co_mutex_unlock_return(mutex, self);
 }
 
+struct CoRwTicket {
+    bool read;
+    Coroutine *co;
+    QSIMPLEQ_ENTRY(CoRwTicket) next;
+};
+
 void qemu_co_rwlock_init(CoRwlock *lock)
 {
-    memset(lock, 0, sizeof(*lock));
-    qemu_co_queue_init(&lock->queue);
     qemu_co_mutex_init(&lock->mutex);
+    lock->owners = 0;
+    QSIMPLEQ_INIT(&lock->tickets);
+}
+
+/* Releases the internal CoMutex.  */
+static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
+{
+    CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
+    Coroutine *co = NULL;
+
+    /*
+     * Setting lock->owners here prevents rdlock and wrlock from
+     * sneaking in between unlock and wake.
+     */
+
+    if (tkt) {
+        if (tkt->read) {
+            if (lock->owners >= 0) {
+                lock->owners++;
+                co = tkt->co;
+            }
+        } else {
+            if (lock->owners == 0) {
+                lock->owners = -1;
+                co = tkt->co;
+            }
+        }
+    }
+
+    if (co) {
+        QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
+        qemu_co_mutex_unlock(&lock->mutex);
+        aio_co_wake(co);
+    } else {
+        qemu_co_mutex_unlock(&lock->mutex);
+    }
 }
 
 void qemu_co_rwlock_rdlock(CoRwlock *lock)
@@ -340,13 +380,22 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
 
     qemu_co_mutex_lock(&lock->mutex);
     /* For fairness, wait if a writer is in line.  */
-    while (lock->pending_writer) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
+    if (lock->owners == 0 || (lock->owners > 0 && QSIMPLEQ_EMPTY(&lock->tickets))) {
+        lock->owners++;
+        qemu_co_mutex_unlock(&lock->mutex);
+    } else {
+        CoRwTicket my_ticket = { true, self };
+
+        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+        qemu_co_mutex_unlock(&lock->mutex);
+        qemu_coroutine_yield();
+        assert(lock->owners >= 1);
+
+        /* Possibly wake another reader, which will wake the next in line.  */
+        qemu_co_mutex_lock(&lock->mutex);
+        qemu_co_rwlock_maybe_wake_one(lock);
     }
-    lock->reader++;
-    qemu_co_mutex_unlock(&lock->mutex);
 
-    /* The rest of the read-side critical section is run without the mutex.  */
     self->locks_held++;
 }
 
@@ -355,69 +404,64 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
     Coroutine *self = qemu_coroutine_self();
 
     assert(qemu_in_coroutine());
-    if (!lock->reader) {
-        /* The critical section started in qemu_co_rwlock_wrlock.  */
-        qemu_co_queue_restart_all(&lock->queue);
-    } else {
-        self->locks_held--;
+    self->locks_held--;
 
-        qemu_co_mutex_lock(&lock->mutex);
-        lock->reader--;
-        assert(lock->reader >= 0);
-        /* Wakeup only one waiting writer */
-        if (!lock->reader) {
-            qemu_co_queue_next(&lock->queue);
-        }
+    qemu_co_mutex_lock(&lock->mutex);
+    if (lock->owners > 0) {
+        lock->owners--;
+    } else {
+        assert(lock->owners == -1);
+        lock->owners = 0;
     }
-    qemu_co_mutex_unlock(&lock->mutex);
+
+    qemu_co_rwlock_maybe_wake_one(lock);
 }
 
 void qemu_co_rwlock_downgrade(CoRwlock *lock)
 {
-    Coroutine *self = qemu_coroutine_self();
-
-    /* lock->mutex critical section started in qemu_co_rwlock_wrlock or
-     * qemu_co_rwlock_upgrade.
-     */
-    assert(lock->reader == 0);
-    lock->reader++;
-    qemu_co_mutex_unlock(&lock->mutex);
+    qemu_co_mutex_lock(&lock->mutex);
+    assert(lock->owners == -1);
+    lock->owners = 1;
 
-    /* The rest of the read-side critical section is run without the mutex.  */
-    self->locks_held++;
+    /* Possibly wake another reader, which will wake the next in line.  */
+    qemu_co_rwlock_maybe_wake_one(lock);
 }
 
 void qemu_co_rwlock_wrlock(CoRwlock *lock)
 {
+    Coroutine *self = qemu_coroutine_self();
+
     qemu_co_mutex_lock(&lock->mutex);
-    lock->pending_writer++;
-    while (lock->reader) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
+    if (lock->owners == 0) {
+        lock->owners = -1;
+        qemu_co_mutex_unlock(&lock->mutex);
+    } else {
+        CoRwTicket my_ticket = { false, qemu_coroutine_self() };
+
+        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+        qemu_co_mutex_unlock(&lock->mutex);
+        qemu_coroutine_yield();
+        assert(lock->owners == -1);
     }
-    lock->pending_writer--;
 
-    /* The rest of the write-side critical section is run with
-     * the mutex taken, so that lock->reader remains zero.
-     * There is no need to update self->locks_held.
-     */
+    self->locks_held++;
 }
 
 void qemu_co_rwlock_upgrade(CoRwlock *lock)
 {
-    Coroutine *self = qemu_coroutine_self();
-
     qemu_co_mutex_lock(&lock->mutex);
-    assert(lock->reader > 0);
-    lock->reader--;
-    lock->pending_writer++;
-    while (lock->reader) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
-    }
-    lock->pending_writer--;
+    assert(lock->owners > 0);
+    /* For fairness, wait if a writer is in line.  */
+    if (lock->owners == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
+        lock->owners = -1;
+        qemu_co_mutex_unlock(&lock->mutex);
+    } else {
+        CoRwTicket my_ticket = { false, qemu_coroutine_self() };
 
-    /* The rest of the write-side critical section is run with
-     * the mutex taken, similar to qemu_co_rwlock_wrlock.  Do
-     * not account for the lock twice in self->locks_held.
-     */
-    self->locks_held--;
+        lock->owners--;
+        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+        qemu_co_rwlock_maybe_wake_one(lock);
+        qemu_coroutine_yield();
+        assert(lock->owners == -1);
+    }
 }
-- 
2.29.2



