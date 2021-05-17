Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E33938299A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:15:19 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaHO-0006eb-NT
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8J-0004kx-6z; Mon, 17 May 2021 06:05:56 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8H-0001eR-Ei; Mon, 17 May 2021 06:05:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so8288016ejc.10;
 Mon, 17 May 2021 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBqTDXA9Nz0xhg9QJ+rdI3aq/c/Qwf8zhyPVSPAzEfk=;
 b=MA0f/9tP/l2sJdo1WEY4KtnChAhryCR6i3xLTi/9twLM6sFrExYO0SKkCxBGR9zwxj
 dfToVJjJaaXCmjFnTwNw9GnjdBMFzqA6Wo1aIZwTZ5gxf8Cq8uc/EV6NDmz3N6OURk6v
 8/ZZ+NSCezOSi/ZfvNpQEsFz3fRr05SnRG1HgBozRo/U7HOLxiwFN+8FrKzndH2s3w7F
 U1KgNFy8ns1PvZspuR1HWHmLVBs+n836ZeRfKDWJT5fUGDSr/DMdCJAHB8VpUYNLlRHQ
 +rOEbouRYCix5KTS09Cjp5VMxbS/uBHw3x8EScBw79LYvKE5/tRxQbmCIfgxeB9g++HS
 A3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GBqTDXA9Nz0xhg9QJ+rdI3aq/c/Qwf8zhyPVSPAzEfk=;
 b=rgunenQ48p2sqt0BSh/vcoVu7PsNDaRr9mQD2hFSDa91YRhvU6Ul8z382w3lNplRhh
 r1lBtWUbTFJjdDFc85KtuLmahVLHrit3Rh/QL7I8qOmFFEjeJIuh/9xKvuGgoaRxX4Ev
 yopmbpcnQTm1lwhWt+VdZ4p+8eGJHL3xasNVV3B863kb/GV5alPsFeaG9RwwDwhAxMKJ
 wJddc92ptYdmofo4N/53AUMUkuMPR5LoC5qVzCgdjxcZvUgoJp3MzGTUFYdXHSHe9br4
 JDRfsjPANSM2pelIndnkhW0nISS7/82olNn5iehZ5KjxLAowWbN9KY5WNih48gjURLRx
 g/Ng==
X-Gm-Message-State: AOAM532vrA9DKuAlWoCm6AnmdwRL12b9frk9BR2f6wvj+38fpZMtkN4y
 mqRXGjzuvF64TA2xNCrzi2g16UL5AcUYSw==
X-Google-Smtp-Source: ABdhPJzvFpGGcbDUqh/hJJYPYn6SIFX33ETmfd1QfmsjB1AgfF2NFusyStSR4WAHizZzeOGHBV8RAQ==
X-Received: by 2002:a17:907:9715:: with SMTP id
 jg21mr17108641ejc.52.1621245951480; 
 Mon, 17 May 2021 03:05:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] coroutine-sleep: use a stack-allocated timer
Date: Mon, 17 May 2021 12:05:43 +0200
Message-Id: <20210517100548.28806-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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

The lifetime of the timer is well-known (it cannot outlive
qemu_co_sleep_ns_wakeable, because it's deleted by the time the
coroutine resumes), so it is not necessary to place it on the heap.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-sleep.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 8c4dac4fd7..eec6e81f3f 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -21,7 +21,7 @@ static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 struct QemuCoSleepState {
     Coroutine *co;
-    QEMUTimer *ts;
+    QEMUTimer ts;
     QemuCoSleepState **user_state_pointer;
 };
 
@@ -35,7 +35,7 @@ void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
     if (sleep_state->user_state_pointer) {
         *sleep_state->user_state_pointer = NULL;
     }
-    timer_del(sleep_state->ts);
+    timer_del(&sleep_state->ts);
     aio_co_wake(sleep_state->co);
 }
 
@@ -50,7 +50,6 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
     AioContext *ctx = qemu_get_current_aio_context();
     QemuCoSleepState state = {
         .co = qemu_coroutine_self(),
-        .ts = aio_timer_new(ctx, type, SCALE_NS, co_sleep_cb, &state),
         .user_state_pointer = sleep_state,
     };
 
@@ -63,10 +62,11 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
         abort();
     }
 
+    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, &state);
     if (sleep_state) {
         *sleep_state = &state;
     }
-    timer_mod(state.ts, qemu_clock_get_ns(type) + ns);
+    timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
     if (sleep_state) {
         /*
@@ -75,5 +75,4 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
          */
         assert(*sleep_state == NULL);
     }
-    timer_free(state.ts);
 }
-- 
2.31.1



