Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5613CC0A4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:48:55 +0200 (CEST)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZRn-0006Sb-07
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKe-00014J-OR
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKc-00013f-I9
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id x16so6180137plg.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0BEIF48nvi6sFWAaISCWLaZU6e7Adgdrz5Zwf4cf1s=;
 b=ZNYK0WdFqn/xGfcmbAouCWxD5gsKT/kHZYvr6hzCGrgzWaykFGxoRhwmL+c9n2lZMU
 Ct7ReDzhNtzl+0o3wzRw4WvcsQF2hmyuqv4SbcqLwovG+jVBYfwaMgtkBDSQFNsuvqxq
 jC2XljkRdWWinTX5wZByGYkjb9AyPW5Nil06AEoEJU7p00Bm1cmBv5Y2MFo5auwAzyTb
 6QlJzqbztI2w+0RLoqj2htCtEEYNkhcmNfoYHcApdNNwjAGoO2S0HA1b8yxIiLlFkPiP
 Rfdq8QMw0VgK/DQy3g52atMl1utndEAgbDFikicaDkNPpm1ASXabSm+2ZhiLLhiA8eFK
 TgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0BEIF48nvi6sFWAaISCWLaZU6e7Adgdrz5Zwf4cf1s=;
 b=ChhV7ECzPtt8G+UIfNWs8doQCPZj3uGYOuAROBbi0z85RgMkDXR77GHHLYMaVpilvF
 86cXhQrlojJmhEAEYhKhsvmmvTYVo8MEoeTStr2AR1p0qZ0koQeCCmEnnu4lGH9yvkw8
 8pz5PY64lXuKHYiI0zPX3MMwZXVaFH1e9YCuJh3OoWr4Y9oK7iEyR+cWskvuEV+TVvZW
 rgvz7iyc8vZZEP5nRZR0bRJHIRGmbxN9MuPJ/5uGsdHREx399enUHpTXeth4xCeBNI/g
 8V5KjfqD+K+OEq2+YDsrbWYCKzngok6dxUSKzOcAh3JFfqnmFWZEY+FyVyZUf3+mfzo9
 8J2w==
X-Gm-Message-State: AOAM533X3IhXHa2UuX5rdFfgjPSM6Zy5Z9+RVn+ajNkJHTM99LmigV5Y
 qoxTYKgqxa9+ixaziGD/mTv+tkQ/QMKRxg==
X-Google-Smtp-Source: ABdhPJzkqrVvzdMCzl871NWiU+eEsZf8pb8ytm2e6NqquaLZGQq7r3R3MUqa6YPDANp5iWk05AR90g==
X-Received: by 2002:a17:902:9895:b029:128:cdfb:f389 with SMTP id
 s21-20020a1709029895b0290128cdfbf389mr9662145plp.45.1626486089148; 
 Fri, 16 Jul 2021 18:41:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
Date: Fri, 16 Jul 2021 18:41:19 -0700
Message-Id: <20210717014121.1784956-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unify the parameters of atomic_mmu_lookup between cputlb.c and
user-exec.c.  Call the function directly, and remove the macros.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 41 +++++++++++++++++++++++++------------
 accel/tcg/cputlb.c          |  7 +------
 accel/tcg/user-exec.c       | 12 ++++++-----
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index ae6b6a03be..6ee0158c5f 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -74,7 +74,8 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
@@ -95,7 +96,9 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                          TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_READ, retaddr);
+    DATA_TYPE val;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
 
@@ -109,7 +112,8 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                      TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_WRITE, retaddr);
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, true,
                                          ATOMIC_MMU_IDX);
 
@@ -123,7 +127,8 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
@@ -139,7 +144,8 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
+                                         PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
                                          ATOMIC_MMU_IDX);           \
@@ -161,7 +167,8 @@ GEN_ATOMIC_HELPER(xor_fetch)
 
 #undef GEN_ATOMIC_HELPER
 
-/* These helpers are, as a whole, full barriers.  Within the helper,
+/*
+ * These helpers are, as a whole, full barriers.  Within the helper,
  * the leading barrier is explicit and the trailing barrier is within
  * cmpxchg primitive.
  *
@@ -172,7 +179,8 @@ GEN_ATOMIC_HELPER(xor_fetch)
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
+    XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
+                                          PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE cmp, old, new, val = xval;                           \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
                                          ATOMIC_MMU_IDX);           \
@@ -217,7 +225,8 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
@@ -238,7 +247,9 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                          TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_READ, retaddr);
+    DATA_TYPE val;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
 
@@ -252,7 +263,8 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                      TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_WRITE, retaddr);
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, true,
                                          ATOMIC_MMU_IDX);
 
@@ -268,7 +280,8 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
+                                         PAGE_READ | PAGE_WRITE, retaddr);
     ABI_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
@@ -284,7 +297,8 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
+    DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
+                                         PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
                                          false, ATOMIC_MMU_IDX);    \
@@ -315,7 +329,8 @@ GEN_ATOMIC_HELPER(xor_fetch)
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
+    XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
+                                          PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
                                          false, ATOMIC_MMU_IDX);    \
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 81b29716da..16eda21265 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2693,12 +2693,7 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
-#define ATOMIC_MMU_LOOKUP_RW \
-    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, retaddr)
-#define ATOMIC_MMU_LOOKUP_R \
-    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ, retaddr)
-#define ATOMIC_MMU_LOOKUP_W \
-    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_WRITE, retaddr)
+
 #define ATOMIC_MMU_CLEANUP
 #define ATOMIC_MMU_IDX   get_mmuidx(oi)
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index bc4a38b4df..90d1a2d327 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1221,9 +1221,14 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
     return ret;
 }
 
-/* Do not allow unaligned operations to proceed.  Return the host address.  */
+/*
+ * Do not allow unaligned operations to proceed.  Return the host address.
+ *
+ * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
+ */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
-                               int size, uintptr_t retaddr)
+                               TCGMemOpIdx oi, int size, int prot,
+                               uintptr_t retaddr)
 {
     /* Enforce qemu required alignment.  */
     if (unlikely(addr & (size - 1))) {
@@ -1243,9 +1248,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
-#define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
-#define ATOMIC_MMU_LOOKUP_R   ATOMIC_MMU_LOOKUP_RW
-#define ATOMIC_MMU_LOOKUP_W   ATOMIC_MMU_LOOKUP_RW
 #define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
 #define ATOMIC_MMU_IDX MMU_USER_IDX
 
-- 
2.25.1


