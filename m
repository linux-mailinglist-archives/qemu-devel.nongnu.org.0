Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F974D7EFA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:48:48 +0100 (CET)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThJn-0005xW-Sx
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:48:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3u-00088T-Bb; Mon, 14 Mar 2022 05:32:23 -0400
Received: from [2a00:1450:4864:20::336] (port=55178
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3s-00088t-7L; Mon, 14 Mar 2022 05:32:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id r64so1198941wmr.4;
 Mon, 14 Mar 2022 02:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H8NfUo8sx1eIDedHt7en4kF8wuAhW0z5/z8YFwGyH44=;
 b=L75qzcZFj+3sXqMC0ffqzKrh02Ph1eK9qH7XS4spkfh6a07D5FwEk6n2IjcBtKjEx7
 wzGPtI344aFBRSTqRIfcCH6eRv8cFW+rmOvHoSL8fo1YZYekrq2mIsRC0foZjBkZlWuU
 duQcwc39knwMYW5AjkTe0ML7YrPdjUSJFt9EtX1ddKvRzlO+aaLevNBk0qlOorQSr2/y
 3rvK2sMlpMUV558RzrBg8OrB+0dm0dGEEaqiYubCsukXJHDNGJU/yOYAcZ1e/NyL2k7k
 v1NcI5NUhTHG6AcWtNdU+wXb4jba89QaSSfBHsdWocrK3AhiJw4qlS07NpfuYxnHh4y2
 aT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H8NfUo8sx1eIDedHt7en4kF8wuAhW0z5/z8YFwGyH44=;
 b=OFDu206F8fb2yfVsLB03LYWy5QG/bcSTkk5K4Xv2zKFqz5PM1vugQddfba3SUradD+
 pznp6EfKAc8bXiRT1Z8f3iiOtclt/ppMg9Hl94woqIIYFn00jNSaaLnBAw6kdsa4bIGs
 I/XXCTcSiO8eJuu7S8J9534DO4HPreuiJsc17GG+VkUeV7+7ihNUS1sQZpv6eT02Bw7k
 qea/lIohIFM2f4ytDqc3YoGUwFQ/rs2JsJx/dwcbjEhSsf5yy38wNG7sCoopHsFy0ldT
 DEE8Y8c5NGuorfVJE5wVkRVvTpuRsc86nQP8iIPuzGA0FR2Om9RUh+k/jRmjIMhSj2n3
 B+CA==
X-Gm-Message-State: AOAM533ZnsUEC/HkSHzEu+OHn05A1KPhVU+xsG0dyaUfUVoH/BHb+Uqp
 rhj0EgUASufjpn7pHBr3nC3PisOarJ8=
X-Google-Smtp-Source: ABdhPJwazsjNiQL0mcBehDO/7EyhLJEDH7tuePmLghhZCUNaH29V8N4xkaggzTADWFAeG1AjtSIAWg==
X-Received: by 2002:a7b:c950:0:b0:389:5328:aaa8 with SMTP id
 i16-20020a7bc950000000b003895328aaa8mr24559316wml.181.1647250338531; 
 Mon, 14 Mar 2022 02:32:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 16/16] port test-coroutine to C++ coroutines
Date: Mon, 14 Mar 2022 10:32:03 +0100
Message-Id: <20220314093203.1420404-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
 tests/unit/meson.build                        |   6 +-
 .../{test-coroutine.c => test-coroutine.cc}   | 140 +++++++++---------
 2 files changed, 76 insertions(+), 70 deletions(-)
 rename tests/unit/{test-coroutine.c => test-coroutine.cc} (81%)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4ca5fdb699..675b5323dd 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -168,7 +168,11 @@ slow_tests = {
 }
 
 foreach test_name, extra: tests
-  src = [test_name + '.c']
+  if test_name == 'test-coroutine'
+    src = [test_name + '.cc']
+  else
+    src = [test_name + '.c']
+  endif
   deps = [qemuutil]
   if extra.length() > 0
     # use a sourceset to quickly separate sources and deps
diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.cc
similarity index 81%
rename from tests/unit/test-coroutine.c
rename to tests/unit/test-coroutine.cc
index c230c2fa6e..8f9ddc50da 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.cc
@@ -16,14 +16,14 @@
 #include "qemu/coroutine_int.h"
 #include "qemu/lockable.h"
 
-#if 0
 /*
  * Check that qemu_in_coroutine() works
  */
 
-static void coroutine_fn verify_in_coroutine(void *opaque)
+static CoroutineFn<void> verify_in_coroutine(void *opaque)
 {
     g_assert(qemu_in_coroutine());
+    co_return;
 }
 
 static void test_in_coroutine(void)
@@ -40,10 +40,11 @@ static void test_in_coroutine(void)
  * Check that qemu_coroutine_self() works
  */
 
-static void coroutine_fn verify_self(void *opaque)
+static CoroutineFn<void> verify_self(void *opaque)
 {
-    Coroutine **p_co = opaque;
+    Coroutine **p_co = (Coroutine **)opaque;
     g_assert(qemu_coroutine_self() == *p_co);
+    co_return;
 }
 
 static void test_self(void)
@@ -58,20 +59,20 @@ static void test_self(void)
  * Check that qemu_coroutine_entered() works
  */
 
-static void coroutine_fn verify_entered_step_2(void *opaque)
+static CoroutineFn<void> verify_entered_step_2(void *opaque)
 {
     Coroutine *caller = (Coroutine *)opaque;
 
     g_assert(qemu_coroutine_entered(caller));
     g_assert(qemu_coroutine_entered(qemu_coroutine_self()));
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
 
     /* Once more to check it still works after yielding */
     g_assert(qemu_coroutine_entered(caller));
     g_assert(qemu_coroutine_entered(qemu_coroutine_self()));
 }
 
-static void coroutine_fn verify_entered_step_1(void *opaque)
+static CoroutineFn<void> verify_entered_step_1(void *opaque)
 {
     Coroutine *self = qemu_coroutine_self();
     Coroutine *coroutine;
@@ -83,6 +84,7 @@ static void coroutine_fn verify_entered_step_1(void *opaque)
     qemu_coroutine_enter(coroutine);
     g_assert(!qemu_coroutine_entered(coroutine));
     qemu_coroutine_enter(coroutine);
+    co_return;
 }
 
 static void test_entered(void)
@@ -104,9 +106,9 @@ typedef struct {
     unsigned int max;       /* maximum level of nesting */
 } NestData;
 
-static void coroutine_fn nest(void *opaque)
+static CoroutineFn<void> nest(void *opaque)
 {
-    NestData *nd = opaque;
+    NestData *nd = (NestData *)opaque;
 
     nd->n_enter++;
 
@@ -118,6 +120,7 @@ static void coroutine_fn nest(void *opaque)
     }
 
     nd->n_return++;
+    co_return;
 }
 
 static void test_nesting(void)
@@ -141,13 +144,13 @@ static void test_nesting(void)
  * Check that yield/enter transfer control correctly
  */
 
-static void coroutine_fn yield_5_times(void *opaque)
+static CoroutineFn<void> yield_5_times(void *opaque)
 {
-    bool *done = opaque;
+    bool *done = (bool *)opaque;
     int i;
 
     for (i = 0; i < 5; i++) {
-        qemu_coroutine_yield();
+        co_await qemu_coroutine_yield();
     }
     *done = true;
 }
@@ -166,15 +169,16 @@ static void test_yield(void)
     g_assert_cmpint(i, ==, 5); /* coroutine must yield 5 times */
 }
 
-static void coroutine_fn c2_fn(void *opaque)
+static CoroutineFn<void> c2_fn(void *opaque)
 {
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
 }
 
-static void coroutine_fn c1_fn(void *opaque)
+static CoroutineFn<void> c1_fn(void *opaque)
 {
-    Coroutine *c2 = opaque;
+    Coroutine *c2 = (Coroutine *)opaque;
     qemu_coroutine_enter(c2);
+    co_return;
 }
 
 static void test_no_dangling_access(void)
@@ -200,34 +204,35 @@ static void test_no_dangling_access(void)
 static bool locked;
 static int done;
 
-static void coroutine_fn mutex_fn(void *opaque)
+static CoroutineFn<void> mutex_fn(void *opaque)
 {
-    CoMutex *m = opaque;
-    qemu_co_mutex_lock(m);
+    CoMutex *m = (CoMutex *)opaque;
+    co_await qemu_co_mutex_lock(m);
     assert(!locked);
     locked = true;
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
     locked = false;
-    qemu_co_mutex_unlock(m);
+    co_await qemu_co_mutex_unlock(m);
     done++;
 }
 
-static void coroutine_fn lockable_fn(void *opaque)
+static CoroutineFn<void> lockable_fn(void *opaque)
 {
-    QemuCoLockable *x = opaque;
-    qemu_co_lockable_lock(x);
+    QemuCoLockable *x = (QemuCoLockable *)opaque;
+    co_await qemu_co_lockable_lock(x);
     assert(!locked);
     locked = true;
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
     locked = false;
-    qemu_co_lockable_unlock(x);
+    co_await qemu_co_lockable_unlock(x);
     done++;
 }
 
-static void do_test_co_mutex(CoroutineEntry *entry, void *opaque)
+template<typename T>
+static void do_test_co_mutex(CoroutineEntry *entry, const T *opaque)
 {
-    Coroutine *c1 = qemu_coroutine_create(entry, opaque);
-    Coroutine *c2 = qemu_coroutine_create(entry, opaque);
+    Coroutine *c1 = qemu_coroutine_create(entry, (void *)opaque);
+    Coroutine *c2 = qemu_coroutine_create(entry, (void *)opaque);
 
     done = 0;
     qemu_coroutine_enter(c1);
@@ -284,23 +289,23 @@ static CoRwlock rwlock;
  * | unlock       |            |
  */
 
-static void coroutine_fn rwlock_yield_upgrade(void *opaque)
+static CoroutineFn<void> rwlock_yield_upgrade(void *opaque)
 {
-    qemu_co_rwlock_rdlock(&rwlock);
-    qemu_coroutine_yield();
+    co_await qemu_co_rwlock_rdlock(&rwlock);
+    co_await qemu_coroutine_yield();
 
-    qemu_co_rwlock_upgrade(&rwlock);
-    qemu_co_rwlock_unlock(&rwlock);
+    co_await qemu_co_rwlock_upgrade(&rwlock);
+    co_await qemu_co_rwlock_unlock(&rwlock);
 
     *(bool *)opaque = true;
 }
 
-static void coroutine_fn rwlock_wrlock_yield(void *opaque)
+static CoroutineFn<void> rwlock_wrlock_yield(void *opaque)
 {
-    qemu_co_rwlock_wrlock(&rwlock);
-    qemu_coroutine_yield();
+    co_await qemu_co_rwlock_wrlock(&rwlock);
+    co_await qemu_coroutine_yield();
 
-    qemu_co_rwlock_unlock(&rwlock);
+    co_await qemu_co_rwlock_unlock(&rwlock);
     *(bool *)opaque = true;
 }
 
@@ -326,39 +331,39 @@ static void test_co_rwlock_upgrade(void)
     g_assert(c2_done);
 }
 
-static void coroutine_fn rwlock_rdlock_yield(void *opaque)
+static CoroutineFn<void> rwlock_rdlock_yield(void *opaque)
 {
-    qemu_co_rwlock_rdlock(&rwlock);
-    qemu_coroutine_yield();
+    co_await qemu_co_rwlock_rdlock(&rwlock);
+    co_await qemu_coroutine_yield();
 
-    qemu_co_rwlock_unlock(&rwlock);
-    qemu_coroutine_yield();
+    co_await qemu_co_rwlock_unlock(&rwlock);
+    co_await qemu_coroutine_yield();
 
     *(bool *)opaque = true;
 }
 
-static void coroutine_fn rwlock_wrlock_downgrade(void *opaque)
+static CoroutineFn<void> rwlock_wrlock_downgrade(void *opaque)
 {
-    qemu_co_rwlock_wrlock(&rwlock);
+    co_await qemu_co_rwlock_wrlock(&rwlock);
 
-    qemu_co_rwlock_downgrade(&rwlock);
-    qemu_co_rwlock_unlock(&rwlock);
+    co_await qemu_co_rwlock_downgrade(&rwlock);
+    co_await qemu_co_rwlock_unlock(&rwlock);
     *(bool *)opaque = true;
 }
 
-static void coroutine_fn rwlock_rdlock(void *opaque)
+static CoroutineFn<void> rwlock_rdlock(void *opaque)
 {
-    qemu_co_rwlock_rdlock(&rwlock);
+    co_await qemu_co_rwlock_rdlock(&rwlock);
 
-    qemu_co_rwlock_unlock(&rwlock);
+    co_await qemu_co_rwlock_unlock(&rwlock);
     *(bool *)opaque = true;
 }
 
-static void coroutine_fn rwlock_wrlock(void *opaque)
+static CoroutineFn<void> rwlock_wrlock(void *opaque)
 {
-    qemu_co_rwlock_wrlock(&rwlock);
+    co_await qemu_co_rwlock_wrlock(&rwlock);
 
-    qemu_co_rwlock_unlock(&rwlock);
+    co_await qemu_co_rwlock_unlock(&rwlock);
     *(bool *)opaque = true;
 }
 
@@ -428,11 +433,12 @@ static void test_co_rwlock_downgrade(void)
  * Check that creation, enter, and return work
  */
 
-static void coroutine_fn set_and_exit(void *opaque)
+static CoroutineFn<void> set_and_exit(void *opaque)
 {
-    bool *done = opaque;
+    bool *done = (bool *)opaque;
 
     *done = true;
+    co_return;
 }
 
 static void test_lifecycle(void)
@@ -459,7 +465,7 @@ struct coroutine_position {
     int state;
 };
 static struct coroutine_position records[RECORD_SIZE];
-static unsigned record_pos;
+static int record_pos;
 
 static void record_push(int func, int state)
 {
@@ -469,11 +475,11 @@ static void record_push(int func, int state)
     cp->state = state;
 }
 
-static void coroutine_fn co_order_test(void *opaque)
+static CoroutineFn<void> co_order_test(void *opaque)
 {
     record_push(2, 1);
     g_assert(qemu_in_coroutine());
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
     record_push(2, 2);
     g_assert(qemu_in_coroutine());
 }
@@ -509,9 +515,10 @@ static void test_order(void)
  * Lifecycle benchmark
  */
 
-static void coroutine_fn empty_coroutine(void *opaque)
+static CoroutineFn<void> empty_coroutine(void *opaque)
 {
     /* Do nothing */
+    co_return;
 }
 
 static void perf_lifecycle(void)
@@ -561,13 +568,13 @@ static void perf_nesting(void)
  * Yield benchmark
  */
 
-static void coroutine_fn yield_loop(void *opaque)
+static CoroutineFn<void> yield_loop(void *opaque)
 {
-    unsigned int *counter = opaque;
+    unsigned int *counter = (unsigned int *)opaque;
 
     while ((*counter) > 0) {
         (*counter)--;
-        qemu_coroutine_yield();
+        co_await qemu_coroutine_yield();
     }
 }
 
@@ -611,9 +618,9 @@ static void perf_baseline(void)
     g_test_message("Function call %u iterations: %f s", maxcycles, duration);
 }
 
-static __attribute__((noinline)) void perf_cost_func(void *opaque)
+static __attribute__((noinline)) CoroutineFn<void> perf_cost_func(void *opaque)
 {
-    qemu_coroutine_yield();
+    co_await qemu_coroutine_yield();
 }
 
 static void perf_cost(void)
@@ -639,13 +646,11 @@ static void perf_cost(void)
                    duration, ops,
                    (unsigned long)(1000000000.0 * duration / maxcycles));
 }
-#endif
 
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-#if 0
     /* This test assumes there is a freelist and marks freed coroutine memory
      * with a sentinel value.  If there is no freelist this would legitimately
      * crash, so skip it.
@@ -653,9 +658,7 @@ int main(int argc, char **argv)
     if (CONFIG_COROUTINE_POOL) {
         g_test_add_func("/basic/no-dangling-access", test_no_dangling_access);
     }
-#endif
 
-#if 0
     g_test_add_func("/basic/lifecycle", test_lifecycle);
     g_test_add_func("/basic/yield", test_yield);
     g_test_add_func("/basic/nesting", test_nesting);
@@ -674,6 +677,5 @@ int main(int argc, char **argv)
         g_test_add_func("/perf/function-call", perf_baseline);
         g_test_add_func("/perf/cost", perf_cost);
     }
-#endif
     return g_test_run();
 }
-- 
2.35.1

