Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B071E7E97
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:26:10 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jef1V-00071g-3x
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jeeyz-00042y-IN
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:23:33 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jeeyx-0003TD-Sb
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:23:33 -0400
Received: by mail-pl1-x634.google.com with SMTP id y11so1149886plt.12
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=iW7IdIzsC9AFT7A/HgICb/ikiPzXalvsYjSvDjiUN+g=;
 b=VF7LL2Fu+vrqD6kGEFNiPgyrztTNHkQ+jCM9MrIJ+qhpaVUZJMQjXS0r/UqSqF3Mpi
 wufwEz/8zoO/QP22/Y8qMI0+l3HDlVwaq5BornSob7kOsgXc5pIFZUn5AKhswCUhAXLh
 Wvrs0gHIH1ZwVlBiGvnxaldhZn+h1K6nFRikGLXwVtcBJ8b6l662tjBQ9PDUOMHzItc7
 KUzTJoMb2wLagDyxwFm2Tv6RD+matAUG52/Sl3ABTTM4SKRIHiTHUmAdmqbAWAy0wl/U
 34roJzTwmGGSTgTu/SLHbUPps4JHQY05fo5gCm6zIkpXB3JYwO1vNGkVTx6kiYfGt2mn
 9xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iW7IdIzsC9AFT7A/HgICb/ikiPzXalvsYjSvDjiUN+g=;
 b=ue2YQkWvz6ynqtgOgJkjNi61wOM9AbnKBlyh/d7n4npGEY52VzSt+PR35tpedND89O
 DbVqCzFr4VK+GCeB4jzvyhY2Sley79RoAyvDEjK7ui9gqFf+m5b3r6snnXKPvHiBckfa
 0bBxyjtgnOGwz7N+hR6eIrd/+76pmcdVi5nNkjQyN6Xd+7m6QUCuQmoAAvlxffYw3TWA
 uXupmtm0ZG8uKioXuxS7f06niRpGRw70C3khMJcnp//q9+E+bOHj6pEm2h1NBrFzdyK1
 VC630aV3LPrjRdjEtRyxUNn75kXtp+L8/x5DZKT5RklYUOLu/HM/mJE6/Do4JJQQzswH
 e5Lg==
X-Gm-Message-State: AOAM531aB/H62yDyURHyAVwnYtObKrl8LnXlz2FwMIaUYmwEcRtdnF4G
 a4G7OnscQctA+pnB3T5Ea2lPGdnEMCsWHg==
X-Google-Smtp-Source: ABdhPJwo4xE3TvP97jbm78UJCvE8EMuxYTCPmgFic1Ddy1nkaIL5wiocuryyc+87pyUREK+kpjoEMw==
X-Received: by 2002:a17:90b:4d10:: with SMTP id
 mw16mr9331139pjb.143.1590758609648; 
 Fri, 29 May 2020 06:23:29 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:75ac:d268:da04:dde4])
 by smtp.gmail.com with ESMTPSA id e13sm1998686pfd.10.2020.05.29.06.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 06:23:28 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/12] configure: add --enable-tsan flag + fiber
 annotations for coroutine-ucontext
Date: Fri, 29 May 2020 09:23:31 -0400
Message-Id: <20200529132341.755-1-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=robert.foley@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, robert.foley@linaro.org, cota@braap.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Lingfeng Yang <lfy@google.com>,
 peter.puhov@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lingfeng Yang <lfy@google.com>

We tried running QEMU under tsan in 2016, but tsan's lack of support for
longjmp-based fibers was a blocker:
  https://groups.google.com/forum/#!topic/thread-sanitizer/se0YuzfWazw

Fortunately, thread sanitizer gained fiber support in early 2019:
  https://reviews.llvm.org/D54889

This patch brings tsan support upstream by importing the patch that annotated
QEMU's coroutines as tsan fibers in Android's QEMU fork:
  https://android-review.googlesource.com/c/platform/external/qemu/+/844675

Tested with '--enable-tsan --cc=clang-9 --cxx=clang++-9 --disable-werror'
configure flags.

Signed-off-by: Lingfeng Yang <lfy@google.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
[cota: minor modifications + configure changes]
Signed-off-by: Robert Foley <robert.foley@linaro.org>
[RF: Error out in configure if tsan not available, fix checkpatch warnings]
---
 configure                 | 41 +++++++++++++++++
 util/coroutine-ucontext.c | 97 +++++++++++++++++++++++++++++++++++----
 2 files changed, 129 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index b969dee675..c18efae65e 100755
--- a/configure
+++ b/configure
@@ -395,6 +395,7 @@ gprof="no"
 debug_tcg="no"
 debug="no"
 sanitizers="no"
+tsan="no"
 fortify_source=""
 strip_opt="yes"
 tcg_interpreter="no"
@@ -1150,6 +1151,10 @@ for opt do
   ;;
   --disable-sanitizers) sanitizers="no"
   ;;
+  --enable-tsan) tsan="yes"
+  ;;
+  --disable-tsan) tsan="no"
+  ;;
   --enable-sparse) sparse="yes"
   ;;
   --disable-sparse) sparse="no"
@@ -1750,6 +1755,7 @@ Advanced options (experts only):
   --with-pkgversion=VERS   use specified string as sub-version of the package
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
+  --enable-tsan            enable thread sanitizer
   --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
@@ -6192,6 +6198,27 @@ if test "$fuzzing" = "yes" ; then
   fi
 fi
 
+# Thread sanitizer is, for now, much noisier than the other sanitizers;
+# keep it separate until that is not the case.
+have_tsan=no
+have_tsan_iface_fiber=no
+if test "$tsan" = "yes" ; then
+  write_c_skeleton
+  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=thread" "" ; then
+      have_tsan=yes
+  fi
+  cat > $TMPC << EOF
+#include <sanitizer/tsan_interface.h>
+int main(void) {
+  __tsan_create_fiber(0);
+  return 0;
+}
+EOF
+  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=thread" "" ; then
+      have_tsan_iface_fiber=yes
+  fi
+fi
+
 ##########################################
 # check for libpmem
 
@@ -6293,6 +6320,16 @@ if test "$have_asan" = "yes"; then
            "Without code annotation, the report may be inferior."
   fi
 fi
+if test "$have_tsan" = "yes" ; then
+  if test "$have_tsan_iface_fiber" = "yes" ; then
+    QEMU_CFLAGS="-fsanitize=thread $QEMU_CFLAGS"
+    QEMU_LDFLAGS="-fsanitize=thread $QEMU_LDFLAGS"
+  else
+    error_exit "Cannot enable TSAN due to missing fiber annotation interface."
+  fi
+elif test "$tsan" = "yes" ; then
+  error_exit "Cannot enable TSAN due to missing sanitize thread interface."
+fi
 if test "$have_ubsan" = "yes"; then
   QEMU_CFLAGS="-fsanitize=undefined $QEMU_CFLAGS"
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
@@ -7382,6 +7419,10 @@ if test "$have_asan_iface_fiber" = "yes" ; then
     echo "CONFIG_ASAN_IFACE_FIBER=y" >> $config_host_mak
 fi
 
+if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
+    echo "CONFIG_TSAN=y" >> $config_host_mak
+fi
+
 if test "$has_environ" = "yes" ; then
   echo "CONFIG_HAS_ENVIRON=y" >> $config_host_mak
 fi
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index bd593e61bc..a3dc78e67a 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -37,18 +37,33 @@
 #endif
 #endif
 
+#ifdef CONFIG_TSAN
+#include <sanitizer/tsan_interface.h>
+#endif
+
 typedef struct {
     Coroutine base;
     void *stack;
     size_t stack_size;
     sigjmp_buf env;
 
+    void *tsan_co_fiber;
+    void *tsan_caller_fiber;
+
 #ifdef CONFIG_VALGRIND_H
     unsigned int valgrind_stack_id;
 #endif
 
 } CoroutineUContext;
 
+#define UC_DEBUG 0
+#if UC_DEBUG && defined(CONFIG_TSAN)
+#define UC_TRACE(fmt, ...) fprintf(stderr, "%s:%d:%p " fmt "\n", \
+    __func__, __LINE__, __tsan_get_current_fiber(), ##__VA_ARGS__);
+#else
+#define UC_TRACE(fmt, ...)
+#endif
+
 /**
  * Per-thread coroutine bookkeeping
  */
@@ -65,7 +80,20 @@ union cc_arg {
     int i[2];
 };
 
-static void finish_switch_fiber(void *fake_stack_save)
+/* QEMU_ALWAYS_INLINE only does so if __OPTIMIZE__, so we cannot use it. */
+static inline __attribute__((always_inline))
+void on_new_fiber(CoroutineUContext *co)
+{
+#ifdef CONFIG_TSAN
+    co->tsan_co_fiber = __tsan_create_fiber(0); /* flags: sync on switch */
+    co->tsan_caller_fiber = __tsan_get_current_fiber();
+    UC_TRACE("Create new TSAN co fiber. co: %p co fiber: %p caller fiber: %p ",
+             co, co->tsan_co_fiber, co->tsan_caller_fiber);
+#endif
+}
+
+static inline __attribute__((always_inline))
+void finish_switch_fiber(void *fake_stack_save)
 {
 #ifdef CONFIG_ASAN
     const void *bottom_old;
@@ -78,18 +106,40 @@ static void finish_switch_fiber(void *fake_stack_save)
         leader.stack_size = size_old;
     }
 #endif
+#ifdef CONFIG_TSAN
+    if (fake_stack_save) {
+        __tsan_release(fake_stack_save);
+        __tsan_switch_to_fiber(fake_stack_save, 0);  /* 0=synchronize */
+    }
+#endif
 }
 
-static void start_switch_fiber(void **fake_stack_save,
-                               const void *bottom, size_t size)
+static inline __attribute__((always_inline)) void start_switch_fiber(
+    CoroutineAction action, void **fake_stack_save,
+    const void *bottom, size_t size, void *new_fiber)
 {
 #ifdef CONFIG_ASAN
-    __sanitizer_start_switch_fiber(fake_stack_save, bottom, size);
+    if (action == COROUTINE_TERMINATE) {
+        __sanitizer_start_switch_fiber(
+            action == COROUTINE_TERMINATE ? NULL : fake_stack_save,
+            bottom, size);
+    }
+#endif
+#ifdef CONFIG_TSAN
+    void *curr_fiber =
+        __tsan_get_current_fiber();
+    __tsan_acquire(curr_fiber);
+
+    UC_TRACE("Current fiber: %p.", curr_fiber);
+    *fake_stack_save = curr_fiber;
+    UC_TRACE("Switch to fiber %p", new_fiber);
+    __tsan_switch_to_fiber(new_fiber, 0);  /* 0=synchronize */
 #endif
 }
 
 static void coroutine_trampoline(int i0, int i1)
 {
+    UC_TRACE("Start trampoline");
     union cc_arg arg;
     CoroutineUContext *self;
     Coroutine *co;
@@ -104,21 +154,34 @@ static void coroutine_trampoline(int i0, int i1)
 
     /* Initialize longjmp environment and switch back the caller */
     if (!sigsetjmp(self->env, 0)) {
-        start_switch_fiber(&fake_stack_save,
-                           leader.stack, leader.stack_size);
+        UC_TRACE("Current fiber: %p. Set co %p to env 0x%lx",
+                 __tsan_get_current_fiber(), self, (unsigned long)self->env);
+        start_switch_fiber(
+            COROUTINE_YIELD,
+            &fake_stack_save,
+            leader.stack,
+            leader.stack_size,
+            self->tsan_caller_fiber);
+        UC_TRACE("Jump to co %p caller fiber %p env 0x%lx",
+                 co, self->tsan_caller_fiber, *(unsigned long *)co->entry_arg);
         siglongjmp(*(sigjmp_buf *)co->entry_arg, 1);
     }
 
+    UC_TRACE("After first siglongjmp");
+
     finish_switch_fiber(fake_stack_save);
 
     while (true) {
         co->entry(co->entry_arg);
+        UC_TRACE("switch from co %p to caller co %p fiber %p\n",
+                 co, co->caller, self->tsan_caller_fiber);
         qemu_coroutine_switch(co, co->caller, COROUTINE_TERMINATE);
     }
 }
 
 Coroutine *qemu_coroutine_new(void)
 {
+    UC_TRACE("Start new coroutine");
     CoroutineUContext *co;
     ucontext_t old_uc, uc;
     sigjmp_buf old_env;
@@ -154,12 +217,16 @@ Coroutine *qemu_coroutine_new(void)
 
     arg.p = co;
 
+    on_new_fiber(co);
     makecontext(&uc, (void (*)(void))coroutine_trampoline,
                 2, arg.i[0], arg.i[1]);
 
     /* swapcontext() in, siglongjmp() back out */
     if (!sigsetjmp(old_env, 0)) {
-        start_switch_fiber(&fake_stack_save, co->stack, co->stack_size);
+        start_switch_fiber(
+            COROUTINE_YIELD,
+            &fake_stack_save,
+            co->stack, co->stack_size, co->tsan_co_fiber);
         swapcontext(&old_uc, &uc);
     }
 
@@ -185,6 +252,7 @@ static inline void valgrind_stack_deregister(CoroutineUContext *co)
 
 void qemu_coroutine_delete(Coroutine *co_)
 {
+    UC_TRACE("Nuking co %p from orbit", co_);
     CoroutineUContext *co = DO_UPCAST(CoroutineUContext, base, co_);
 
 #ifdef CONFIG_VALGRIND_H
@@ -209,6 +277,10 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
 {
     CoroutineUContext *from = DO_UPCAST(CoroutineUContext, base, from_);
     CoroutineUContext *to = DO_UPCAST(CoroutineUContext, base, to_);
+    UC_TRACE("from to: %p %p uc: %p %p. fibers: %p %p caller fibers: %p %p\n",
+            from_, to_, from, to,
+            from->tsan_co_fiber, to->tsan_co_fiber,
+            from->tsan_caller_fiber, to->tsan_caller_fiber);
     int ret;
     void *fake_stack_save = NULL;
 
@@ -216,8 +288,8 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
 
     ret = sigsetjmp(from->env, 0);
     if (ret == 0) {
-        start_switch_fiber(action == COROUTINE_TERMINATE ?
-                           NULL : &fake_stack_save, to->stack, to->stack_size);
+        start_switch_fiber(action, &fake_stack_save,
+                           to->stack, to->stack_size, to->tsan_co_fiber);
         siglongjmp(to->env, action);
     }
 
@@ -231,6 +303,13 @@ Coroutine *qemu_coroutine_self(void)
     if (!current) {
         current = &leader.base;
     }
+#ifdef CONFIG_TSAN
+    if (!leader.tsan_co_fiber) {
+        leader.tsan_co_fiber = __tsan_get_current_fiber();
+        UC_TRACE("For co %p set leader co fiber to %p",
+                 current, leader.tsan_co_fiber);
+    }
+#endif
     return current;
 }
 
-- 
2.17.1


