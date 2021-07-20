Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB73D03FC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:41:55 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xUw-0004UM-Va
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQm-0005zd-2P
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQi-0000CL-9p
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id g24so463540pji.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gByINc+ktkYg8pbHnFAwT6K5mm8lqzrOGXD9r55vivo=;
 b=qW26Q+KPpjjUEgW43kN/pIAbyjtzlA9iJtvUtdKuXndSeu7rgVX5povpXiI8nZpGjA
 J+CmHY9HiEJJKHUboBfUBTTaMZLw7U5IiW8V4nYIZXXN5TK2LNzyCI+M+B6xSKxL2rc3
 OivvDAtWMleAVmKhzenqCI1upZU0FipF09e0IbqjltZOL6tNSuTjcmZMQiPMDxUX5UB0
 Ox8uP5QtAjgNiZ47wyr3uOuqBjyumFz/PFRGgXDqgy6gYM+Tu1LcfqsXcQzmqRF2S3CU
 zyF4dBdSKgpX7IP1/RJOdbWFvKMdVUXY0rMs8xMu3Ak1t5Y2Ox7uxm11C9AU1ePUwGX+
 u3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gByINc+ktkYg8pbHnFAwT6K5mm8lqzrOGXD9r55vivo=;
 b=adxafDYtkdBP8F9XGVrsk642pkML3MZn2VDqYyQUh3L5lLT2jRhQbqdWj1+t9TchU0
 BNlge8lmBnt3lXflIqRmG2E5PRhG4dZSV+lMPjtNvwPJM8x7eCKf3UcG8Mn/msTHf7iO
 E2vbqxch/SSxEClDZc+wrrusSSTJ/t5YAvIsSl/urChY2fwhD77PgTYtMFKaDVvU3XZX
 M33TOxmgaQSAg0uDfDBfPofelPP5A6QqXSEuGfD4r+Gxzh0y21O0I9L8dWNFrBrTOCwo
 9TKi3L9Nzlab9PIPp/sR9dLbinMPmoPIc89YfPW08LlQBGWiYOWHKZqiRfj8zgUKI5MD
 /QjQ==
X-Gm-Message-State: AOAM532juLWTsWvMKtquwfK7r8GGkIhO3JUqNiNP5VfkC9W2RQszKJZ2
 Gv47xy6cLeAMnhywu8yP98G5+KZKsWF9Jg==
X-Google-Smtp-Source: ABdhPJym2HsE9GFXgdodboHB9Zeqz1caiqi8ZsNiIlAiB9z3pJS103CZ5gicKIRRdUraEwDI7KLNfg==
X-Received: by 2002:a17:90a:db53:: with SMTP id
 u19mr32171368pjx.4.1626817050950; 
 Tue, 20 Jul 2021 14:37:30 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/10] qemu/atomic: Add aligned_{int64,uint64}_t types
Date: Tue, 20 Jul 2021 11:37:16 -1000
Message-Id: <20210720213723.630552-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use it to avoid some clang-12 -Watomic-alignment errors,
forcing some structures to be aligned and as a pointer when
we have ensured that the address is aligned.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h |  4 ++--
 include/qemu/atomic.h       | 14 +++++++++++++-
 include/qemu/stats64.h      |  2 +-
 softmmu/timers-state.h      |  2 +-
 linux-user/hppa/cpu_loop.c  |  2 +-
 util/qsp.c                  |  4 ++--
 6 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index afa8a9daf3..d347462af5 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -28,8 +28,8 @@
 # define SHIFT      4
 #elif DATA_SIZE == 8
 # define SUFFIX     q
-# define DATA_TYPE  uint64_t
-# define SDATA_TYPE int64_t
+# define DATA_TYPE  aligned_uint64_t
+# define SDATA_TYPE aligned_int64_t
 # define BSWAP      bswap64
 # define SHIFT      3
 #elif DATA_SIZE == 4
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index fe5467d193..112a29910b 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -271,7 +271,19 @@
     _oldn;                                                              \
 })
 
-/* Abstractions to access atomically (i.e. "once") i64/u64 variables */
+/*
+ * Abstractions to access atomically (i.e. "once") i64/u64 variables.
+ *
+ * The i386 abi is odd in that by default members are only aligned to
+ * 4 bytes, which means that 8-byte types can wind up mis-aligned.
+ * Clang will then warn about this, and emit a call into libatomic.
+ *
+ * Use of these types in structures when they will be used with atomic
+ * operations can avoid this.
+ */
+typedef int64_t aligned_int64_t __attribute__((aligned(8)));
+typedef uint64_t aligned_uint64_t __attribute__((aligned(8)));
+
 #ifdef CONFIG_ATOMIC64
 /* Use __nocheck because sizeof(void *) might be < sizeof(u64) */
 #define qatomic_read_i64(P) \
diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
index fdd3d1b8f9..802402254b 100644
--- a/include/qemu/stats64.h
+++ b/include/qemu/stats64.h
@@ -21,7 +21,7 @@
 
 typedef struct Stat64 {
 #ifdef CONFIG_ATOMIC64
-    uint64_t value;
+    aligned_uint64_t value;
 #else
     uint32_t low, high;
     uint32_t lock;
diff --git a/softmmu/timers-state.h b/softmmu/timers-state.h
index 8c262ce139..94bb7394c5 100644
--- a/softmmu/timers-state.h
+++ b/softmmu/timers-state.h
@@ -47,7 +47,7 @@ typedef struct TimersState {
     int64_t last_delta;
 
     /* Compensate for varying guest execution speed.  */
-    int64_t qemu_icount_bias;
+    aligned_int64_t qemu_icount_bias;
 
     int64_t vm_clock_warp_start;
     int64_t cpu_clock_offset;
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 3aaaf3337c..82d8183821 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -82,7 +82,7 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
                 o64 = *(uint64_t *)g2h(cs, old);
                 n64 = *(uint64_t *)g2h(cs, new);
 #ifdef CONFIG_ATOMIC64
-                r64 = qatomic_cmpxchg__nocheck((uint64_t *)g2h(cs, addr),
+                r64 = qatomic_cmpxchg__nocheck((aligned_uint64_t *)g2h(cs, addr),
                                                o64, n64);
                 ret = r64 != o64;
 #else
diff --git a/util/qsp.c b/util/qsp.c
index bacc5fa2f6..8562b14a87 100644
--- a/util/qsp.c
+++ b/util/qsp.c
@@ -83,8 +83,8 @@ typedef struct QSPCallSite QSPCallSite;
 struct QSPEntry {
     void *thread_ptr;
     const QSPCallSite *callsite;
-    uint64_t n_acqs;
-    uint64_t ns;
+    aligned_uint64_t n_acqs;
+    aligned_uint64_t ns;
     unsigned int n_objs; /* count of coalesced objs; only used for reporting */
 };
 typedef struct QSPEntry QSPEntry;
-- 
2.25.1


