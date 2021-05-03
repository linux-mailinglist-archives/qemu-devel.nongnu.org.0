Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ABF371444
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:28:17 +0200 (CEST)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWkE-000179-R1
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi4-0008KK-Nd
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:56 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi3-0003X0-7o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:56 -0400
Received: by mail-ed1-x535.google.com with SMTP id y26so5858043eds.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJVqL7YxAZ4sEYqWvKgnyVTzcE0p9RgiVvKoiF/1R3Q=;
 b=H75yEHN7fH+XeLepX8Qc42hirNkYR30MCw1r+m5OvRfRY+OBTQn2Tp+zs4nFKiy3SH
 2KstRs3vuqOoPz+FGz8UWQu32Nrbtg4VddcJxhFx6ReFnPYUFFmsRd+fm1vgDXBz1QIG
 0ivI0jn8uAdoG3LA8ID0T3IG1/KrpRSaePxzXmrFp0WBtpC8dEMRMEAXH892FsCSPXkX
 Lv7D80VUD2v1ndaQi6sPMk95b0psLV2gelbfk1YxCNnAxF+GeXAoZo7P7QbwHr3ECJMp
 kNzRxlHBrH7kqQfSzyB+ZHqy0nhr5UcUREjIirIyz5oE5kmNY5QRRpHYhofM4B15+NGX
 b8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GJVqL7YxAZ4sEYqWvKgnyVTzcE0p9RgiVvKoiF/1R3Q=;
 b=KDIAI8E5ujd9+oWon0kVomyIpiTFcbSpXwLwEr5Iy0fx6CLcEXg4+6CMVnZuOJOppp
 L6Sxb/NXWz/ycxRUnf+vAzbkdfG0RjaNaV3BHV/Wri6ZZzrvzY5QmIYZpC/SPeOZ2SUr
 YCqIYvLPWudMMv7RuqRswXceuY3Z+Sb8Lv/L+UgIO+pwQR8ll3rZVP0EN3NsHgaEpu4Q
 u1lCYEQAIBbEu9Pl14tJlW0RddXyQAOLnU3Xmm6bw7LAaXtm1jHIY1nQIfI2gSK9pKfP
 GxMY9DHiGFhwp1zH/FS0tZkX0HH4UhsdhnN4zhOM30qGlNxrJv8V9dlo8SQJxyfQbYei
 vDnw==
X-Gm-Message-State: AOAM5302gI7xhco8UhquAEv4/1FWWsQGAlB3HZSW9E1MaNNf6pMRIGxZ
 OqYvF4JK3TstYhJgrq3sBAe1ozutM+4=
X-Google-Smtp-Source: ABdhPJy9v/ULA2bFwUCxcmVrJCyx/bXcHO5KhimJ7ZyAw9AUbIA3+Nqx50MRFA4f6GVLoGofN9BAPA==
X-Received: by 2002:a05:6402:11ca:: with SMTP id
 j10mr15161093edw.184.1620041153978; 
 Mon, 03 May 2021 04:25:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id gn36sm2981317ejc.23.2021.05.03.04.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:25:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] coroutine-sleep: use a stack-allocated timer
Date: Mon,  3 May 2021 13:25:45 +0200
Message-Id: <20210503112550.478521-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503112550.478521-1-pbonzini@redhat.com>
References: <20210503112550.478521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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

The lifetime of the timer is well-known (it cannot outlive
qemu_co_sleep_ns_wakeable, because it's deleted by the time the
coroutine resumes), so it is not necessary to place it on the heap.

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



