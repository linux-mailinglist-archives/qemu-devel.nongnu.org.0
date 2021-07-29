Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482653D9AF4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:16:43 +0200 (CEST)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ufC-0004ze-81
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCm-0004UT-6v
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:20 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCi-0002dy-02
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:19 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso6639597pjf.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H/QY6ZB/v4Yx4M1OEgHboccx4eqNPtpn43j0YGnvC7g=;
 b=gE9qsZ0u3qWgyp+FOXGWnDuUWUDr/WR4+1ip0rm4XCsMqftdC4TiIM4jrwC80rCy0d
 He9ueIYiy5Ko7Y8Bmnn/MJntFoKqH/ClU0FEZ1wmrPSb0wi1BSTl30OdNiGQEbZdTr10
 JDqmqGwQe2NCJNgClM99fWSiMMYibAYEJiuj6cN/4ZAPMItUerqCDsTBbO2T+0oQ7QET
 DSD5fyr++jIeyJ8nJIOpwIT0hoPE4k5XFJJGx2tjwaG3tkqAwrL4SrdeRdRIhihl5qUv
 y0O83CzHlSiitx+KLnCcCd2db9Dk38QRxRqInMnBG43aXBRv/SXpXHZjjMCtay80wMQ3
 HJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/QY6ZB/v4Yx4M1OEgHboccx4eqNPtpn43j0YGnvC7g=;
 b=UhTXLl+QWwc6Fih8VuZkSay+H+mSM9pNHiTJfOv7imE+Pm1QVN5b34C6Fot1iWWKmY
 J1agz3WwqrHtq9v6IRD8Dqcv5+2QoceBXP8BnMlZ9fQcV/qGWeVhy4h28qDiV9mKaEQA
 /B5NBk3t7govyrOMNr5OTtl/UeX/slaALTieMFZC3iC3jVfbJGxjOIV2a8IFZCJGNhB3
 cA//M9GtJaOoWAWh7o2DJoKWpAak1mlefBhyfEiwPRzG5pJTdzICO5lRDsiAMN0JQtKm
 Cspu5uWh8xBW10lbYR5vYGmepcV0d3/4VItLPEL/oqXUEc20+ITFFNXuuEPfyIaBeLec
 8q2g==
X-Gm-Message-State: AOAM532B8UCx7lhSeVpCZPn1mKlXhkcLb76zcM5vNbMcoAoGn2dCD+JH
 vx4RT0+SrpnlSg+cY+O58RFx7polm8SUXg==
X-Google-Smtp-Source: ABdhPJzN7KJx4FKEMnAyCah13pHDiSy68kchfeKteApA8/uPAZplRvMV116nzIGW1jBmsKjXsn+EHw==
X-Received: by 2002:a17:902:76cb:b029:12b:2fb8:7c35 with SMTP id
 j11-20020a17090276cbb029012b2fb87c35mr2119573plt.16.1627519634413; 
 Wed, 28 Jul 2021 17:47:14 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/43] tcg: Rename TCGMemOpIdx to MemOpIdx
Date: Wed, 28 Jul 2021 14:46:24 -1000
Message-Id: <20210729004647.282017-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to move this out of tcg.h, so rename it
as we did when moving MemOp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h   | 24 +++++------
 include/tcg/tcg.h             | 74 ++++++++++++++++-----------------
 accel/tcg/cputlb.c            | 78 +++++++++++++++++------------------
 accel/tcg/user-exec.c         |  2 +-
 target/arm/helper-a64.c       | 16 +++----
 target/arm/m_helper.c         |  2 +-
 target/i386/tcg/mem_helper.c  |  4 +-
 target/m68k/op_helper.c       |  2 +-
 target/mips/tcg/msa_helper.c  |  6 +--
 target/s390x/tcg/mem_helper.c | 20 ++++-----
 target/sparc/ldst_helper.c    |  2 +-
 tcg/optimize.c                |  2 +-
 tcg/tcg-op.c                  | 12 +++---
 tcg/tcg.c                     |  2 +-
 tcg/tci.c                     | 14 +++----
 accel/tcg/atomic_common.c.inc |  6 +--
 tcg/aarch64/tcg-target.c.inc  | 14 +++----
 tcg/arm/tcg-target.c.inc      | 10 ++---
 tcg/i386/tcg-target.c.inc     | 10 ++---
 tcg/mips/tcg-target.c.inc     | 12 +++---
 tcg/ppc/tcg-target.c.inc      | 10 ++---
 tcg/riscv/tcg-target.c.inc    | 16 +++----
 tcg/s390/tcg-target.c.inc     | 10 ++---
 tcg/sparc/tcg-target.c.inc    |  4 +-
 tcg/tcg-ldst.c.inc            |  2 +-
 25 files changed, 177 insertions(+), 177 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index d89af4cc1e..4427fab6df 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -72,7 +72,7 @@
 
 ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
@@ -92,7 +92,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 #if DATA_SIZE >= 16
 #if HAVE_ATOMIC128
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
-                         TCGMemOpIdx oi, uintptr_t retaddr)
+                         MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ, retaddr);
@@ -106,7 +106,7 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 }
 
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
-                     TCGMemOpIdx oi, uintptr_t retaddr)
+                     MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
@@ -119,7 +119,7 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 #endif
 #else
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
-                           TCGMemOpIdx oi, uintptr_t retaddr)
+                           MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
@@ -134,7 +134,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
+                        ABI_TYPE val, MemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
@@ -167,7 +167,7 @@ GEN_ATOMIC_HELPER(xor_fetch)
  */
 #define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
+                        ABI_TYPE xval, MemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
@@ -211,7 +211,7 @@ GEN_ATOMIC_HELPER_FN(umax_fetch, MAX,  DATA_TYPE, new)
 
 ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
@@ -231,7 +231,7 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 #if DATA_SIZE >= 16
 #if HAVE_ATOMIC128
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
-                         TCGMemOpIdx oi, uintptr_t retaddr)
+                         MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ, retaddr);
@@ -245,7 +245,7 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 }
 
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
-                     TCGMemOpIdx oi, uintptr_t retaddr)
+                     MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
@@ -260,7 +260,7 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 #endif
 #else
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
-                           TCGMemOpIdx oi, uintptr_t retaddr)
+                           MemOpIdx oi, uintptr_t retaddr)
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
@@ -275,7 +275,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
+                        ABI_TYPE val, MemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
@@ -305,7 +305,7 @@ GEN_ATOMIC_HELPER(xor_fetch)
  */
 #define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
+                        ABI_TYPE xval, MemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..f91ebd0743 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1148,7 +1148,7 @@ static inline size_t tcg_current_code_size(TCGContext *s)
 }
 
 /* Combine the MemOp and mmu_idx parameters into a single value.  */
-typedef uint32_t TCGMemOpIdx;
+typedef uint32_t MemOpIdx;
 
 /**
  * make_memop_idx
@@ -1157,7 +1157,7 @@ typedef uint32_t TCGMemOpIdx;
  *
  * Encode these values into a single parameter.
  */
-static inline TCGMemOpIdx make_memop_idx(MemOp op, unsigned idx)
+static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
 {
     tcg_debug_assert(idx <= 15);
     return (op << 4) | idx;
@@ -1169,7 +1169,7 @@ static inline TCGMemOpIdx make_memop_idx(MemOp op, unsigned idx)
  *
  * Extract the memory operation from the combined value.
  */
-static inline MemOp get_memop(TCGMemOpIdx oi)
+static inline MemOp get_memop(MemOpIdx oi)
 {
     return oi >> 4;
 }
@@ -1180,7 +1180,7 @@ static inline MemOp get_memop(TCGMemOpIdx oi)
  *
  * Extract the mmu index from the combined value.
  */
-static inline unsigned get_mmuidx(TCGMemOpIdx oi)
+static inline unsigned get_mmuidx(MemOpIdx oi)
 {
     return oi & 15;
 }
@@ -1278,46 +1278,46 @@ uint64_t dup_const(unsigned vece, uint64_t c);
 #ifdef CONFIG_SOFTMMU
 /* Value zero-extended to tcg register size.  */
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     TCGMemOpIdx oi, uintptr_t retaddr);
+                                     MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           TCGMemOpIdx oi, uintptr_t retaddr);
+                           MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           TCGMemOpIdx oi, uintptr_t retaddr);
+                           MemOpIdx oi, uintptr_t retaddr);
 
 /* Value sign-extended to tcg register size.  */
 tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     TCGMemOpIdx oi, uintptr_t retaddr);
+                                     MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
-                        TCGMemOpIdx oi, uintptr_t retaddr);
+                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr);
+                       MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr);
+                       MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr);
+                       MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr);
+                       MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr);
+                       MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr);
+                       MemOpIdx oi, uintptr_t retaddr);
 
 /* Temporary aliases until backends are converted.  */
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -1345,30 +1345,30 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 
 uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
                                  uint32_t cmpv, uint32_t newv,
-                                 TCGMemOpIdx oi, uintptr_t retaddr);
+                                 MemOpIdx oi, uintptr_t retaddr);
 uint32_t cpu_atomic_cmpxchgw_le_mmu(CPUArchState *env, target_ulong addr,
                                     uint32_t cmpv, uint32_t newv,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint32_t cpu_atomic_cmpxchgl_le_mmu(CPUArchState *env, target_ulong addr,
                                     uint32_t cmpv, uint32_t newv,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint64_t cpu_atomic_cmpxchgq_le_mmu(CPUArchState *env, target_ulong addr,
                                     uint64_t cmpv, uint64_t newv,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint32_t cpu_atomic_cmpxchgw_be_mmu(CPUArchState *env, target_ulong addr,
                                     uint32_t cmpv, uint32_t newv,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint32_t cpu_atomic_cmpxchgl_be_mmu(CPUArchState *env, target_ulong addr,
                                     uint32_t cmpv, uint32_t newv,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 uint64_t cpu_atomic_cmpxchgq_be_mmu(CPUArchState *env, target_ulong addr,
                                     uint64_t cmpv, uint64_t newv,
-                                    TCGMemOpIdx oi, uintptr_t retaddr);
+                                    MemOpIdx oi, uintptr_t retaddr);
 
 #define GEN_ATOMIC_HELPER(NAME, TYPE, SUFFIX)         \
 TYPE cpu_atomic_ ## NAME ## SUFFIX ## _mmu            \
     (CPUArchState *env, target_ulong addr, TYPE val,  \
-     TCGMemOpIdx oi, uintptr_t retaddr);
+     MemOpIdx oi, uintptr_t retaddr);
 
 #ifdef CONFIG_ATOMIC64
 #define GEN_ATOMIC_HELPER_ALL(NAME)          \
@@ -1415,19 +1415,19 @@ GEN_ATOMIC_HELPER_ALL(xchg)
 
 Int128 cpu_atomic_cmpxchgo_le_mmu(CPUArchState *env, target_ulong addr,
                                   Int128 cmpv, Int128 newv,
-                                  TCGMemOpIdx oi, uintptr_t retaddr);
+                                  MemOpIdx oi, uintptr_t retaddr);
 Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, target_ulong addr,
                                   Int128 cmpv, Int128 newv,
-                                  TCGMemOpIdx oi, uintptr_t retaddr);
+                                  MemOpIdx oi, uintptr_t retaddr);
 
 Int128 cpu_atomic_ldo_le_mmu(CPUArchState *env, target_ulong addr,
-                             TCGMemOpIdx oi, uintptr_t retaddr);
+                             MemOpIdx oi, uintptr_t retaddr);
 Int128 cpu_atomic_ldo_be_mmu(CPUArchState *env, target_ulong addr,
-                             TCGMemOpIdx oi, uintptr_t retaddr);
+                             MemOpIdx oi, uintptr_t retaddr);
 void cpu_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
-                           TCGMemOpIdx oi, uintptr_t retaddr);
+                           MemOpIdx oi, uintptr_t retaddr);
 void cpu_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
-                           TCGMemOpIdx oi, uintptr_t retaddr);
+                           MemOpIdx oi, uintptr_t retaddr);
 
 #ifdef CONFIG_DEBUG_TCG
 void tcg_assert_listed_vecop(TCGOpcode);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 0a1fdbefdd..d72f65f42b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1749,7 +1749,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
  * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
  */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, int size, int prot,
+                               MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
     size_t mmu_idx = get_mmuidx(oi);
@@ -1850,7 +1850,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
  */
 
 typedef uint64_t FullLoadHelper(CPUArchState *env, target_ulong addr,
-                                TCGMemOpIdx oi, uintptr_t retaddr);
+                                MemOpIdx oi, uintptr_t retaddr);
 
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_memop(const void *haddr, MemOp op)
@@ -1876,7 +1876,7 @@ load_memop(const void *haddr, MemOp op)
 }
 
 static inline uint64_t QEMU_ALWAYS_INLINE
-load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
+load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
             FullLoadHelper *full_load)
 {
@@ -1991,78 +1991,78 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
  */
 
 static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     TCGMemOpIdx oi, uintptr_t retaddr)
+                                     MemOpIdx oi, uintptr_t retaddr)
 {
     return full_ldub_mmu(env, addr, oi, retaddr);
 }
 
 static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                 TCGMemOpIdx oi, uintptr_t retaddr)
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
                        full_le_lduw_mmu);
 }
 
 tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return full_le_lduw_mmu(env, addr, oi, retaddr);
 }
 
 static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                 TCGMemOpIdx oi, uintptr_t retaddr)
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
                        full_be_lduw_mmu);
 }
 
 tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return full_be_lduw_mmu(env, addr, oi, retaddr);
 }
 
 static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                 TCGMemOpIdx oi, uintptr_t retaddr)
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
                        full_le_ldul_mmu);
 }
 
 tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return full_le_ldul_mmu(env, addr, oi, retaddr);
 }
 
 static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                 TCGMemOpIdx oi, uintptr_t retaddr)
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
                        full_be_ldul_mmu);
 }
 
 tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return full_be_ldul_mmu(env, addr, oi, retaddr);
 }
 
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           TCGMemOpIdx oi, uintptr_t retaddr)
+                           MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
                        helper_le_ldq_mmu);
 }
 
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           TCGMemOpIdx oi, uintptr_t retaddr)
+                           MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
                        helper_be_ldq_mmu);
@@ -2075,31 +2075,31 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
 
 
 tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     TCGMemOpIdx oi, uintptr_t retaddr)
+                                     MemOpIdx oi, uintptr_t retaddr)
 {
     return (int8_t)helper_ret_ldub_mmu(env, addr, oi, retaddr);
 }
 
 tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return (int16_t)helper_le_lduw_mmu(env, addr, oi, retaddr);
 }
 
 tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return (int16_t)helper_be_lduw_mmu(env, addr, oi, retaddr);
 }
 
 tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return (int32_t)helper_le_ldul_mmu(env, addr, oi, retaddr);
 }
 
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi, uintptr_t retaddr)
+                                    MemOpIdx oi, uintptr_t retaddr)
 {
     return (int32_t)helper_be_ldul_mmu(env, addr, oi, retaddr);
 }
@@ -2113,7 +2113,7 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
                                        MemOp op, FullLoadHelper *full_load)
 {
     uint16_t meminfo;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     uint64_t ret;
 
     meminfo = trace_mem_get_info(op, mmu_idx, false);
@@ -2337,7 +2337,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
     target_ulong page2, tlb_addr, tlb_addr2;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     size_t size2;
     int i;
 
@@ -2404,7 +2404,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
 
 static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
-             TCGMemOpIdx oi, uintptr_t retaddr, MemOp op)
+             MemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -2502,43 +2502,43 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
 void __attribute__((noinline))
 helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
-                   TCGMemOpIdx oi, uintptr_t retaddr)
+                   MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr)
+                       MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr)
+                       MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr)
+                       MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_LEUL);
 }
 
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr)
+                       MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_BEUL);
 }
 
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr)
+                       MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_LEQ);
 }
 
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       TCGMemOpIdx oi, uintptr_t retaddr)
+                       MemOpIdx oi, uintptr_t retaddr)
 {
     store_helper(env, addr, val, oi, retaddr, MO_BEQ);
 }
@@ -2551,7 +2551,7 @@ static inline void QEMU_ALWAYS_INLINE
 cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                  int mmu_idx, uintptr_t retaddr, MemOp op)
 {
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     uint16_t meminfo;
 
     meminfo = trace_mem_get_info(op, mmu_idx, true);
@@ -2717,49 +2717,49 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 /* Code access functions.  */
 
 static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr)
+                               MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_code);
 }
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
 {
-    TCGMemOpIdx oi = make_memop_idx(MO_UB, cpu_mmu_index(env, true));
+    MemOpIdx oi = make_memop_idx(MO_UB, cpu_mmu_index(env, true));
     return full_ldub_code(env, addr, oi, 0);
 }
 
 static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr)
+                               MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_TEUW, true, full_lduw_code);
 }
 
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 {
-    TCGMemOpIdx oi = make_memop_idx(MO_TEUW, cpu_mmu_index(env, true));
+    MemOpIdx oi = make_memop_idx(MO_TEUW, cpu_mmu_index(env, true));
     return full_lduw_code(env, addr, oi, 0);
 }
 
 static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_TEUL, true, full_ldl_code);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
 {
-    TCGMemOpIdx oi = make_memop_idx(MO_TEUL, cpu_mmu_index(env, true));
+    MemOpIdx oi = make_memop_idx(MO_TEUL, cpu_mmu_index(env, true));
     return full_ldl_code(env, addr, oi, 0);
 }
 
 static uint64_t full_ldq_code(CPUArchState *env, target_ulong addr,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
+                              MemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_TEQ, true, full_ldq_code);
 }
 
 uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
 {
-    TCGMemOpIdx oi = make_memop_idx(MO_TEQ, cpu_mmu_index(env, true));
+    MemOpIdx oi = make_memop_idx(MO_TEQ, cpu_mmu_index(env, true));
     return full_ldq_code(env, addr, oi, 0);
 }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index f17b75e0aa..eb672eae3a 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1204,7 +1204,7 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
  * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
  */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, int size, int prot,
+                               MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
     MemOp mop = get_memop(oi);
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 26f79f9141..13d1e3f808 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -531,8 +531,8 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
     clear_helper_retaddr();
 #else
     int mem_idx = cpu_mmu_index(env, false);
-    TCGMemOpIdx oi0 = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
-    TCGMemOpIdx oi1 = make_memop_idx(MO_LEQ, mem_idx);
+    MemOpIdx oi0 = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
+    MemOpIdx oi1 = make_memop_idx(MO_LEQ, mem_idx);
 
     o0 = helper_le_ldq_mmu(env, addr + 0, oi0, ra);
     o1 = helper_le_ldq_mmu(env, addr + 8, oi1, ra);
@@ -555,7 +555,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
     uintptr_t ra = GETPC();
     bool success;
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
 
     assert(HAVE_CMPXCHG128);
 
@@ -601,8 +601,8 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
     clear_helper_retaddr();
 #else
     int mem_idx = cpu_mmu_index(env, false);
-    TCGMemOpIdx oi0 = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
-    TCGMemOpIdx oi1 = make_memop_idx(MO_BEQ, mem_idx);
+    MemOpIdx oi0 = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
+    MemOpIdx oi1 = make_memop_idx(MO_BEQ, mem_idx);
 
     o1 = helper_be_ldq_mmu(env, addr + 0, oi0, ra);
     o0 = helper_be_ldq_mmu(env, addr + 8, oi1, ra);
@@ -625,7 +625,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
     uintptr_t ra = GETPC();
     bool success;
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
 
     assert(HAVE_CMPXCHG128);
 
@@ -651,7 +651,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     Int128 oldv, cmpv, newv;
     uintptr_t ra = GETPC();
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
 
     assert(HAVE_CMPXCHG128);
 
@@ -672,7 +672,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
     Int128 oldv, cmpv, newv;
     uintptr_t ra = GETPC();
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
 
     assert(HAVE_CMPXCHG128);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 20761c9487..efb522dc44 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1930,7 +1930,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
 
     {
         bool threadmode, spsel;
-        TCGMemOpIdx oi;
+        MemOpIdx oi;
         ARMMMUIdx mmu_idx;
         uint32_t *frame_sp_p;
         uint32_t frameptr;
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 2da3cd14b6..0fd696f9c1 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -67,7 +67,7 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
     {
         uintptr_t ra = GETPC();
         int mem_idx = cpu_mmu_index(env, false);
-        TCGMemOpIdx oi = make_memop_idx(MO_TEQ, mem_idx);
+        MemOpIdx oi = make_memop_idx(MO_TEQ, mem_idx);
         oldv = cpu_atomic_cmpxchgq_le_mmu(env, a0, cmpv, newv, oi, ra);
     }
 
@@ -136,7 +136,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
 
         int mem_idx = cpu_mmu_index(env, false);
-        TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+        MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
         Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
 
         if (int128_eq(oldv, cmpv)) {
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d006d1cb3e..5918a29516 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -785,7 +785,7 @@ static void do_cas2l(CPUM68KState *env, uint32_t regs, uint32_t a1, uint32_t a2,
     uintptr_t ra = GETPC();
 #if defined(CONFIG_ATOMIC64)
     int mmu_idx = cpu_mmu_index(env, 0);
-    TCGMemOpIdx oi = make_memop_idx(MO_BEQ, mmu_idx);
+    MemOpIdx oi = make_memop_idx(MO_BEQ, mmu_idx);
 #endif
 
     if (parallel) {
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 04af54f66d..167d9a591c 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -8211,9 +8211,9 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #define DF_ELEMENTS(df) (MSA_WRLEN / DF_BITS(df))
 
 #if !defined(CONFIG_USER_ONLY)
-#define MEMOP_IDX(DF)                                           \
-        TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
-                                        cpu_mmu_index(env, false));
+#define MEMOP_IDX(DF)                                                   \
+    MemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,                 \
+                                 cpu_mmu_index(env, false));
 #else
 #define MEMOP_IDX(DF)
 #endif
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 21a4de4067..ec88f5dbb0 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -238,7 +238,7 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
     g_assert(haddr);
     memset(haddr, byte, size);
 #else
-    TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
     int i;
 
     if (likely(haddr)) {
@@ -281,7 +281,7 @@ static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
 #ifdef CONFIG_USER_ONLY
     return ldub_p(*haddr + offset);
 #else
-    TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
     uint8_t byte;
 
     if (likely(*haddr)) {
@@ -315,7 +315,7 @@ static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
 #ifdef CONFIG_USER_ONLY
     stb_p(*haddr + offset, byte);
 #else
-    TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
 
     if (likely(*haddr)) {
         stb_p(*haddr + offset, byte);
@@ -1803,7 +1803,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
     Int128 cmpv = int128_make128(env->regs[r1 + 1], env->regs[r1]);
     Int128 newv = int128_make128(env->regs[r3 + 1], env->regs[r3]);
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     Int128 oldv;
     bool fail;
 
@@ -1883,7 +1883,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 uint32_t *haddr = g2h(env_cpu(env), a1);
                 ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
 #else
-                TCGMemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mem_idx);
                 ov = cpu_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi, ra);
 #endif
             } else {
@@ -1903,7 +1903,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
 
             if (parallel) {
 #ifdef CONFIG_ATOMIC64
-                TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN, mem_idx);
                 ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
 #else
                 /* Note that we asserted !parallel above.  */
@@ -1939,7 +1939,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 cpu_stq_data_ra(env, a1 + 0, int128_gethi(nv), ra);
                 cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
             } else if (HAVE_CMPXCHG128) {
-                TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
                 ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
                 cc = !int128_eq(ov, cv);
             } else {
@@ -1978,7 +1978,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 cpu_stq_data_ra(env, a2 + 0, svh, ra);
                 cpu_stq_data_ra(env, a2 + 8, svl, ra);
             } else if (HAVE_ATOMIC128) {
-                TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
                 Int128 sv = int128_make128(svl, svh);
                 cpu_atomic_sto_be_mmu(env, a2, sv, oi, ra);
             } else {
@@ -2474,7 +2474,7 @@ uint64_t HELPER(lpq_parallel)(CPUS390XState *env, uint64_t addr)
     uintptr_t ra = GETPC();
     uint64_t hi, lo;
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     Int128 v;
 
     assert(HAVE_ATOMIC128);
@@ -2505,7 +2505,7 @@ void HELPER(stpq_parallel)(CPUS390XState *env, uint64_t addr,
 {
     uintptr_t ra = GETPC();
     int mem_idx;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     Int128 v;
 
     assert(HAVE_ATOMIC128);
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 69b812e68c..5c558d312a 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1313,7 +1313,7 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
     case ASI_SNF:
     case ASI_SNFL:
         {
-            TCGMemOpIdx oi;
+            MemOpIdx oi;
             int idx = (env->pstate & PS_PRIV
                        ? (asi & 1 ? MMU_KERNEL_SECONDARY_IDX : MMU_KERNEL_IDX)
                        : (asi & 1 ? MMU_USER_SECONDARY_IDX : MMU_USER_IDX));
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9876ac52a8..c239c3bd07 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1023,7 +1023,7 @@ void tcg_optimize(TCGContext *s)
 
         CASE_OP_32_64(qemu_ld):
             {
-                TCGMemOpIdx oi = op->args[nb_oargs + nb_iargs];
+                MemOpIdx oi = op->args[nb_oargs + nb_iargs];
                 MemOp mop = get_memop(oi);
                 if (!(mop & MO_SIGN)) {
                     mask = (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e01f68f44d..e1490c372e 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2797,7 +2797,7 @@ static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,
                          MemOp memop, TCGArg idx)
 {
-    TCGMemOpIdx oi = make_memop_idx(memop, idx);
+    MemOpIdx oi = make_memop_idx(memop, idx);
 #if TARGET_LONG_BITS == 32
     tcg_gen_op3i_i32(opc, val, addr, oi);
 #else
@@ -2812,7 +2812,7 @@ static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,
 static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
                          MemOp memop, TCGArg idx)
 {
-    TCGMemOpIdx oi = make_memop_idx(memop, idx);
+    MemOpIdx oi = make_memop_idx(memop, idx);
 #if TARGET_LONG_BITS == 32
     if (TCG_TARGET_REG_BITS == 32) {
         tcg_gen_op4i_i32(opc, TCGV_LOW(val), TCGV_HIGH(val), addr, oi);
@@ -3132,7 +3132,7 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
         tcg_temp_free_i32(t1);
     } else {
         gen_atomic_cx_i32 gen;
-        TCGMemOpIdx oi;
+        MemOpIdx oi;
 
         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
@@ -3171,7 +3171,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
     } else if ((memop & MO_SIZE) == MO_64) {
 #ifdef CONFIG_ATOMIC64
         gen_atomic_cx_i64 gen;
-        TCGMemOpIdx oi;
+        MemOpIdx oi;
 
         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
@@ -3227,7 +3227,7 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
                              TCGArg idx, MemOp memop, void * const table[])
 {
     gen_atomic_op_i32 gen;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
@@ -3269,7 +3269,7 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
     if ((memop & MO_SIZE) == MO_64) {
 #ifdef CONFIG_ATOMIC64
         gen_atomic_op_i64 gen;
-        TCGMemOpIdx oi;
+        MemOpIdx oi;
 
         gen = table[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4142d42d77..658be0c6b6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1910,7 +1910,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             case INDEX_op_qemu_ld_i64:
             case INDEX_op_qemu_st_i64:
                 {
-                    TCGMemOpIdx oi = op->args[k++];
+                    MemOpIdx oi = op->args[k++];
                     MemOp op = get_memop(oi);
                     unsigned ix = get_mmuidx(oi);
 
diff --git a/tcg/tci.c b/tcg/tci.c
index b672c7cae5..5c08dc0a9a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -61,7 +61,7 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
  *   i = immediate (uint32_t)
  *   I = immediate (tcg_target_ulong)
  *   l = label or pointer
- *   m = immediate (TCGMemOpIdx)
+ *   m = immediate (MemOpIdx)
  *   n = immediate (call return length)
  *   r = register
  *   s = signed ldst offset
@@ -105,7 +105,7 @@ static void tci_args_ri(uint32_t insn, TCGReg *r0, tcg_target_ulong *i1)
 }
 
 static void tci_args_rrm(uint32_t insn, TCGReg *r0,
-                         TCGReg *r1, TCGMemOpIdx *m2)
+                         TCGReg *r1, MemOpIdx *m2)
 {
     *r0 = extract32(insn, 8, 4);
     *r1 = extract32(insn, 12, 4);
@@ -145,7 +145,7 @@ static void tci_args_rrrc(uint32_t insn,
 }
 
 static void tci_args_rrrm(uint32_t insn,
-                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGMemOpIdx *m3)
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, MemOpIdx *m3)
 {
     *r0 = extract32(insn, 8, 4);
     *r1 = extract32(insn, 12, 4);
@@ -289,7 +289,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 }
 
 static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
-                            TCGMemOpIdx oi, const void *tb_ptr)
+                            MemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
     uintptr_t ra = (uintptr_t)tb_ptr;
@@ -374,7 +374,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
 }
 
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
-                        TCGMemOpIdx oi, const void *tb_ptr)
+                        MemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
     uintptr_t ra = (uintptr_t)tb_ptr;
@@ -482,7 +482,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
         uint64_t T1, T2;
-        TCGMemOpIdx oi;
+        MemOpIdx oi;
         int32_t ofs;
         void *ptr;
 
@@ -1148,7 +1148,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     tcg_target_ulong i1;
     int32_t s2;
     TCGCond c;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     uint8_t pos, len;
     void *ptr;
 
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 6c0339f610..ebaa793464 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -14,7 +14,7 @@
  */
 
 static uint16_t atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
-                                     TCGMemOpIdx oi)
+                                     MemOpIdx oi)
 {
     CPUState *cpu = env_cpu(env);
     uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
@@ -34,7 +34,7 @@ static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
 
 #if HAVE_ATOMIC128
 static uint16_t atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi)
+                                    MemOpIdx oi)
 {
     uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
 
@@ -50,7 +50,7 @@ static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
 }
 
 static uint16_t atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
-                                    TCGMemOpIdx oi)
+                                    MemOpIdx oi)
 {
     uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), true);
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 6f43c048a5..5edca8d44d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1545,7 +1545,7 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
 #include "../tcg-ldst.c.inc"
 
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     TCGMemOpIdx oi, uintptr_t ra)
+ *                                     MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_ld_helpers[MO_SIZE + 1] = {
     [MO_8]  = helper_ret_ldub_mmu,
@@ -1561,7 +1561,7 @@ static void * const qemu_ld_helpers[MO_SIZE + 1] = {
 };
 
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, TCGMemOpIdx oi,
+ *                                     uintxx_t val, MemOpIdx oi,
  *                                     uintptr_t ra)
  */
 static void * const qemu_st_helpers[MO_SIZE + 1] = {
@@ -1586,7 +1586,7 @@ static inline void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
     MemOp size = opc & MO_SIZE;
 
@@ -1611,7 +1611,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
     MemOp size = opc & MO_SIZE;
 
@@ -1629,7 +1629,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
                                 TCGType ext, TCGReg data_reg, TCGReg addr_reg,
                                 tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
 {
@@ -1778,7 +1778,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 }
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            TCGMemOpIdx oi, TCGType ext)
+                            MemOpIdx oi, TCGType ext)
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
@@ -1803,7 +1803,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            TCGMemOpIdx oi)
+                            MemOpIdx oi)
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8939b2c2da..cbe3057a9d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1588,7 +1588,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi, TCGReg addrlo,
                                 TCGReg addrhi, tcg_insn_unit *raddr,
                                 tcg_insn_unit *label_ptr)
@@ -1608,7 +1608,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg argreg, datalo, datahi;
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
     void *func;
 
@@ -1672,7 +1672,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg argreg, datalo, datahi;
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1801,7 +1801,7 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
@@ -1906,7 +1906,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
 static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5fd4e4392f..1e42a877fb 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1740,7 +1740,7 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
  * for a load or store, so that we can later generate the correct helper code
  */
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
-                                TCGMemOpIdx oi,
+                                MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
                                 tcg_insn_unit *raddr,
@@ -1767,7 +1767,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
  */
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    TCGMemOpIdx oi = l->oi;
+    MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
@@ -1852,7 +1852,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  */
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    TCGMemOpIdx oi = l->oi;
+    MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
@@ -2053,7 +2053,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
@@ -2142,7 +2142,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index cc279205d6..02dc4b63ae 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1140,7 +1140,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
  * Clobbers TMP0, TMP1, TMP2, TMP3.
  */
 static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
-                             TCGReg addrh, TCGMemOpIdx oi,
+                             TCGReg addrh, MemOpIdx oi,
                              tcg_insn_unit *label_ptr[2], bool is_load)
 {
     MemOp opc = get_memop(oi);
@@ -1216,7 +1216,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrl);
 }
 
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
                                 TCGType ext,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
@@ -1241,7 +1241,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    TCGMemOpIdx oi = l->oi;
+    MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     TCGReg v0;
     int i;
@@ -1295,7 +1295,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    TCGMemOpIdx oi = l->oi;
+    MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
     int i;
@@ -1454,7 +1454,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
@@ -1556,7 +1556,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3fef2aa6b2..2d4ca1f445 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2088,7 +2088,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
                                 TCGReg datalo_reg, TCGReg datahi_reg,
                                 TCGReg addrlo_reg, TCGReg addrhi_reg,
                                 tcg_insn_unit *raddr, tcg_insn_unit *lptr)
@@ -2107,7 +2107,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
     TCGReg hi, lo, arg = TCG_REG_R3;
 
@@ -2154,7 +2154,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
     TCGReg hi, lo, arg = TCG_REG_R3;
@@ -2218,7 +2218,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg datalo, datahi, addrlo, rbase;
     TCGReg addrhi __attribute__((unused));
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc, s_bits;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
@@ -2293,7 +2293,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg datalo, datahi, addrlo, rbase;
     TCGReg addrhi __attribute__((unused));
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc, s_bits;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6264e58b3a..c1b0c3764d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -850,7 +850,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 #include "../tcg-ldst.c.inc"
 
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     TCGMemOpIdx oi, uintptr_t ra)
+ *                                     MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
     [MO_UB] = helper_ret_ldub_mmu,
@@ -875,7 +875,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
 };
 
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, TCGMemOpIdx oi,
+ *                                     uintxx_t val, MemOpIdx oi,
  *                                     uintptr_t ra)
  */
 static void * const qemu_st_helpers[MO_SIZE + 1] = {
@@ -906,7 +906,7 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 }
 
 static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
-                             TCGReg addrh, TCGMemOpIdx oi,
+                             TCGReg addrh, MemOpIdx oi,
                              tcg_insn_unit **label_ptr, bool is_load)
 {
     MemOp opc = get_memop(oi);
@@ -959,7 +959,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
 }
 
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
                                 TCGType ext,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
@@ -980,7 +980,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    TCGMemOpIdx oi = l->oi;
+    MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     TCGReg a0 = tcg_target_call_iarg_regs[0];
     TCGReg a1 = tcg_target_call_iarg_regs[1];
@@ -1012,7 +1012,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    TCGMemOpIdx oi = l->oi;
+    MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
     TCGReg a0 = tcg_target_call_iarg_regs[0];
@@ -1104,7 +1104,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
@@ -1173,7 +1173,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 67a2ba5ff3..fd0b3316d2 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1547,7 +1547,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
     return addr_reg;
 }
 
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
                                 TCGReg data, TCGReg addr,
                                 tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
 {
@@ -1565,7 +1565,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg addr_reg = lb->addrlo_reg;
     TCGReg data_reg = lb->datalo_reg;
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
@@ -1590,7 +1590,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg addr_reg = lb->addrlo_reg;
     TCGReg data_reg = lb->datalo_reg;
-    TCGMemOpIdx oi = lb->oi;
+    MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
@@ -1644,7 +1644,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            TCGMemOpIdx oi)
+                            MemOpIdx oi)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1671,7 +1671,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            TCGMemOpIdx oi)
+                            MemOpIdx oi)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index b9bce29282..0e3f460584 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1140,7 +1140,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            TCGMemOpIdx oi, bool is_64)
+                            MemOpIdx oi, bool is_64)
 {
     MemOp memop = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1222,7 +1222,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
-                            TCGMemOpIdx oi)
+                            MemOpIdx oi)
 {
     MemOp memop = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index c3ce88e69d..6c6848d034 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -22,7 +22,7 @@
 
 typedef struct TCGLabelQemuLdst {
     bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    TCGMemOpIdx oi;
+    MemOpIdx oi;
     TCGType type;           /* result type of a load */
     TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
     TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-- 
2.25.1


