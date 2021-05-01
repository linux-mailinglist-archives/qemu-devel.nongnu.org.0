Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F863706A7
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:35:41 +0200 (CEST)
Received: from localhost ([::1]:33304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm2G-0005Oq-1n
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0000Ww-Kh
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxM-0005We-EO
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g10so861494edb.0
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vV+zf/1bQAsAUU58HSRZ4dlpBrgD7hp3E95gfiSrSSU=;
 b=bpIuWhjZ2nzPFbOu7002l6tZwChP/rerP8/I8dfo0dUEGKrCCuWZNs+A2onB2z5Prr
 +hPeV+axbsU7fNZRWeNBLHEkfUq0NqXPvRucTcmpctB3XSzDWwxTCso5URS4kbR+k7mA
 oMDlPaOkXOdGoAt0MdwT5HbfxxGjhtQloS5iVKBZqFBTFSRyUdMqNVxR7+b05ciSyAuH
 0Rynm8JcBxy4O0BNC9RpqHGlGTewLZLbPrJX3z5C1IcynNSHClgf3fX29G8ibo6ybjpG
 a+qZmC98HHEUsQAi4jfnxUAoaXiYJdyohkHnskcI5rd1xKS7qBnOcDUIR2A29oyO+/8o
 SljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vV+zf/1bQAsAUU58HSRZ4dlpBrgD7hp3E95gfiSrSSU=;
 b=TWWMn5R3UfLS5+6eQ1QCJELWD6Hb3oVom8HKim61MUj+bXNhUrKCIIeazQV+2lRghw
 WVjp6EaoMNBKdfkKB5sOXOKyWkAWx+ba7tZUaUgtfna9+53Y1S1jd5zPxzdBqvyA7fEh
 SSilaIoSRzpSB2tFEETy9uF6ueIEHf/hsYI7tyj8BMT3CHfFiT4cQD3ar0pLlbOj7ZpL
 PQ9lqQck4FJTtE0a+J0ZV3r0Z1uVky3+6fPGxzNc/w8mHczhnjheC8lsFfqyoqMjb08p
 haccSdx862cRIN6+GBWKgEtWNOXlE4cudpVRINKuxWugClw34IZiIDcLQyH5upHUm0wH
 UFUg==
X-Gm-Message-State: AOAM533ER2U7VufYoYPGtTLEHa0QQN71T59ZWwlRbQwAfxMuK2OANc1i
 /AZnQENh5tgx8uVJJlAQDwLKGZrMFcA=
X-Google-Smtp-Source: ABdhPJyFKcXsACahlNrb4dlSpT4jRGihbX1YIzwNSmi7eAN25aAd3My/59s3/aLvllgLeqfc4Id0Hg==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr1968039edd.321.1619861435040; 
 Sat, 01 May 2021 02:30:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] ratelimit: protect with a mutex
Date: Sat,  1 May 2021 11:30:22 +0200
Message-Id: <20210501093026.189429-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now, rate limiting is protected by the AioContext mutex, which is
taken for example both by the block jobs and by qmp_block_job_set_speed
(via find_block_job).

We would like to remove the dependency of block layer code on the
AioContext mutex, since most drivers and the core I/O code are already
not relying on it.  However, there is no existing lock that can easily
be taken by both ratelimit_set_speed and ratelimit_calculate_delay,
especially because the latter might run in coroutine context (and
therefore under a CoMutex) but the former will not.

Since concurrent calls to ratelimit_calculate_delay are not possible,
one idea could be to use a seqlock to get a snapshot of slice_ns and
slice_quota.  But for now keep it simple, and just add a mutex to the
RateLimit struct; block jobs are generally not performance critical to
the point of optimizing the clock cycles spent in synchronization.

This also requires the introduction of init/destroy functions, so
add them to the two users of ratelimit.h.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-copy.c       |  2 ++
 blockjob.c               |  3 +++
 include/qemu/ratelimit.h | 14 ++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/block/block-copy.c b/block/block-copy.c
index 39ae481c8b..9b4af00614 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -230,6 +230,7 @@ void block_copy_state_free(BlockCopyState *s)
         return;
     }
 
+    ratelimit_destroy(&s->rate_limit);
     bdrv_release_dirty_bitmap(s->copy_bitmap);
     shres_destroy(s->mem);
     g_free(s);
@@ -289,6 +290,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
     }
 
+    ratelimit_init(&s->rate_limit);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
diff --git a/blockjob.c b/blockjob.c
index 207e8c7fd9..46f15befe8 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -87,6 +87,7 @@ void block_job_free(Job *job)
 
     block_job_remove_all_bdrv(bjob);
     blk_unref(bjob->blk);
+    ratelimit_destroy(&bjob->limit);
     error_free(bjob->blocker);
 }
 
@@ -435,6 +436,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     assert(job->job.driver->free == &block_job_free);
     assert(job->job.driver->user_resume == &block_job_user_resume);
 
+    ratelimit_init(&job->limit);
+
     job->blk = blk;
 
     job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
index 01da8d63f1..003ea6d5a3 100644
--- a/include/qemu/ratelimit.h
+++ b/include/qemu/ratelimit.h
@@ -14,9 +14,11 @@
 #ifndef QEMU_RATELIMIT_H
 #define QEMU_RATELIMIT_H
 
+#include "qemu/lockable.h"
 #include "qemu/timer.h"
 
 typedef struct {
+    QemuMutex lock;
     int64_t slice_start_time;
     int64_t slice_end_time;
     uint64_t slice_quota;
@@ -40,6 +42,7 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
     double delay_slices;
 
+    QEMU_LOCK_GUARD(&limit->lock);
     assert(limit->slice_quota && limit->slice_ns);
 
     if (limit->slice_end_time < now) {
@@ -65,9 +68,20 @@ static inline int64_t ratelimit_calculate_delay(RateLimit *limit, uint64_t n)
     return limit->slice_end_time - now;
 }
 
+static inline void ratelimit_init(RateLimit *limit)
+{
+    qemu_mutex_init(&limit->lock);
+}
+
+static inline void ratelimit_destroy(RateLimit *limit)
+{
+    qemu_mutex_destroy(&limit->lock);
+}
+
 static inline void ratelimit_set_speed(RateLimit *limit, uint64_t speed,
                                        uint64_t slice_ns)
 {
+    QEMU_LOCK_GUARD(&limit->lock);
     limit->slice_ns = slice_ns;
     limit->slice_quota = MAX(((double)speed * slice_ns) / 1000000000ULL, 1);
 }
-- 
2.31.1



