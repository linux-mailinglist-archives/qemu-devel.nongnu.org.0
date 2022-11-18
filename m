Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF362F1F6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxz2-0007SL-9Z; Fri, 18 Nov 2022 04:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyy-0007RR-W6
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:25 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyu-00021s-G7
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:24 -0500
Received: by mail-pf1-x433.google.com with SMTP id y203so4394609pfb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=akD4L3MOoGlRYA3uHiEfsrTB30qu1a8omZVJ5P37pGk=;
 b=cEBVz9x0zI63IDzfbLjmhtC6xDbHmZZBWSPT+DWmp20OBKBWf9jvEGjkimMySv3xQQ
 tVeIcEI/A3IYo9l8DUT6WxdraIvVNLpYETG9W7h4YhQTsoIH66ibwjTNacwxGBM/ygqV
 Sv+xIvLGGtj+SKWCzmDF+U0Qwtxn3lqMJHUVJdHnOhJ3C7oVt2jjqBqHRejoXQzVe+nm
 wxbXBRw9d3M7dKlzjX4h/MEeVq6ul4qTYw3wroceKuoC7NlhzTSdYL7/BTYFV4eEJrf6
 S2adxPTw6zNxtHKdOoI3vYj8SrpoOBhnlEFH17gfCGa2ORgNC42BnPQOrthvqogmqPk5
 qt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=akD4L3MOoGlRYA3uHiEfsrTB30qu1a8omZVJ5P37pGk=;
 b=YRcoblzZYWV0xF4V44Hs4DgwFP7HOibqfG/64pjR1qoiMNFnY7qk3JVv7wwtdDFw5z
 q5Vwqt/pEByYHw+IlhsG6hdMwn2sV4ySyMKidGAj8hJeIsYBdbCuFEx17JStj1JYzh6d
 kBaGWEDV758l+hrEmrO4P/bMGHf6OQ/N+MroRk8tvbZmKWgh3K4CyolstcjpcYPCg6Ci
 MpxotDGGLsWZcmOgWyE6axgcRVzG6qpzZuHucVvTkBHrNUeecMuyXU4cwYQ7QbXd4Xgl
 RxSWS0U3+r+jQM4Rs2rVKhCUfOXZFJrYG8Vc7LYlO2KEF8lkAdpe7erf4OOqdBF1pPxl
 OkdQ==
X-Gm-Message-State: ANoB5pm3YN5jV5E65l3e8iuifb/U92skR4dex9K12DiUWPOOlshUhiqY
 f+jIuL2pHTz4GWQ61q8Lrh8pajgVJVWaMQ==
X-Google-Smtp-Source: AA0mqf4hBi5fdqGjqNAcNKpjUXqUoUdyo7zqRCBkLKU9H142xM1mwvWCsclRa3+tS0nh4F7CRYGAXQ==
X-Received: by 2002:a65:6118:0:b0:476:d2e9:778e with SMTP id
 z24-20020a656118000000b00476d2e9778emr5870331pgu.309.1668764898982; 
 Fri, 18 Nov 2022 01:48:18 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 10/29] tcg: Unify helper_{be,le}_{ld,st}*
Date: Fri, 18 Nov 2022 01:47:35 -0800
Message-Id: <20221118094754.242910-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With the current structure of cputlb.c, there is no difference
between the little-endian and big-endian entry points, aside
from the assert.  Unify the pairs of functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h           |  60 ++++------
 accel/tcg/cputlb.c               | 190 ++++++++++---------------------
 docs/devel/loads-stores.rst      |  36 ++----
 tcg/aarch64/tcg-target.c.inc     |  39 +++----
 tcg/arm/tcg-target.c.inc         |  45 +++-----
 tcg/i386/tcg-target.c.inc        |  40 +++----
 tcg/loongarch64/tcg-target.c.inc |  25 ++--
 tcg/mips/tcg-target.c.inc        |  40 +++----
 tcg/ppc/tcg-target.c.inc         |  30 ++---
 tcg/riscv/tcg-target.c.inc       |  51 +++------
 tcg/s390x/tcg-target.c.inc       |  38 +++----
 tcg/sparc64/tcg-target.c.inc     |  37 +++---
 12 files changed, 226 insertions(+), 405 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..56fa7afe5e 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -28,47 +28,31 @@
 #ifdef CONFIG_SOFTMMU
 
 /* Value zero-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t retaddr);
 
 /* Value sign-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
-                        MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
 
 #else
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 69f8a25a7f..3d32adc0e7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1980,25 +1980,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     cpu_loop_exit_atomic(env_cpu(env), retaddr);
 }
 
-/*
- * Verify that we have passed the correct MemOp to the correct function.
- *
- * In the case of the helper_*_mmu functions, we will have done this by
- * using the MemOp to look up the helper during code generation.
- *
- * In the case of the cpu_*_mmu functions, this is up to the caller.
- * We could present one function to target code, and dispatch based on
- * the MemOp, but so far we have worked hard to avoid an indirect function
- * call along the memory path.
- */
-static void validate_memop(MemOpIdx oi, MemOp expected)
-{
-#ifdef CONFIG_DEBUG_TCG
-    MemOp have = get_memop(oi) & (MO_SIZE | MO_BSWAP);
-    assert(have == expected);
-#endif
-}
-
 /*
  * Load Helpers
  *
@@ -2215,10 +2196,10 @@ static uint8_t do_ld1_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return do_ld_1(env, &l.page[0], l.mmu_idx, access_type, ra);
 }
 
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_UB);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_8);
     return do_ld1_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2261,17 +2242,10 @@ static uint16_t do_ld2_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return ret;
 }
 
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUW);
-    return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
-}
-
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_16);
     return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2310,17 +2284,10 @@ static uint32_t do_ld4_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return ret;
 }
 
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUL);
-    return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
-}
-
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_32);
     return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2359,17 +2326,10 @@ static uint64_t do_ld8_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return ret;
 }
 
-uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr)
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUQ);
-    return do_ld8_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
-}
-
-uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUQ);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_64);
     return do_ld8_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2378,35 +2338,22 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
  * avoid this for 64-bit data, or for 32-bit data on 32-bit host.
  */
 
-
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    return (int8_t)helper_ret_ldub_mmu(env, addr, oi, retaddr);
+    return (int8_t)helper_ldub_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    return (int16_t)helper_le_lduw_mmu(env, addr, oi, retaddr);
+    return (int16_t)helper_lduw_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    return (int16_t)helper_be_lduw_mmu(env, addr, oi, retaddr);
-}
-
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    return (int32_t)helper_le_ldul_mmu(env, addr, oi, retaddr);
-}
-
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    return (int32_t)helper_be_ldul_mmu(env, addr, oi, retaddr);
+    return (int32_t)helper_ldul_mmu(env, addr, oi, retaddr);
 }
 
 /*
@@ -2422,7 +2369,7 @@ uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
 {
     uint8_t ret;
 
-    validate_memop(oi, MO_UB);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_UB);
     ret = do_ld1_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2433,7 +2380,7 @@ uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint16_t ret;
 
-    validate_memop(oi, MO_BEUW);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUW);
     ret = do_ld2_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2444,7 +2391,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint32_t ret;
 
-    validate_memop(oi, MO_BEUL);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUL);
     ret = do_ld4_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2455,7 +2402,7 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint64_t ret;
 
-    validate_memop(oi, MO_BEUQ);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUQ);
     ret = do_ld8_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2466,7 +2413,7 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint16_t ret;
 
-    validate_memop(oi, MO_LEUW);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUW);
     ret = do_ld2_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2477,7 +2424,7 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint32_t ret;
 
-    validate_memop(oi, MO_LEUL);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUL);
     ret = do_ld4_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2488,7 +2435,7 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint64_t ret;
 
-    validate_memop(oi, MO_LEUQ);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUQ);
     ret = do_ld8_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2516,8 +2463,8 @@ Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    h = helper_be_ldq_mmu(env, addr, new_oi, ra);
-    l = helper_be_ldq_mmu(env, addr + 8, new_oi, ra);
+    h = helper_ldq_mmu(env, addr, new_oi, ra);
+    l = helper_ldq_mmu(env, addr + 8, new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return int128_make128(l, h);
@@ -2545,8 +2492,8 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    l = helper_le_ldq_mmu(env, addr, new_oi, ra);
-    h = helper_le_ldq_mmu(env, addr + 8, new_oi, ra);
+    l = helper_ldq_mmu(env, addr, new_oi, ra);
+    h = helper_ldq_mmu(env, addr + 8, new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return int128_make128(l, h);
@@ -2754,13 +2701,13 @@ static void do_st_1(CPUArchState *env, MMULookupPageData *p, uint8_t val,
     }
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
-                        MemOpIdx oi, uintptr_t ra)
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
     bool crosspage;
 
-    validate_memop(oi, MO_UB);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_8);
     crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
     tcg_debug_assert(!crosspage);
 
@@ -2802,17 +2749,10 @@ static void do_st2_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
     }
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUW);
-    do_st2_mmu(env, addr, val, oi, retaddr);
-}
-
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_16);
     do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
@@ -2848,17 +2788,10 @@ static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
     }
 }
 
-void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUL);
-    do_st4_mmu(env, addr, val, oi, retaddr);
-}
-
-void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_32);
     do_st4_mmu(env, addr, val, oi, retaddr);
 }
 
@@ -2894,17 +2827,10 @@ static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     }
 }
 
-void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUQ);
-    do_st8_mmu(env, addr, val, oi, retaddr);
-}
-
-void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUQ);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_64);
     do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
@@ -2920,49 +2846,55 @@ static void plugin_store_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 void cpu_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                  MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_ret_stb_mmu(env, addr, val, oi, retaddr);
+    helper_stb_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_be_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_be_stw_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_be_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_be_stl_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_be_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_be_stq_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_le_stw_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_le_stl_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_le_stq_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
@@ -2987,8 +2919,8 @@ void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    helper_be_stq_mmu(env, addr, int128_gethi(val), new_oi, ra);
-    helper_be_stq_mmu(env, addr + 8, int128_getlo(val), new_oi, ra);
+    helper_stq_mmu(env, addr, int128_gethi(val), new_oi, ra);
+    helper_stq_mmu(env, addr + 8, int128_getlo(val), new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -3014,8 +2946,8 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    helper_le_stq_mmu(env, addr, int128_getlo(val), new_oi, ra);
-    helper_le_stq_mmu(env, addr + 8, int128_gethi(val), new_oi, ra);
+    helper_stq_mmu(env, addr, int128_getlo(val), new_oi, ra);
+    helper_stq_mmu(env, addr + 8, int128_gethi(val), new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index ad5dfe133e..d2cefc77a2 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -297,31 +297,20 @@ swap: ``translator_ld{sign}{size}_swap(env, ptr, swap)``
 Regexes for git grep
  - ``\<translator_ld[us]\?[bwlq]\(_swap\)\?\>``
 
-``helper_*_{ld,st}*_mmu``
+``helper_{ld,st}*_mmu``
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These functions are intended primarily to be called by the code
-generated by the TCG backend. They may also be called by target
-CPU helper function code. Like the ``cpu_{ld,st}_mmuidx_ra`` functions
-they perform accesses by guest virtual address, with a given ``mmuidx``.
+generated by the TCG backend.  Like the ``cpu_{ld,st}_mmu`` functions
+they perform accesses by guest virtual address, with a given ``MemOpIdx``.
 
-These functions specify an ``opindex`` parameter which encodes
-(among other things) the mmu index to use for the access.  This parameter
-should be created by calling ``make_memop_idx()``.
+They differ from ``cpu_{ld,st}_mmu`` in that they take the endianness
+of the operation only from the MemOpIdx, and loads extend the return
+value to the size of a host general register (``tcg_target_ulong``).
 
-The ``retaddr`` parameter should be the result of GETPC() called directly
-from the top level HELPER(foo) function (or 0 if no guest CPU state
-unwinding is required).
+load: ``helper_ld{sign}{size}_mmu(env, addr, opindex, retaddr)``
 
-**TODO** The names of these functions are a bit odd for historical
-reasons because they were originally expected to be called only from
-within generated code. We should rename them to bring them more in
-line with the other memory access functions. The explicit endianness
-is the only feature they have beyond ``*_mmuidx_ra``.
-
-load: ``helper_{endian}_ld{sign}{size}_mmu(env, addr, opindex, retaddr)``
-
-store: ``helper_{endian}_st{size}_mmu(env, addr, val, opindex, retaddr)``
+store: ``helper_{size}_mmu(env, addr, val, opindex, retaddr)``
 
 ``sign``
  - (empty) : for 32 or 64 bit sizes
@@ -334,14 +323,9 @@ store: ``helper_{endian}_st{size}_mmu(env, addr, val, opindex, retaddr)``
  - ``l`` : 32 bits
  - ``q`` : 64 bits
 
-``endian``
- - ``le`` : little endian
- - ``be`` : big endian
- - ``ret`` : target endianness
-
 Regexes for git grep
- - ``\<helper_\(le\|be\|ret\)_ld[us]\?[bwlq]_mmu\>``
- - ``\<helper_\(le\|be\|ret\)_st[bwlq]_mmu\>``
+ - ``\<helper_ld[us]\?[bwlq]_mmu\>``
+ - ``\<helper_st[bwlq]_mmu\>``
 
 ``address_space_*``
 ~~~~~~~~~~~~~~~~~~~
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index dfe569dd8c..001a71bbc0 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1564,37 +1564,26 @@ static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
 }
 
 #ifdef CONFIG_SOFTMMU
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     MemOpIdx oi, uintptr_t ra)
+/*
+ * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
+ *                                  MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_ld_helpers[MO_SIZE + 1] = {
-    [MO_8]  = helper_ret_ldub_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_lduw_mmu,
-    [MO_32] = helper_be_ldul_mmu,
-    [MO_64] = helper_be_ldq_mmu,
-#else
-    [MO_16] = helper_le_lduw_mmu,
-    [MO_32] = helper_le_ldul_mmu,
-    [MO_64] = helper_le_ldq_mmu,
-#endif
+    [MO_8]  = helper_ldub_mmu,
+    [MO_16] = helper_lduw_mmu,
+    [MO_32] = helper_ldul_mmu,
+    [MO_64] = helper_ldq_mmu,
 };
 
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, MemOpIdx oi,
- *                                     uintptr_t ra)
+/*
+ * helper signature: helper_st*_mmu(CPUState *env, target_ulong addr,
+ *                                  uintxx_t val, MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_8]  = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_stw_mmu,
-    [MO_32] = helper_be_stl_mmu,
-    [MO_64] = helper_be_stq_mmu,
-#else
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-#endif
+    [MO_8]  = helper_stb_mmu,
+    [MO_16] = helper_stw_mmu,
+    [MO_32] = helper_stl_mmu,
+    [MO_64] = helper_stq_mmu,
 };
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index add90ddeb4..1f89745c86 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1300,41 +1300,26 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
 }
 
 #ifdef CONFIG_SOFTMMU
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     int mmu_idx, uintptr_t ra)
+/*
+ * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
+ *                                  int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_UW] = helper_be_lduw_mmu,
-    [MO_UL] = helper_be_ldul_mmu,
-    [MO_UQ] = helper_be_ldq_mmu,
-    [MO_SW] = helper_be_ldsw_mmu,
-    [MO_SL] = helper_be_ldul_mmu,
-#else
-    [MO_UW] = helper_le_lduw_mmu,
-    [MO_UL] = helper_le_ldul_mmu,
-    [MO_UQ] = helper_le_ldq_mmu,
-    [MO_SW] = helper_le_ldsw_mmu,
-    [MO_SL] = helper_le_ldul_mmu,
-#endif
+static void * const qemu_ld_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_ldub_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_UQ] = helper_ldq_mmu,
 };
 
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
+/*
+ * helper signature: helper_st*_mmu(CPUState *env, target_ulong addr,
+ *                                  uintxx_t val, int mmu_idx, uintptr_t ra)
  */
 static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_8]   = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_stw_mmu,
-    [MO_32] = helper_be_stl_mmu,
-    [MO_64] = helper_be_stq_mmu,
-#else
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-#endif
+    [MO_8]  = helper_stb_mmu,
+    [MO_16] = helper_stw_mmu,
+    [MO_32] = helper_stl_mmu,
+    [MO_64] = helper_stq_mmu,
 };
 
 /* Helper routines for marshalling helper function arguments into
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1361960156..24e9efe631 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1728,30 +1728,26 @@ static void tcg_out_nopn(TCGContext *s, int n)
 }
 
 #if defined(CONFIG_SOFTMMU)
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     int mmu_idx, uintptr_t ra)
+/*
+ * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
+ *                                  int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
+static void * const qemu_ld_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_ldub_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_UQ] = helper_ldq_mmu,
 };
 
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
+/*
+ * helper signature: helper_st*_mmu(CPUState *env, target_ulong addr,
+ *                                  uintxx_t val, int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_stb_mmu,
+    [MO_UW] = helper_stw_mmu,
+    [MO_UL] = helper_stl_mmu,
+    [MO_UQ] = helper_stq_mmu,
 };
 
 /* Perform the TLB load and compare.
@@ -1926,7 +1922,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
                      (uintptr_t)l->raddr);
     }
 
-    tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_branch(s, 1, qemu_ld_helpers[opc & MO_SIZE]);
 
     data_reg = l->datalo_reg;
     switch (opc & MO_SSIZE) {
@@ -2033,7 +2029,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* "Tail call" to the helper, with the return address back inline.  */
     tcg_out_push(s, retaddr);
-    tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_jmp(s, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
 #else
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f6b0ed00bb..e73b48bd0f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -655,26 +655,25 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
 
 #if defined(CONFIG_SOFTMMU)
 /*
- * helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     MemOpIdx oi, uintptr_t ra)
+ * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
+ *                                  MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_ld_helpers[4] = {
-    [MO_8]  = helper_ret_ldub_mmu,
-    [MO_16] = helper_le_lduw_mmu,
-    [MO_32] = helper_le_ldul_mmu,
-    [MO_64] = helper_le_ldq_mmu,
+    [MO_8]  = helper_ldub_mmu,
+    [MO_16] = helper_lduw_mmu,
+    [MO_32] = helper_ldul_mmu,
+    [MO_64] = helper_ldq_mmu,
 };
 
 /*
- * helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, MemOpIdx oi,
- *                                     uintptr_t ra)
+ * helper signature: helper_st*_mmu(CPUState *env, target_ulong addr,
+ *                                  uintxx_t val, MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_st_helpers[4] = {
-    [MO_8]  = helper_ret_stb_mmu,
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
+    [MO_8]  = helper_stb_mmu,
+    [MO_16] = helper_stw_mmu,
+    [MO_32] = helper_stl_mmu,
+    [MO_64] = helper_stq_mmu,
 };
 
 /* We expect to use a 12-bit negative offset from ENV.  */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 92883176c6..a23e2c409f 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1037,31 +1037,21 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
 }
 
 #if defined(CONFIG_SOFTMMU)
-static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_LESL] = helper_le_ldsl_mmu,
-    [MO_BESL] = helper_be_ldsl_mmu,
-#endif
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
+    [MO_UB] = helper_ldub_mmu,
+    [MO_SB] = helper_ldsb_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_SW] = helper_ldsw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_SL] = helper_ldsl_mmu,
+    [MO_UQ] = helper_ldq_mmu,
 };
 
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_stb_mmu,
+    [MO_UW] = helper_stw_mmu,
+    [MO_UL] = helper_stl_mmu,
+    [MO_UQ] = helper_stq_mmu,
 };
 
 /* Helper routines for marshalling helper function arguments into
@@ -1267,7 +1257,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
     i = tcg_out_call_iarg_imm(s, i, oi);
     i = tcg_out_call_iarg_imm(s, i, (intptr_t)l->raddr);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
     /* delay slot */
     tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
 
@@ -1345,7 +1335,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
        computation to take place in the return address register.  */
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (intptr_t)l->raddr);
     i = tcg_out_call_iarg_reg(s, i, TCG_REG_RA);
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], true);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], true);
     /* delay slot */
     tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
     return true;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e86d4a5e78..3e9fc9bd25 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2052,27 +2052,21 @@ static const uint32_t qemu_exts_opc[4] = {
 /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
  *                                 int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
+static void * const qemu_ld_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_ldub_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_UQ] = helper_ldq_mmu,
 };
 
 /* helper signature: helper_st_mmu(CPUState *env, target_ulong addr,
  *                                 uintxx_t val, int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_stb_mmu,
+    [MO_UW] = helper_stw_mmu,
+    [MO_UL] = helper_stl_mmu,
+    [MO_UQ] = helper_stq_mmu,
 };
 
 /* We expect to use a 16-bit negative offset from ENV.  */
@@ -2234,7 +2228,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
     tcg_out32(s, MFSPR | RT(arg) | LR);
 
-    tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_ld_helpers[opc & MO_SIZE]);
 
     lo = lb->datalo_reg;
     hi = lb->datahi_reg;
@@ -2303,7 +2297,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
     tcg_out32(s, MFSPR | RT(arg) | LR);
 
-    tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_st_helpers[opc & MO_SIZE]);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 417736cae7..7261f15197 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -858,46 +858,29 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  */
 
 #if defined(CONFIG_SOFTMMU)
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     MemOpIdx oi, uintptr_t ra)
+/*
+ * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
+ *                                  MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
-    [MO_UB] = helper_ret_ldub_mmu,
-    [MO_SB] = helper_ret_ldsb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_UW] = helper_be_lduw_mmu,
-    [MO_SW] = helper_be_ldsw_mmu,
-    [MO_UL] = helper_be_ldul_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_SL] = helper_be_ldsl_mmu,
-#endif
-    [MO_UQ] = helper_be_ldq_mmu,
-#else
-    [MO_UW] = helper_le_lduw_mmu,
-    [MO_SW] = helper_le_ldsw_mmu,
-    [MO_UL] = helper_le_ldul_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_SL] = helper_le_ldsl_mmu,
-#endif
-    [MO_UQ] = helper_le_ldq_mmu,
-#endif
+    [MO_UB] = helper_ldub_mmu,
+    [MO_SB] = helper_ldsb_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_SW] = helper_ldsw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_SL] = helper_ldsl_mmu,
+    [MO_UQ] = helper_ldq_mmu,
 };
 
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, MemOpIdx oi,
- *                                     uintptr_t ra)
+/*
+ * helper signature: helper_st*_mmu(CPUState *env, target_ulong addr,
+ *                                  uintxx_t val, MemOpIdx oi, uintptr_t ra)
  */
 static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_8]   = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_stw_mmu,
-    [MO_32] = helper_be_stl_mmu,
-    [MO_64] = helper_be_stq_mmu,
-#else
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-#endif
+    [MO_8]  = helper_stb_mmu,
+    [MO_16] = helper_stw_mmu,
+    [MO_32] = helper_stl_mmu,
+    [MO_64] = helper_stq_mmu,
 };
 
 /* We don't support oversize guests */
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 50655e9d1d..30556c430f 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -438,29 +438,21 @@ static const uint8_t tcg_cond_to_ltr_cond[] = {
 };
 
 #ifdef CONFIG_SOFTMMU
-static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LESL] = helper_le_ldsl_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BESL] = helper_be_ldsl_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
+    [MO_UB] = helper_ldub_mmu,
+    [MO_SB] = helper_ldsb_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_SW] = helper_ldsw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_SL] = helper_ldsl_mmu,
+    [MO_UQ] = helper_ldq_mmu,
 };
 
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
+    [MO_UB] = helper_stb_mmu,
+    [MO_UW] = helper_stw_mmu,
+    [MO_UL] = helper_stl_mmu,
+    [MO_UQ] = helper_stq_mmu,
 };
 #endif
 
@@ -1913,7 +1905,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE]);
     tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
@@ -1954,7 +1946,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 9b5afb8248..f9334b7c56 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -880,8 +880,8 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 }
 
 #ifdef CONFIG_SOFTMMU
-static const tcg_insn_unit *qemu_ld_trampoline[(MO_SSIZE | MO_BSWAP) + 1];
-static const tcg_insn_unit *qemu_st_trampoline[(MO_SIZE | MO_BSWAP) + 1];
+static const tcg_insn_unit *qemu_ld_trampoline[MO_SSIZE + 1];
+static const tcg_insn_unit *qemu_st_trampoline[MO_SIZE + 1];
 
 static void emit_extend(TCGContext *s, TCGReg r, int op)
 {
@@ -907,25 +907,18 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
 static void build_trampolines(TCGContext *s)
 {
     static void * const qemu_ld_helpers[] = {
-        [MO_UB]   = helper_ret_ldub_mmu,
-        [MO_SB]   = helper_ret_ldsb_mmu,
-        [MO_LEUW] = helper_le_lduw_mmu,
-        [MO_LESW] = helper_le_ldsw_mmu,
-        [MO_LEUL] = helper_le_ldul_mmu,
-        [MO_LEUQ] = helper_le_ldq_mmu,
-        [MO_BEUW] = helper_be_lduw_mmu,
-        [MO_BESW] = helper_be_ldsw_mmu,
-        [MO_BEUL] = helper_be_ldul_mmu,
-        [MO_BEUQ] = helper_be_ldq_mmu,
+        [MO_UB] = helper_ldub_mmu,
+        [MO_SB] = helper_ldsb_mmu,
+        [MO_UW] = helper_lduw_mmu,
+        [MO_SW] = helper_ldsw_mmu,
+        [MO_UL] = helper_ldul_mmu,
+        [MO_UQ] = helper_ldq_mmu,
     };
     static void * const qemu_st_helpers[] = {
-        [MO_UB]   = helper_ret_stb_mmu,
-        [MO_LEUW] = helper_le_stw_mmu,
-        [MO_LEUL] = helper_le_stl_mmu,
-        [MO_LEUQ] = helper_le_stq_mmu,
-        [MO_BEUW] = helper_be_stw_mmu,
-        [MO_BEUL] = helper_be_stl_mmu,
-        [MO_BEUQ] = helper_be_stq_mmu,
+        [MO_UB] = helper_stb_mmu,
+        [MO_UW] = helper_stw_mmu,
+        [MO_UL] = helper_stl_mmu,
+        [MO_UQ] = helper_stq_mmu,
     };
 
     int i;
@@ -1196,9 +1189,9 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     /* We use the helpers to extend SB and SW data, leaving the case
        of SL needing explicit extending below.  */
     if ((memop & MO_SSIZE) == MO_SL) {
-        func = qemu_ld_trampoline[memop & (MO_BSWAP | MO_SIZE)];
+        func = qemu_ld_trampoline[MO_UL];
     } else {
-        func = qemu_ld_trampoline[memop & (MO_BSWAP | MO_SSIZE)];
+        func = qemu_ld_trampoline[memop & MO_SSIZE];
     }
     tcg_debug_assert(func != NULL);
     tcg_out_call_nodelay(s, func, false);
@@ -1338,7 +1331,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O2, data);
 
-    func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
+    func = qemu_st_trampoline[memop & MO_SIZE];
     tcg_debug_assert(func != NULL);
     tcg_out_call_nodelay(s, func, false);
     /* delay slot */
-- 
2.34.1


