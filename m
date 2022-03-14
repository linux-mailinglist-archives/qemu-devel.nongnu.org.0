Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A24D7F09
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:52:18 +0100 (CET)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThNB-0003N6-M1
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:52:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3u-00088U-FH; Mon, 14 Mar 2022 05:32:23 -0400
Received: from [2a00:1450:4864:20::32e] (port=42760
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3q-000884-Q6; Mon, 14 Mar 2022 05:32:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso1269281wmr.1; 
 Mon, 14 Mar 2022 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ew3J4Yhx2vLW0aRlDEqkJx3eRwlf8HSNh+3huXgfKV4=;
 b=NbXXMXekAcgb3Pgb4b8yv903lCfq8byhosjcnWNz791nrDndakoJ19HaiF+MZ9HMeU
 +xLYpH+xayMQ2LYkRi4PvPXK75/BIflvJ0UIxZGN4jDs+sJ+hwbbIJeHAMdfp7mEZvFk
 4oFpGQVx/IUFe0a6T92X3y8vcRivo2nfoAcrUXdQSkxp3CLh6O0bt4eH0+YpIOIvDFe0
 MQ9mTtIEAgnv1E1YydRKFcSxg2LdlHwRnv6mWEkJCQRgce0Z1ezqPsaX1CjV57hluZFv
 o3GGUcA+hScgDILx06vBEi+LArKKbxC3kmoyourSw9JvzXuxsMTQUTcOXwQjRQD2cbbI
 lXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ew3J4Yhx2vLW0aRlDEqkJx3eRwlf8HSNh+3huXgfKV4=;
 b=BrZGNZXfjiFhlA5e/42Hvz1hxfa77dOG416yIZ4c4xkVteWMCYdQuirMCy+y07wByP
 T86CjA3nKa3h7I9++6E/br4tnAYQKcOjpv643n6hzO/s2LQ+3wmstVyFhoSOus6w+YWG
 WT/6ncqvyO0xYIXslL/hgDmanUkqNLlIE1tplNWEFmCBCp3qIsinC0iWkM3W3WzcWLcd
 dMlTZMQ9XLY7hd0zoU83HLXGgJruet8TuaM1naTeYYGI5+K1ohVNji7qh3DgKevN+j/y
 tIjpWqTewiCI6P2sBpRck8AXJOn+pfeD0n/zLKOOWgHzUHetXJc8IpfH6pY1zV1NDOUA
 B/HQ==
X-Gm-Message-State: AOAM533RoQkxDvr3QzpY0IuHMyAA8WqQ22Old/koB7bsRpz+EEceHu3H
 DEcjTKSqLObi8YkeXIiwpvAxJ5v54AE=
X-Google-Smtp-Source: ABdhPJxye0scuKhIVlHCN5NmcjFPco0nmFKpWw8yzLadvAy0RqQtnzWdNhvWGpgoGaciwkrK2YjRRg==
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr16842556wmc.57.1647250336890; 
 Mon, 14 Mar 2022 02:32:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 14/16] util: introduce C++ stackless coroutine
 backend
Date: Mon, 14 Mar 2022 10:32:01 +0100
Message-Id: <20220314093203.1420404-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                     |  44 +-
 include/qemu/coroutine.h                      | 445 +++++++++++++-----
 include/qemu/coroutine_int.h                  |   8 +
 util/coroutine-stackless.cc                   | 145 ++++++
 util/meson.build                              |   6 +-
 ...oroutine-lock.c => qemu-coroutine-lock.cc} |  70 +--
 ...outine-sleep.c => qemu-coroutine-sleep.cc} |  12 +-
 util/{qemu-coroutine.c => qemu-coroutine.cc}  |  16 -
 8 files changed, 530 insertions(+), 216 deletions(-)
 create mode 100644 util/coroutine-stackless.cc
 rename util/{qemu-coroutine-lock.c => qemu-coroutine-lock.cc} (87%)
 rename util/{qemu-coroutine-sleep.c => qemu-coroutine-sleep.cc} (89%)
 rename util/{qemu-coroutine.c => qemu-coroutine.cc} (94%)

diff --git a/configure b/configure
index 091710ec03..c02b5edcba 100755
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
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index ac9891502e..0f89fbafa0 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -48,25 +48,6 @@ G_BEGIN_DECLS
 
 typedef struct Coroutine Coroutine;
 
-/**
- * Coroutine entry point
- *
- * When the coroutine is entered for the first time, opaque is passed in as an
- * argument.
- *
- * When this function returns, the coroutine is destroyed automatically and
- * execution continues in the caller who last entered the coroutine.
- */
-typedef void coroutine_fn CoroutineEntry(void *opaque);
-
-/**
- * Create a new coroutine
- *
- * Use qemu_coroutine_enter() to actually transfer control to the coroutine.
- * The opaque argument is passed as the argument to the entry point.
- */
-Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque);
-
 /**
  * Transfer control to a coroutine
  */
@@ -83,14 +64,6 @@ void qemu_coroutine_enter_if_inactive(Coroutine *co);
  */
 void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co);
 
-/**
- * Transfer control back to a coroutine's caller
- *
- * This function does not return until the coroutine is re-entered using
- * qemu_coroutine_enter().
- */
-void coroutine_fn qemu_coroutine_yield(void);
-
 /**
  * Get the AioContext of the given coroutine
  */
@@ -157,18 +130,6 @@ struct CoMutex {
  */
 void qemu_co_mutex_init(CoMutex *mutex);
 
-/**
- * Locks the mutex. If the lock cannot be taken immediately, control is
- * transferred to the caller of the current coroutine.
- */
-void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex);
-
-/**
- * Unlocks the mutex and schedules the next coroutine that was waiting for this
- * lock to be run.
- */
-void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex);
-
 /**
  * Assert that the current coroutine holds @mutex.
  */
@@ -200,17 +161,6 @@ typedef struct CoQueue {
  */
 void qemu_co_queue_init(CoQueue *queue);
 
-#if 0
-/**
- * Adds the current coroutine to the CoQueue and transfers control to the
- * caller of the coroutine.  The mutex is unlocked during the wait and
- * locked again afterwards.
- */
-#define qemu_co_queue_wait(queue, lock) \
-    qemu_co_queue_wait_impl(queue, QEMU_MAKE_CO_LOCKABLE(lock))
-void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock);
-#endif
-
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.
  * Returns true if a coroutine was removed, false if the queue is empty.
@@ -260,66 +210,10 @@ typedef struct CoRwlock {
  */
 void qemu_co_rwlock_init(CoRwlock *lock);
 
-/**
- * Read locks the CoRwlock. If the lock cannot be taken immediately because
- * of a parallel writer, control is transferred to the caller of the current
- * coroutine.
- */
-void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock);
-
-/**
- * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
- * @qemu_co_rwlock_unlock followed by a separate @qemu_co_rwlock_wrlock.
- * Note that if the lock cannot be upgraded immediately, control is transferred
- * to the caller of the current coroutine; another writer might run while
- * @qemu_co_rwlock_upgrade blocks.
- */
-void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock);
-
-/**
- * Downgrades a write-side critic section to a reader.  Downgrading with
- * @qemu_co_rwlock_downgrade never blocks, unlike @qemu_co_rwlock_unlock
- * followed by @qemu_co_rwlock_rdlock.  This makes it more efficient, but
- * may also sometimes be necessary for correctness.
- */
-void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock);
-
-/**
- * Write Locks the mutex. If the lock cannot be taken immediately because
- * of a parallel reader, control is transferred to the caller of the current
- * coroutine.
- */
-void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock);
-
-/**
- * Unlocks the read/write lock and schedules the next coroutine that was
- * waiting for this lock to be run.
- */
-void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock);
-
 typedef struct QemuCoSleep {
     Coroutine *to_wake;
 } QemuCoSleep;
 
-/**
- * Yield the coroutine for a given duration. Initializes @w so that,
- * during this yield, it can be passed to qemu_co_sleep_wake() to
- * terminate the sleep.
- */
-void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
-                                            QEMUClockType type, int64_t ns);
-
-/**
- * Yield the coroutine until the next call to qemu_co_sleep_wake.
- */
-void coroutine_fn qemu_co_sleep(QemuCoSleep *w);
-
-static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
-{
-    QemuCoSleep w = { 0 };
-    qemu_co_sleep_ns_wakeable(&w, type, ns);
-}
-
 /**
  * Wake a coroutine if it is sleeping in qemu_co_sleep_ns. The timer will be
  * deleted. @sleep_state must be the variable whose address was given to
@@ -328,13 +222,6 @@ static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
  */
 void qemu_co_sleep_wake(QemuCoSleep *w);
 
-/**
- * Yield until a file descriptor becomes readable
- *
- * Note that this function clobbers the handlers for the file descriptor.
- */
-void coroutine_fn yield_until_fd_readable(int fd);
-
 /**
  * Increase coroutine pool size
  */
@@ -348,6 +235,338 @@ void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
 G_END_DECLS
 
 #include "qemu/lockable.h"
+
+#ifdef __cplusplus
+#include <cstdint>
+#include <coroutine>
+#include <exception>
+
+// BaseCoroutine is a simple wrapper type for a Promise.  It mostly
+// exists because C++ says so, but it also provides two extra features:
+// RAII destruction of the coroutine (which is more efficient but
+// beware, the promise's final_suspend must always suspend to avoid
+// double free) and a cast to std::coroutine_handle<>, which makes
+// it resumable.
+
+template<typename Promise> struct BaseCoroutine
+{
+    using promise_type = Promise;
+
+    BaseCoroutine() = default;
+    explicit BaseCoroutine (Promise &promise) :
+        _coroutine{std::coroutine_handle<Promise>::from_promise(promise)} {}
+
+    BaseCoroutine(BaseCoroutine const&) = delete;
+    BaseCoroutine(BaseCoroutine&& other) : _coroutine{other._coroutine} {
+        other._coroutine = nullptr;
+    }
+
+    BaseCoroutine& operator=(BaseCoroutine const&) = delete;
+    BaseCoroutine& operator=(BaseCoroutine&& other) {
+        if (&other != this) {
+            _coroutine = other._coroutine;
+            other._coroutine = nullptr;
+        }
+        return *this;
+    }
+
+    ~BaseCoroutine() {
+        //printf("!!!! destroying %p\n", _coroutine);
+        if (_coroutine) _coroutine.destroy();
+    }
+
+    operator bool() const noexcept {
+        return _coroutine;
+    }
+    operator std::coroutine_handle<>() const noexcept {
+        return _coroutine;
+    }
+    Promise &promise() const noexcept {
+        return _coroutine.promise();
+    }
+
+private:
+    std::coroutine_handle<Promise> _coroutine = nullptr;
+};
+
+// This is a simple awaitable object that takes care of resuming a
+// parent coroutine.  It's needed because co_await suspends all
+// parent coroutines on the stack.  It does not need a specific
+// "kind" of coroutine_handle, so no need to put it inside the
+// templates below.
+//
+// If next is NULL, then this degrades to std::suspend_always.
+
+struct ResumeAndFinish {
+    explicit ResumeAndFinish(std::coroutine_handle<> next) noexcept :
+        _next{next} {}
+
+    bool await_ready() const noexcept {
+        return false;
+    }
+    bool await_suspend(std::coroutine_handle<> ch) const noexcept {
+        if (_next) {
+            _next.resume();
+        }
+        return true;
+    }
+    void await_resume() const noexcept {}
+
+private:
+    std::coroutine_handle<> _next;
+};
+
+// ------------------------
+
+// CoroutineFn does not even need anything more than what
+// BaseCoroutine provides, so it's just a type alias.  The magic
+// is all in ValuePromise<T>.
+//
+// Suspended CoroutineFns are chained between themselves.  Whenever a
+// coroutine is suspended, all those that have done a co_await are
+// also suspended, and whenever a coroutine finishes, it has to
+// check if its parent can now be resumed.
+//
+// The two auxiliary classes Awaiter and ResumeAndFinish take
+// care of the two sides of this.  Awaiter's await_suspend() stores
+// the parent coroutine into ValuePromise; ResumeAndFinish's runs
+// after a coroutine returns, and resumes the parent coroutine.
+
+template<typename T> struct ValuePromise;
+template<typename T>
+using CoroutineFn = BaseCoroutine<ValuePromise<T>>;
+
+typedef CoroutineFn<void> CoroutineFunc(void *);
+
+// Unfortunately it is forbidden to define both return_void() and
+// return_value() in the same class.  In order to cut on the
+// code duplication, define a superclass for both ValuePromise<T>
+// and ValuePromise<void>.
+//
+// The "curiously recurring template pattern" is used to substitute
+// ValuePromise<T> into the methods of the base class and its Awaited.
+// For example await_resume() needs to retrieve a value with the
+// correct type from the subclass's value() method.
+
+template<typename T, typename Derived>
+struct BasePromise
+{
+    using coro_handle_type = std::coroutine_handle<Derived>;
+
+#if 0
+    // Same as get_return_object().address() but actually works.
+    // Useful as an identifier to identify the promise in debugging
+    // output, because it matches the values passed to await_suspend().
+    void *coro_address() const {
+        return __builtin_coro_promise((char *)this, __alignof(*this), true);
+    }
+
+    BasePromise() {
+        printf("!!!! created %p\n", coro_address());
+    }
+    ~BasePromise() {
+        printf("!!!! destroyed %p\n", coro_address());
+    }
+#endif
+
+    CoroutineFn<T> get_return_object() noexcept { return CoroutineFn<T>{downcast()}; }
+    void unhandled_exception()                  { std::terminate(); }
+    auto initial_suspend() const noexcept       { return std::suspend_never{}; }
+    auto final_suspend() noexcept               {
+        auto continuation = ResumeAndFinish{_next};
+        mark_ready();
+        return continuation;
+    }
+private:
+    std::coroutine_handle<> _next = nullptr;
+
+    static const std::uintptr_t READY_MARKER = 1;
+    void mark_ready() {
+        _next = std::coroutine_handle<>::from_address((void *)READY_MARKER);
+    }
+
+    bool is_ready() const {
+        return _next.address() == (void *)READY_MARKER;
+    }
+
+    Derived& downcast() noexcept                { return *static_cast<Derived*>(this); }
+    Derived const& downcast() const noexcept    { return *static_cast<const Derived*>(this); }
+
+    // This records the parent coroutine, before a co_await suspends
+    // all parent coroutines on the stack.
+    void then(std::coroutine_handle<> parent)  { _next = parent; }
+
+    // This is the object that lets us co_await a CoroutineFn<T> (of which
+    // this class is the corresponding promise object).  This is just mapping
+    // C++ awaitable naming into the more convention promise naming.
+    struct Awaiter {
+        Derived &_promise;
+
+        explicit Awaiter(Derived &promise) : _promise{promise} {}
+
+        bool await_ready() const noexcept {
+            return _promise.is_ready();
+        }
+
+        void await_suspend(std::coroutine_handle<> parent) const noexcept {
+            _promise.then(parent);
+        }
+
+        Derived::await_resume_type await_resume() const noexcept {
+            return _promise.value();
+        }
+    };
+
+    // C++ connoisseurs will tell you that this is not private.
+    friend Awaiter operator co_await(CoroutineFn<T> co) {
+        return Awaiter{co.promise()};
+    }
+};
+
+// The actu promises, respectively for non-void and void types.
+// All that's left is storing and retrieving the value.
+
+template<typename T>
+struct ValuePromise: BasePromise<T, ValuePromise<T>>
+{
+    using await_resume_type = T&&;
+    T _value;
+    void return_value(T&& value)       { _value = std::move(value); }
+    void return_value(T const& value)  { _value = value; }
+    T&& value() noexcept               { return static_cast<T&&>(_value); }
+};
+
+template<>
+struct ValuePromise<void>: BasePromise<void, ValuePromise<void>>
+{
+    using await_resume_type = void;
+    void return_void() const           {}
+    void value() const                 {}
+};
+
+
+// ---------------------------
+
+// This class takes care of yielding, which is just a matter of doing
+// "co_await Yield{}".  This always suspends, and also stores the
+// suspending CoroutineFn in current->top.
+struct Yield: std::suspend_always {
+    void await_suspend(std::coroutine_handle<> parent) const noexcept;
+};
+
+// ---------------------------
+
+// Make it possible to write "co_await qemu_coroutine_yield()"
+static inline Yield qemu_coroutine_yield()
+{
+    return Yield{};
+}
+
+/**
+ * Coroutine entry point
+ *
+ * When the coroutine is entered for the first time, opaque is passed in as an
+ * argument.
+ *
+ * When this function returns, the coroutine is destroyed automatically and
+ * execution continues in the caller who last entered the coroutine.
+ */
+typedef CoroutineFn<void> CoroutineEntry(void *opaque);
+
+/**
+ * Create a new coroutine
+ *
+ * Use qemu_coroutine_enter() to actually transfer control to the coroutine.
+ * The opaque argument is passed as the argument to the entry point.
+ */
+Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque);
+
+/**
+ * Adds the current coroutine to the CoQueue and transfers control to the
+ * caller of the coroutine.  The mutex is unlocked during the wait and
+ * locked again afterwards.
+ */
+#define qemu_co_queue_wait(queue, lock) \
+    qemu_co_queue_wait_impl(queue, QEMU_MAKE_CO_LOCKABLE(lock))
+CoroutineFn<void> qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock);
+
+/**
+ * Locks the mutex. If the lock cannot be taken immediately, control is
+ * transferred to the caller of the current coroutine.
+ */
+CoroutineFn<void> qemu_co_mutex_lock(CoMutex *mutex);
+
+/**
+ * Unlocks the mutex and schedules the next coroutine that was waiting for this
+ * lock to be run.
+ */
+CoroutineFn<void> qemu_co_mutex_unlock(CoMutex *mutex);
+
+/**
+ * Read locks the CoRwlock. If the lock cannot be taken immediately because
+ * of a parallel writer, control is transferred to the caller of the current
+ * coroutine.
+ */
+CoroutineFn<void> qemu_co_rwlock_rdlock(CoRwlock *lock);
+
+/**
+ * Write Locks the CoRwlock from a reader.  This is a bit more efficient than
+ * @qemu_co_rwlock_unlock followed by a separate @qemu_co_rwlock_wrlock.
+ * Note that if the lock cannot be upgraded immediately, control is transferred
+ * to the caller of the current coroutine; another writer might run while
+ * @qemu_co_rwlock_upgrade blocks.
+ */
+CoroutineFn<void> qemu_co_rwlock_upgrade(CoRwlock *lock);
+
+/**
+ * Downgrades a write-side critic section to a reader.  Downgrading with
+ * @qemu_co_rwlock_downgrade never blocks, unlike @qemu_co_rwlock_unlock
+ * followed by @qemu_co_rwlock_rdlock.  This makes it more efficient, but
+ * may also sometimes be necessary for correctness.
+ */
+CoroutineFn<void> qemu_co_rwlock_downgrade(CoRwlock *lock);
+
+/**
+ * Write Locks the mutex. If the lock cannot be taken immediately because
+ * of a parallel reader, control is transferred to the caller of the current
+ * coroutine.
+ */
+CoroutineFn<void> qemu_co_rwlock_wrlock(CoRwlock *lock);
+
+/**
+ * Unlocks the read/write lock and schedules the next coroutine that was
+ * waiting for this lock to be run.
+ */
+CoroutineFn<void> qemu_co_rwlock_unlock(CoRwlock *lock);
+
+/**
+ * Yield the coroutine for a given duration. Initializes @w so that,
+ * during this yield, it can be passed to qemu_co_sleep_wake() to
+ * terminate the sleep.
+ */
+CoroutineFn<void> qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+                                            QEMUClockType type, int64_t ns);
+
+/**
+ * Yield the coroutine until the next call to qemu_co_sleep_wake.
+ */
+CoroutineFn<void> qemu_co_sleep(QemuCoSleep *w);
+
+static inline CoroutineFn<void> qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
+{
+    QemuCoSleep w = { 0 };
+    co_await qemu_co_sleep_ns_wakeable(&w, type, ns);
+}
+
+/**
+ * Yield until a file descriptor becomes readable
+ *
+ * Note that this function clobbers the handlers for the file descriptor.
+ */
+CoroutineFn<void> yield_until_fd_readable(int fd);
+
+
 #include "qemu/co-lockable.h"
+#endif
 
 #endif /* QEMU_COROUTINE_H */
diff --git a/include/qemu/coroutine_int.h b/include/qemu/coroutine_int.h
index 1da148552f..67d6586997 100644
--- a/include/qemu/coroutine_int.h
+++ b/include/qemu/coroutine_int.h
@@ -28,6 +28,8 @@
 #include "qemu/queue.h"
 #include "qemu/coroutine.h"
 
+G_BEGIN_DECLS
+
 #ifdef CONFIG_SAFESTACK
 /* Pointer to the unsafe stack, defined by the compiler */
 extern __thread void *__safestack_unsafe_stack_ptr;
@@ -41,6 +43,10 @@ typedef enum {
     COROUTINE_ENTER = 3,
 } CoroutineAction;
 
+#ifndef __cplusplus
+typedef struct IncompleteType *CoroutineEntry;
+#endif
+
 struct Coroutine {
     CoroutineEntry *entry;
     void *entry_arg;
@@ -74,4 +80,6 @@ void qemu_coroutine_delete(Coroutine *co);
 CoroutineAction qemu_coroutine_switch(Coroutine *from, Coroutine *to,
                                       CoroutineAction action);
 
+G_END_DECLS
+
 #endif
diff --git a/util/coroutine-stackless.cc b/util/coroutine-stackless.cc
new file mode 100644
index 0000000000..ce2f284663
--- /dev/null
+++ b/util/coroutine-stackless.cc
@@ -0,0 +1,145 @@
+/*
+ * stackless coroutine initialization code
+ *
+ * Copyright (C) 2022 Paolo BOnzini <pbonzini@redhat.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser Gener Public
+ * License as published by the Free Software Foundation; either
+ * version 2.0 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser Gener Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser Gener Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "qemu/coroutine_int.h"
+
+// CoroutineImpl is the entry point into a coroutine.  It stores the
+// coroutine_handle that last called qemu_coroutine_yield(), and
+// Coroutine::resume() then resumes from the last yield point.
+//
+// Together with a thread-loc variable "current", the "caller"
+// member establishes a stack of active coroutines, so that
+// qemu_coroutine_yield() knows which coroutine has yielded.
+//
+// Its promise type, EntryPromise, is pretty much bog-standard.
+// It always suspends on entry, so that the coroutine is only
+// entered by the first call to qemu_coroutine_enter(); and it
+// always suspends on exit too, because we want to clean up the
+// coroutine explicitly in BaseCoroutine's destructor.
+
+struct EntryPromise;
+struct CoroutineImpl: BaseCoroutine<EntryPromise> {
+    std::coroutine_handle<> top;
+    explicit CoroutineImpl(promise_type &promise) :
+        BaseCoroutine{promise}, top{*this} {}
+
+    CoroutineAction resume();
+};
+
+struct EntryPromise
+{
+    CoroutineImpl get_return_object() noexcept          { return CoroutineImpl{*this}; }
+    void unhandled_exception()                          { std::terminate(); }
+    auto initial_suspend() const noexcept               { return std::suspend_always{}; }
+    auto final_suspend() const noexcept                 { return std::suspend_always{}; }
+    void return_void() const noexcept                   {}
+};
+
+typedef struct {
+    Coroutine base;
+    CoroutineImpl *impl;
+} CoroutineStackless;
+
+static __thread CoroutineStackless leader;
+static __thread Coroutine *current;
+
+// ---------------------------
+
+// Change the type from CoroutineFn<void> to Coroutine,
+// so that it does not start until qemu_coroutine_enter()
+CoroutineImpl coroutine_trampoline(Coroutine *co)
+{
+    co_await co->entry(co->entry_arg);
+}
+
+CoroutineAction CoroutineImpl::resume() {
+    std::coroutine_handle<> old_top = top;
+    top = nullptr;
+    old_top.resume();
+    return top ? COROUTINE_YIELD : COROUTINE_TERMINATE;
+}
+
+void Yield::await_suspend(std::coroutine_handle<> parent) const noexcept {
+    CoroutineStackless *curr = DO_UPCAST(CoroutineStackless, base, current);
+    curr->impl->top = parent;
+}
+
+// ---------------------------
+
+Coroutine *qemu_coroutine_new(void)
+{
+    CoroutineStackless *co;
+
+    co = g_new0(CoroutineStackless, 1);
+    return &co->base;
+}
+
+void qemu_coroutine_delete(Coroutine *co_)
+{
+    CoroutineStackless *co = DO_UPCAST(CoroutineStackless, base, co_);
+
+    g_free(co);
+}
+
+// RAII wrapper to set and restore the current coroutine
+struct WithCurrent {
+    Coroutine &_co;
+    WithCurrent(Coroutine &co): _co(co) {
+        current = &_co;
+    }
+    ~WithCurrent() {
+        current = _co.caller;
+        _co.caller = NULL;
+    }
+};
+
+CoroutineAction
+qemu_coroutine_switch(Coroutine *from, Coroutine *to_,
+                      CoroutineAction action)
+{
+    CoroutineStackless *to = DO_UPCAST(CoroutineStackless, base, to_);
+
+    assert(action == COROUTINE_ENTER);
+    assert(to->base.caller);
+    auto w = WithCurrent{*to_};
+    if (!to->impl) {
+        to->impl = new CoroutineImpl(coroutine_trampoline(to_));
+    }
+    if (to->impl->resume() == COROUTINE_YIELD) {
+        return COROUTINE_YIELD;
+    }
+    delete to->impl;
+    to->impl = NULL;
+    return COROUTINE_TERMINATE;
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
diff --git a/util/meson.build b/util/meson.build
index 30949cd481..11ec6534b9 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -68,7 +68,7 @@ if have_block
   util_ss.add(files('base64.c'))
   util_ss.add(files('buffer.c'))
   util_ss.add(files('bufferiszero.c'))
-  util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
+  util_ss.add(files('coroutine-stackless.cc'))
   util_ss.add(files('hbitmap.c'))
   util_ss.add(files('hexdump.c'))
   util_ss.add(files('iova-tree.c'))
@@ -76,12 +76,12 @@ if have_block
   util_ss.add(files('lockcnt.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('nvdimm-utils.c'))
-  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c')) # 'qemu-coroutine-io.c'
+  util_ss.add(files('qemu-coroutine.cc', 'qemu-coroutine-lock.cc')) # 'qemu-coroutine-io.c'
 # util_ss.add(when: 'CONFIG_LINUX', if_true: [
 #   files('vhost-user-server.c'), vhost_user
 # ])
   util_ss.add(files('block-helpers.c'))
-  util_ss.add(files('qemu-coroutine-sleep.c'))
+  util_ss.add(files('qemu-coroutine-sleep.cc'))
 # util_ss.add(files('qemu-co-shared-resource.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.cc
similarity index 87%
rename from util/qemu-coroutine-lock.c
rename to util/qemu-coroutine-lock.cc
index d6c0565ba5..86c51604b6 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.cc
@@ -120,6 +120,7 @@ bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
 }
+#endif
 
 /* The wait records are handled with a multiple-producer, single-consumer
  * lock-free queue.  There cannot be two concurrent pop_waiter() calls
@@ -187,7 +188,7 @@ void qemu_co_mutex_init(CoMutex *mutex)
     memset(mutex, 0, sizeof(*mutex));
 }
 
-static void coroutine_fn qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
+static void qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
 {
     /* Read co before co->ctx; pairs with smp_wmb() in
      * qemu_coroutine_enter().
@@ -197,7 +198,7 @@ static void coroutine_fn qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
     aio_co_wake(co);
 }
 
-static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
+static CoroutineFn<void> qemu_co_mutex_lock_slowpath(AioContext *ctx,
                                                      CoMutex *mutex)
 {
     Coroutine *self = qemu_coroutine_self();
@@ -223,17 +224,17 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
             /* We got the lock ourselves!  */
             assert(to_wake == &w);
             mutex->ctx = ctx;
-            return;
+            co_return;
         }
 
         qemu_co_mutex_wake(mutex, co);
     }
 
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
     trace_qemu_co_mutex_lock_return(mutex, self);
 }
 
-void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex)
+CoroutineFn<void> qemu_co_mutex_lock(CoMutex *mutex)
 {
     AioContext *ctx = qemu_get_current_aio_context();
     Coroutine *self = qemu_coroutine_self();
@@ -267,13 +268,13 @@ retry_fast_path:
         trace_qemu_co_mutex_lock_uncontended(mutex, self);
         mutex->ctx = ctx;
     } else {
-        qemu_co_mutex_lock_slowpath(ctx, mutex);
+        co_await qemu_co_mutex_lock_slowpath(ctx, mutex);
     }
     mutex->holder = self;
     self->locks_held++;
 }
 
-void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
+CoroutineFn<void> qemu_co_mutex_unlock(CoMutex *mutex)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -288,7 +289,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
     self->locks_held--;
     if (qatomic_fetch_dec(&mutex->locked) == 1) {
         /* No waiting qemu_co_mutex_lock().  Pfew, that was easy!  */
-        return;
+        co_return;
     }
 
     for (;;) {
@@ -342,7 +343,7 @@ void qemu_co_rwlock_init(CoRwlock *lock)
 }
 
 /* Releases the intern CoMutex.  */
-static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
+static CoroutineFn<void> qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 {
     CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
     Coroutine *co = NULL;
@@ -368,46 +369,46 @@ static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 
     if (co) {
         QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
-        qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_co_mutex_unlock(&lock->mutex);
         aio_co_wake(co);
     } else {
-        qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_co_mutex_unlock(&lock->mutex);
     }
 }
 
-void qemu_co_rwlock_rdlock(CoRwlock *lock)
+CoroutineFn<void> qemu_co_rwlock_rdlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
-    qemu_co_mutex_lock(&lock->mutex);
+    co_await qemu_co_mutex_lock(&lock->mutex);
     /* For fairness, wait if a writer is in line.  */
     if (lock->owners == 0 || (lock->owners > 0 && QSIMPLEQ_EMPTY(&lock->tickets))) {
         lock->owners++;
-        qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_co_mutex_unlock(&lock->mutex);
     } else {
         CoRwTicket my_ticket = { true, self };
 
         QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
-        qemu_co_mutex_unlock(&lock->mutex);
-        qemu_coroutine_yield();
+        co_await qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_coroutine_yield();
         assert(lock->owners >= 1);
 
         /* Possibly wake another reader, which will wake the next in line.  */
-        qemu_co_mutex_lock(&lock->mutex);
-        qemu_co_rwlock_maybe_wake_one(lock);
+        co_await qemu_co_mutex_lock(&lock->mutex);
+        co_await qemu_co_rwlock_maybe_wake_one(lock);
     }
 
     self->locks_held++;
 }
 
-void qemu_co_rwlock_unlock(CoRwlock *lock)
+CoroutineFn<void> qemu_co_rwlock_unlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
     assert(qemu_in_coroutine());
     self->locks_held--;
 
-    qemu_co_mutex_lock(&lock->mutex);
+    co_await qemu_co_mutex_lock(&lock->mutex);
     if (lock->owners > 0) {
         lock->owners--;
     } else {
@@ -415,55 +416,54 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
         lock->owners = 0;
     }
 
-    qemu_co_rwlock_maybe_wake_one(lock);
+    co_await qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_downgrade(CoRwlock *lock)
+CoroutineFn<void> qemu_co_rwlock_downgrade(CoRwlock *lock)
 {
-    qemu_co_mutex_lock(&lock->mutex);
+    co_await qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners == -1);
     lock->owners = 1;
 
     /* Possibly wake another reader, which will wake the next in line.  */
-    qemu_co_rwlock_maybe_wake_one(lock);
+    co_await qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_wrlock(CoRwlock *lock)
+CoroutineFn<void> qemu_co_rwlock_wrlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
-    qemu_co_mutex_lock(&lock->mutex);
+    co_await qemu_co_mutex_lock(&lock->mutex);
     if (lock->owners == 0) {
         lock->owners = -1;
-        qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_co_mutex_unlock(&lock->mutex);
     } else {
         CoRwTicket my_ticket = { false, self };
 
         QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
-        qemu_co_mutex_unlock(&lock->mutex);
-        qemu_coroutine_yield();
+        co_await qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_coroutine_yield();
         assert(lock->owners == -1);
     }
 
     self->locks_held++;
 }
 
-void qemu_co_rwlock_upgrade(CoRwlock *lock)
+CoroutineFn<void> qemu_co_rwlock_upgrade(CoRwlock *lock)
 {
-    qemu_co_mutex_lock(&lock->mutex);
+    co_await qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners > 0);
     /* For fairness, wait if a writer is in line.  */
     if (lock->owners == 1 && QSIMPLEQ_EMPTY(&lock->tickets)) {
         lock->owners = -1;
-        qemu_co_mutex_unlock(&lock->mutex);
+        co_await qemu_co_mutex_unlock(&lock->mutex);
     } else {
         CoRwTicket my_ticket = { false, qemu_coroutine_self() };
 
         lock->owners--;
         QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
-        qemu_co_rwlock_maybe_wake_one(lock);
-        qemu_coroutine_yield();
+        co_await qemu_co_rwlock_maybe_wake_one(lock);
+        co_await qemu_coroutine_yield();
         assert(lock->owners == -1);
     }
 }
-#endif
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.cc
similarity index 89%
rename from util/qemu-coroutine-sleep.c
rename to util/qemu-coroutine-sleep.cc
index b5bfb4ad18..8bb8d91109 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.cc
@@ -17,7 +17,6 @@
 #include "qemu/timer.h"
 #include "block/aio.h"
 
-#if 0
 static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 void qemu_co_sleep_wake(QemuCoSleep *w)
@@ -38,11 +37,11 @@ void qemu_co_sleep_wake(QemuCoSleep *w)
 
 static void co_sleep_cb(void *opaque)
 {
-    QemuCoSleep *w = opaque;
+    QemuCoSleep *w = (QemuCoSleep *)opaque;
     qemu_co_sleep_wake(w);
 }
 
-void coroutine_fn qemu_co_sleep(QemuCoSleep *w)
+CoroutineFn<void> qemu_co_sleep(QemuCoSleep *w)
 {
     Coroutine *co = qemu_coroutine_self();
 
@@ -56,13 +55,13 @@ void coroutine_fn qemu_co_sleep(QemuCoSleep *w)
     }
 
     w->to_wake = co;
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
 
     /* w->to_wake is cleared before resuming this coroutine.  */
     assert(w->to_wake == NULL);
 }
 
-void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+CoroutineFn<void> qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
                                             QEMUClockType type, int64_t ns)
 {
     AioContext *ctx = qemu_get_current_aio_context();
@@ -76,7 +75,6 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
      * must happen after qemu_co_sleep yields and there is no race
      * between timer_mod and qemu_co_sleep.
      */
-    qemu_co_sleep(w);
+    co_await qemu_co_sleep(w);
     timer_del(&ts);
 }
-#endif
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.cc
similarity index 94%
rename from util/qemu-coroutine.c
rename to util/qemu-coroutine.cc
index 9f2bd96fa0..0ae2a4090f 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.cc
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



