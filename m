Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE43D0400
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:44:07 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xX4-00005H-Bx
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQs-0006EL-IL
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQp-0000H4-5X
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id 37so2809pgq.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yXkWA0eZbeR3PWDmUYnZO8DFWV5ZMhdaTqrtSIzDRQk=;
 b=OSlsc8ZvVZFNqKhPu2dOe32AhScB/AP8nt3G68c89NYzeoAMkYd1keoHiF0GcS2Rbc
 cTKE7+F+i/eaw/2TYIynBp0upJNkhMDxmk6tdQjFvO3EcDFLwP6rV8UUmwr3A7DdHGKN
 wv4J+6B/PtzUoPjmSohzipwPLM9MovIZApar1uvR/7618+kgt1nEXVJ7DUrewr+iV3E+
 1uvvqWwA3I4Peka+IZ0EmgR29LUSpF0ZicWgQ9M/1cPGx+gClbhDuStV/Xh5SE/9CtGi
 Y+e3gzhETJl0YD8lx8ihznrn0tItxg7RflC9P5T+iDPgCFutw/fTcUXMk0GBgIYf9t2n
 /RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yXkWA0eZbeR3PWDmUYnZO8DFWV5ZMhdaTqrtSIzDRQk=;
 b=Q4zwxQJ1XePyUNhQsVvZz1ZqILPOA891r5LY7uZEEPd3U2Ne0lcdvFrRueezpvhOhe
 Is24+1tZYfLaI+gCY/iXhEZuf0Nnm4l2XtlFV87l0yEe/v0UiGE3Uo5FyOBAr7FbjdOD
 Lr2Mz29DpvoG3YEiRbNZrG7XxXbmkwWpH1QkTJm1teouiA+WwoYi2IUc7Iq8T20fmgpI
 IWhd2Ek3B/wbJALu755KGWxGwvtf5JNw+y2lhX39voN9mz5q91At1XhBy8j48m8CAqfl
 4zM5Cdy8lEhJl5xSRhHXkYqdxrb0gxtBNo+58GNqgcvRnFJTqaLTOLIQkI9PmwA7YGTt
 xs9Q==
X-Gm-Message-State: AOAM531j6DAQAb6ye9hG51KpL6+yzNhf87rj5XD592GkS4saRwmi4m1Z
 LKj6hCvnuqGpCpc9CbgZhyJeRccSwIws4A==
X-Google-Smtp-Source: ABdhPJyg74jTBfuS5WdKrZTO3FfHIrZ/mfC43y9/H+fh9b0le7fzNLxZgHmA1IfMIwmKy39SvRL0IQ==
X-Received: by 2002:a05:6a00:98b:b029:32a:d9a5:2540 with SMTP id
 u11-20020a056a00098bb029032ad9a52540mr32632644pfg.66.1626817057692; 
 Tue, 20 Jul 2021 14:37:37 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/10] accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
Date: Tue, 20 Jul 2021 11:37:21 -1000
Message-Id: <20210720213723.630552-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unify the parameters of atomic_mmu_lookup between cputlb.c and
user-exec.c.  Call the function directly, and remove the macros.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


