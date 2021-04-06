Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36399355A98
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:43:11 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpjK-00048Q-9w
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph2-0001uW-C0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgy-0006PO-Jo
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:48 -0400
Received: by mail-pf1-x42f.google.com with SMTP id n38so1275311pfv.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xg0dHSSHbNndr4UE+t8eLAkBBwNMOnWRtx1WrZnfz3o=;
 b=Chjr2TH7UcW+AjSWM5zYP92vosfnwv4GEcyBX47o7ce0ZWqrin/yMk13sinNARINus
 Sat3ubjCEg7Dt0j6FkXdHMFtY0Buwoc3IqI8j5tCEe0AD8TX7X1+/lekPTRHbEHefMsT
 6JcSMwmowJvtrn3QkirQCglF+xifK7/VbdRRenxt9R3RQBjYdF8OyPdtiq9hTWuTvvGO
 K+yzyTOIIwUUAdd4OjTRi435JOTXpFVXSk1t+68jGrRy+RDlTnChw8U1UElgLFqkjAEj
 Fy9ahppWiTwT7PNzAGK4iA726I7djkE9eUnXcboABiowe7EzAObOMDVZwHK+viOcPjfE
 /RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xg0dHSSHbNndr4UE+t8eLAkBBwNMOnWRtx1WrZnfz3o=;
 b=ijIyAZdPA6RuHT5chA3cmKSyBNfxvNw/r0GDfIfdOUxALwCfFluopkh2BCJ+er73zH
 JkBlitWgoaU7CyVL4Qle5dPO0btFmG5KJsjzQx25LKIpGUfcjwVFv6PKc5bgNT85dc9S
 6Q2fy3bfYCNlwr6Gb4MRFS6qUTfJ6H48iFl7vnSqj2vwh6vZ7qhbLNhCIuiUTMcd789H
 h9P/eTp66GKOifZsz1dzYoqSl+IZtoRzHNzhJeluof/CipefuZbmteLZAre85O/lcjbb
 azRXu1VuiZVe+LJmZZm63kSMc9kAoHnAOZTd56VXO1Z1zdJSrX7pJqhlsoJwLtO5jnSS
 neVg==
X-Gm-Message-State: AOAM531T4IWpzFs5jCB21O1IBkvIq52JYJcsV3fRbKVGqDryVbJ+prCm
 lEH/VRL2/M1x8uCt98c7ZY0LYbAN7jveaQ==
X-Google-Smtp-Source: ABdhPJxTCM8e653b77eAfBqVjhTwxEGMWVQi1o7916u9OzXlJhe046FbTy3RRyCCnVMwIHFte0kkgQ==
X-Received: by 2002:a65:4383:: with SMTP id m3mr12515986pgp.57.1617730843088; 
 Tue, 06 Apr 2021 10:40:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] target/arm: Simplify sve mte checking
Date: Tue,  6 Apr 2021 10:40:29 -0700
Message-Id: <20210406174031.64299-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that mte_check1 and mte_checkN have been merged, we can
merge sve_cont_ldst_mte_check1 and sve_cont_ldst_mte_checkN.

Which means that we can eliminate the function pointer into
sve_ldN_r and sve_stN_r, calling sve_cont_ldst_mte_check directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 84 +++++++++++++----------------------------
 1 file changed, 26 insertions(+), 58 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 982240d104..c068dfa0d5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4382,13 +4382,9 @@ static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
 #endif
 }
 
-typedef uint64_t mte_check_fn(CPUARMState *, uint32_t, uint64_t, uintptr_t);
-
-static inline QEMU_ALWAYS_INLINE
-void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
-                                 uint64_t *vg, target_ulong addr, int esize,
-                                 int msize, uint32_t mtedesc, uintptr_t ra,
-                                 mte_check_fn *check)
+static void sve_cont_ldst_mte_check(SVEContLdSt *info, CPUARMState *env,
+                                    uint64_t *vg, target_ulong addr, int esize,
+                                    int msize, uint32_t mtedesc, uintptr_t ra)
 {
     intptr_t mem_off, reg_off, reg_last;
 
@@ -4405,7 +4401,7 @@ void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    check(env, mtedesc, addr, ra);
+                    mte_check(env, mtedesc, addr, ra);
                 }
                 reg_off += esize;
                 mem_off += msize;
@@ -4422,7 +4418,7 @@ void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
             uint64_t pg = vg[reg_off >> 6];
             do {
                 if ((pg >> (reg_off & 63)) & 1) {
-                    check(env, mtedesc, addr, ra);
+                    mte_check(env, mtedesc, addr, ra);
                 }
                 reg_off += esize;
                 mem_off += msize;
@@ -4431,30 +4427,6 @@ void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
     }
 }
 
-typedef void sve_cont_ldst_mte_check_fn(SVEContLdSt *info, CPUARMState *env,
-                                        uint64_t *vg, target_ulong addr,
-                                        int esize, int msize, uint32_t mtedesc,
-                                        uintptr_t ra);
-
-static void sve_cont_ldst_mte_check1(SVEContLdSt *info, CPUARMState *env,
-                                     uint64_t *vg, target_ulong addr,
-                                     int esize, int msize, uint32_t mtedesc,
-                                     uintptr_t ra)
-{
-    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_check);
-}
-
-static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
-                                     uint64_t *vg, target_ulong addr,
-                                     int esize, int msize, uint32_t mtedesc,
-                                     uintptr_t ra)
-{
-    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_check);
-}
-
-
 /*
  * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
@@ -4463,8 +4435,7 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
                const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn,
-               sve_cont_ldst_mte_check_fn *mte_check_fn)
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -4493,9 +4464,9 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
      * Handle mte checks for all active elements.
      * Since TBI must be set for MTE, !mtedesc => !mte_active.
      */
-    if (mte_check_fn && mtedesc) {
-        mte_check_fn(&info, env, vg, addr, 1 << esz, N << msz,
-                     mtedesc, retaddr);
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, 1 << esz, N << msz,
+                                mtedesc, retaddr);
     }
 
     flags = info.page[0].flags | info.page[1].flags;
@@ -4621,8 +4592,7 @@ void sve_ldN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
         mtedesc = 0;
     }
 
-    sve_ldN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
-              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
+    sve_ldN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn);
 }
 
 #define DO_LD1_1(NAME, ESZ)                                             \
@@ -4630,7 +4600,7 @@ void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,                 \
                             target_ulong addr, uint32_t desc)           \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1, 0,            \
-              sve_##NAME##_host, sve_##NAME##_tlb, NULL);               \
+              sve_##NAME##_host, sve_##NAME##_tlb);                     \
 }                                                                       \
 void HELPER(sve_##NAME##_r_mte)(CPUARMState *env, void *vg,             \
                                 target_ulong addr, uint32_t desc)       \
@@ -4644,22 +4614,22 @@ void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,              \
                                target_ulong addr, uint32_t desc)        \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
-              sve_##NAME##_le_host, sve_##NAME##_le_tlb, NULL);         \
+              sve_##NAME##_le_host, sve_##NAME##_le_tlb);               \
 }                                                                       \
 void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,              \
                                target_ulong addr, uint32_t desc)        \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
-              sve_##NAME##_be_host, sve_##NAME##_be_tlb, NULL);         \
+              sve_##NAME##_be_host, sve_##NAME##_be_tlb);               \
 }                                                                       \
 void HELPER(sve_##NAME##_le_r_mte)(CPUARMState *env, void *vg,          \
-                                 target_ulong addr, uint32_t desc)      \
+                                   target_ulong addr, uint32_t desc)    \
 {                                                                       \
     sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
                   sve_##NAME##_le_host, sve_##NAME##_le_tlb);           \
 }                                                                       \
 void HELPER(sve_##NAME##_be_r_mte)(CPUARMState *env, void *vg,          \
-                                 target_ulong addr, uint32_t desc)      \
+                                   target_ulong addr, uint32_t desc)    \
 {                                                                       \
     sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
                   sve_##NAME##_be_host, sve_##NAME##_be_tlb);           \
@@ -4693,7 +4663,7 @@ void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,                \
                              target_ulong addr, uint32_t desc)          \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N, 0,           \
-              sve_ld1bb_host, sve_ld1bb_tlb, NULL);                     \
+              sve_ld1bb_host, sve_ld1bb_tlb);                           \
 }                                                                       \
 void HELPER(sve_ld##N##bb_r_mte)(CPUARMState *env, void *vg,            \
                                  target_ulong addr, uint32_t desc)      \
@@ -4707,13 +4677,13 @@ void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
-              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb, NULL);   \
+              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);         \
 }                                                                       \
 void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
-              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb, NULL);   \
+              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);         \
 }                                                                       \
 void HELPER(sve_ld##N##SUFF##_le_r_mte)(CPUARMState *env, void *vg,     \
                                         target_ulong addr, uint32_t desc) \
@@ -5090,8 +5060,7 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
                const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn,
-               sve_cont_ldst_mte_check_fn *mte_check_fn)
+               sve_ldst1_tlb_fn *tlb_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -5117,9 +5086,9 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
      * Handle mte checks for all active elements.
      * Since TBI must be set for MTE, !mtedesc => !mte_active.
      */
-    if (mte_check_fn && mtedesc) {
-        mte_check_fn(&info, env, vg, addr, 1 << esz, N << msz,
-                     mtedesc, retaddr);
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, 1 << esz, N << msz,
+                                mtedesc, retaddr);
     }
 
     flags = info.page[0].flags | info.page[1].flags;
@@ -5233,8 +5202,7 @@ void sve_stN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
         mtedesc = 0;
     }
 
-    sve_stN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
-              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
+    sve_stN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn);
 }
 
 #define DO_STN_1(N, NAME, ESZ)                                          \
@@ -5242,7 +5210,7 @@ void HELPER(sve_st##N##NAME##_r)(CPUARMState *env, void *vg,            \
                                  target_ulong addr, uint32_t desc)      \
 {                                                                       \
     sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, N, 0,            \
-              sve_st1##NAME##_host, sve_st1##NAME##_tlb, NULL);         \
+              sve_st1##NAME##_host, sve_st1##NAME##_tlb);               \
 }                                                                       \
 void HELPER(sve_st##N##NAME##_r_mte)(CPUARMState *env, void *vg,        \
                                      target_ulong addr, uint32_t desc)  \
@@ -5256,13 +5224,13 @@ void HELPER(sve_st##N##NAME##_le_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N, 0,             \
-              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb, NULL);   \
+              sve_st1##NAME##_le_host, sve_st1##NAME##_le_tlb);         \
 }                                                                       \
 void HELPER(sve_st##N##NAME##_be_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
     sve_stN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, N, 0,             \
-              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb, NULL);   \
+              sve_st1##NAME##_be_host, sve_st1##NAME##_be_tlb);         \
 }                                                                       \
 void HELPER(sve_st##N##NAME##_le_r_mte)(CPUARMState *env, void *vg,     \
                                         target_ulong addr, uint32_t desc) \
-- 
2.25.1


