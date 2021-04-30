Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC436F891
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:39:20 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQYJ-0004EG-NI
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTy-0007My-K4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTu-0001D4-Qg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id q9so15850749wrs.6
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gEptES1vzGILk1HgzB/fRCwsWZWFaXca8aMTyui+Yvo=;
 b=uj9vPdB3pB4jReGCZRUlFZqORWlnIn8Ic/kq+95pNzf+0d17gOnUkQMmB7Hd1dWJKl
 m1zLXc45l6sHOhHzzCOX6isLBBCcRn8jKo9tqU87sW7fL5O3b88hElGrrMk406ykMbaO
 fENKcA2TC3nl4V7UgfZnGZfo0kF7uw8pr5lsmL7QsopBuWM3eJT5+srTmBhcTYYKYYW6
 e7w4Z1m65FMmaSDd1hKamu4m3Kp/EyHJzEXpdyyMf6bP+YgaUJ5t8m7iB58jjnJus0LF
 JDujnFDhJppWGuZexfck6XCDCmoRF3FHav/1x6ZhMvAZWkVOypolFOBo1rFyC5giJcCL
 fyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEptES1vzGILk1HgzB/fRCwsWZWFaXca8aMTyui+Yvo=;
 b=KtVUnMG2n3vSWXcSADAPHdP6k3JvBMjXMuwHqrpiML5v/yAxZvYFRBn4RKcOA4zXNT
 P3UnGmxYMd8N6hvFyFSGBy2VI8H3MdxbDiI1zoQbe38hHOL6Y65SZnC7GSlTZW8ZKPtr
 9i4oRJTgOveUb5UDK7Jhm74S/CDnI6eYMYwxUGokzxtWQN+UYZYrDseSL4/dUWgfRpY6
 cepmz1O1wIFNdJocih1dfOubQzvKgToJc/GfGRNNxNq9gh9CCavLaYMVGh8XVZ0npOSy
 O2C2X38tl/eZP3zQ8Bk8JqZT4hGDN1zobhc7jjaQ9/KK2++uConjJVLArMDoPN25osH+
 Edzg==
X-Gm-Message-State: AOAM531FWpNuCB50dcLE73FEW3LwDmozsMX8idaLeKn+7avjo1sOCF69
 ihXZsTkY8k3IksCpe8kiD0kyfuXg157cfovc
X-Google-Smtp-Source: ABdhPJyBo6U5HypkyOxHeYrUUxBETNh8Q5pVCd/OtzbIxGSQ72YGSDPX47XpQyjTP1nbObegnthcmw==
X-Received: by 2002:a5d:5254:: with SMTP id k20mr3120483wrc.62.1619778885370; 
 Fri, 30 Apr 2021 03:34:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/43] target/arm: Merge mte_check1, mte_checkN
Date: Fri, 30 Apr 2021 11:34:02 +0100
Message-Id: <20210430103437.4140-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The mte_check1 and mte_checkN functions are now identical.
Drop mte_check1 and rename mte_checkN to mte_check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-a64.h    |  3 +--
 target/arm/internals.h     |  5 +----
 target/arm/mte_helper.c    | 26 +++-----------------------
 target/arm/sve_helper.c    | 14 +++++++-------
 target/arm/translate-a64.c |  4 ++--
 5 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index c139fa81f94..7b706571bb4 100644
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
index 2c77f2d50f0..af1db2cd9c9 100644
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
index 804057d3f6e..c91d561ce33 100644
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
index fd6c58f96a8..b63ddfc7f91 100644
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
index 3af00ae90ef..a68d5dd5d13 100644
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
2.20.1


