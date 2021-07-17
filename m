Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502333CC5DC
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:27:56 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pyd-0003ii-9B
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvI-0003wF-71
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:28 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvE-0002is-Ap
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:27 -0400
Received: by mail-pg1-x52f.google.com with SMTP id w15so14019858pgk.13
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yClJeA0eodPxyF1R5QUgBR1GfzM9vxxAZPieFhrwqxo=;
 b=U3sPgQy7+dx2BaZdusgbTlJXoWHThCNPDF8GYe/34gyi4Tl6mTuvcPUshV2tdsbWrF
 hqVrXreit/khFFlvflKLC0MN/cr6Z8PHoqZtNJd0qRaPE95wog7AIBdhWYFHOXS1n6u7
 R3spYojDQTgz9gyyo1Z03CZL6qoiTAC/wB4ALfS3JSkbmVFDPwGtqXtyyEgm6ihtaz7g
 tPYXwNvNDCcYrMwbRgXwW3IQ4WAIZR223077aep87odPymWa9bvcMHdoecNdbFe7LBCO
 YxN2Dkl4vVZoNHgJb0i8zkexLU7QJnYPebjBLbZsx7Gxw6iUYcHp4DNKrg3rInrDJbGx
 EiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yClJeA0eodPxyF1R5QUgBR1GfzM9vxxAZPieFhrwqxo=;
 b=rH1vMOjQ1ObjmH/as7+DDpGBNCN8VS3cg0oV8R3ZhqclAQ06sgrzqY4gw/AbBVrHJR
 bcVeBUL2dnz1NOYVsTlmze7Rj/MtblbGh/A5CTcF7VPRnidmTkuJpQafFtn6ICUlCww5
 +mL8Cu+9vZgx8hVShquOHsROFU/MCrIlUxrD7/wamWNP//bNmZl+1sdf7Li34mvu176z
 vir7RpUFxYBUwIFn3Z1zx2iNSwqv3d3OrvhO2n1JU+SPGqq/tCcTv2qvXXlsSs87yKhQ
 xQ9p6JDfkVFW6C/xabs2ZhwWQ3+bRQIyZAN+KjD1NVRwt18LT6lEp9Kcysu2lF5dFpQV
 s+XQ==
X-Gm-Message-State: AOAM530htGWUHq7mm35m5TVBmQAhiAX2My9NMwF7cksUSzDEppuS9Qju
 HbeuKcO54JvDKpAg+D+68GizDSkkR25JjA==
X-Google-Smtp-Source: ABdhPJz1U0Xy48hldRIVWupNI/g9H0wZNpImnOWvLjuip3r192L1YWLE4n4UbDdD45ywn2M2HnbTgA==
X-Received: by 2002:a05:6a00:ccf:b029:329:308f:9ef6 with SMTP id
 b15-20020a056a000ccfb0290329308f9ef6mr16585535pfv.24.1626549862143; 
 Sat, 17 Jul 2021 12:24:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] qemu/atomic: Add aligned_{int64,uint64}_t types
Date: Sat, 17 Jul 2021 12:24:12 -0700
Message-Id: <20210717192419.2066778-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use it to avoid some clang-12 -Watomic-alignment errors,
forcing some structures to be aligned and as a pointer when
we have ensured that the address is aligned.

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
index bf89855209..f8f159052f 100644
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
 #define qatomic_read_i64  qatomic_read__nocheck
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


