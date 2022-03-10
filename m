Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C54D4782
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:59:25 +0100 (CET)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIO4-00053V-FC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9g-0006ip-SF; Thu, 10 Mar 2022 07:44:33 -0500
Received: from [2a00:1450:4864:20::431] (port=41652
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9f-0005CA-7M; Thu, 10 Mar 2022 07:44:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id i8so7760353wrr.8;
 Thu, 10 Mar 2022 04:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQ9jxKI5I1M89vZzYqquoXBdkPU8bHNffna5C1ysXtM=;
 b=SJ/1MNM2DfoliLjnh72Keto3Cinco9tPyaddBuqlsg0Tk6Nh4qs7CrzYfkQmmcm3IV
 g5b5UIA8lBvxmYNrUP4Nt5Y9hbu8oRnQnBBqx1FYTqijvTAatsHm8dFvfRA2fUBs5/t8
 OjapXsrtWf1p+uqytB4JHjaBUWHtUNn6BuMtWz/FTUgrISlMGB0thJe01ObJ/sf5QTO5
 nakfj99SlRu/yb63NSeCdZK2b6E9uhN342o+57n5f83jgKfuXOwhFKBRGjpmx3UBk4Pj
 JDIZgG4j53HTm6t6MdZjzKdXfYXBRBQuONiEuerX4Lzn4V5mPfo1cqaaMsiYMF1Krrh1
 RVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FQ9jxKI5I1M89vZzYqquoXBdkPU8bHNffna5C1ysXtM=;
 b=i7eF6Jt4VZfi27V0cmZIWQyihJAkDKgx3n9jj4oE5QLqvvC9Vlh42cLxHcpeSyr+/d
 Col1YAUtSm8Qpo14V3LR+gt6fnMpBQ2bMY3IVXTcgXaGisBls515nQ741E6uy5YreAbQ
 Qhe4Wu35HlLiq5fa4RaDThl/SaaUxiFKvMqWERQQfxU9PztHGHQLCm3qI5zwsgUAz0zD
 PgouQD60SkzyOdWNB9NEYVXhTnLeZeVcOV1jHDk4zjdnhcPP1GZKfsE+jupsag6lwVEv
 bYWY7uv342EQ1f4cXoSBWK0F1LM2uR3cuMVv98O/SA/EXt/sJdjTWh+mNXq58CFmV72j
 7c1Q==
X-Gm-Message-State: AOAM5306wdmjaUng61GSfyufu0jC4tbx0KvwqWDBNVUah92ns7st6b51
 GU8axmJpYLZW7RcO2O66Ui/TCdUKp5Y=
X-Google-Smtp-Source: ABdhPJxkzQSj4kBS8gG7J+lU07bK4mSut46oPbrMO3N72RTcDI62sFtQ1z1mOtwJmctwXBjyEokkPg==
X-Received: by 2002:adf:e5cf:0:b0:203:7a50:98bd with SMTP id
 a15-20020adfe5cf000000b002037a5098bdmr3437946wrn.416.1646916269580; 
 Thu, 10 Mar 2022 04:44:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/35] convert CoMutex to stackless coroutines
Date: Thu, 10 Mar 2022 13:43:49 +0100
Message-Id: <20220310124413.1102441-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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

Build the frame for qemu_co_mutex_lock_slowpath, because it has code
that runs after qemu_coroutine_yield().  For qemu_co_mutex_lock() and
qemu_co_mutex_unlock(), just return COROUTINE_CONTINUE on paths that do
not go through an awaitable function, which is all of them in the case
of qemu_co_mutex_unlock().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 60 ++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 048cfcea71..061a376aa4 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -120,6 +120,7 @@ bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
 }
+#endif
 
 /* The wait records are handled with a multiple-producer, single-consumer
  * lock-free queue.  There cannot be two concurrent pop_waiter() calls
@@ -197,15 +198,28 @@ static void coroutine_fn qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
     aio_co_wake(co);
 }
 
-static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
-                                                     CoMutex *mutex)
-{
-    Coroutine *self = qemu_coroutine_self();
+struct FRAME__qemu_co_mutex_lock_slowpath {
+    CoroutineFrame common;
+    uint32_t _step;
+    AioContext *ctx;
+    CoMutex *mutex;
+    Coroutine *self;
     CoWaitRecord w;
+};
+
+static CoroutineAction co__qemu_co_mutex_lock_slowpath(void *_frame)
+{
+    struct FRAME__qemu_co_mutex_lock_slowpath *_f = _frame;
+    AioContext *ctx = _f->ctx;
+    CoMutex *mutex = _f->mutex;
+    Coroutine *self;
     unsigned old_handoff;
 
+switch(_f->_step) {
+case 0: {
+    self = qemu_coroutine_self();
     trace_qemu_co_mutex_lock_entry(mutex, self);
-    push_waiter(mutex, &w);
+    push_waiter(mutex, &_f->w);
 
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
      * a concurrent unlock() the responsibility of waking somebody up.
@@ -221,21 +235,40 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
         Coroutine *co = to_wake->co;
         if (co == self) {
             /* We got the lock ourselves!  */
-            assert(to_wake == &w);
+            assert(to_wake == &_f->w);
             mutex->ctx = ctx;
-            return;
+            goto _out;
         }
 
         qemu_co_mutex_wake(mutex, co);
     }
 
-    qemu_coroutine_yield();
+_f->_step = 1;
+_f->self = self;
+    return qemu_coroutine_yield();
+}
+case 1:
+self = _f->self;
     trace_qemu_co_mutex_lock_return(mutex, self);
     mutex->holder = self;
     self->locks_held++;
+    goto _out;
+}
+_out:
+return stack_free(&_f->common);
 }
 
-void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex)
+static CoroutineAction qemu_co_mutex_lock_slowpath(AioContext *ctx, CoMutex *mutex)
+{
+    struct FRAME__qemu_co_mutex_lock_slowpath *f;
+    f = stack_alloc(co__qemu_co_mutex_lock_slowpath, sizeof(*f));
+    f->ctx = ctx;
+    f->mutex = mutex;
+    f->_step = 0;
+    return co__qemu_co_mutex_lock_slowpath(f);
+}
+
+CoroutineAction qemu_co_mutex_lock(CoMutex *mutex)
 {
     AioContext *ctx = qemu_get_current_aio_context();
     Coroutine *self = qemu_coroutine_self();
@@ -270,12 +303,13 @@ retry_fast_path:
         mutex->ctx = ctx;
         mutex->holder = self;
         self->locks_held++;
+        return COROUTINE_CONTINUE;
     } else {
-        qemu_co_mutex_lock_slowpath(ctx, mutex);
+        return qemu_co_mutex_lock_slowpath(ctx, mutex);
     }
 }
 
-void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
+CoroutineAction qemu_co_mutex_unlock(CoMutex *mutex)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -290,7 +324,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
     self->locks_held--;
     if (qatomic_fetch_dec(&mutex->locked) == 1) {
         /* No waiting qemu_co_mutex_lock().  Pfew, that was easy!  */
-        return;
+        return COROUTINE_CONTINUE;
     }
 
     for (;;) {
@@ -328,8 +362,10 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
     }
 
     trace_qemu_co_mutex_unlock_return(mutex, self);
+    return COROUTINE_CONTINUE;
 }
 
+#if 0
 struct CoRwTicket {
     bool read;
     Coroutine *co;
-- 
2.35.1



