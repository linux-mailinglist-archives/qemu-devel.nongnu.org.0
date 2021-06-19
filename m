Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7C3ADB1D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:31:49 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueou-0003RZ-Ua
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejq-0003Pt-GJ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejn-0003Yi-6l
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g4so7528583pjk.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtFGj96PfP7GWAslaWvOoNrcvv1JjgMLufaP8rpAh9M=;
 b=kVQEz+iRrG1ddeX20aMv6IL/9ofYbu7qZtUhT+jmioxDR2f714si1hAJ8pgCN1Q9uX
 Q3jTHkee5HUQW9M/Of7+llGBkUVJPQUra/Hktt20KDfCSM/KMR05+s5muYjShUKOQ8b8
 D2sWx7R8d+fZpIdjxYD888uHwvaSwQM/JsQmtNdgRlBrWqQvg37MsUsp1VaGMYXSverW
 MjqI3XRo4Z1uihrp/V9yj1cDFX3a0jWvHnzrBI8shpzhfuV/LO+h2TDwgzWRZxRbREIJ
 qB6tQ7EGJSUQVdtmSvUItdx/Ds0QB5jfbmcF7Ry0WTFnWQ37K5I/akYpc714sAyCGCFc
 cMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtFGj96PfP7GWAslaWvOoNrcvv1JjgMLufaP8rpAh9M=;
 b=lUKrRyC+nA0mNQ/8312TF/VNMn1CchkIrvmSe0eRkzpdNc6bH6F46OyIrJc0fDITb3
 GdRfaWMUzejmoQB2mXTbYtRZAvMvT3x53bOoXDgmOktecha4uWRaolcB/VkbbAvJfa8I
 x0iTIdVmbhhNIoMC4Fv9snRbKEmtN0BzVB90AyBe0MFJuv/ReoXPWdPuFznw/jgkA3/H
 /TSg3JbWF3sXE7hQTTAOeEk+93XawdY8JBNaI+mfPFJ4JhrLB2u2zAojbc88JDNFyNT0
 gQgK5/ki0roIOGOQ66Aq7jkhm/IFZm41vo6nOtasjuZ/FvRqLPhmxODTITdCMXLo+Qhg
 ++Kw==
X-Gm-Message-State: AOAM530dYObEu9PoyGdHjxncNJZp1ri3zLT8SYO42ea/777jv/SK5ToK
 9yErJ8BDiYfyIf0qO4Z0fPepONkUA/xGNQ==
X-Google-Smtp-Source: ABdhPJzGmJZ6nRdMh5mROUDwVd2Et4TLAQdxETUruHVmlJR0V17do1/2zaNeaZForvGLFLRFcoc4LQ==
X-Received: by 2002:a17:902:c403:b029:106:7793:3fcc with SMTP id
 k3-20020a170902c403b029010677933fccmr10016675plk.81.1624123589965; 
 Sat, 19 Jun 2021 10:26:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] accel/tcg: Use byte ops for unaligned loads
Date: Sat, 19 Jun 2021 10:26:14 -0700
Message-Id: <20210619172626.875885-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

If an unaligned load is required then the load is split into
two separate accesses and combined.  This does not work correctly
with MMIO accesses because the I/O subsystem may use a different
endianness than we are expecting.

Use byte loads to obviate I/O endianness.  We already use byte
stores in store_helper_unaligned, so this solution has precedent.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/360
Message-Id: <20210609093528.9616-1-mark.cave-ayland@ilande.co.uk>
[PMD: Extract load_helper_unaligned() in earlier patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210609141010.1066750-3-f4bug@amsat.org>
[rth: Drop all of the stuff we do for stores not required by loads.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 93 ++++++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 57 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a94de90099..ba21487138 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1854,35 +1854,36 @@ load_memop(const void *haddr, MemOp op)
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper_unaligned(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
                       uintptr_t retaddr, MemOp op, bool code_read,
-                      FullLoadHelper *full_load)
+                      FullLoadHelper *byte_load)
 {
+    uintptr_t mmu_idx = get_mmuidx(oi);
     size_t size = memop_size(op);
-    target_ulong addr1, addr2;
-    uint64_t res;
-    uint64_t r1, r2;
-    unsigned shift;
-
-    addr1 = addr & ~((target_ulong)size - 1);
-    addr2 = addr1 + size;
-    r1 = full_load(env, addr1, oi, retaddr);
-    r2 = full_load(env, addr2, oi, retaddr);
-    shift = (addr & (size - 1)) * 8;
+    uint64_t val = 0;
+    int i;
 
+    /* XXX: not efficient, but simple. */
+    oi = make_memop_idx(MO_UB, mmu_idx);
     if (memop_big_endian(op)) {
-        /* Big-endian combine.  */
-        res = (r1 << shift) | (r2 >> ((size * 8) - shift));
+        for (i = 0; i < size; ++i) {
+            /* Big-endian load.  */
+            uint64_t val8 = byte_load(env, addr + i, oi, retaddr);
+            val = (val << 8) | val8;
+        }
     } else {
-        /* Little-endian combine.  */
-        res = (r1 >> shift) | (r2 << ((size * 8) - shift));
+        for (i = 0; i < size; ++i) {
+            /* Little-endian load.  */
+            uint64_t val8 = byte_load(env, addr + i, oi, retaddr);
+            val |= val8 << (i * 8);
+        }
     }
 
-    return res & MAKE_64BIT_MASK(0, size * 8);
+    return val;
 }
 
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
-            FullLoadHelper *full_load)
+            FullLoadHelper *byte_load)
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1920,10 +1921,10 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         CPUIOTLBEntry *iotlbentry;
         bool need_swap;
 
-        /* For anything that is unaligned, recurse through full_load.  */
+        /* For anything that is unaligned, recurse through byte_load.  */
         if ((addr & (size - 1)) != 0) {
             return load_helper_unaligned(env, addr, oi, retaddr, op,
-                                         code_read, full_load);
+                                         code_read, byte_load);
         }
 
         iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
@@ -1961,7 +1962,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
                     >= TARGET_PAGE_SIZE)) {
         return load_helper_unaligned(env, addr, oi, retaddr, op,
-                                     code_read, full_load);
+                                     code_read, byte_load);
     }
 
     haddr = (void *)((uintptr_t)addr + entry->addend);
@@ -1978,8 +1979,9 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
  * We don't bother with this widened value for SOFTMMU_CODE_ACCESS.
  */
 
-static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
+static uint64_t __attribute__((noinline))
+full_ldub_mmu(CPUArchState *env, target_ulong addr,
+              TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
 }
@@ -1993,8 +1995,7 @@ tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
-                       full_le_lduw_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, false, full_ldub_mmu);
 }
 
 tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
@@ -2006,8 +2007,7 @@ tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
-                       full_be_lduw_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, false, full_ldub_mmu);
 }
 
 tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
@@ -2019,8 +2019,7 @@ tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
-                       full_le_ldul_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, false, full_ldub_mmu);
 }
 
 tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
@@ -2032,8 +2031,7 @@ tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
-                       full_be_ldul_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, false, full_ldub_mmu);
 }
 
 tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
@@ -2045,15 +2043,13 @@ tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
-                       helper_le_ldq_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_LEQ, false, full_ldub_mmu);
 }
 
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
-                       helper_be_ldq_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_BEQ, false, full_ldub_mmu);
 }
 
 /*
@@ -2732,8 +2728,9 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 
 /* Code access functions.  */
 
-static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr)
+static uint64_t __attribute__((noinline))
+full_ldub_code(CPUArchState *env, target_ulong addr,
+               TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_code);
 }
@@ -2744,38 +2741,20 @@ uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
     return full_ldub_code(env, addr, oi, 0);
 }
 
-static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
-                               TCGMemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_TEUW, true, full_lduw_code);
-}
-
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 {
     TCGMemOpIdx oi = make_memop_idx(MO_TEUW, cpu_mmu_index(env, true));
-    return full_lduw_code(env, addr, oi, 0);
-}
-
-static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_TEUL, true, full_ldl_code);
+    return load_helper(env, addr, oi, 0, MO_TEUW, true, full_ldub_code);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
 {
     TCGMemOpIdx oi = make_memop_idx(MO_TEUL, cpu_mmu_index(env, true));
-    return full_ldl_code(env, addr, oi, 0);
-}
-
-static uint64_t full_ldq_code(CPUArchState *env, target_ulong addr,
-                              TCGMemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_TEQ, true, full_ldq_code);
+    return load_helper(env, addr, oi, 0, MO_TEUL, true, full_ldub_code);
 }
 
 uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
 {
     TCGMemOpIdx oi = make_memop_idx(MO_TEQ, cpu_mmu_index(env, true));
-    return full_ldq_code(env, addr, oi, 0);
+    return load_helper(env, addr, oi, 0, MO_TEQ, true, full_ldub_code);
 }
-- 
2.25.1


