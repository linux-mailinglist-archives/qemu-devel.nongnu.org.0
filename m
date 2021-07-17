Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D83CC5DD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:28:00 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pyh-0003t1-Ee
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvK-00042d-80
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvG-0002lB-TZ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:29 -0400
Received: by mail-pf1-x429.google.com with SMTP id d9so1080441pfv.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOCPAiZpRi+JkVZiq7soA3Hvt4DUu2Ndb/7IMzdvaDQ=;
 b=wWt8F+Iu1FxaWeEjZPuLRKkskmUTbz3CG6FG/m4b9HfHeAHr2Qd7zQz67V232keD3G
 3YQsa8PSenH0gAsyqrvXoo2n+npI/BxiMS2wIWo7hLtrPSk3JpiH47exGZHNANEEJFHA
 LxUg3kUJSrEW4bhkIHBQlwe2uFL59rj1SYtS/afteLfU8NVE+XFvFimtAsHbC5LHmLGA
 1mtgqGBa7CfdPsRxCEDNjiv9JmpPeu4JFiDdzrasH4+9k54bnxYKvKe8d7k6h4zcyEfh
 trcH6VC8V4Psn3YgYNm/ZDVCB9hS7F4j4RtDq4V1W8cggus7TEtERsL4MLPBNTHL7rUs
 bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOCPAiZpRi+JkVZiq7soA3Hvt4DUu2Ndb/7IMzdvaDQ=;
 b=nMPOcoVmecnI5ghvVIAs4Zq1j5rIXqea0ARUQwHUjxtwJTiMzWBFgeh8QcePPLVONS
 AT0NQiRZlFR5qZqgBXTWM8e11eVbwcXls//Ich/CjgQvwHbGt8W/t3Npy5R7m4lRvFE7
 Zpw1A/fI7OoqG9W9xmz/BCNyOK/vX+f6m0ualVWCI9aMTlQzCzEA3zGmZea5OcEkuNi5
 nc8In4WTGn/IiPHm4Q0vYAybCyAbbkN1enRXVkEzIP3h5uOaoIqy7U4gTGE5I9xOfbgw
 uK0UrZuiZ+T7ACDx9IFalHdMVRAJ5OUwLM45nsrpvjLELFvNAycOHfqIDw7F8JX8aDB9
 GR8A==
X-Gm-Message-State: AOAM530ONC4pJEfZNbtI2E/rn1Tj8Y7vFhb/4m0TQ3zrCKWW2u/HwpIY
 u0tn7iNHJ0IE7RrBLlX3pbBanOmSOlDbyw==
X-Google-Smtp-Source: ABdhPJwyW6BlFc+yun9fj/lJdCSo5UUDNbCNjVw9aAYTpDjczd165c7pwAOIxyBUiz+ArHBy3AQ6Iw==
X-Received: by 2002:a05:6a00:1c62:b029:329:f24e:3056 with SMTP id
 s34-20020a056a001c62b0290329f24e3056mr16869667pfw.50.1626549865479; 
 Sat, 17 Jul 2021 12:24:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/10] accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
Date: Sat, 17 Jul 2021 12:24:17 -0700
Message-Id: <20210717192419.2066778-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
index dc646e964a..b1e5471f94 100644
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


