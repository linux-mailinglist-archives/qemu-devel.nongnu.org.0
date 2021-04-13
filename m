Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1935DF96
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:59:34 +0200 (CEST)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIdh-0002Zo-8X
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWIZv-0006rK-8t; Tue, 13 Apr 2021 08:55:39 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWIZt-0005hz-KY; Tue, 13 Apr 2021 08:55:38 -0400
Received: by mail-ej1-x62f.google.com with SMTP id g5so19050763ejx.0;
 Tue, 13 Apr 2021 05:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vLwHfEp1AzcUmgniSsXzVkGzPWMmmja/bcyUs+ASzko=;
 b=iltohZH05gqtb0exNIAQyJB/S6qu67vlr4yDqh8y2siNvgifh0itUBFp02PkEzWlBV
 YMX5YQy/R1vr9U4e2sOSNU7/w+NHHgsClLCjhowzOoLOMKY6odHQOOKkBZim4in2MBHh
 sUcPy/KsyrxUOTBzTyi2EfBSWl+ZjaGnTdqFmMnemfes/JRxPNhnPUd+4bOC0giEEYaj
 P8PF39GEzEJ57al5F3O6Yst/AXZbL/qjAGEU5Xuu2qe9A7EhkW7fStLGhA2Ico3Y7oNf
 W/yT2rtwiZjO0pibAZAbdreQexEBxuSvvFk8gd2k+q+OoDGZZ8uC+SLOsW3z5L7sd6sR
 zAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vLwHfEp1AzcUmgniSsXzVkGzPWMmmja/bcyUs+ASzko=;
 b=XprSGzNyzxq16ptkFsm8+VcoichDIWgLbeItsFW1M5Hi9EyX3n/B0YJIWUYZdZUwQF
 WAYLT3fDWxHeQyEBeFVYDxX3MjEGXZgV50aSbJRNwpEF102vVoaw3ik5ru37NZRlVx6t
 33n8EWYih1Jntjf6flEBY3LoUVbvAoDmGmZP4cdX+iuUkEQXsWD4bw3v2Bo7vNgqhgPr
 DubPZZDGTRGeM/s5HzLPOOJwdSslgNgxoDzDqHZDar3KMMsQBvNyJV/Ecx4elkWPjTb8
 EUZtu5EVX1KNFsNn1EE0mxbazo8MHJfPk0YljhEDDE82irAoEwvtDbxn9s3FBqz/PZ7y
 XSTw==
X-Gm-Message-State: AOAM530IIAy8l/iL0WElt9jmsp/p3zr1YOxb2idZXnhCeKkBDMGla7dz
 6ZohgsgpF5tcZW5A7CaGrfnEvAIKzxM=
X-Google-Smtp-Source: ABdhPJzKgTFvW4CDsmDgkRnSl5qwf+SseL4nEz0OMo1srVhxp5bsdplSacQMPlS//kxdLVz2/Dl4dA==
X-Received: by 2002:a17:906:2a0f:: with SMTP id
 j15mr29079286eje.159.1618318535113; 
 Tue, 13 Apr 2021 05:55:35 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b21sm8031069ejz.123.2021.04.13.05.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:55:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ratelimit: protect with a mutex
Date: Tue, 13 Apr 2021 14:55:33 +0200
Message-Id: <20210413125533.217440-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: eesposit@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org
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
2.30.1


