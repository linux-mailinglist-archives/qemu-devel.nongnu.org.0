Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7886E3829A7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:18:11 +0200 (CEST)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaKA-0000rl-92
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8M-0004ox-Qk; Mon, 17 May 2021 06:05:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8K-0001gT-4u; Mon, 17 May 2021 06:05:58 -0400
Received: by mail-ed1-x533.google.com with SMTP id b17so6196692ede.0;
 Mon, 17 May 2021 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8NwIGTy4xrdgQYoJbPMNCQEvseYJEQuulAUnjQxH2U=;
 b=vKNDGrfGK1Rs7ybhlG0dGvOdfjBsQiWpQfZhYuxHkl8sU4PEA8o5QkqyzZoOxZBh/t
 tYrvaIpwxcyCl2IRxMcULxJE0W95p0Mr8GEi3lbJ5MZyl9YvLkQoLKqha4HjdbMff04r
 ARjQhQeEAdweMEwWh9fGLhzsJPxLpIedIZk08pWL6LactLv91XnYTq2fvNXWVGZ2v5+I
 qVOBlkHQtJRgSqeQ0Tuym2YiceQyi1aQ79sHZ9oy9sNvmQEJABXmly1mvMzoGnO/B1MZ
 meBYXZOdCj40DCPyLla4phWN+Oia7ZYIRyFOlxNoeRxDb0tfR0lDIAo85lBQoPb2L1px
 04Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K8NwIGTy4xrdgQYoJbPMNCQEvseYJEQuulAUnjQxH2U=;
 b=q99rTmO4BlC+YwQd64LAPqbaU9JeKzCuzjEglxcX1aEfcxoCgkCwd3mJAOQ/h70Akq
 IeFM9mbm9TUgkrbD+v6VGGoD0MS/lEcdP95OhqkA0wmT0PRXOSjOFVp2xrFcUhiKZ+Mc
 eSUBr1Q/3f/rasQzbywbg1a94gzIvrYFreGenziy9THaC6KDJhnXbb7XaXCeWDkbiK+M
 zlkBHodYTPiHmLEKUQuMRQVWikkIba1t/DX7r9KaCYO4LNubcLAffZ1iuz89kPUVgWQy
 O8f3Vw5m8MjgR+OHqrqIYPd3iCHvNynywQAL1xM9VtNTs4xORItRzavdtAcslyli0DbB
 wRLw==
X-Gm-Message-State: AOAM532AEhECZrJr/FVATYOfNs1SsR5WmwVGHXJ7dNovPeZvS1vzufje
 VPFiDJO51I2JQ0i4IsZC+9jywxeY2OCfyQ==
X-Google-Smtp-Source: ABdhPJzlew+TMhTM6q88TDDAnuh9w7uJfB6radI/G9aohbnhboOWcbc28SuW7rjkc3TT3BGw6b3wPg==
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr27333409edu.160.1621245954376; 
 Mon, 17 May 2021 03:05:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] coroutine-sleep: move timer out of QemuCoSleepState
Date: Mon, 17 May 2021 12:05:46 +0200
Message-Id: <20210517100548.28806-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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

This simplification is enabled by the previous patch.  Now aio_co_wake
will only be called once, therefore we do not care about a spurious
firing of the timer after a qemu_co_sleep_wake.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-sleep.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 3ae2b5399a..1d25019620 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -21,7 +21,6 @@ static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 struct QemuCoSleepState {
     Coroutine *co;
-    QEMUTimer ts;
     QemuCoSleepState **user_state_pointer;
 };
 
@@ -34,7 +33,6 @@ void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
 
         assert(scheduled == qemu_co_sleep_ns__scheduled);
         *sleep_state->user_state_pointer = NULL;
-        timer_del(&sleep_state->ts);
         aio_co_wake(sleep_state->co);
     }
 }
@@ -49,6 +47,7 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
                                             QemuCoSleepState **sleep_state)
 {
     AioContext *ctx = qemu_get_current_aio_context();
+    QEMUTimer ts;
     QemuCoSleepState state = {
         .co = qemu_coroutine_self(),
         .user_state_pointer = sleep_state,
@@ -63,10 +62,11 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
         abort();
     }
 
-    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, sleep_state);
+    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, sleep_state);
     *sleep_state = &state;
-    timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
+    timer_mod(&ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
+    timer_del(&ts);
 
     /* qemu_co_sleep_wake clears *sleep_state before resuming this coroutine.  */
     assert(*sleep_state == NULL);
-- 
2.31.1



