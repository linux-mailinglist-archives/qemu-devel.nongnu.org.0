Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE09B33F053
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:26:51 +0100 (CET)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVGF-0001D6-0i
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6a-0002Hu-ED; Wed, 17 Mar 2021 08:16:52 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6X-0007j2-HB; Wed, 17 Mar 2021 08:16:52 -0400
Received: by mail-ej1-x62a.google.com with SMTP id p8so2202351ejb.10;
 Wed, 17 Mar 2021 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYCbgh+KOfRbcZnCn6zMIAeTgkH/DDMxlNrT19NgzJE=;
 b=i0bWDOEELuRTIAM7HbY3woLKx8GHenTkxAIXZ3LQe2w/xKH2Z6itIWrPQV5Ha9P+jA
 OYmNJ/+uYkgn0GUZ5EPJW7TjtsQYIobeitYHycJsuiQgKWIqys51fCyLY4vyK2a1eesQ
 nAy9NrB50NOoMD5I8NYikFkqTUzbfRle/ijHvfmbCC3ZPWGXPw47SL9RUb58CnBf/z8P
 5yFQimla8jI7W6Wy18V9df5rGLL/p5x80QtwDw1rQHqABJNrPYj+Vts9kXIPwxdXgo+t
 6AgJgDHS+mmF79RNHKYpcAUNLi2mQn2cOGQQHYIp1nHmgkbgKj7gdx3InibJd9aouOit
 uuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tYCbgh+KOfRbcZnCn6zMIAeTgkH/DDMxlNrT19NgzJE=;
 b=r70XYWytDe6u6I4su7D03BYhIWqHWFjCbK20l4vkv6qsHMhE4vy/JsfbnEiW4XRpD4
 xseub1c6OjFQoAM/8kzRWD/4rkkwiExv7bkyzavapRExIKQzo4eoXKuiFVFTBk/cFZ37
 bxGK5bn57DN2cHUx3VCR07NIX7gOX74ljYaIYH/1/fgdAiJ+r/0SLS+W3a2lt3hJW+nH
 mFoPElC4FtlNsuNj6RswE/Lmae4rezZon7xzwNCt/lMurVx0H2+d0ExH8MiqgXNmAo+O
 J0LRGBbgslUt8vydKI78zENToykjS5miYn+b/HaflI7szWtvZ1b3b6iOoHzHNYIkiQpE
 r99A==
X-Gm-Message-State: AOAM533cB1eKCyqiu21fndBPUloFNiioLDA/5B3r0r3+0iJ8zzR30qaD
 aKyzFYU6OATLmqo7e+KeoScmD7E8ej4=
X-Google-Smtp-Source: ABdhPJxK5QYMAIWTjZF4su3t6cpoAd04+3P5ZVJuxkHGsdrPHh0Ug4HE+hrqGl5Rf4c1ENTOx4aHDA==
X-Received: by 2002:a17:906:12db:: with SMTP id
 l27mr34495455ejb.500.1615983406353; 
 Wed, 17 Mar 2021 05:16:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] coroutine-lock: reimplement CoRwLock to fix downgrade bug
Date: Wed, 17 Mar 2021 13:16:39 +0100
Message-Id: <20210317121641.215714-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317121641.215714-1-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
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

To fix this, keep the queue of waiters explicitly in the CoRwLock
instead of using CoQueue, and store for each whether it is a
potential reader or a writer.  This way, downgrade can look at the
first queued coroutines and wake it only if it is a reader, causing
all other readers in line to be released in turn.

Reported-by: David Edmondson <david.edmondson@oracle.com>
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
+    /* Number of readers, of -1 if owned for writing.  */
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



