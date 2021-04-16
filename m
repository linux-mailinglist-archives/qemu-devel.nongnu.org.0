Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A163627D2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:37:03 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTKw-00073c-Ha
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFO-0000oR-Be
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:19 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFL-0003kD-Nc
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:18 -0400
Received: by mail-pg1-x534.google.com with SMTP id p12so19763696pgj.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yr78coefc+eRQexqS5tG3BUmA7vqp5TSUwgP9PBW9oM=;
 b=SQjDCPXu3OrJiWSSnA5pErwO0z6gweSl6YH8biCflxIB+5rMYTC0fDLo2bb5+yklqN
 +tx0pi7sDPO4DfXISITga0xdr7XouljUQoRI33onb5eySDqPvetxhHXxrYDJb2RPtZEW
 UvaVHsqZcFbS1hLXaTmLbdwych7aiYg6Si1X7xdknhObLIgxb+ezWv+axtz4Wsvtv/kz
 p5A2WluYY7qaE2xV99dGtFtNZeXU/C0jsSEygV4MF/A2P6xbMGyNb5yQffX0EpsnT1GC
 51zuJaRYYBqTbbGkCRfi+DA5a1qM/ZDvu+yLJ9hsco/xLcE+6LjJQYMXWs7mDW9gootw
 16fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yr78coefc+eRQexqS5tG3BUmA7vqp5TSUwgP9PBW9oM=;
 b=bRYw6kCXjXUnH2/MQFrN17KCTy/YVGOpayZ+twAReZfNiTY6zvTBgkPOfI0F3m2bUu
 4C7c8bpJE01UUPo5fAW5opSdKHT/GrM55ta5pexyv8AdHiKEOjzfdZpq+cH/EW0X05Nq
 6wmaT5uw8DyvUUXT6pU5gS65a41zYbBznMEAgNajJMtuMngdGI9gyKSb0AjYNDHKH/na
 lOD9z5sMjhvdN8YQKsg1oFYU5+D/n+bh7Hrf06gkHHb2bRoSj0lBr6B6Q3XE0TChYayz
 ztQFtK4lm/0qFZCCUfi0o9PO8NkBc+XHw5H/Qh012KhNbn7N3P89yg3k4kZQm6CK+rwJ
 72cw==
X-Gm-Message-State: AOAM532hBbUV0tht6wHKJYWI0Vij+PYCXiP2OYbLPXxoP2xFI9rhrpkX
 lH1z4DKW4e72929i52H7DTjbXTTHpPHSjA==
X-Google-Smtp-Source: ABdhPJwWFLLQv065hLHjyQ9CqiWyFlIx8otcBE9gMPSDd4gToVMTmYwWFiAm+pc2Mh2uTFKGZlf6pw==
X-Received: by 2002:a63:3402:: with SMTP id b2mr392064pga.190.1618597874198;
 Fri, 16 Apr 2021 11:31:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/9] target/arm: Merge mte_check1, mte_checkN
Date: Fri, 16 Apr 2021 11:31:03 -0700
Message-Id: <20210416183106.1516563-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mte_check1 and mte_checkN functions are now identical.
Drop mte_check1 and rename mte_checkN to mte_check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  3 +--
 target/arm/internals.h     |  5 +----
 target/arm/mte_helper.c    | 26 +++-----------------------
 target/arm/sve_helper.c    | 14 +++++++-------
 target/arm/translate-a64.c |  4 ++--
 5 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index c139fa81f9..7b706571bb 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -104,8 +104,7 @@ DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
-DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
-DEF_HELPER_FLAGS_3(mte_checkN, TCG_CALL_NO_WG, i64, env, i32, i64)
+DEF_HELPER_FLAGS_3(mte_check, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2c77f2d50f..af1db2cd9c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1146,10 +1146,7 @@ FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra);
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra);
+uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 29f5f4823a..161425f208 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -789,8 +789,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     return 0;
 }
 
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
+uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 {
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, ra, &fault);
@@ -803,28 +802,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
     return useronly_clean_ptr(ptr);
 }
 
-uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
-    return mte_checkN(env, desc, ptr, GETPC());
-}
-
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
-{
-    uint64_t fault;
-    int ret = mte_probe_int(env, desc, ptr, ra, &fault);
-
-    if (unlikely(ret == 0)) {
-        mte_check_fail(env, desc, fault, ra);
-    } else if (ret < 0) {
-        return ptr;
-    }
-    return useronly_clean_ptr(ptr);
-}
-
-uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    return mte_check1(env, desc, ptr, GETPC());
+    return mte_check(env, desc, ptr, GETPC());
 }
 
 /*
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fd6c58f96a..b63ddfc7f9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4442,7 +4442,7 @@ static void sve_cont_ldst_mte_check1(SVEContLdSt *info, CPUARMState *env,
                                      uintptr_t ra)
 {
     sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_check1);
+                                mtedesc, ra, mte_check);
 }
 
 static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
@@ -4451,7 +4451,7 @@ static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
                                      uintptr_t ra)
 {
     sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
-                                mtedesc, ra, mte_checkN);
+                                mtedesc, ra, mte_check);
 }
 
 
@@ -4826,7 +4826,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     if (fault == FAULT_FIRST) {
         /* Trapping mte check for the first-fault element.  */
         if (mtedesc) {
-            mte_check1(env, mtedesc, addr + mem_off, retaddr);
+            mte_check(env, mtedesc, addr + mem_off, retaddr);
         }
 
         /*
@@ -5373,7 +5373,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
-                        mte_check1(env, mtedesc, addr, retaddr);
+                        mte_check(env, mtedesc, addr, retaddr);
                     }
                     host_fn(&scratch, reg_off, info.host);
                 } else {
@@ -5386,7 +5386,7 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              BP_MEM_READ, retaddr);
                     }
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
-                        mte_check1(env, mtedesc, addr, retaddr);
+                        mte_check(env, mtedesc, addr, retaddr);
                     }
                     tlb_fn(env, &scratch, reg_off, addr, retaddr);
                 }
@@ -5552,7 +5552,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
      */
     addr = base + (off_fn(vm, reg_off) << scale);
     if (mtedesc) {
-        mte_check1(env, mtedesc, addr, retaddr);
+        mte_check(env, mtedesc, addr, retaddr);
     }
     tlb_fn(env, vd, reg_off, addr, retaddr);
 
@@ -5773,7 +5773,7 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 }
 
                 if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
-                    mte_check1(env, mtedesc, addr, retaddr);
+                    mte_check(env, mtedesc, addr, retaddr);
                 }
             }
             i += 1;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3af00ae90e..a68d5dd5d1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -276,7 +276,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check1(ret, cpu_env, tcg_desc, addr);
+        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
         tcg_temp_free_i32(tcg_desc);
 
         return ret;
@@ -310,7 +310,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_checkN(ret, cpu_env, tcg_desc, addr);
+        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
         tcg_temp_free_i32(tcg_desc);
 
         return ret;
-- 
2.25.1


