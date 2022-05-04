Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECBD51A248
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:34:36 +0200 (CEST)
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG5L-00080c-9N
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwn-0000wG-MY
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwk-0007IN-Jg
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJdPU0b9Q2J3QqG8M5+vlXeikGiGvdzhsO1C5GkBCUo=;
 b=EXtbkxjbQrE8zaC15Othp/++bd0tA3W4BU9ASkaht3IsNjblZTC1R4fGe8teZQsJPdNzuZ
 b77lkE+VSj+I8OHvG0HQopqjqVsKrCIH14NGVnCJcbTSC+Y2EmJRqwj3AVmHq4Zl/hNv1c
 6a1FUk/hiwLgbuD27wysNJwmf2Wxcjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-oLtpN51TPaSssLKr_dhrdA-1; Wed, 04 May 2022 10:25:38 -0400
X-MC-Unique: oLtpN51TPaSssLKr_dhrdA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39C96185A7A4;
 Wed,  4 May 2022 14:25:38 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 270D1402189;
 Wed,  4 May 2022 14:25:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 11/13] coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
Date: Wed,  4 May 2022 16:25:20 +0200
Message-Id: <20220504142522.167506-12-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Thread-Local Storage variables cannot be used directly from coroutine
code because the compiler may optimize TLS variable accesses across
qemu_coroutine_yield() calls. When the coroutine is re-entered from
another thread the TLS variables from the old thread must no longer be
used.

Use QEMU_DEFINE_STATIC_CO_TLS() for the current and leader variables.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220307153853.602859-2-stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/coroutine-ucontext.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index ed368e1a3e..ddc98fb4f8 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include <ucontext.h>
 #include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
 
 #ifdef CONFIG_VALGRIND_H
 #include <valgrind/valgrind.h>
@@ -66,8 +67,8 @@ typedef struct {
 /**
  * Per-thread coroutine bookkeeping
  */
-static __thread CoroutineUContext leader;
-static __thread Coroutine *current;
+QEMU_DEFINE_STATIC_CO_TLS(Coroutine *, current);
+QEMU_DEFINE_STATIC_CO_TLS(CoroutineUContext, leader);
 
 /*
  * va_args to makecontext() must be type 'int', so passing
@@ -97,14 +98,15 @@ static inline __attribute__((always_inline))
 void finish_switch_fiber(void *fake_stack_save)
 {
 #ifdef CONFIG_ASAN
+    CoroutineUContext *leaderp = get_ptr_leader();
     const void *bottom_old;
     size_t size_old;
 
     __sanitizer_finish_switch_fiber(fake_stack_save, &bottom_old, &size_old);
 
-    if (!leader.stack) {
-        leader.stack = (void *)bottom_old;
-        leader.stack_size = size_old;
+    if (!leaderp->stack) {
+        leaderp->stack = (void *)bottom_old;
+        leaderp->stack_size = size_old;
     }
 #endif
 #ifdef CONFIG_TSAN
@@ -161,8 +163,10 @@ static void coroutine_trampoline(int i0, int i1)
 
     /* Initialize longjmp environment and switch back the caller */
     if (!sigsetjmp(self->env, 0)) {
-        start_switch_fiber_asan(COROUTINE_YIELD, &fake_stack_save, leader.stack,
-                                leader.stack_size);
+        CoroutineUContext *leaderp = get_ptr_leader();
+
+        start_switch_fiber_asan(COROUTINE_YIELD, &fake_stack_save,
+                                leaderp->stack, leaderp->stack_size);
         start_switch_fiber_tsan(&fake_stack_save, self, true); /* true=caller */
         siglongjmp(*(sigjmp_buf *)co->entry_arg, 1);
     }
@@ -297,7 +301,7 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
     int ret;
     void *fake_stack_save = NULL;
 
-    current = to_;
+    set_current(to_);
 
     ret = sigsetjmp(from->env, 0);
     if (ret == 0) {
@@ -315,18 +319,24 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
 
 Coroutine *qemu_coroutine_self(void)
 {
-    if (!current) {
-        current = &leader.base;
+    Coroutine *self = get_current();
+    CoroutineUContext *leaderp = get_ptr_leader();
+
+    if (!self) {
+        self = &leaderp->base;
+        set_current(self);
     }
 #ifdef CONFIG_TSAN
-    if (!leader.tsan_co_fiber) {
-        leader.tsan_co_fiber = __tsan_get_current_fiber();
+    if (!leaderp->tsan_co_fiber) {
+        leaderp->tsan_co_fiber = __tsan_get_current_fiber();
     }
 #endif
-    return current;
+    return self;
 }
 
 bool qemu_in_coroutine(void)
 {
-    return current && current->caller;
+    Coroutine *self = get_current();
+
+    return self && self->caller;
 }
-- 
2.35.1


