Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF8924F1F5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 06:33:53 +0200 (CEST)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA4B6-00028b-69
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 00:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghonghao@bytedance.com>)
 id 1kA49D-0000Rk-IT
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 00:31:55 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wanghonghao@bytedance.com>)
 id 1kA49B-00033J-JK
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 00:31:55 -0400
Received: by mail-pl1-x641.google.com with SMTP id t11so3617449plr.5
 for <qemu-devel@nongnu.org>; Sun, 23 Aug 2020 21:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GaHFAjBZj/yhDBoP8tyxyicBoN4aikESBnel0KS+ntc=;
 b=TRapnlpmRLn65NuA1wuujFEnvXUt68QZFZcepumM8aLn/cznH5QI1dNZjK2fBksXSP
 gh5X/mf+IuMmnpHnRK9kGiDsWAstcGZg122HMIOefMJuAxtn7wiCs4sKfJ42lQ77JiLT
 7XW8OIAxyes/AbnkcHcorBYGhJAdqSE7EpWWyCesivW3+z3tQ5oqYRn9/+9YC17EnJnH
 ZRhA4O4AphySliQNjUYFWgJz+Rn+0j+13984wtv8+xRuPzrOSFLFKQ1p8vu6upiKEaMC
 c4pV+Rl6xjv0xlxtSbcBfG8sgTQVezfO1t7DPf3nfseC5BQEqYhd7PKJUaxFFCC8mq5g
 5Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GaHFAjBZj/yhDBoP8tyxyicBoN4aikESBnel0KS+ntc=;
 b=jZLZHmYrwDortUOqdqlLRtH1AAyLzscWpNA9gBt5wEufZHIkdJMhpghurMfyeUFipr
 QgCthF0jba1jXBK1eTUrWzehqrHIlj737J5a8XjNR9uW/mm613itvxTKcvrUhJXbi+M6
 uD9LoBfCDOBL7svwZYJuOZYMJwkCoISyrAx76bJb1Y8XRZ4OE6wAoi6JGuZ9kZ5yHvrN
 GY2o9mW109HKW1lm+aXlaMdxYWGJPl4icnSIkLPTl2zS6nVS2ruLoliQMLkDfpIBB8Tu
 PH+b9ynelo4zONPNcRY7XRazMZsj94vglD3KKQ6rL54FOh/U9yhfiKqbSUte1L09weiL
 CvFQ==
X-Gm-Message-State: AOAM531D+CQJEN0pHyKLE2FdwIdxi2a8xFPdqGzY7uIRTCLJeFmPYyyH
 TQfu0Jj4RMVc5nj60xJqNbUJ+OvrHpeDiE8FbCE=
X-Google-Smtp-Source: ABdhPJxh2Xa1Q7YEoG5poacDzivQsLG0GK475wZlSxZlPmfi4qGSFgpEUvOBrowNB5Crm3fW/mNGAw==
X-Received: by 2002:a17:902:aa46:: with SMTP id
 c6mr2574387plr.136.1598243511997; 
 Sun, 23 Aug 2020 21:31:51 -0700 (PDT)
Received: from MacBook-Pro.local.net ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id d124sm1623237pfa.40.2020.08.23.21.31.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Aug 2020 21:31:51 -0700 (PDT)
From: wanghonghao <wanghonghao@bytedance.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] coroutine: take exactly one batch from global pool at a
 time
Date: Mon, 24 Aug 2020 12:31:21 +0800
Message-Id: <20200824043121.13421-2-wanghonghao@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20200824043121.13421-1-wanghonghao@bytedance.com>
References: <20200824043121.13421-1-wanghonghao@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=wanghonghao@bytedance.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, fam@euphon.net,
 wanghonghao <wanghonghao@bytedance.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch replace the global coroutine queue with a lock-free stack of which
the elements are coroutine queues. Threads can put coroutine queues into the
stack or take queues from it and each coroutine queue has exactly
POOL_BATCH_SIZE coroutines. Note that the stack is not strictly LIFO, but it's
enough for buffer pool.

Coroutines will be put into thread-local pools first while release. Now the
fast pathes of both allocation and release are atomic-free, and there won't
be too many coroutines remain in a single thread since POOL_BATCH_SIZE has been
reduced to 16.

In practice, I've run a VM with two block devices binding to two different
iothreads, and run fio with iodepth 128 on each device. It maintains around
400 coroutines and has about 1% chance of calling to `qemu_coroutine_new`
without this patch. And with this patch, it maintains no more than 273
coroutines and doesn't call `qemu_coroutine_new` after initial allocations.

Signed-off-by: wanghonghao <wanghonghao@bytedance.com>
---
 util/qemu-coroutine.c | 63 ++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index c3caa6c770..070d492edc 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -21,13 +21,14 @@
 #include "block/aio.h"
 
 enum {
-    POOL_BATCH_SIZE = 64,
+    POOL_BATCH_SIZE = 16,
+    POOL_MAX_BATCHES = 32,
 };
 
-/** Free list to speed up creation */
-static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
-static unsigned int release_pool_size;
-static __thread QSLIST_HEAD(, Coroutine) alloc_pool = QSLIST_HEAD_INITIALIZER(pool);
+/** Free stack to speed up creation */
+static QSLIST_HEAD(, Coroutine) pool[POOL_MAX_BATCHES];
+static int pool_top;
+static __thread QSLIST_HEAD(, Coroutine) alloc_pool;
 static __thread unsigned int alloc_pool_size;
 static __thread Notifier coroutine_pool_cleanup_notifier;
 
@@ -49,20 +50,26 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
     if (CONFIG_COROUTINE_POOL) {
         co = QSLIST_FIRST(&alloc_pool);
         if (!co) {
-            if (release_pool_size > POOL_BATCH_SIZE) {
-                /* Slow path; a good place to register the destructor, too.  */
-                if (!coroutine_pool_cleanup_notifier.notify) {
-                    coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
-                    qemu_thread_atexit_add(&coroutine_pool_cleanup_notifier);
+            int top;
+
+            /* Slow path; a good place to register the destructor, too.  */
+            if (!coroutine_pool_cleanup_notifier.notify) {
+                coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
+                qemu_thread_atexit_add(&coroutine_pool_cleanup_notifier);
+            }
+
+            while ((top = atomic_read(&pool_top)) > 0) {
+                if (atomic_cmpxchg(&pool_top, top, top - 1) != top) {
+                    continue;
                 }
 
-                /* This is not exact; there could be a little skew between
-                 * release_pool_size and the actual size of release_pool.  But
-                 * it is just a heuristic, it does not need to be perfect.
-                 */
-                alloc_pool_size = atomic_xchg(&release_pool_size, 0);
-                QSLIST_MOVE_ATOMIC(&alloc_pool, &release_pool);
+                QSLIST_MOVE_ATOMIC(&alloc_pool, &pool[top - 1]);
                 co = QSLIST_FIRST(&alloc_pool);
+
+                if (co) {
+                    alloc_pool_size = POOL_BATCH_SIZE;
+                    break;
+                }
             }
         }
         if (co) {
@@ -86,16 +93,30 @@ static void coroutine_delete(Coroutine *co)
     co->caller = NULL;
 
     if (CONFIG_COROUTINE_POOL) {
-        if (release_pool_size < POOL_BATCH_SIZE * 2) {
-            QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
-            atomic_inc(&release_pool_size);
-            return;
-        }
+        int top, value, old;
+
         if (alloc_pool_size < POOL_BATCH_SIZE) {
             QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
             alloc_pool_size++;
             return;
         }
+
+        for (top = atomic_read(&pool_top); top < POOL_MAX_BATCHES; top++) {
+            QSLIST_REPLACE_ATOMIC(&pool[top], &alloc_pool);
+            if (!QSLIST_EMPTY(&alloc_pool)) {
+                continue;
+            }
+
+            value = top + 1;
+
+            do {
+                old = atomic_cmpxchg(&pool_top, top, value);
+            } while (old != top && (top = old) < value);
+
+            QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
+            alloc_pool_size = 1;
+            return;
+        }
     }
 
     qemu_coroutine_delete(co);
-- 
2.24.3 (Apple Git-128)


