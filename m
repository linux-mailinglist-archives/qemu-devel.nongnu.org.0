Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566961B3680
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 06:44:39 +0200 (CEST)
Received: from localhost ([::1]:41591 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR7FW-0000u2-9w
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 00:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74n-0000v5-JR
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74k-0005gj-8o
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:33 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74j-0005cB-PS
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:33:29 -0400
Received: by mail-pl1-x641.google.com with SMTP id z6so427160plk.10
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 21:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9amWqshE7k/NAq9a276bjEryeqReUJxYJNXk6wnm0Gs=;
 b=L6aI8/AaePKUmLWkH5eJ5ORLDsUfOSxjqUkGmV1d5iecMehEqtqzbzVWEM0INGaFht
 b+hNdyq5yecu2WYRVpK7WcBSch99brb3memU+hc6J7LEurbG/VG6I8z/A3hyRVEgkR4r
 zp9d3r0cEwWfJbbtWbzSDFwGqN0piODENwe5pxaaGe3D29SB3BKx+511gZrZ0+PIpF0w
 J13qS15xS3xwXEJTO35S1I9Q2WLYB99UMnBsOmb4vIWETVUA5UcR6HuEwag4EQ0hs5eA
 gcJUpjdz4dqukuCameZY8vi8aoGkCu9FNvrGM6skhqkiF6uTREDSxuVAZ5/Zm8jftOBQ
 VHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9amWqshE7k/NAq9a276bjEryeqReUJxYJNXk6wnm0Gs=;
 b=o60PsqbSm+6eq0apFFfyUreAaWQtJxmeOPxI1+h0iknhHTAfU4JDo9RwC75jZ8KvpN
 n0GovQ/Z0SGb036Qhjv64UGHksISlJ8xYDMAa7wMBwYHFmnK3rFFwBt1ZvQK9LeT3LNG
 t8Pt/+0fqLoLVZq39gxuKWMUcxLnvVdZaNwdqPy0HCNs7rLcm5wtRjk0tEtPiw8ayl6i
 lM2ZkV5ZYrJmqa1ZExObyOk0gIvymCTIQ6qRzqmsLFSrMZQ9Uc3HkIALp3eRADINcU/O
 Q03ZbLHHzfv0GVeedJHPng/hObT7kYC43tfYvLGKZGx147hhQwFK1KDkDeHUwC3nF3Ed
 UUSg==
X-Gm-Message-State: AGi0Pubhk+6si54GZTvKHCnPh2SGKSKS1VoSqmqpLhRbu5JXd6Igs1Qh
 CsxwTFaMcH5mBunVC9hnaMttqrAn/sI=
X-Google-Smtp-Source: APiQypImJXQa8GXnCKl9mpE5INUfoBfDNVzBuvdmaSK2kSasCmE5dRarP/7/0vYW+XoL+rH2ced+Gw==
X-Received: by 2002:a17:90a:1da6:: with SMTP id
 v35mr10044180pjv.44.1587530007896; 
 Tue, 21 Apr 2020 21:33:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/18] target/arm: Use SVEContLdSt for multi-register
 contiguous loads
Date: Tue, 21 Apr 2020 21:33:03 -0700
Message-Id: <20200422043309.18430-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 223 ++++++++++++++--------------------------
 1 file changed, 79 insertions(+), 144 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7992a569b0..9365e32646 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4449,27 +4449,28 @@ static inline bool test_host_page(void *host)
 }
 
 /*
- * Common helper for all contiguous one-register predicated loads.
+ * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
 static inline QEMU_ALWAYS_INLINE
-void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
+void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
-               const int esz, const int msz,
+               const int esz, const int msz, const int N,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    void *vd = &env->vfp.zregs[rd];
     const intptr_t reg_max = simd_oprsz(desc);
     intptr_t reg_off, reg_last, mem_off;
     SVEContLdSt info;
     void *host;
-    int flags;
+    int flags, i;
 
     /* Find the active elements.  */
-    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, 1 << msz)) {
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, N << msz)) {
         /* The entire predicate was false; no load occurs.  */
-        memset(vd, 0, reg_max);
+        for (i = 0; i < N; ++i) {
+            memset(&env->vfp.zregs[(rd + i) & 31], 0, reg_max);
+        }
         return;
     }
 
@@ -4477,7 +4478,7 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_LOAD, retaddr);
 
     /* Handle watchpoints for all active elements. */
-    sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, 1 << msz,
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, N << msz,
                               BP_MEM_READ, retaddr);
 
     /* TODO: MTE check. */
@@ -4493,9 +4494,8 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
          * which for ARM will raise SyncExternal.  Perform the load
          * into scratch memory to preserve register state until the end.
          */
-        ARMVectorReg scratch;
+        ARMVectorReg scratch[4] = { };
 
-        memset(&scratch, 0, reg_max);
         mem_off = info.mem_off_first[0];
         reg_off = info.reg_off_first[0];
         reg_last = info.reg_off_last[1];
@@ -4510,21 +4510,29 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    tlb_fn(env, &scratch, reg_off, addr + mem_off, retaddr);
+                    for (i = 0; i < N; ++i) {
+                        tlb_fn(env, &scratch[i], reg_off,
+                               addr + mem_off + (i << msz), retaddr);
+                    }
                 }
                 reg_off += 1 << esz;
-                mem_off += 1 << msz;
+                mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
 
-        memcpy(vd, &scratch, reg_max);
+        for (i = 0; i < N; ++i) {
+            memcpy(&env->vfp.zregs[(rd + i) & 31], &scratch[i], reg_max);
+        }
         return;
 #endif
     }
 
     /* The entire operation is in RAM, on valid pages. */
 
-    memset(vd, 0, reg_max);
+    for (i = 0; i < N; ++i) {
+        memset(&env->vfp.zregs[(rd + i) & 31], 0, reg_max);
+    }
+
     mem_off = info.mem_off_first[0];
     reg_off = info.reg_off_first[0];
     reg_last = info.reg_off_last[0];
@@ -4534,10 +4542,13 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
         uint64_t pg = vg[reg_off >> 6];
         do {
             if ((pg >> (reg_off & 63)) & 1) {
-                host_fn(vd, reg_off, host + mem_off);
+                for (i = 0; i < N; ++i) {
+                    host_fn(&env->vfp.zregs[(rd + i) & 31], reg_off,
+                            host + mem_off + (i << msz));
+                }
             }
             reg_off += 1 << esz;
-            mem_off += 1 << msz;
+            mem_off += N << msz;
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
@@ -4547,7 +4558,11 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
      */
     mem_off = info.mem_off_split;
     if (unlikely(mem_off >= 0)) {
-        tlb_fn(env, vd, info.reg_off_split, addr + mem_off, retaddr);
+        reg_off = info.reg_off_split;
+        for (i = 0; i < N; ++i) {
+            tlb_fn(env, &env->vfp.zregs[(rd + i) & 31], reg_off,
+                   addr + mem_off + (i << msz), retaddr);
+        }
     }
 
     mem_off = info.mem_off_first[1];
@@ -4560,10 +4575,13 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    host_fn(vd, reg_off, host + mem_off);
+                    for (i = 0; i < N; ++i) {
+                        host_fn(&env->vfp.zregs[(rd + i) & 31], reg_off,
+                                host + mem_off + (i << msz));
+                    }
                 }
                 reg_off += 1 << esz;
-                mem_off += 1 << msz;
+                mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
     }
@@ -4573,7 +4591,7 @@ void sve_ld1_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
 void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,        \
                             target_ulong addr, uint32_t desc)  \
 {                                                              \
-    sve_ld1_r(env, vg, addr, desc, GETPC(), ESZ, 0,            \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1,      \
               sve_##NAME##_host, sve_##NAME##_tlb);            \
 }
 
@@ -4581,159 +4599,76 @@ void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,        \
 void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,        \
                                target_ulong addr, uint32_t desc)  \
 {                                                                 \
-    sve_ld1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ,             \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
               sve_##NAME##_le_host, sve_##NAME##_le_tlb);         \
 }                                                                 \
 void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,        \
                                target_ulong addr, uint32_t desc)  \
 {                                                                 \
-    sve_ld1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ,             \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
               sve_##NAME##_be_host, sve_##NAME##_be_tlb);         \
 }
 
-DO_LD1_1(ld1bb,  0)
-DO_LD1_1(ld1bhu, 1)
-DO_LD1_1(ld1bhs, 1)
-DO_LD1_1(ld1bsu, 2)
-DO_LD1_1(ld1bss, 2)
-DO_LD1_1(ld1bdu, 3)
-DO_LD1_1(ld1bds, 3)
+DO_LD1_1(ld1bb,  MO_8)
+DO_LD1_1(ld1bhu, MO_16)
+DO_LD1_1(ld1bhs, MO_16)
+DO_LD1_1(ld1bsu, MO_32)
+DO_LD1_1(ld1bss, MO_32)
+DO_LD1_1(ld1bdu, MO_64)
+DO_LD1_1(ld1bds, MO_64)
 
-DO_LD1_2(ld1hh,  1, 1)
-DO_LD1_2(ld1hsu, 2, 1)
-DO_LD1_2(ld1hss, 2, 1)
-DO_LD1_2(ld1hdu, 3, 1)
-DO_LD1_2(ld1hds, 3, 1)
+DO_LD1_2(ld1hh,  MO_16, MO_16)
+DO_LD1_2(ld1hsu, MO_32, MO_16)
+DO_LD1_2(ld1hss, MO_32, MO_16)
+DO_LD1_2(ld1hdu, MO_64, MO_16)
+DO_LD1_2(ld1hds, MO_64, MO_16)
 
-DO_LD1_2(ld1ss,  2, 2)
-DO_LD1_2(ld1sdu, 3, 2)
-DO_LD1_2(ld1sds, 3, 2)
+DO_LD1_2(ld1ss,  MO_32, MO_32)
+DO_LD1_2(ld1sdu, MO_64, MO_32)
+DO_LD1_2(ld1sds, MO_64, MO_32)
 
-DO_LD1_2(ld1dd,  3, 3)
+DO_LD1_2(ld1dd,  MO_64, MO_64)
 
 #undef DO_LD1_1
 #undef DO_LD1_2
 
-/*
- * Common helpers for all contiguous 2,3,4-register predicated loads.
- */
-static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, int size, uintptr_t ra,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch[2] = { };
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, ra);
-            }
-            i += size, pg >>= size;
-            addr += 2 * size;
-        } while (i & 15);
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 1) & 31], &scratch[1], oprsz);
-}
-
-static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, int size, uintptr_t ra,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch[3] = { };
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, ra);
-                tlb_fn(env, &scratch[2], i, addr + 2 * size, ra);
-            }
-            i += size, pg >>= size;
-            addr += 3 * size;
-        } while (i & 15);
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 1) & 31], &scratch[1], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 2) & 31], &scratch[2], oprsz);
-}
-
-static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
-                      uint32_t desc, int size, uintptr_t ra,
-                      sve_ldst1_tlb_fn *tlb_fn)
-{
-    const unsigned rd = extract32(desc, SIMD_DATA_SHIFT + MEMOPIDX_SHIFT, 5);
-    intptr_t i, oprsz = simd_oprsz(desc);
-    ARMVectorReg scratch[4] = { };
-
-    for (i = 0; i < oprsz; ) {
-        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
-        do {
-            if (pg & 1) {
-                tlb_fn(env, &scratch[0], i, addr, ra);
-                tlb_fn(env, &scratch[1], i, addr + size, ra);
-                tlb_fn(env, &scratch[2], i, addr + 2 * size, ra);
-                tlb_fn(env, &scratch[3], i, addr + 3 * size, ra);
-            }
-            i += size, pg >>= size;
-            addr += 4 * size;
-        } while (i & 15);
-    }
-
-    /* Wait until all exceptions have been raised to write back.  */
-    memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 1) & 31], &scratch[1], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 2) & 31], &scratch[2], oprsz);
-    memcpy(&env->vfp.zregs[(rd + 3) & 31], &scratch[3], oprsz);
-}
-
 #define DO_LDN_1(N) \
-void QEMU_FLATTEN HELPER(sve_ld##N##bb_r) \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
-{                                                                   \
-    sve_ld##N##_r(env, vg, addr, desc, 1, GETPC(), sve_ld1bb_tlb);  \
+void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,        \
+                             target_ulong addr, uint32_t desc)  \
+{                                                               \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,      \
+              sve_ld1bb_host, sve_ld1bb_tlb);                   \
 }
 
-#define DO_LDN_2(N, SUFF, SIZE)                                       \
-void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_le_r)                      \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
+#define DO_LDN_2(N, SUFF, ESZ) \
+void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,       \
+                                    target_ulong addr, uint32_t desc) \
 {                                                                     \
-    sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
-                  sve_ld1##SUFF##_le_tlb);                            \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
+              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);       \
 }                                                                     \
-void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_be_r)                      \
-    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
+void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,       \
+                                    target_ulong addr, uint32_t desc) \
 {                                                                     \
-    sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
-                  sve_ld1##SUFF##_be_tlb);                            \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
+              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);       \
 }
 
 DO_LDN_1(2)
 DO_LDN_1(3)
 DO_LDN_1(4)
 
-DO_LDN_2(2, hh, 2)
-DO_LDN_2(3, hh, 2)
-DO_LDN_2(4, hh, 2)
+DO_LDN_2(2, hh, MO_16)
+DO_LDN_2(3, hh, MO_16)
+DO_LDN_2(4, hh, MO_16)
 
-DO_LDN_2(2, ss, 4)
-DO_LDN_2(3, ss, 4)
-DO_LDN_2(4, ss, 4)
+DO_LDN_2(2, ss, MO_32)
+DO_LDN_2(3, ss, MO_32)
+DO_LDN_2(4, ss, MO_32)
 
-DO_LDN_2(2, dd, 8)
-DO_LDN_2(3, dd, 8)
-DO_LDN_2(4, dd, 8)
+DO_LDN_2(2, dd, MO_64)
+DO_LDN_2(3, dd, MO_64)
+DO_LDN_2(4, dd, MO_64)
 
 #undef DO_LDN_1
 #undef DO_LDN_2
-- 
2.20.1


