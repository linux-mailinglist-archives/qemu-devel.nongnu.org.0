Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB654D0374
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:53:10 +0100 (CET)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFfZ-00022I-Th
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:53:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRFSB-0000v9-6K
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRFS9-0004Cb-5T
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0lwfbgakbDPz2F1Wm8I8jfyO4wDR1n9q2xO5avVkiI=;
 b=WOYUYLL5rJeOYJcRRXERCIUFxa/LBJxlH7j3axem5lbFFlnnrR/wu4e1UeamjQ+JjX2mmo
 QGc6UO5MMWxlpTjNIR32fkHJcV8A62Y6LFrmf0em0RruzQA+oGeZYefceURjOpE481zO7E
 +IXRN0itcQb6B3kmGeu13eMfmPYFTAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-0F83zgenPTSO_wkMvPDUfg-1; Mon, 07 Mar 2022 10:39:13 -0500
X-MC-Unique: 0F83zgenPTSO_wkMvPDUfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BDD11006AA8;
 Mon,  7 Mar 2022 15:39:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E48C26343;
 Mon,  7 Mar 2022 15:39:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
Date: Mon,  7 Mar 2022 15:38:51 +0000
Message-Id: <20220307153853.602859-2-stefanha@redhat.com>
In-Reply-To: <20220307153853.602859-1-stefanha@redhat.com>
References: <20220307153853.602859-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thread-Local Storage variables cannot be used directly from coroutine
code because the compiler may optimize TLS variable accesses across
qemu_coroutine_yield() calls. When the coroutine is re-entered from
another thread the TLS variables from the old thread must no longer be
used.

Use QEMU_DEFINE_STATIC_CO_TLS() for the current and leader variables.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/coroutine-ucontext.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index 904b375192..127d5a13c8 100644
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


