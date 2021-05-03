Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B696637144F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:33:19 +0200 (CEST)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWpC-0005nN-PG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi9-0008OX-SU
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:26:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi8-0003aP-4A
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:26:01 -0400
Received: by mail-ed1-x534.google.com with SMTP id i3so5865505edt.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TkN11ZFUhG5EwQKBzw6s1Q7HDR8GxGfhT1cjSruZpQM=;
 b=gY4MwFJnZl+kETO2gvfLrblyZ8H3muGeeRCr+mdfb5hG8j2yH6KG6rKN3wEJST64pS
 2DJ8GZ5BSKDEbBOnGBW9pL2390ERQHh4a5FS3phkAXYueeAd/bAww17Eo0qBr1i15t3+
 Woh4N2xKWl2yQzGYEezmbfimIEUGSDgZ8tHjODDaPsjmPiQCjCtgBzoMQuTdIYsPqgiz
 QXIRuqfJcY5meV/FI23OTujjS47dmdLY14SEAZRen5UECx8kmaz3LRnx7fpQ1rZs/7Es
 RG3ZdvNXa68lvp+U3akHJthw/B2tkiW2lUl47x6N5H+4/tN+VNTq4F4KexNKzdLvdadX
 hQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TkN11ZFUhG5EwQKBzw6s1Q7HDR8GxGfhT1cjSruZpQM=;
 b=AA1et/ocLREJdSpVXsadZXJrmC7jiiP5QllEEJmtrxfK2f3sHEqt0UbdoTmQ9oZib2
 YoCITWUKDOW0T2+RkPHbKGnVkzhEtj1Yhy7pWM6Ou+tEavqpGAwO1Y4/9kDVWf0QoTOw
 rJ78hBUQEZSFMpSIkjztc7LovmmWQsZmSbLqYqwrcLi/C8gimoBAMajCDFqETqE6G7Tk
 W+C4uGgJKRSW78ff7zzzbPTo0SKZf0rzNpD8lGgg+0LnKNeqoqSjGcOMPzOjxapLGcCB
 v56aTGKMBrQFyrFvgc7K1pz1A+Dfi4qK4iJff+0HhaxBrWOcAOhQ9frEmlVgPb3Q8bLv
 46/g==
X-Gm-Message-State: AOAM533xo7hfbKJw+79eeyb0zwGknSwKKlA5ZqRQ751KB1wsnoEbs/8n
 hRCHl8qG6GDbzJs7tm8T82nlaMuZo3k=
X-Google-Smtp-Source: ABdhPJzKuQ8087hr+02KMLukTMMcxaMci4c40h3BZ3AZr7vBSoHfmtDJ/Zp3HIWfMwgMzhS/yoTs6A==
X-Received: by 2002:a05:6402:3072:: with SMTP id
 bs18mr15021156edb.367.1620041158823; 
 Mon, 03 May 2021 04:25:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id gn36sm2981317ejc.23.2021.05.03.04.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:25:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] coroutine-sleep: introduce qemu_co_sleep
Date: Mon,  3 May 2021 13:25:50 +0200
Message-Id: <20210503112550.478521-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503112550.478521-1-pbonzini@redhat.com>
References: <20210503112550.478521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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

Allow using QemuCoSleep to sleep forever until woken by qemu_co_sleep_wake.
This makes the logic of qemu_co_sleep_ns_wakeable easy to understand.

In the future we could introduce an API that can work even if the
sleep and wake happen from different threads.  For now, initializing
w->to_wake after timer_mod is fine because the timer can only fire in
the same AioContext.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h    |  5 +++++
 util/qemu-coroutine-sleep.c | 20 +++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 77cb8ce459..b53e9632b9 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -302,6 +302,11 @@ typedef struct QemuCoSleep {
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
index 89c3b758c5..df6edba2e4 100644
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
@@ -58,11 +55,20 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
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
+    qemu_co_sleep(w);
+    timer_del(&ts);
+}
-- 
2.31.1


