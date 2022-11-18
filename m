Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996E62F1E6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxz0-0007Rz-UA; Fri, 18 Nov 2022 04:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyy-0007RQ-Ul
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:24 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyw-00022T-Ci
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:24 -0500
Received: by mail-pg1-x52a.google.com with SMTP id f9so348450pgf.7
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ne4IYDfMvK52svuA6NosU3Wb3QAXFhXcoQ7Fx900lGI=;
 b=WcBtWWtI9eOtzVeILfEcnybiEryKFHtu0ohqi+vuCmyCw41kp84g9P+cEtns19h6LF
 P+oXg4Rs7b2dZhVeGKnS3QgI+6L6GVoqNygEF/4aaXxfCbij/4Sh/fKDAIr0WQ5L0Uix
 KmmBMkPHs0aU8uqgFzYL7EKKjZiyvv0vzqWum/Ho44/d2o8QipmEJRJUoKjEQPmEAzwu
 ZQjRPat8vuZkhxPJsLloN0wuXTZaG6NyPtynvY54v6HfJ3glZDXoZ1kVHqdbkuJpZkJ3
 V0TSjTNoMt5xZG+lkC+e/A0UeejhkPw7Vau5lAs+7zkeUdsRGTM7HVDg0sn/3dZIBg3/
 XaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ne4IYDfMvK52svuA6NosU3Wb3QAXFhXcoQ7Fx900lGI=;
 b=dl4Eko8Jt/WRmbImm4TUgxJdHqApKyHQuGZIG1bHcjs+bVrEm0P0RhdZYeQRVo4ubk
 d8rSwq7XNqUcGpUzm96k9lEEgx96bTMG4BFmVqEIScSJblEgzop8+/+mxAElgDNDvZkd
 8PV8LDr9iBfMGldGx0r5bIVR8VI1G/WPrp+pSDrIMBsojRlTh7bRVNF3ngPvtpt+yxAx
 z0RQDHx05DUlVCUI8BUkg9f16fnvjCZ6/jj+M6LA3hGtrG5S3JtvhHbyIQT37+IV9BLh
 GGAn6bPxWNcymHfg3ExyakRJCTrhFzUAQDytG3bAMZSAdJTyLNHEaOrqVGfiJHPSFHAp
 YDeQ==
X-Gm-Message-State: ANoB5pkizv5PsKNkiAUKATrQM/CVv2IvnwVgc660pprua+BKlf+iCivA
 FkLh8e2R9goHZ52qWghgFq1ZCygg0ReYMQ==
X-Google-Smtp-Source: AA0mqf7Ay+TEBfJssqBzm0XK600Fy95g3LX+D2ltFgoj+bc7bQhTrhjru8qe4kniKPRojlEglN10Yg==
X-Received: by 2002:a05:6a00:3004:b0:56c:dba2:30b with SMTP id
 ay4-20020a056a00300400b0056cdba2030bmr6969125pfb.72.1668764901126; 
 Fri, 18 Nov 2022 01:48:21 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 11/29] accel/tcg: Implement helper_{ld,
 st}*_mmu for user-only
Date: Fri, 18 Nov 2022 01:47:36 -0800
Message-Id: <20221118094754.242910-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

TCG backends may need to defer to a helper to implement
the atomicity required by a given operation.  Mirror the
interface used in system mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |   6 +-
 accel/tcg/user-exec.c  | 392 ++++++++++++++++++++++++++++-------------
 2 files changed, 276 insertions(+), 122 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 56fa7afe5e..c1d945fd66 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -25,8 +25,6 @@
 #ifndef TCG_LDST_H
 #define TCG_LDST_H
 
-#ifdef CONFIG_SOFTMMU
-
 /* Value zero-extended to tcg register size.  */
 tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr);
@@ -54,10 +52,10 @@ void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr);
 
-#else
+#ifdef CONFIG_USER_ONLY
 
 G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
 G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
 
-#endif /* CONFIG_SOFTMMU */
+#endif /* CONFIG_USER_ONLY*/
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ddba8c9dd7..3455ff45a4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -254,21 +254,6 @@ void *page_get_target_data(target_ulong address)
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-/*
- * Verify that we have passed the correct MemOp to the correct function.
- *
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
 void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
 {
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
@@ -279,10 +264,9 @@ void helper_unaligned_st(CPUArchState *env, target_ulong addr)
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
 }
 
-static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
-                            MemOpIdx oi, uintptr_t ra, MMUAccessType type)
+static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
+                            MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-    MemOp mop = get_memop(oi);
     int a_bits = get_alignment_bits(mop);
     void *ret;
 
@@ -298,100 +282,206 @@ static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #include "ldst_atomicity.c.inc"
 
-uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
-                    MemOpIdx oi, uintptr_t ra)
+static uint8_t do_ld1_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
     uint8_t ret;
 
-    validate_memop(oi, MO_UB);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    tcg_debug_assert((mop & MO_SIZE) == MO_8);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
     ret = ldub_p(haddr);
     clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    return do_ld1_mmu(env, addr, get_memop(oi), ra);
+}
+
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    return (int8_t)do_ld1_mmu(env, addr, get_memop(oi), ra);
+}
+
+uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    uint8_t ret = do_ld1_mmu(env, addr, get_memop(oi), ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
+static uint16_t do_ld2_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint16_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_16);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_2(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint16_t ret = do_ld2_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int16_t ret = do_ld2_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
 uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint16_t ret;
 
-    validate_memop(oi, MO_BEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_2(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld2_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_be16(ret);
 }
 
-uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
-                        MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-    uint32_t ret;
-
-    validate_memop(oi, MO_BEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_4(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return cpu_to_be32(ret);
-}
-
-uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
-                        MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-    uint64_t ret;
-
-    validate_memop(oi, MO_BEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_8(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return cpu_to_be64(ret);
-}
-
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint16_t ret;
 
-    validate_memop(oi, MO_LEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_2(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld2_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le16(ret);
 }
 
+static uint32_t do_ld4_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint32_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_32);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_4(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint32_t ret = do_ld4_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int32_t ret = do_ld4_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint32_t ret;
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld4_he_mmu(env, addr, mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return cpu_to_be32(ret);
+}
+
 uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint32_t ret;
 
-    validate_memop(oi, MO_LEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_4(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld4_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le32(ret);
 }
 
+static uint64_t do_ld8_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint64_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_64);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_8(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint64_t ret = do_ld8_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint64_t ret;
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld8_he_mmu(env, addr, mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return cpu_to_be64(ret);
+}
+
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint64_t ret;
 
-    validate_memop(oi, MO_LEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_8(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld8_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le64(ret);
 }
@@ -402,7 +492,7 @@ Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     Int128 ret;
 
-    validate_memop(oi, MO_128 | MO_BE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_BE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     memcpy(&ret, haddr, 16);
     clear_helper_retaddr();
@@ -420,7 +510,7 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     Int128 ret;
 
-    validate_memop(oi, MO_128 | MO_LE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_LE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     memcpy(&ret, haddr, 16);
     clear_helper_retaddr();
@@ -432,87 +522,153 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     return ret;
 }
 
-void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
-                 MemOpIdx oi, uintptr_t ra)
+static void do_st1_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                       MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_UB);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    tcg_debug_assert((mop & MO_SIZE) == MO_8);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
     stb_p(haddr, val);
     clear_helper_retaddr();
+}
+
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    do_st1_mmu(env, addr, val, get_memop(oi), ra);
+}
+
+void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                 MemOpIdx oi, uintptr_t ra)
+{
+    do_st1_mmu(env, addr, val, get_memop(oi), ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
+static void do_st2_he_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
+                          MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_16);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_2(env, ra, haddr, mop, val);
+    clear_helper_retaddr();
+}
+
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap16(val);
+    }
+    do_st2_he_mmu(env, addr, val, mop, ra);
+}
+
 void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
                     MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
 
-    validate_memop(oi, MO_BEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_2(env, ra, haddr, get_memop(oi), be16_to_cpu(val));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
-                    MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-
-    validate_memop(oi, MO_BEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_4(env, ra, haddr, get_memop(oi), be32_to_cpu(val));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
-                    MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-
-    validate_memop(oi, MO_BEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_8(env, ra, haddr, get_memop(oi), be64_to_cpu(val));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st2_he_mmu(env, addr, be16_to_cpu(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st2_he_mmu(env, addr, le16_to_cpu(val), mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void do_st4_he_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_LEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_2(env, ra, haddr, get_memop(oi), le16_to_cpu(val));
+    tcg_debug_assert((mop & MO_SIZE) == MO_32);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_4(env, ra, haddr, mop, val);
     clear_helper_retaddr();
+}
+
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap32(val);
+    }
+    do_st4_he_mmu(env, addr, val, mop, ra);
+}
+
+void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st4_he_mmu(env, addr, be32_to_cpu(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st4_he_mmu(env, addr, le32_to_cpu(val), mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void do_st8_he_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_LEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_4(env, ra, haddr, get_memop(oi), le32_to_cpu(val));
+    tcg_debug_assert((mop & MO_SIZE) == MO_64);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_8(env, ra, haddr, mop, val);
     clear_helper_retaddr();
+}
+
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap64(val);
+    }
+    do_st8_he_mmu(env, addr, val, mop, ra);
+}
+
+void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st8_he_mmu(env, addr, cpu_to_be64(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
                     MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
 
-    validate_memop(oi, MO_LEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_8(env, ra, haddr, get_memop(oi), le64_to_cpu(val));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st8_he_mmu(env, addr, cpu_to_le64(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
@@ -521,7 +677,7 @@ void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     void *haddr;
 
-    validate_memop(oi, MO_128 | MO_BE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_BE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     if (!HOST_BIG_ENDIAN) {
         val = bswap128(val);
@@ -536,7 +692,7 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     void *haddr;
 
-    validate_memop(oi, MO_128 | MO_LE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_LE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     if (HOST_BIG_ENDIAN) {
         val = bswap128(val);
-- 
2.34.1


