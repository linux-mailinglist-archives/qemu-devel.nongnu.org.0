Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929241FAD5D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 12:03:59 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8Ri-0007us-Jk
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8LP-0007Ug-4b
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 05:57:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8LN-00042v-8g
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 05:57:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id c71so2248170wmd.5
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I38XNUEOP0p0jWXS0d97X4fxUYTnsRlCa1N4i5/agBo=;
 b=UYnv4Nmz63jWid3IOw+5UMLIdFqMWFT5pooT5SGv0Qh4/TU9dJUqnDuPGgXtUlw0zs
 V+huTmihtdLNMyhvEMFRDoAFl3B/wRITNySmHr8rgxIlzAa+3T7dEoqz+9v+PhvqL98M
 /2zTofx0L6AvzGqVtOBYLYqx3DsjYbHrZ/F50HTLkmbyWPr7XTubWe20Wey+a2xFNBPT
 /tbpmf7VnQwK1SYdE1Sjl51t7Sy2Xe9zZDcWvCkNbPQd43Lr3WOBg4un3zubHTJmPjiw
 bQlGycTSgUDbgpAfc2pq8JNoZlaveP57x6krviJds9B8vt3w3bG5cnDe+6LwUnpNwUgj
 oVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I38XNUEOP0p0jWXS0d97X4fxUYTnsRlCa1N4i5/agBo=;
 b=Giot2L2cntX2ojxO3YViWyHSYEEMvUGqGSwrRWKkxT+yJPq/G0o7kCrd5RQ0ubzBME
 LX/CglV8LcO/pZ6dqnBj7FnbsHP0UqSgx7fZkEIBVSs30hJZr6Ugm7fNoVRzqvfSRnpC
 4ee7hi3ch0m2KXcBO9jSJnUVKiHXdxAd6xVAqxOP2//x67ntzqsxBNhIDx2wIG3F/HXF
 JYEEXYpR99NjdM0hVzGAbTi40Zcj6eMkYl1++msDgZKClGXHS5eaj74I5GOzTOzyB3BR
 2aZbqPT+bRTSRNBnQU8CeWbMqPTbUv9U4wXi3wD+s9vzDp5XiJk5DAfagPn6jWX19Xtu
 JsSQ==
X-Gm-Message-State: AOAM530gEOoabn9/q80TkugJE7pdN0oBtjAeDsmBK26L4dlJzfxmI2RY
 zRXgYH8DWFe+m2+XgEy8sDZqWyxIqy8Q9g==
X-Google-Smtp-Source: ABdhPJz2roNnBW/GOr4W6bcp/SpK7rWq6x6WTQKVp/Yl7InDnoBiOai9NVukkOro/muvtEGa0ual+A==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr2339532wmc.121.1592301443548; 
 Tue, 16 Jun 2020 02:57:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z12sm31090851wrg.9.2020.06.16.02.57.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 02:57:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] target/arm: Convert Neon VEXT to decodetree
Date: Tue, 16 Jun 2020 10:56:54 +0100
Message-Id: <20200616095702.25848-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616095702.25848-1-peter.maydell@linaro.org>
References: <20200616095702.25848-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Convert the Neon VEXT insn to decodetree. Rather than keeping the
old implementation which used fixed temporaries cpu_V0 and cpu_V1
and did the extraction with by-hand shift and logic ops, we use
the TCG extract2 insn.

We don't need to special case 0 or 8 immediates any more as the
optimizer is smart enough to throw away the dead code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       |  8 +++-
 target/arm/translate-neon.inc.c | 76 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 58 +------------------------
 3 files changed, 85 insertions(+), 57 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 9ff182f56d7..26d60220168 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -413,7 +413,13 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
 # return false for size==3.
 ######################################################################
 {
-  # 0b11 subgroup will go here
+  [
+    ##################################################################
+    # Miscellaneous size=0b11 insns
+    ##################################################################
+    VEXT         1111 001 0 1 . 11 .... .... imm:4 . q:1 . 0 .... \
+                 vm=%vm_dp vn=%vn_dp vd=%vd_dp
+  ]
 
   # Subgroup for size != 0b11
   [
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 48a0dee1506..84bc2b239ca 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -2812,3 +2812,79 @@ static bool trans_VQDMLSL_2sc(DisasContext *s, arg_2scalar *a)
 
     return do_2scalar_long(s, a, opfn[a->size], accfn[a->size]);
 }
+
+static bool trans_VEXT(DisasContext *s, arg_VEXT *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (a->imm > 7 && !a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (!a->q) {
+        /* Extract 64 bits from <Vm:Vn> */
+        TCGv_i64 left, right, dest;
+
+        left = tcg_temp_new_i64();
+        right = tcg_temp_new_i64();
+        dest = tcg_temp_new_i64();
+
+        neon_load_reg64(right, a->vn);
+        neon_load_reg64(left, a->vm);
+        tcg_gen_extract2_i64(dest, right, left, a->imm * 8);
+        neon_store_reg64(dest, a->vd);
+
+        tcg_temp_free_i64(left);
+        tcg_temp_free_i64(right);
+        tcg_temp_free_i64(dest);
+    } else {
+        /* Extract 128 bits from <Vm+1:Vm:Vn+1:Vn> */
+        TCGv_i64 left, middle, right, destleft, destright;
+
+        left = tcg_temp_new_i64();
+        middle = tcg_temp_new_i64();
+        right = tcg_temp_new_i64();
+        destleft = tcg_temp_new_i64();
+        destright = tcg_temp_new_i64();
+
+        if (a->imm < 8) {
+            neon_load_reg64(right, a->vn);
+            neon_load_reg64(middle, a->vn + 1);
+            tcg_gen_extract2_i64(destright, right, middle, a->imm * 8);
+            neon_load_reg64(left, a->vm);
+            tcg_gen_extract2_i64(destleft, middle, left, a->imm * 8);
+        } else {
+            neon_load_reg64(right, a->vn + 1);
+            neon_load_reg64(middle, a->vm);
+            tcg_gen_extract2_i64(destright, right, middle, (a->imm - 8) * 8);
+            neon_load_reg64(left, a->vm + 1);
+            tcg_gen_extract2_i64(destleft, middle, left, (a->imm - 8) * 8);
+        }
+
+        neon_store_reg64(destright, a->vd);
+        neon_store_reg64(destleft, a->vd + 1);
+
+        tcg_temp_free_i64(destright);
+        tcg_temp_free_i64(destleft);
+        tcg_temp_free_i64(right);
+        tcg_temp_free_i64(middle);
+        tcg_temp_free_i64(left);
+    }
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4d39bbf035b..a0822dba5e2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5030,10 +5030,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int pass;
     int u;
     int vec_size;
-    uint32_t imm;
     TCGv_i32 tmp, tmp2, tmp3, tmp5;
     TCGv_ptr ptr1;
-    TCGv_i64 tmp64;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return 1;
@@ -5076,60 +5074,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             return 1;
         } else { /* size == 3 */
             if (!u) {
-                /* Extract.  */
-                imm = (insn >> 8) & 0xf;
-
-                if (imm > 7 && !q)
-                    return 1;
-
-                if (q && ((rd | rn | rm) & 1)) {
-                    return 1;
-                }
-
-                if (imm == 0) {
-                    neon_load_reg64(cpu_V0, rn);
-                    if (q) {
-                        neon_load_reg64(cpu_V1, rn + 1);
-                    }
-                } else if (imm == 8) {
-                    neon_load_reg64(cpu_V0, rn + 1);
-                    if (q) {
-                        neon_load_reg64(cpu_V1, rm);
-                    }
-                } else if (q) {
-                    tmp64 = tcg_temp_new_i64();
-                    if (imm < 8) {
-                        neon_load_reg64(cpu_V0, rn);
-                        neon_load_reg64(tmp64, rn + 1);
-                    } else {
-                        neon_load_reg64(cpu_V0, rn + 1);
-                        neon_load_reg64(tmp64, rm);
-                    }
-                    tcg_gen_shri_i64(cpu_V0, cpu_V0, (imm & 7) * 8);
-                    tcg_gen_shli_i64(cpu_V1, tmp64, 64 - ((imm & 7) * 8));
-                    tcg_gen_or_i64(cpu_V0, cpu_V0, cpu_V1);
-                    if (imm < 8) {
-                        neon_load_reg64(cpu_V1, rm);
-                    } else {
-                        neon_load_reg64(cpu_V1, rm + 1);
-                        imm -= 8;
-                    }
-                    tcg_gen_shli_i64(cpu_V1, cpu_V1, 64 - (imm * 8));
-                    tcg_gen_shri_i64(tmp64, tmp64, imm * 8);
-                    tcg_gen_or_i64(cpu_V1, cpu_V1, tmp64);
-                    tcg_temp_free_i64(tmp64);
-                } else {
-                    /* BUGFIX */
-                    neon_load_reg64(cpu_V0, rn);
-                    tcg_gen_shri_i64(cpu_V0, cpu_V0, imm * 8);
-                    neon_load_reg64(cpu_V1, rm);
-                    tcg_gen_shli_i64(cpu_V1, cpu_V1, 64 - (imm * 8));
-                    tcg_gen_or_i64(cpu_V0, cpu_V0, cpu_V1);
-                }
-                neon_store_reg64(cpu_V0, rd);
-                if (q) {
-                    neon_store_reg64(cpu_V1, rd + 1);
-                }
+                /* Extract: handled by decodetree */
+                return 1;
             } else if ((insn & (1 << 11)) == 0) {
                 /* Two register misc.  */
                 op = ((insn >> 12) & 0x30) | ((insn >> 7) & 0xf);
-- 
2.20.1


