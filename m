Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE75A4D7EF7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:47:37 +0100 (CET)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThIe-0004mS-WC
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:47:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3o-00083l-81; Mon, 14 Mar 2022 05:32:16 -0400
Received: from [2a00:1450:4864:20::32e] (port=33508
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3m-000859-Bu; Mon, 14 Mar 2022 05:32:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso8093804wms.0; 
 Mon, 14 Mar 2022 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6AAK7o1izgyXxVFjUo5ZTWnlTq6OePo73jaya5LDSw=;
 b=ZC+ghCA0sQkxOVnD5Sm0atvhREOOZcHZ9Fv+ZaLZsk15moyfWzSbWBCSjEaocy7a45
 0PsNSIhQT9o/4YmzNdcadvbLozV7DauyMehLBC6JObYgOUWYwsUArehVSJoiZ4RkI2kX
 2NuCCwt3eZg6Khky4kG23kl1hLmnxDmJFy5vi9R7rKcCrLPKRFGG1Fwo9cDwq3qnCjxO
 FN9bSh324p8285iiBz3W/iX3e58SAHRS2ugFthx3uEUEf6ofYETCzaDeaL8afhPVcKlj
 8idV9QID621BEpZ6HdjhnHuQcCgg0yc1Dyqv5pYcKLHTlAOzv4iYuioszaS7rR7rf3BQ
 Ke/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v6AAK7o1izgyXxVFjUo5ZTWnlTq6OePo73jaya5LDSw=;
 b=pePD6Hn4mtty1AoNZcW+2KT7WiP8Uj/WHkg2i2RECecuikRT5xa2pLWQEBNIIIhW+P
 4rTYjbcMhL5ep4ieCoxQwY/h5VbIPTfOx7R8rA8CjXWXowFYAu+i69MBUeWA1NlB4miP
 ERvm2JNaLW45PY7g5X48ttR4C+7yj9PmoD7fcp3uRQaj2Chro4RNl0f5XtuuLaGvMTv9
 oWHbElM0nFdwpTlFLSylQXQbQ22wBw8wdUip2qaO+F69Kgx4ty9BxVW7sl0mAfD9xTTE
 GsiwAGbytN9lEouO1GGy+BlmQQtF8MMxByz2jPrmIfyvrWBh4o/r39C2q/r7/ag+uwxV
 MsYg==
X-Gm-Message-State: AOAM531L6yjBt72lysIIZPQAhGc+6COSIyOePeYseNryb5zF1+IKbqRN
 R2uYUxHjFumwBPQc1Ouo6kCgC1SKwEk=
X-Google-Smtp-Source: ABdhPJzUE1GJrynC/zKxD8D79o3S4V1GshO7oPGbhKNvMFpj3NlHAHBVYDx2fKr3Jf3zelhtN8gADA==
X-Received: by 2002:a05:600c:54a:b0:389:90f7:1b15 with SMTP id
 k10-20020a05600c054a00b0038990f71b15mr16673368wmc.156.1647250332609; 
 Mon, 14 Mar 2022 02:32:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 09/16] start adding extern "C" markers
Date: Mon, 14 Mar 2022 10:31:56 +0100
Message-Id: <20220314093203.1420404-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio.h           |  5 +++++
 include/fpu/softfloat-types.h |  4 ++++
 include/qemu/bitops.h         |  3 +++
 include/qemu/bswap.h          | 10 +++-------
 include/qemu/coroutine.h      |  4 ++++
 include/qemu/host-utils.h     |  4 ++++
 include/qemu/notify.h         |  4 ++++
 include/qemu/qsp.h            |  4 ++++
 include/qemu/thread.h         |  4 ++++
 include/qemu/timer.h          |  4 ++++
 10 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 5634173b12..4b21d95f0b 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -17,12 +17,15 @@
 #ifdef CONFIG_LINUX_IO_URING
 #include <liburing.h>
 #endif
+
 #include "qemu/coroutine.h"
 #include "qemu/queue.h"
 #include "qemu/event_notifier.h"
 #include "qemu/thread.h"
 #include "qemu/timer.h"
 
+G_BEGIN_DECLS
+
 typedef struct BlockAIOCB BlockAIOCB;
 typedef void BlockCompletionFunc(void *opaque, int ret);
 
@@ -769,4 +772,6 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
 void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
                                 Error **errp);
 
+G_END_DECLS
+
 #endif
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 8abd9ab4ec..aaf7b0b5fa 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -80,6 +80,8 @@ this code that are retained.
 #ifndef SOFTFLOAT_TYPES_H
 #define SOFTFLOAT_TYPES_H
 
+G_BEGIN_DECLS
+
 /*
  * Software IEC/IEEE floating-point types.
  */
@@ -197,4 +199,6 @@ typedef struct float_status {
     bool no_signaling_nans;
 } float_status;
 
+G_END_DECLS
+
 #endif /* SOFTFLOAT_TYPES_H */
diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..677884bead 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -12,6 +12,7 @@
 #ifndef BITOPS_H
 #define BITOPS_H
 
+G_BEGIN_DECLS
 
 #include "host-utils.h"
 #include "atomic.h"
@@ -618,4 +619,6 @@ static inline uint64_t half_unshuffle64(uint64_t x)
     return x;
 }
 
+G_END_DECLS
+
 #endif
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 2d3bb8bbed..439e755ed4 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -15,12 +15,10 @@
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 #include "fpu/softfloat-types.h"
 
+G_BEGIN_DECLS
+
 #ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
@@ -508,8 +506,6 @@ DO_STN_LDN_P(be)
 #undef le_bswaps
 #undef be_bswaps
 
-#ifdef __cplusplus
-}
-#endif
+G_END_DECLS
 
 #endif /* BSWAP_H */
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 6f4596fc5b..428e97d946 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -18,6 +18,8 @@
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 
+G_BEGIN_DECLS
+
 /**
  * Coroutines are a mechanism for stack switching and can be used for
  * cooperative userspace threading.  These functions provide a simple but
@@ -341,6 +343,8 @@ void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
  */
 void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
 
+G_END_DECLS
+
 #include "qemu/lockable.h"
 #include "qemu/co-lockable.h"
 
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index ca979dc6cc..406e593dff 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -30,6 +30,8 @@
 #ifndef HOST_UTILS_H
 #define HOST_UTILS_H
 
+G_BEGIN_DECLS
+
 #include "qemu/compiler.h"
 #include "qemu/bswap.h"
 
@@ -849,4 +851,6 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
 #endif
 }
 
+G_END_DECLS
+
 #endif
diff --git a/include/qemu/notify.h b/include/qemu/notify.h
index bcfa70fb2e..a8effa39b7 100644
--- a/include/qemu/notify.h
+++ b/include/qemu/notify.h
@@ -14,6 +14,8 @@
 #ifndef QEMU_NOTIFY_H
 #define QEMU_NOTIFY_H
 
+G_BEGIN_DECLS
+
 #include "qemu/queue.h"
 
 typedef struct Notifier Notifier;
@@ -71,4 +73,6 @@ void notifier_with_return_remove(NotifierWithReturn *notifier);
 int notifier_with_return_list_notify(NotifierWithReturnList *list,
                                      void *data);
 
+G_END_DECLS
+
 #endif
diff --git a/include/qemu/qsp.h b/include/qemu/qsp.h
index bf36aabfa8..65389837a1 100644
--- a/include/qemu/qsp.h
+++ b/include/qemu/qsp.h
@@ -16,6 +16,8 @@ enum QSPSortBy {
     QSP_SORT_BY_AVG_WAIT_TIME,
 };
 
+G_BEGIN_DECLS
+
 void qsp_report(size_t max, enum QSPSortBy sort_by,
                 bool callsite_coalesce);
 
@@ -24,4 +26,6 @@ void qsp_enable(void);
 void qsp_disable(void);
 void qsp_reset(void);
 
+G_END_DECLS
+
 #endif /* QEMU_QSP_H */
diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 460568d67d..ec27b7ec58 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -22,6 +22,8 @@ typedef struct QemuThread QemuThread;
 #define QEMU_THREAD_JOINABLE 0
 #define QEMU_THREAD_DETACHED 1
 
+G_BEGIN_DECLS
+
 void qemu_mutex_init(QemuMutex *mutex);
 void qemu_mutex_destroy(QemuMutex *mutex);
 int qemu_mutex_trylock_impl(QemuMutex *mutex, const char *file, const int line);
@@ -397,4 +399,6 @@ void qemu_lockcnt_inc_and_unlock(QemuLockCnt *lockcnt);
  */
 unsigned qemu_lockcnt_count(QemuLockCnt *lockcnt);
 
+G_END_DECLS
+
 #endif
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index ee071e07d1..236c45f1c6 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -5,6 +5,8 @@
 #include "qemu/notify.h"
 #include "qemu/host-utils.h"
 
+G_BEGIN_DECLS
+
 #define NANOSECONDS_PER_SECOND 1000000000LL
 
 /* timers */
@@ -998,4 +1000,6 @@ static inline int64_t profile_getclock(void)
 extern int64_t dev_time;
 #endif
 
+G_END_DECLS
+
 #endif
-- 
2.35.1



