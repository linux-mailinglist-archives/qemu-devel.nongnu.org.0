Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA73829C3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:24:36 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaQN-00053g-Mw
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8O-0004qo-LH; Mon, 17 May 2021 06:06:01 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8L-0001hT-UT; Mon, 17 May 2021 06:05:59 -0400
Received: by mail-ed1-x531.google.com with SMTP id a25so6122697edr.12;
 Mon, 17 May 2021 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UzkfuYorD23EZdVdpax3DBoMJaYVD6QjEIBFy4F93kI=;
 b=Jmp6Jy4teyHM9FSPnKiu1JMU/BFXWKoGOK7vPkQC41jbb2oQDyXt1nEQdgwhrGl+/6
 Zvw4cnTgJV+91hEG7tr9MkvHctd0J5uLdb51B756XpJtXPZHK+2ib+AVyKa9WayRQPyL
 QEl5+I4t1TvOAGwPOHaw+uMeVvsyRnvy22kEdkW+BGXVUCGkqZzbWhBebTIUOAUZ/244
 CNz10j0nvKC1EwY75RASH43kO41ts1efMwwWr/DMcpTkUkA7Pvmmp85Cjv4yo/gu7F8w
 MNAhTfqEZ7a7tyDXo7wa9n+3PNEH0unsZJQ3YiDxcAmE/y6p1w9rUHid4CAcAsgaMEJc
 cxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UzkfuYorD23EZdVdpax3DBoMJaYVD6QjEIBFy4F93kI=;
 b=qYb3Bt8k3f21K7/0raY+0QvCRvF78CgnLddECbh5uo1C6SsEZiYCKp48gtuj8BwzJ1
 B7mrQispLeMFODF4yOYnKXh3XOWekA92nVfsnO8nkR/1QoNtVdtbhw89UzW5yIwW9QYv
 F6uD6q9qMxAooo/22nCaS4kAPd7H06l0aKrZan3qqio7Ti2WdX1xtSMfk7lnFikpeA11
 yjnmz69VaWznkByn8UJ4ciESlvcNc30+nBAAekmsvFgzLt330GdM7gYYUojWgKr4UbKH
 YE8exy6WbRWqDFLdfq1212OkW+xrXK9JQeFU2TXPjDh+x4RQpL1ccymRFod9mHvBpR1C
 QzcA==
X-Gm-Message-State: AOAM532TJHFfAPyu5OfYX+5LUj6+8KfzjFTxT4+prX+b+T+GS50hLFEx
 YHVaHAdQz5xA+ZQlHEnKvsC2ZRRLgWZhUA==
X-Google-Smtp-Source: ABdhPJxWsgmbkfRZBRbp//t5yMf49bb0QTavKZGxE89smb/e6SA7Lue4SUROsaTWrWjeAlKt3hi7uA==
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr40518859edv.315.1621245955770; 
 Mon, 17 May 2021 03:05:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] coroutine-sleep: introduce qemu_co_sleep
Date: Mon, 17 May 2021 12:05:48 +0200
Message-Id: <20210517100548.28806-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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

Allow using QemuCoSleep to sleep forever until woken by qemu_co_sleep_wake.
This makes the logic of qemu_co_sleep_ns_wakeable easy to understand.

In the future we will introduce an API that can work even if the
sleep and wake happen from different threads.  For now, initializing
w->to_wake after timer_mod is fine because the timer can only fire in
the same AioContext.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h    |  5 +++++
 util/qemu-coroutine-sleep.c | 26 +++++++++++++++++++-------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 82c0671f80..292e61aef0 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -303,6 +303,11 @@ typedef struct QemuCoSleep {
 void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
                                             QEMUClockType type, int64_t ns);
 
+/**
+ * Yield the coroutine until the next call to qemu_co_sleep_wake.
+ */
+void coroutine_fn qemu_co_sleep(QemuCoSleep *w);
+
 static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
 {
     QemuCoSleep w = { 0 };
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 89c3b758c5..571ab521ff 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -41,12 +41,9 @@ static void co_sleep_cb(void *opaque)
     qemu_co_sleep_wake(w);
 }
 
-void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
-                                            QEMUClockType type, int64_t ns)
+void coroutine_fn qemu_co_sleep(QemuCoSleep *w)
 {
     Coroutine *co = qemu_coroutine_self();
-    AioContext *ctx = qemu_get_current_aio_context();
-    QEMUTimer ts;
 
     const char *scheduled = qatomic_cmpxchg(&co->scheduled, NULL,
                                             qemu_co_sleep_ns__scheduled);
@@ -58,11 +55,26 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
     }
 
     w->to_wake = co;
-    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, w),
-    timer_mod(&ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
-    timer_del(&ts);
 
     /* w->to_wake is cleared before resuming this coroutine.  */
     assert(w->to_wake == NULL);
 }
+
+void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+                                            QEMUClockType type, int64_t ns)
+{
+    AioContext *ctx = qemu_get_current_aio_context();
+    QEMUTimer ts;
+
+    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, w);
+    timer_mod(&ts, qemu_clock_get_ns(type) + ns);
+
+    /*
+     * The timer will fire in the current AiOContext, so the callback
+     * must happen after qemu_co_sleep yields and there is no race
+     * between timer_mod and qemu_co_sleep.
+     */
+    qemu_co_sleep(w);
+    timer_del(&ts);
+}
-- 
2.31.1


