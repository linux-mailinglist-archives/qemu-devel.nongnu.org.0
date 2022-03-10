Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538884D484B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:44:08 +0100 (CET)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJ5L-0004Ao-Ek
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9e-0006eg-MJ; Thu, 10 Mar 2022 07:44:30 -0500
Received: from [2a00:1450:4864:20::42a] (port=37516
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9b-0005BE-3A; Thu, 10 Mar 2022 07:44:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q14so7787133wrc.4;
 Thu, 10 Mar 2022 04:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZTGpKD1V1daCcQooV+d3hKY0yPYSonlzjUhTBgMbvI=;
 b=m4OEVtbicg0iaYVYLcQpIgr4jQArcTqsNqGBw6pEZj48+Cod7Fx7B8B7t4ebP5+Nc/
 O7/zZMDE56xaKc7kD4JrisK2om02tDRd8pOqOmJrblDY1+mQA5uw9RFLaHCqsPr4q6rO
 OOGy8b8l7qwPc0vt3QHKugjPQMjOvXr0vPtadSvZU50SMXMRKimMRjLQ5aVq1BktcXtj
 LVb3HBW+6UQkbk+TvF+8DJv8KhFCxyClenf8DXfOXBZul71P1h7GD8dRx2mM2nEHX7LQ
 1pRrLCUGr8vHacvQ58Ltz1r717/1RwdMkm4Hu5Ua9z2oqwQdAEg1kOh9JN+rJuFmFL9b
 55/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FZTGpKD1V1daCcQooV+d3hKY0yPYSonlzjUhTBgMbvI=;
 b=G4v0hMv5sy1mflQ2i3xvMcTdGNBlPMxnFGrF9E+4Q2bXaJwWFSxJyKGhT9ZsJ2Glzj
 5GCA/AuJuqowf6D/lLN8b+fajGGXLcgN/hyoHvAxg/Jv8lQpLl8vq6ZOiO3bVyENGlgh
 32kX/oXaPhe9J9JmTQHtSVOarms9top3R+KB0ClKcxOgEtTq5ByTEgEkdPkABX6NOori
 8efddoXP9n96yVBxl7gfbD9jbQfb99b7a/hunB1DIB5PYjovYnQ3a9WroTku8v1KrCdf
 HwrUgmXyg5tdNyaBdj6BeSkS8ZzXKpSjIZEQVC2TN9gMInU6jXxwwlPhxuMIjh6l5bOi
 qokQ==
X-Gm-Message-State: AOAM532W3Rljuyjc79IFe0D/GG4u8Szt2Rnli+zMHImA2A5Vx28fH421
 ksjyozmgLFyO9vAsSs37GcvckTaVsZU=
X-Google-Smtp-Source: ABdhPJxLm0djZ8weu8IB+cLYt1CtRpOD78sOmHGLXk3zEbbvCdtUkzV2sb26G+9JR0zOPozVFKelCg==
X-Received: by 2002:a5d:598a:0:b0:1f1:fa29:1ba6 with SMTP id
 n10-20020a5d598a000000b001f1fa291ba6mr3379849wri.90.1646916265213; 
 Thu, 10 Mar 2022 04:44:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/35] coroutine: introduce the "stackless coroutine" backend
Date: Thu, 10 Mar 2022 13:43:45 +0100
Message-Id: <20220310124413.1102441-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This backend is similar to the one that was written for the "Continuation
Passing C" precompiler[1].  The main advantages of stackless coroutines,
in the context of QEMU, are two.  First, they do not make any assumption
on the layout of the stack (e.g. they do not need any special treatment
for control-flow protection technologies such as SafeStack or CET).
Second, they do not hide from the compiler the fact that coroutines can
and will move across threads.

Stackless coroutines actually do have a stack, but the frames of
awaitable functions are kept outside the *processor* stack.  The
qemu_coroutine_switch function from the runtime repeatedly invokes the
"handler" for the topmost entry of the coroutine call stack, so that
there is nothing on the processor stack between qemu_coroutine_switch
and a function that can yield.  Therefore, yielding can be done simply
by returning back to qemu_coroutine_switch.

An awaitable function is split in two parts.  User code calls an
external function that sets up the stack frame with the arguments and
calls into the second part.  The second part takes a single void*
argument pointing to the stack frame, so that it can be called on
resumption from qemu_coroutine_switch.  You can already see a bit of
this separation in the runtime, where qemu_coroutine_new sets up a frame
for coroutine_trampoline, which is the function that is actually invoked
by qemu_coroutine_switch.

Both parts return a CoroutineAction enum: COROUTINE_CONTINUE to just go on
with the execution loop (typically because an awaitable function reached
the end of the function and popped a stack frame, more on this below),
COROUTINE_YIELD to exit to the caller, COROUTINE_TERMINATE to clean up the
current coroutine and exit to the caller.  COROUTINE_TERMINATE actually
is only returned by the runtime's internal coroutine_trampoline.  The
fact that the return value is always a CoroutineAction (the actual return
value must be done with a pointer argument, pointing into the caller's
stack frame) means that code changes are necessary for the coroutine
themselves; that's a separate topic which I'll get to in a moment.

Compared to other backends, the only extra change needed to common code
is in the implementation of qemu_coroutine_yield().  The implementation
for fiber-based backends cannot be reused because qemu_coroutine_yield()
now needs to return a CoroutineAction enum, just like any other
awaitable function[2].

There are two possible implementation of the stackless coroutine handlers.
The first is to change the handler address every time an awaitable
function yields, pointing the handler to a function that executes the
rest of the function.  This effectively means transforming the function
to continuation-passing style and is what Continuation Passing C did.

The alternative is to turn the function into a state machine (a large
switch statement); the information on where to restart execution is
stored in the stack frame.  This is the approach that I chose for these
conversions.  Because the yield points can be arbitrarily inside loops
or conditionals, this would be a very hard thing to do for a source-to-source
translator in any normal language.  But C is not a normal language, and
especially its switch statement is not normal.  A construction similar
to Duff's device makes it possible to do this in a source-to-source
manner:

  switch (t->_step) {
  case 0:
        do_something_without_yielding();
        for (i = 0; i < n; i++) {
                ...
                t->_step = 1;
                t->i = i;
                t->n = n;
                return another_coroutine(...);
  case 1:
                i = t->i;
                n = t->n;
                ...
        }
  }

Putting everything in a single function *should* reduces code size
somewhat (due to prologs and epilogs), and would also provide chances
for optimization when an awaitable function is called but does not yield.
I have not done this in this series, but it basically would entail changing
all occurrences of "return awaitable_function();" to

   if (awaitable_function() == COROUTINE_YIELD) return COROUTINE_YIELD;
   fallthrough;

Because of the code transformations that are needed, stackless coroutines
require compiler support.  Manual conversion is something I did for
this experiment but I don't recommend for your sanity; it should
be restricted to internal functions such as coroutine_trampoline
or qemu_coroutine_yield().  Therefore, the idea would be to use a
source-to-source translator, again similar to Continuation Passing C.
Debugging support on the level of the current gdb script is probably
possible too.

A basic translator should produce code roughly similar to the one that I
have written by hand, except when I applied a little more
care or sophistication to simplify the translation.

For example, if a function does not call an awaitable function except
in tail calls, it is not necessary to construct a stack frame and tear
it away immediately after the tail calls return.  I have sometimes done
this because it makes the conversion simpler.

In addition, the translator need not save variables that are not written
on any path from a previous yield point to the current one, and need not
load variables that are not read on any path from the current yield point
to the next one.  This looks complicated but is a relatively simple data
flow problem---but anyway it's not important for a basic translator.

A final design point is the implementation of the per-coroutine stack.
In this implementation I chose to have no allocations while coroutines
run: the per-coroutine stack is really a stack that carves out frames
from a large COROUTINE_STACK_SIZE-bytes block.  However, it is also
possible to implement coroutine_stack_alloc and coroutine_stack_free
using malloc/free.

[1] https://arxiv.org/pdf/1310.3404.pdf
[2] The QEMU/CPC paper kept the target-independent qemu_coroutine_yield,
    by special casing it in the runtime.  I chose not to because, if
    QEMU were to switch to stackless coroutines, the other backends
    would likely be dropped at the same time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                    |  44 +---------
 include/qemu/co-lockable.h   |  26 ++++--
 include/qemu/coroutine.h     |  48 +++++++----
 include/qemu/coroutine_int.h |   6 --
 util/coroutine-stackless.c   | 159 +++++++++++++++++++++++++++++++++++
 util/qemu-coroutine.c        |  16 ----
 6 files changed, 212 insertions(+), 87 deletions(-)
 create mode 100644 util/coroutine-stackless.c

diff --git a/configure b/configure
index 886000346a..e45d2c3b9c 100755
--- a/configure
+++ b/configure
@@ -1220,8 +1220,6 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --cpu=CPU                Build for host CPU [$cpu]
-  --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
   --tls-priority           default TLS protocol/cipher priority string
   --enable-plugins
@@ -1242,7 +1240,7 @@ cat << EOF
   debug-info      debugging information
   lto             Enable Link-Time Optimization.
   safe-stack      SafeStack Stack Smash Protection. Depends on
-                  clang/llvm >= 3.7 and requires coroutine backend ucontext.
+                  clang/llvm >= 3.7
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vhost-net       vhost-net kernel acceleration support
@@ -2338,39 +2336,7 @@ EOF
   fi
 fi
 
-if test "$coroutine" = ""; then
-  if test "$mingw32" = "yes"; then
-    coroutine=win32
-  elif test "$ucontext_works" = "yes"; then
-    coroutine=ucontext
-  else
-    coroutine=sigaltstack
-  fi
-else
-  case $coroutine in
-  windows)
-    if test "$mingw32" != "yes"; then
-      error_exit "'windows' coroutine backend only valid for Windows"
-    fi
-    # Unfortunately the user visible backend name doesn't match the
-    # coroutine-*.c filename for this case, so we have to adjust it here.
-    coroutine=win32
-    ;;
-  ucontext)
-    if test "$ucontext_works" != "yes"; then
-      feature_not_found "ucontext"
-    fi
-    ;;
-  sigaltstack)
-    if test "$mingw32" = "yes"; then
-      error_exit "only the 'windows' coroutine backend is valid for Windows"
-    fi
-    ;;
-  *)
-    error_exit "unknown coroutine backend $coroutine"
-    ;;
-  esac
-fi
+coroutine=stackless
 
 ##################################################
 # SafeStack
@@ -2395,9 +2361,6 @@ EOF
   else
     error_exit "SafeStack not supported by your compiler"
   fi
-  if test "$coroutine" != "ucontext"; then
-    error_exit "SafeStack is only supported by the coroutine backend ucontext"
-  fi
 else
 cat > $TMPC << EOF
 int main(int argc, char *argv[])
@@ -2427,9 +2390,6 @@ else # "$safe_stack" = ""
     safe_stack="no"
   else
     safe_stack="yes"
-    if test "$coroutine" != "ucontext"; then
-      error_exit "SafeStack is only supported by the coroutine backend ucontext"
-    fi
   fi
 fi
 fi
diff --git a/include/qemu/co-lockable.h b/include/qemu/co-lockable.h
index 09f4620017..95d058e2c9 100644
--- a/include/qemu/co-lockable.h
+++ b/include/qemu/co-lockable.h
@@ -16,7 +16,7 @@
 #include "qemu/coroutine.h"
 #include "qemu/thread.h"
 
-typedef void coroutine_fn QemuCoLockUnlockFunc(void *);
+typedef CoroutineAction QemuCoLockUnlockFunc(void *);
 
 struct QemuCoLockable {
     void *object;
@@ -24,6 +24,18 @@ struct QemuCoLockable {
     QemuCoLockUnlockFunc *unlock;
 };
 
+static inline CoroutineAction qemu_mutex_co_lock(QemuMutex *mutex)
+{
+    qemu_mutex_lock(mutex);
+    return COROUTINE_CONTINUE;
+}
+
+static inline CoroutineAction qemu_mutex_co_unlock(QemuMutex *mutex)
+{
+    qemu_mutex_unlock(mutex);
+    return COROUTINE_CONTINUE;
+}
+
 static inline __attribute__((__always_inline__)) QemuCoLockable *
 qemu_make_co_lockable(void *x, QemuCoLockable *lockable)
 {
@@ -68,7 +80,7 @@ qemu_null_co_lockable(void *x)
 #define QEMU_MAKE_CO_LOCKABLE(x)                                            \
     _Generic((x), QemuCoLockable *: (x),                                    \
              void *: qemu_null_co_lockable(x),                              \
-             QemuMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, mutex)),    \
+             QemuMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, mutex_co)), \
              CoMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, co_mutex)))   \
 
 /**
@@ -82,17 +94,17 @@ qemu_null_co_lockable(void *x)
  */
 #define QEMU_MAKE_CO_LOCKABLE_NONNULL(x)                        \
     _Generic((x), QemuCoLockable *: (x),                        \
-                  QemuMutex *: QMCL_OBJ_(x, mutex),             \
+                  QemuMutex *: QMCL_OBJ_(x, mutex_co),          \
                   CoMutex *: QMCL_OBJ_(x, co_mutex))
 
-static inline void coroutine_fn qemu_co_lockable_lock(QemuCoLockable *x)
+static inline CoroutineAction qemu_co_lockable_lock(QemuCoLockable *x)
 {
-    x->lock(x->object);
+    return x->lock(x->object);
 }
 
-static inline void coroutine_fn qemu_co_lockable_unlock(QemuCoLockable *x)
+static inline CoroutineAction qemu_co_lockable_unlock(QemuCoLockable *x)
 {
-    x->unlock(x->object);
+    return x->unlock(x->object);
 }
 
 #endif
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index b23fba88c2..2f2be6abfe 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -18,6 +18,20 @@
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 
+typedef enum {
+    COROUTINE_YIELD = 1,
+    COROUTINE_TERMINATE = 2,
+    COROUTINE_ENTER = 3,
+    COROUTINE_CONTINUE = 4,
+} CoroutineAction;
+
+typedef CoroutineAction CoroutineImpl(void *opaque);
+
+typedef struct {
+    CoroutineImpl *caller_func;
+    void *caller_frame;
+} CoroutineFrame;
+
 /**
  * Coroutines are a mechanism for stack switching and can be used for
  * cooperative userspace threading.  These functions provide a simple but
@@ -56,7 +70,7 @@ typedef struct Coroutine Coroutine;
  * When this function returns, the coroutine is destroyed automatically and
  * execution continues in the caller who last entered the coroutine.
  */
-typedef void coroutine_fn CoroutineEntry(void *opaque);
+typedef CoroutineAction CoroutineEntry(void *opaque);
 
 /**
  * Create a new coroutine
@@ -88,7 +102,7 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co);
  * This function does not return until the coroutine is re-entered using
  * qemu_coroutine_enter().
  */
-void coroutine_fn qemu_coroutine_yield(void);
+CoroutineAction qemu_coroutine_yield(void);
 
 /**
  * Get the AioContext of the given coroutine
@@ -160,13 +174,13 @@ void qemu_co_mutex_init(CoMutex *mutex);
  * Locks the mutex. If the lock cannot be taken immediately, control is
  * transferred to the caller of the current coroutine.
  */
-void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex);
+CoroutineAction qemu_co_mutex_lock(CoMutex *mutex);
 
 /**
  * Unlocks the mutex and schedules the next coroutine that was waiting for this
  * lock to be run.
  */
-void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex);
+CoroutineAction qemu_co_mutex_unlock(CoMutex *mutex);
 
 /**
  * Assert that the current coroutine holds @mutex.
@@ -206,7 +220,7 @@ void qemu_co_queue_init(CoQueue *queue);
  */
 #define qemu_co_queue_wait(queue, lock) \
     qemu_co_queue_wait_impl(queue, QEMU_MAKE_CO_LOCKABLE(lock))
-void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock);
+CoroutineAction qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock);
 
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.
@@ -262,7 +276,7 @@ void qemu_co_rwlock_init(CoRwlock *lock);
  * of a parallel writer, control is transferred to the caller of the current
  * coroutine.
  */
-void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock);
+CoroutineAction qemu_co_rwlock_rdlock(CoRwlock *lock);
 
 /**
  * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
@@ -271,7 +285,7 @@ void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock);
  * to the caller of the current coroutine; another writer might run while
  * @qemu_co_rwlock_upgrade blocks.
  */
-void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock);
+CoroutineAction qemu_co_rwlock_upgrade(CoRwlock *lock);
 
 /**
  * Downgrades a write-side critical section to a reader.  Downgrading with
@@ -279,20 +293,20 @@ void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock);
  * followed by @qemu_co_rwlock_rdlock.  This makes it more efficient, but
  * may also sometimes be necessary for correctness.
  */
-void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock);
+CoroutineAction qemu_co_rwlock_downgrade(CoRwlock *lock);
 
 /**
  * Write Locks the mutex. If the lock cannot be taken immediately because
  * of a parallel reader, control is transferred to the caller of the current
  * coroutine.
  */
-void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock);
+CoroutineAction qemu_co_rwlock_wrlock(CoRwlock *lock);
 
 /**
  * Unlocks the read/write lock and schedules the next coroutine that was
  * waiting for this lock to be run.
  */
-void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock);
+CoroutineAction qemu_co_rwlock_unlock(CoRwlock *lock);
 
 typedef struct QemuCoSleep {
     Coroutine *to_wake;
@@ -303,18 +317,18 @@ typedef struct QemuCoSleep {
  * during this yield, it can be passed to qemu_co_sleep_wake() to
  * terminate the sleep.
  */
-void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+CoroutineAction qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
                                             QEMUClockType type, int64_t ns);
 
 /**
  * Yield the coroutine until the next call to qemu_co_sleep_wake.
  */
-void coroutine_fn qemu_co_sleep(QemuCoSleep *w);
+CoroutineAction qemu_co_sleep(QemuCoSleep *w);
 
-static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
+static inline CoroutineAction qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
 {
     QemuCoSleep w = { 0 };
-    qemu_co_sleep_ns_wakeable(&w, type, ns);
+    return qemu_co_sleep_ns_wakeable(&w, type, ns);
 }
 
 /**
@@ -330,7 +344,7 @@ void qemu_co_sleep_wake(QemuCoSleep *w);
  *
  * Note that this function clobbers the handlers for the file descriptor.
  */
-void coroutine_fn yield_until_fd_readable(int fd);
+CoroutineAction yield_until_fd_readable(int fd);
 
 /**
  * Increase coroutine pool size
@@ -342,7 +356,9 @@ void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
  */
 void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
 
-#include "qemu/lockable.h"
 #include "qemu/co-lockable.h"
 
+void *coroutine_only_fn stack_alloc(CoroutineImpl *func, size_t bytes);
+CoroutineAction coroutine_only_fn stack_free(CoroutineFrame *f);
+
 #endif /* QEMU_COROUTINE_H */
diff --git a/include/qemu/coroutine_int.h b/include/qemu/coroutine_int.h
index 1da148552f..1989370194 100644
--- a/include/qemu/coroutine_int.h
+++ b/include/qemu/coroutine_int.h
@@ -35,12 +35,6 @@ extern __thread void *__safestack_unsafe_stack_ptr;
 
 #define COROUTINE_STACK_SIZE (1 << 20)
 
-typedef enum {
-    COROUTINE_YIELD = 1,
-    COROUTINE_TERMINATE = 2,
-    COROUTINE_ENTER = 3,
-} CoroutineAction;
-
 struct Coroutine {
     CoroutineEntry *entry;
     void *entry_arg;
diff --git a/util/coroutine-stackless.c b/util/coroutine-stackless.c
new file mode 100644
index 0000000000..7ba3b0cf63
--- /dev/null
+++ b/util/coroutine-stackless.c
@@ -0,0 +1,159 @@
+/*
+ * stackless coroutine initialization code
+ *
+ * Copyright (C) 2022 Paolo BOnzini <pbonzini@redhat.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.0 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "qemu/coroutine_int.h"
+
+typedef struct {
+    Coroutine base;
+    void *stack;
+    void *stack_ptr;
+    CoroutineImpl *current_func;
+    void *current_frame;
+} CoroutineStackless;
+
+static __thread CoroutineStackless leader;
+static __thread Coroutine *current;
+
+static void *coroutine_stack_alloc(CoroutineStackless *co, CoroutineImpl *func, size_t bytes)
+{
+    CoroutineFrame *ret = co->stack_ptr;
+
+    bytes = ROUND_UP(bytes, 16);
+    assert(bytes <= COROUTINE_STACK_SIZE - (co->stack_ptr - co->stack));
+    co->stack_ptr += bytes;
+    ret->caller_func = co->current_func;
+    ret->caller_frame = co->current_frame;
+    co->current_func = func;
+    co->current_frame = ret;
+    return ret;
+}
+
+static void coroutine_stack_free(CoroutineStackless *co, CoroutineFrame *f)
+{
+    assert((void *)f >= co->stack && (void *)f < co->stack_ptr);
+    co->current_func = f->caller_func;
+    co->current_frame = f->caller_frame;
+    co->stack_ptr = f;
+}
+
+struct FRAME__coroutine_trampoline {
+    CoroutineFrame common;
+    bool back;
+};
+
+static CoroutineAction coroutine_trampoline(void *_frame)
+{
+    struct FRAME__coroutine_trampoline *_f = _frame;
+    Coroutine *co = current;
+    if (!_f->back) {
+        _f->back = true;
+        // or:
+        //   if (co->entry(co->entry_arg) == COROUTINE_YIELD) return COROUTINE_YIELD;
+        return co->entry(co->entry_arg);
+    }
+
+    _f->back = false;
+    current = co->caller;
+    co->caller = NULL;
+    return COROUTINE_TERMINATE;
+}
+
+Coroutine *qemu_coroutine_new(void)
+{
+    CoroutineStackless *co;
+    struct FRAME__coroutine_trampoline *frame;
+
+    co = g_malloc0(sizeof(*co));
+    co->stack = g_malloc(COROUTINE_STACK_SIZE);
+    co->stack_ptr = co->stack;
+
+    frame = coroutine_stack_alloc(co, coroutine_trampoline, sizeof(*frame));
+    frame->back = false;
+    return &co->base;
+}
+
+void qemu_coroutine_delete(Coroutine *co_)
+{
+    CoroutineStackless *co = DO_UPCAST(CoroutineStackless, base, co_);
+    struct FRAME__coroutine_trampoline *frame = co->current_frame;
+
+    assert(!frame->back);
+    coroutine_stack_free(co, co->current_frame);
+    assert(co->stack_ptr == co->stack);
+    g_free(co->stack);
+    g_free(co);
+}
+
+CoroutineAction
+qemu_coroutine_switch(Coroutine *from, Coroutine *to,
+                      CoroutineAction action)
+{
+    assert(action == COROUTINE_ENTER);
+    assert(to->caller != NULL);
+    current = to;
+    do {
+        CoroutineStackless *co = DO_UPCAST(CoroutineStackless, base, to);
+        action = co->current_func(co->current_frame);
+    } while (action == COROUTINE_CONTINUE);
+    assert(action != COROUTINE_ENTER);
+    return action;
+}
+
+CoroutineAction qemu_coroutine_yield(void)
+{
+    Coroutine *from = current;
+    Coroutine *to = from->caller;
+    trace_qemu_coroutine_yield(from, to);
+    if (!to) {
+        fprintf(stderr, "Co-routine is yielding to no one\n");
+        abort();
+    }
+    from->caller = NULL;
+    current = to;
+    return COROUTINE_YIELD;
+}
+
+Coroutine *qemu_coroutine_self(void)
+{
+    if (!current) {
+        current = &leader.base;
+    }
+    return current;
+}
+
+bool qemu_in_coroutine(void)
+{
+    return current && current->caller;
+}
+
+void *stack_alloc(CoroutineImpl *func, size_t bytes)
+{
+    CoroutineStackless *co = DO_UPCAST(CoroutineStackless, base, current);
+
+    return coroutine_stack_alloc(co, func, bytes);
+}
+
+CoroutineAction stack_free(CoroutineFrame *f)
+{
+    CoroutineStackless *co = DO_UPCAST(CoroutineStackless, base, current);
+    coroutine_stack_free(co, f);
+    return COROUTINE_CONTINUE;
+}
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 9f2bd96fa0..0ae2a4090f 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -179,22 +179,6 @@ void qemu_coroutine_enter_if_inactive(Coroutine *co)
     }
 }
 
-void coroutine_fn qemu_coroutine_yield(void)
-{
-    Coroutine *self = qemu_coroutine_self();
-    Coroutine *to = self->caller;
-
-    trace_qemu_coroutine_yield(self, to);
-
-    if (!to) {
-        fprintf(stderr, "Co-routine is yielding to no one\n");
-        abort();
-    }
-
-    self->caller = NULL;
-    qemu_coroutine_switch(self, to, COROUTINE_YIELD);
-}
-
 bool qemu_coroutine_entered(Coroutine *co)
 {
     return co->caller;
-- 
2.35.1



