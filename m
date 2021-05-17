Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A383829BC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:22:49 +0200 (CEST)
Received: from localhost ([::1]:47702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaOe-0007XC-I5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8M-0004oy-Qi; Mon, 17 May 2021 06:05:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8J-0001gM-4B; Mon, 17 May 2021 06:05:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id t15so6124882edr.11;
 Mon, 17 May 2021 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ldi1B45Le+F//0iymW8+X/cGEwD6/csDFGa23RugWNg=;
 b=G5r2IDN9Do5gxYTrVYrO63oO8hKjlaXDZoydm4AcBK4KjPlqPmQggnuZ9bGKJl4LKT
 T3inZKVXkh8TOF5p5/MfeIW/Z5gvyrLwHp7CO0JYBgTDYrPaazSw+ak14fIEAfd/yC+O
 61/TLsbXrkUGh90y4ivWaeqyLOHF7s1Zf2udW3mYXOMV0ejErY7koQeSpqtHsEcuqsax
 3rHl7MqIFysHxbK1lyrgOHZyEj9EeNkjtUIM+rPB1bbe6MFsnheO+ArDWEcXju1lUXu9
 qmJ+lnYpX81RxSCQy6qSbjSvSjHELAkCAUaYWINpUH9i9YUec4vyhScxHmgYJOQZg5XF
 VEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ldi1B45Le+F//0iymW8+X/cGEwD6/csDFGa23RugWNg=;
 b=VSx5hayrjPiTOm1mXdHbl45LsZwSPcFa/Sir8rLibaQd8E8hr0/TP60lBK8Q2WwUlf
 k7Yw6fefutnnH0gJdSSPoN4eFgbVUPeY9D9U8OytzK3tXIoxNcuZwMs/HpEv0l3v7Ehm
 B5/l0M7ouHMKMUeFj7LWse3OxGrd9b9rsckjFMv+gLUJ7/VTZNLOk+/S/3QbWCf2VoLC
 j2R/QvZw83f7lXC9iYpdK7h6UgTulEmAyh/YIFNOyZ5v6SDoGSpY/NpSplNwbFU7Qf3V
 9edJpW7SMxUOcFzZX3VI6+VPJDYK3Ds5NLIoWRp1HFK/yJfUyJcKolfvNimcVWM+nb8U
 fGcw==
X-Gm-Message-State: AOAM533xlLLpINNF1hcFR0rJqPsgR15B1B5+b8nvxRqfXIg8//9l+OhP
 JaTlTfFB+r+f1lKuxDO5TRyfdqdhKNYp4w==
X-Google-Smtp-Source: ABdhPJwO6Q/ebHkoVRUzxUX5x/OQPNXFdkP/vl4tTW42L/vdi3+fsVaIzErXC0PzcXxXtV9Luxycog==
X-Received: by 2002:a50:d69c:: with SMTP id r28mr21435621edi.64.1621245953471; 
 Mon, 17 May 2021 03:05:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] coroutine-sleep: allow qemu_co_sleep_wake that wakes
 nothing
Date: Mon, 17 May 2021 12:05:45 +0200
Message-Id: <20210517100548.28806-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers of qemu_co_sleep_wake are checking whether they are passing
a NULL argument inside the pointer-to-pointer: do the check in
qemu_co_sleep_wake itself.

As a side effect, qemu_co_sleep_wake can be called more than once and
it will only wake the coroutine once; after the first time, the argument
will be set to NULL via *sleep_state->user_state_pointer.  However, this
would not be safe unless co_sleep_cb keeps using the QemuCoSleepState*
directly, so make it go through the pointer-to-pointer instead.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-copy.c          |  4 +---
 block/nbd.c                 |  8 ++------
 util/qemu-coroutine-sleep.c | 21 ++++++++++++---------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 9b4af00614..f896dc56f2 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -674,9 +674,7 @@ out:
 
 void block_copy_kick(BlockCopyCallState *call_state)
 {
-    if (call_state->sleep_state) {
-        qemu_co_sleep_wake(call_state->sleep_state);
-    }
+    qemu_co_sleep_wake(call_state->sleep_state);
 }
 
 /*
diff --git a/block/nbd.c b/block/nbd.c
index 1d4668d42d..1c6315b168 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -289,9 +289,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     s->drained = true;
-    if (s->connection_co_sleep_ns_state) {
-        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
-    }
+    qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
 
     nbd_co_establish_connection_cancel(bs, false);
 
@@ -330,9 +328,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
 
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
-        if (s->connection_co_sleep_ns_state) {
-            qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
-        }
+        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
         nbd_co_establish_connection_cancel(bs, true);
     }
     if (qemu_in_coroutine()) {
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 3f6f637e81..3ae2b5399a 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -27,19 +27,22 @@ struct QemuCoSleepState {
 
 void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
 {
-    /* Write of schedule protected by barrier write in aio_co_schedule */
-    const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
-                                           qemu_co_sleep_ns__scheduled, NULL);
+    if (sleep_state) {
+        /* Write of schedule protected by barrier write in aio_co_schedule */
+        const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
+                                                qemu_co_sleep_ns__scheduled, NULL);
 
-    assert(scheduled == qemu_co_sleep_ns__scheduled);
-    *sleep_state->user_state_pointer = NULL;
-    timer_del(&sleep_state->ts);
-    aio_co_wake(sleep_state->co);
+        assert(scheduled == qemu_co_sleep_ns__scheduled);
+        *sleep_state->user_state_pointer = NULL;
+        timer_del(&sleep_state->ts);
+        aio_co_wake(sleep_state->co);
+    }
 }
 
 static void co_sleep_cb(void *opaque)
 {
-    qemu_co_sleep_wake(opaque);
+    QemuCoSleepState **sleep_state = opaque;
+    qemu_co_sleep_wake(*sleep_state);
 }
 
 void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
@@ -60,7 +63,7 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
         abort();
     }
 
-    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, &state);
+    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, sleep_state);
     *sleep_state = &state;
     timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
-- 
2.31.1



