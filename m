Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109DC1EFE78
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 19:04:56 +0200 (CEST)
Received: from localhost ([::1]:57806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhFm3-0005KW-5R
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 13:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhFYI-0002Ff-Ju
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:50:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhFYH-0001lE-AM
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:50:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y17so10422337wrn.11
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=im/18ze7m3l5HA15eEkQAPIlSy1Fw6ZEyoO+DwBIfz0=;
 b=Bt5SC2mk30qSLePL6w0bWUNAvxJaVgFeuqa/loA5DNE9swjcclZ7hmIr5/yVWUokDV
 UCX7Nq5DIKK27h8PgHK1LlNfYz00oWCHZFalvv+j5BotE2cH84FcAogwPWTKQ4glpCgn
 RssDM+R15/5Z+eGhmVp3+Vsr5KsRLvgd9mi1hRivU2FReQ07mxPfcQlnIBqGurY/4DDL
 wM0vLoOLWb4m8wwNDFR52sG2rTdKoSzFwh0fQC7RQNwljpYo5se5xD4JYCe4uM3qJ684
 KDxQQihXKahz+qBLVSG/CL0y1Zy0tBH+RVNCe71dit5bXXttO4zNQvMm5UkoYdyB4oQK
 qm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=im/18ze7m3l5HA15eEkQAPIlSy1Fw6ZEyoO+DwBIfz0=;
 b=kdl0oaNnAtIBR+GFU/42CuBSy7vj17OiVR8Ix6rPTGLECsUG9SwnU0fXutMDWkfV/N
 AInV8YkRtI6ZE55bdyNCbvSx/gTCQUe0OXSjDQquGYiLyVrV7Mwvxgjddm6U+8wclzhr
 dicgUD9QqIaRh+ZGkpCQgsYrS5WjH4QkTGnd1Gk0xhWAO2I+BrzPcRmdxXC3r32vrwS3
 2CWVqLjK52953WP6zKknNyDR/lh64WsgjxsXtfhtUDl+I9AH/r6OCmoQK9PCiBouOW/E
 /yhljxrOyEa9eoEtzqKGQKshXWnU49HjmblqVx6giQV+6vAaf7NwKImzdl2iiWjdYg2Y
 45kA==
X-Gm-Message-State: AOAM530rNEFyg5b1q1yHjm391RE353KhDXZs8EvhyzeG8CP7gLzajm19
 d0DxFrdYWHIoLIqSXdf6V5jLqNdIvLWRCA==
X-Google-Smtp-Source: ABdhPJxYDmGFLgfVHv1T5WO4NmfIgsC1pI7yah8VEmHwuveBappp1I/sjz9jXwLH+XenWJTgXv4VrQ==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr10330375wrm.262.1591375839446; 
 Fri, 05 Jun 2020 09:50:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c140sm12272724wmd.18.2020.06.05.09.50.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 09:50:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/29] target/arm: Convert Neon VSHLL, VMOVL to decodetree
Date: Fri,  5 Jun 2020 17:50:05 +0100
Message-Id: <20200605165007.12095-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605165007.12095-1-peter.maydell@linaro.org>
References: <20200605165007.12095-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Convert the VSHLL and VMOVL insns from the 2-reg-shift group
to decodetree. Since the loop always has two passes, we unroll
it to avoid the awkward reassignment of one TCGv to another.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200522145520.6778-8-peter.maydell@linaro.org
---
 target/arm/neon-dp.decode       | 16 +++++++
 target/arm/translate-neon.inc.c | 81 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 46 +------------------
 3 files changed, 99 insertions(+), 44 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 79d0bfdd70e..3dde699e97e 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -243,6 +243,14 @@ VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
                  &2reg_shift vm=%vm_dp vd=%vd_dp size=1 q=0 \
                  shift=%neon_rshift_i3
 
+# Long left shifts: again Q is part of opcode decode
+@2reg_shll_s     .... ... . . . 1 shift:5    .... .... 0 . . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=2 q=0
+@2reg_shll_h     .... ... . . . 01 shift:4   .... .... 0 . . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=1 q=0
+@2reg_shll_b     .... ... . . . 001 shift:3  .... .... 0 . . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=0 q=0
+
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_d
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_s
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_h
@@ -348,3 +356,11 @@ VQSHRN_U16_2sh   1111 001 1 1 . ...... .... 1001 . 0 . 1 .... @2reg_shrn_h
 VQRSHRN_U64_2sh  1111 001 1 1 . ...... .... 1001 . 1 . 1 .... @2reg_shrn_d
 VQRSHRN_U32_2sh  1111 001 1 1 . ...... .... 1001 . 1 . 1 .... @2reg_shrn_s
 VQRSHRN_U16_2sh  1111 001 1 1 . ...... .... 1001 . 1 . 1 .... @2reg_shrn_h
+
+VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_s
+VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_h
+VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_b
+
+VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_s
+VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_h
+VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_b
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 562470ca08c..3d566044f3d 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1578,3 +1578,84 @@ DO_2SN_32(VQSHRN_U16, gen_helper_neon_shl_u16, gen_helper_neon_narrow_sat_u8)
 DO_2SN_64(VQRSHRN_U64, gen_helper_neon_rshl_u64, gen_helper_neon_narrow_sat_u32)
 DO_2SN_32(VQRSHRN_U32, gen_helper_neon_rshl_u32, gen_helper_neon_narrow_sat_u16)
 DO_2SN_32(VQRSHRN_U16, gen_helper_neon_rshl_u16, gen_helper_neon_narrow_sat_u8)
+
+static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
+                         NeonGenWidenFn *widenfn, bool u)
+{
+    TCGv_i64 tmp;
+    TCGv_i32 rm0, rm1;
+    uint64_t widen_mask = 0;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (a->vd & 1) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * This is a widen-and-shift operation. The shift is always less
+     * than the width of the source type, so after widening the input
+     * vector we can simply shift the whole 64-bit widened register,
+     * and then clear the potential overflow bits resulting from left
+     * bits of the narrow input appearing as right bits of the left
+     * neighbour narrow input. Calculate a mask of bits to clear.
+     */
+    if ((a->shift != 0) && (a->size < 2 || u)) {
+        int esize = 8 << a->size;
+        widen_mask = MAKE_64BIT_MASK(0, esize);
+        widen_mask >>= esize - a->shift;
+        widen_mask = dup_const(a->size + 1, widen_mask);
+    }
+
+    rm0 = neon_load_reg(a->vm, 0);
+    rm1 = neon_load_reg(a->vm, 1);
+    tmp = tcg_temp_new_i64();
+
+    widenfn(tmp, rm0);
+    if (a->shift != 0) {
+        tcg_gen_shli_i64(tmp, tmp, a->shift);
+        tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
+    }
+    neon_store_reg64(tmp, a->vd);
+
+    widenfn(tmp, rm1);
+    if (a->shift != 0) {
+        tcg_gen_shli_i64(tmp, tmp, a->shift);
+        tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
+    }
+    neon_store_reg64(tmp, a->vd + 1);
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
+static bool trans_VSHLL_S_2sh(DisasContext *s, arg_2reg_shift *a)
+{
+    NeonGenWidenFn *widenfn[] = {
+        gen_helper_neon_widen_s8,
+        gen_helper_neon_widen_s16,
+        tcg_gen_ext_i32_i64,
+    };
+    return do_vshll_2sh(s, a, widenfn[a->size], false);
+}
+
+static bool trans_VSHLL_U_2sh(DisasContext *s, arg_2reg_shift *a)
+{
+    NeonGenWidenFn *widenfn[] = {
+        gen_helper_neon_widen_u8,
+        gen_helper_neon_widen_u16,
+        tcg_gen_extu_i32_i64,
+    };
+    return do_vshll_2sh(s, a, widenfn[a->size], true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 883c1a29c7b..a9f52049e7c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5248,6 +5248,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             case 7: /* VQSHL */
             case 8: /* VSHRN, VRSHRN, VQSHRUN, VQRSHRUN */
             case 9: /* VQSHRN, VQRSHRN */
+            case 10: /* VSHLL, including VMOVL */
                 return 1; /* handled by decodetree */
             default:
                 break;
@@ -5265,50 +5266,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     size--;
             }
             shift = (insn >> 16) & ((1 << (3 + size)) - 1);
-            if (op == 10) {
-                /* VSHLL, VMOVL */
-                if (q || (rd & 1)) {
-                    return 1;
-                }
-                tmp = neon_load_reg(rm, 0);
-                tmp2 = neon_load_reg(rm, 1);
-                for (pass = 0; pass < 2; pass++) {
-                    if (pass == 1)
-                        tmp = tmp2;
-
-                    gen_neon_widen(cpu_V0, tmp, size, u);
-
-                    if (shift != 0) {
-                        /* The shift is less than the width of the source
-                           type, so we can just shift the whole register.  */
-                        tcg_gen_shli_i64(cpu_V0, cpu_V0, shift);
-                        /* Widen the result of shift: we need to clear
-                         * the potential overflow bits resulting from
-                         * left bits of the narrow input appearing as
-                         * right bits of left the neighbour narrow
-                         * input.  */
-                        if (size < 2 || !u) {
-                            uint64_t imm64;
-                            if (size == 0) {
-                                imm = (0xffu >> (8 - shift));
-                                imm |= imm << 16;
-                            } else if (size == 1) {
-                                imm = 0xffff >> (16 - shift);
-                            } else {
-                                /* size == 2 */
-                                imm = 0xffffffff >> (32 - shift);
-                            }
-                            if (size < 2) {
-                                imm64 = imm | (((uint64_t)imm) << 32);
-                            } else {
-                                imm64 = imm;
-                            }
-                            tcg_gen_andi_i64(cpu_V0, cpu_V0, ~imm64);
-                        }
-                    }
-                    neon_store_reg64(cpu_V0, rd + pass);
-                }
-            } else if (op >= 14) {
+            if (op >= 14) {
                 /* VCVT fixed-point.  */
                 TCGv_ptr fpst;
                 TCGv_i32 shiftv;
-- 
2.20.1


