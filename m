Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9795371447
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:30:55 +0200 (CEST)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWms-0003aX-RG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi6-0008Ks-Tt
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi5-0003Xv-AB
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:58 -0400
Received: by mail-ed1-x530.google.com with SMTP id e7so5815554edu.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KlDK80YilGQbH9G5IoPdIukwRost8JFR5BmMZD0EMTE=;
 b=vbI2V7KLVpVA3Z5mSZOHO/6riMWZFW/hpNb+K96MSAVF4Le4ZzE3docY+pUiJ176Hd
 x/c/42Kv2uoCBHKop/wRWcYqE/TSghrPu5oTjt152w+BiZt9LawyH9FDW5cqy6dPanNV
 PjpCJprO3/ICCbciUq3O57BvzD8el01RGeDtj6Hflfn168RALJ1AyqhYesTI1V+yPrDb
 5P3BJ7Rd+3f4cfa11DlWctoM8SqCwhwrzRRK+vktZg4OWbuLmP28JTeBm9gv2RgP5dKd
 5CT2UTboH7jjITvxKdpQ1H2NI6PzYj+2FVmBOHPbyh/KIFJIki/o8d0vkob26QvpFCHV
 TziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KlDK80YilGQbH9G5IoPdIukwRost8JFR5BmMZD0EMTE=;
 b=jUlxYeoKUGAB2qdvClvUGvWSCyxH8k7ziFjlzgUyZLC9mWZJG8XvpH3aEpXdn5k+if
 3Rh2NjNb2OYdq9SXwX7yHlYuNyBP4hFxgbOCfO47gL8RKPWEExMKcFBvbu3CqlWF0gRc
 YadIRBes0oGsk6mLgr+3owwIXFlwKe2Ia8JyyJvyBeaJdeZsttAsj0VqOwqfhTi+TDTw
 FYG2d+Ul/6xiZ51S7kT6hjbAm9pGkO40f4YFTUPqLwywLdiMyKCzjKMehHZ8zRpo41cP
 rv3pa0/fjxpNu6R69GhqfvknxD+lIsKKBvV3sk4MJWjFI/554HMAtCgtg0YRdEdB5VGx
 2RJw==
X-Gm-Message-State: AOAM531rv/Lw4Y1EDqcPnaswzpWvbHbA/CKr9nAS3Bu/MoMIlecu1rUe
 6tF/FfHXkJr2zUn7GQk7Zy7spurWM+c=
X-Google-Smtp-Source: ABdhPJylOI75404DBqoEyLb9E7UYc5Sk196DMUJiAKARvLL32IUY0Kgclyc12sqI6CtblpOsBT7oSQ==
X-Received: by 2002:a05:6402:17fc:: with SMTP id
 t28mr19534467edy.283.1620041155894; 
 Mon, 03 May 2021 04:25:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id gn36sm2981317ejc.23.2021.05.03.04.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:25:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] coroutine-sleep: allow qemu_co_sleep_wake that wakes
 nothing
Date: Mon,  3 May 2021 13:25:47 +0200
Message-Id: <20210503112550.478521-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503112550.478521-1-pbonzini@redhat.com>
References: <20210503112550.478521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: eesposit@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers of qemu_co_sleep_wake are checking whether they are passing
a NULL argument inside the pointer-to-pointer: do the check in
qemu_co_sleep_wake itself.

As a side effect, qemu_co_sleep_wake can be called more than once and it
will only wake the coroutine once; after the first time, the argument
will be set to NULL via *sleep_state->user_state_pointer.

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
index 3f6f637e81..096eea3444 100644
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
+                                               qemu_co_sleep_ns__scheduled, NULL);
 
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



