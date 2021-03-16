Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58C33D8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:05:53 +0100 (CET)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCCe-0002ym-VM
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7H-0000uO-99; Tue, 16 Mar 2021 12:00:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7B-0000Jh-Ps; Tue, 16 Mar 2021 12:00:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so4074254wma.0; 
 Tue, 16 Mar 2021 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mte8xjSStB0pUDuwPLi1AvR+FEhWFweLpTs50yZR/7A=;
 b=b54mecIGxHgzGlYRLHx2Y8llFI02yW3xoB4CQknfO+YzJ8h+VqfyDZfoPaoF7m7vsg
 k4JPxKUg54HL6DmyoiQlCXUvFwcBS9VsPmSwNZf2fobJvJHtCLdDjtdH32KNUCIggA4C
 e/vRbnpe7TLC2OGbGdOoQba2NiIIpT05FXLoA/qtRH9EwMWfKwU48eY5I+fAYmtTWsxq
 hLjwA8P0WhQg2pxFiqeXptblL9xvyY7LtgUL7OmbG3Gau8C9pil5aeOHHUNZhFbTdcwu
 JEyz2opKHWkhTj9cZ++7d/GSvLblsRxTExZPAc1fAkvLtEFKMFpxN0vPtIVGmRpHto/V
 xS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mte8xjSStB0pUDuwPLi1AvR+FEhWFweLpTs50yZR/7A=;
 b=NmZw59i8E6i/Du7w22tFya51iVxUuX5rRRP6oUz4K1+v+nHdFiChVDg/jeOTVEbPrw
 JlFbemlC4FRhUHJTgZDhETpk4OLGx0T6mvogr8qvs0k22699lp2JhubGcu+i0x51A2Uc
 C6/k6WZsDKRcN00P+XVNmY1VQ+1lzx20or0GWRKbpKqF4snQF8R/JJVkhgU6tulQ1U0U
 h21Nt600dw+WUol1y0WbO7ikhBE5Kr8f+dyLdu5fcBAatdcWXSX/2HLjdkjf/jQTVo/j
 8H1zwWdQ6UhnSi9WR5AbG65rsPW7Ru/s4H97kBwfB8T61bDdrify5JWKC+Td9iu1W8DF
 Pdtw==
X-Gm-Message-State: AOAM532xo+cTF86zmdpGvPv+J0LzxFU1yrCfcPhGQ7/OLLo0CmgtLc71
 pWCgDn0bRYIv5CyiEgNSdGC+mvZ3jsQ=
X-Google-Smtp-Source: ABdhPJznGz++RljOF/YE94MhQ5mGC+Ua5xWDeVUJvco97Eayl987tAoj+cLtaExrxvIc7guXdW7RVQ==
X-Received: by 2002:a7b:c047:: with SMTP id u7mr335074wmc.98.1615910411862;
 Tue, 16 Mar 2021 09:00:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm22674851wrw.69.2021.03.16.09.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:00:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] coroutine-lock: reimplement CoRwLock to fix downgrade bug
Date: Tue, 16 Mar 2021 17:00:06 +0100
Message-Id: <20210316160007.135459-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316160007.135459-1-pbonzini@redhat.com>
References: <20210316160007.135459-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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

A feature of the current rwlock is that if multiple coroutines hold a
reader lock, all must be runnable. The unlock implementation relies on
this, choosing to wake a single coroutine when the final read lock
holder exits the critical section, assuming that it will wake a
coroutine attempting to acquire a write lock.

The downgrade implementation violates this assumption by creating a
read lock owning coroutine that is exclusively runnable - any other
coroutines that are waiting to acquire a read lock are *not* made
runnable when the write lock holder converts its ownership to read
only.

To fix this, keep the queue of waiters explicitly in the CoRwLock
instead of using CoQueue, and store for each whether it is a
potential reader or a writer.  This way, downgrade can look at the
first queued coroutines and wake it if it is a reader, causing
all other readers to be released in turn.

Reported-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h   |  10 ++-
 util/qemu-coroutine-lock.c | 150 ++++++++++++++++++++++++-------------
 2 files changed, 106 insertions(+), 54 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 84eab6e3bf..ae62d4bc8d 100644
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
+    int owner;
+
+    /* Waiting coroutines.  */
+    QSIMPLEQ_HEAD(, CoRwTicket) tickets;
 } CoRwlock;
 
 /**
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index eb73cf11dc..655634d185 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -327,11 +327,70 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
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
+    lock->owner = 0;
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
+     * Setting lock->owner here prevents rdlock and wrlock from
+     * sneaking in between unlock and wake.
+     */
+
+    if (tkt) {
+        if (tkt->read) {
+            if (lock->owner >= 0) {
+                lock->owner++;
+                co = tkt->co;
+            }
+        } else {
+            if (lock->owner == 0) {
+                lock->owner = -1;
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
+}
+
+/* Releases the internal CoMutex.  */
+static void qemu_co_rwlock_sleep(bool read, CoRwlock *lock)
+{
+    CoRwTicket my_ticket = { read, qemu_coroutine_self() };
+
+    QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+    qemu_co_mutex_unlock(&lock->mutex);
+    qemu_coroutine_yield();
+
+    if (read) {
+        /* Possibly wake another reader, which will wake the next in line.  */
+        assert(lock->owner >= 1);
+        qemu_co_mutex_lock(&lock->mutex);
+        qemu_co_rwlock_maybe_wake_one(lock);
+    } else {
+        assert(lock->owner == -1);
+    }
 }
 
 void qemu_co_rwlock_rdlock(CoRwlock *lock)
@@ -339,13 +398,13 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
 
     qemu_co_mutex_lock(&lock->mutex);
     /* For fairness, wait if a writer is in line.  */
-    while (lock->pending_writer) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
+    if (lock->owner == 0 || (lock->owner > 0 && QSIMPLEQ_EMPTY(&lock->tickets))) {
+        lock->owner++;
+        qemu_co_mutex_unlock(&lock->mutex);
+    } else {
+        qemu_co_rwlock_sleep(true, lock);
     }
-    lock->reader++;
-    qemu_co_mutex_unlock(&lock->mutex);
 
-    /* The rest of the read-side critical section is run without the mutex.  */
     self->locks_held++;
 }
 
@@ -355,69 +413,58 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
     Coroutine *self = qemu_coroutine_self();
 
     assert(qemu_in_coroutine());
-    if (!lock->reader) {
-        /* The critical section started in qemu_co_rwlock_wrlock.  */
-        qemu_co_queue_restart_all(&lock->queue);
+    self->locks_held--;
+
+    qemu_co_mutex_lock(&lock->mutex);
+    if (lock->owner == -1) {
+        lock->owner = 0;
     } else {
-        self->locks_held--;
+        lock->owner--;
+    }
 
-        qemu_co_mutex_lock(&lock->mutex);
-        lock->reader--;
-        assert(lock->reader >= 0);
-        /* Wakeup only one waiting writer */
-        if (!lock->reader) {
-            qemu_co_queue_next(&lock->queue);
-        }
+    if (lock->owner == 0) {
+        qemu_co_rwlock_maybe_wake_one(lock);
+    } else {
+        qemu_co_mutex_unlock(&lock->mutex);
     }
-    qemu_co_mutex_unlock(&lock->mutex);
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
+    assert(lock->owner == -1);
+    lock->owner = 1;
 
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
+    if (lock->owner == 0) {
+        lock->owner = -1;
+        qemu_co_mutex_unlock(&lock->mutex);
+    } else {
+        qemu_co_rwlock_sleep(false, lock);
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
+    assert(lock->owner > 0);
+    /* For fairness, wait if a writer is in line.  */
+    if (lock->owner == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
+        lock->owner = -1;
+        qemu_co_mutex_unlock(&lock->mutex);
+    } else {
+        lock->owner--;
+        qemu_co_rwlock_sleep(false, lock);
     }
-    lock->pending_writer--;
 
-    /* The rest of the write-side critical section is run with
-     * the mutex taken, similar to qemu_co_rwlock_wrlock.  Do
-     * not account for the lock twice in self->locks_held.
-     */
-    self->locks_held--;
 }
-- 
2.29.2



