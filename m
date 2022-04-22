Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E450B64B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:42:01 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrfk-0008Lp-Vx
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAO-0005cG-77
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAL-0002xY-Pq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so7619145wma.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yoqGxrEuo7I20WDwXqzVyfNrC/olOohOaVj3LWj1G34=;
 b=s60jTgZao/qCB51Yz2M8VR4RCNei7e0duKPv7WMidFV3SDwLadDY8myMpxz9X7SnnQ
 tvh3ok12Psm88zMqlHXaCdWZA6sSXJsaaceA5U1LTDcKG2xW7ztcTTEPTChBt6JXH4Ow
 75tGDBXwnVPxG5iTnCknP9ioJw1mOZ3TTeC7FNDUKuXwxtzIezFRA3OdmkR0mXMYx8I8
 VaWWb5BDUTTWNjEL+KQTCcpZ/U/Oba5qlSa1exq3/IrSWk4QxoGUtI6QYI7XwRIJFeEX
 cDmi0Fqb8A2gykJ0ET7JJKxGqvlFXtVr2UbDIg7dh+5vUvpUydmBHhNLX8VsIES3GzL3
 0ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yoqGxrEuo7I20WDwXqzVyfNrC/olOohOaVj3LWj1G34=;
 b=aJiQ2ickB66TEM+DUxjZAnB2F2s8VNYr1Cgws9l6E3NZRdta7x9+swoy1ODvIggFLk
 tgN/hFoR39/njP1aJx9Bw/uJEohu3NqlTCipBpIiQHF7yw3EiETwYZNA3PyGKBuwWiUK
 HXhajx9P/+967vrhmQ1GUJhqBzOaB7uOa+BEbcLein3NgFzAafNKvVxq7Q48q/g79vzp
 EcOVlAbHn4lR+fRmrs+b6T6uMyHiCoRXEyX+Ry+rzeTrw72A8dgJIWEK0+t7tMbEbw51
 gTgp4qmqgkDjnVxsOVmSlwljLl7E15NMbtXapqCHBXCVbC9RZOosHiJ84ZlICf3dl/WB
 H7/g==
X-Gm-Message-State: AOAM530fTGSILUbnIvQe4t1dnUqYppzCe/eLk2d/2iqvS5CIsaFKxk0P
 30c+CnQiEDCS2y00dhpPCyv+dSL6oZjUoA==
X-Google-Smtp-Source: ABdhPJzApJmfyPS6Lp2iBWODiXdC7doeA2cWJpsiSITbBDuvZ2aunyDAZJ6/E56DBCPQiBNQbXf07Q==
X-Received: by 2002:a05:600c:1d9d:b0:38e:c8e0:209f with SMTP id
 p29-20020a05600c1d9d00b0038ec8e0209fmr3504808wms.43.1650621928123; 
 Fri, 22 Apr 2022 03:05:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 57/61] target/arm: Use tcg_constant in translate-neon.c
Date: Fri, 22 Apr 2022 11:04:28 +0100
Message-Id: <20220422100432.2288247-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use tcg_constant_{i32,i64} as appropriate throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 384604c0095..2e4d1ec87d9 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -447,7 +447,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
-    TCGv_i32 addr, tmp;
+    TCGv_i32 addr;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -513,7 +513,6 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
-    tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
 
     mop = endian | size | align;
@@ -530,7 +529,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                     neon_load_element64(tmp64, tt, n, size);
                     gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
-                tcg_gen_add_i32(addr, addr, tmp);
+                tcg_gen_addi_i32(addr, addr, 1 << size);
 
                 /* Subsequent memory operations inherit alignment */
                 mop &= ~MO_AMASK;
@@ -538,7 +537,6 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
         }
     }
     tcg_temp_free_i32(addr);
-    tcg_temp_free_i32(tmp);
     tcg_temp_free_i64(tmp64);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, nregs * interleave * 8);
@@ -1348,7 +1346,7 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
      * To avoid excessive duplication of ops we implement shift
      * by immediate using the variable shift operations.
      */
-    constimm = tcg_const_i64(dup_const(a->size, a->shift));
+    constimm = tcg_constant_i64(dup_const(a->size, a->shift));
 
     for (pass = 0; pass < a->q + 1; pass++) {
         TCGv_i64 tmp = tcg_temp_new_i64();
@@ -1358,7 +1356,6 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
         write_neon_element64(tmp, a->vd, pass, MO_64);
         tcg_temp_free_i64(tmp);
     }
-    tcg_temp_free_i64(constimm);
     return true;
 }
 
@@ -1394,7 +1391,7 @@ static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
      * To avoid excessive duplication of ops we implement shift
      * by immediate using the variable shift operations.
      */
-    constimm = tcg_const_i32(dup_const(a->size, a->shift));
+    constimm = tcg_constant_i32(dup_const(a->size, a->shift));
     tmp = tcg_temp_new_i32();
 
     for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
@@ -1403,7 +1400,6 @@ static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
     tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(constimm);
     return true;
 }
 
@@ -1457,7 +1453,7 @@ static bool do_2shift_narrow_64(DisasContext *s, arg_2reg_shift *a,
      * This is always a right shift, and the shiftfn is always a
      * left-shift helper, which thus needs the negated shift count.
      */
-    constimm = tcg_const_i64(-a->shift);
+    constimm = tcg_constant_i64(-a->shift);
     rm1 = tcg_temp_new_i64();
     rm2 = tcg_temp_new_i64();
     rd = tcg_temp_new_i32();
@@ -1477,7 +1473,6 @@ static bool do_2shift_narrow_64(DisasContext *s, arg_2reg_shift *a,
     tcg_temp_free_i32(rd);
     tcg_temp_free_i64(rm1);
     tcg_temp_free_i64(rm2);
-    tcg_temp_free_i64(constimm);
 
     return true;
 }
@@ -1521,7 +1516,7 @@ static bool do_2shift_narrow_32(DisasContext *s, arg_2reg_shift *a,
         /* size == 2 */
         imm = -a->shift;
     }
-    constimm = tcg_const_i32(imm);
+    constimm = tcg_constant_i32(imm);
 
     /* Load all inputs first to avoid potential overwrite */
     rm1 = tcg_temp_new_i32();
@@ -1546,7 +1541,6 @@ static bool do_2shift_narrow_32(DisasContext *s, arg_2reg_shift *a,
 
     shiftfn(rm3, rm3, constimm);
     shiftfn(rm4, rm4, constimm);
-    tcg_temp_free_i32(constimm);
 
     tcg_gen_concat_i32_i64(rtmp, rm3, rm4);
     tcg_temp_free_i32(rm4);
@@ -2911,7 +2905,7 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return true;
     }
 
-    desc = tcg_const_i32((a->vn << 2) | a->len);
+    desc = tcg_constant_i32((a->vn << 2) | a->len);
     def = tcg_temp_new_i64();
     if (a->op) {
         read_neon_element64(def, a->vd, 0, MO_64);
@@ -2926,7 +2920,6 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
 
     tcg_temp_free_i64(def);
     tcg_temp_free_i64(val);
-    tcg_temp_free_i32(desc);
     return true;
 }
 
-- 
2.25.1


