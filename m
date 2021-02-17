Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106F31E0A2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:40:56 +0100 (CET)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTcz-0000D2-C5
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKu-00075N-PE
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:12 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKs-00079G-Lc
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:12 -0500
Received: by mail-pg1-x536.google.com with SMTP id o63so9202629pgo.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zh4Oi86+XA2CDAVF1jA84UCd8h/wBVxBroPuyJg4Sk=;
 b=ly2ufi3xjnjaNAJxRT/g+ym1efXBUj6EITfbJpmYJPxUvLC8WeKY2uYg7MMkRBifl4
 6cw6+IgEHxKS7dxt8HozshISgW1swLT1FX52LEyiw4OkxQqtNPsuo/uAijWHFPK/xe5f
 qcI0KScjiiT25pzLTHKqhXJBmwG7D5ta8Expe5C094IsPSc/mY2wB1g2TdJ6hF8BmdZP
 KxDzWA0ZKTSK1JAd2qGG7NNygu3o5KPlD6A5ARIau7olU28unyGmhvKmgdTjr5NfopIy
 ku7J7T1JxtTmwIm4wlJELfudXMcyYy2YpCLxdudMGJb6a5tbvyja7DyXVCyK6PmRJCte
 lZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zh4Oi86+XA2CDAVF1jA84UCd8h/wBVxBroPuyJg4Sk=;
 b=JC+zy07Vj2yWSBDHfa3/uBlAk7tHmvOy1v9b5CYpeJcFXN/NU1Ls/eLo8878THz1/I
 hMIv8an59UFfn5+vfH3mmSrNOn1UjbwBYgq/xGklMLj+aaSV1SLysGiXkwqele0NPhLm
 DanVTA/HDLuwNESQhXSetfaS4OznX7O+Bgt0NmW1LfnmkmRTtlLjw3n/TAHgezpuVadx
 /4ans/ANiz/W9AaaE1YSCo2NHrFIEEIU4ZaqlvUOy/H3dn2CLpez08W8vzLs8hQlefjJ
 FHs90SWZdR5jxNSml1tVnwG3b4zsxcf7RBhZgDadTqXesEtMGia32UDpidRDSiwge+lY
 D8IA==
X-Gm-Message-State: AOAM533cc6PKRGf5aQwi0zMc6qskfVi3Cm8ZoQ8c9jmBa3wdRlS9SBP7
 LkArSk6/xLWJ+3ioMGK/F1R+4duQzMcj9w==
X-Google-Smtp-Source: ABdhPJwv9DOuoaNcB4wn/xftzQ3Xh1vxNzgEGKEGOo90Tf4S8lJt2EeSi7dt3F7aEPw22L/UCqnPlA==
X-Received: by 2002:a62:4ec4:0:b029:1e0:f67e:b2f2 with SMTP id
 c187-20020a624ec40000b02901e0f67eb2f2mr972251pfb.81.1613593329392; 
 Wed, 17 Feb 2021 12:22:09 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/71] tcg/tci: Remove tci_read_r32
Date: Wed, 17 Feb 2021 12:19:34 -0800
Message-Id: <20210217202036.1724901-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext32u opcodes, and allow truncation
to happen for other users.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 122 ++++++++++++++++++++++++------------------------------
 1 file changed, 54 insertions(+), 68 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8b91e6efc3..a5aaa763f8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -64,11 +64,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint32_t tci_read_reg32(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint32_t)tci_read_reg(regs, index);
-}
-
 #if TCG_TARGET_REG_BITS == 64
 static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -145,22 +140,13 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (32 bit) from bytecode. */
-static uint32_t tci_read_r32(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    uint32_t value = tci_read_reg32(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_REG_BITS == 32
 /* Read two indexed registers (2 * 32 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    uint32_t low = tci_read_r32(regs, tb_ptr);
-    return tci_uint64(tci_read_r32(regs, tb_ptr), low);
+    uint32_t low = tci_read_r(regs, tb_ptr);
+    return tci_uint64(tci_read_r(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
 /* Read indexed register (32 bit signed) from bytecode. */
@@ -404,8 +390,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             continue;
         case INDEX_op_setcond_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
@@ -428,7 +414,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_mov_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i32:
@@ -484,7 +470,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_st_i32:
         CASE_64(st32)
-            t0 = tci_read_r32(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint32_t *)(t1 + t2) = t0;
@@ -494,62 +480,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 / t2);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 / (uint32_t)t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 % t2);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
             break;
         case INDEX_op_and_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -557,41 +543,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 << (t2 & 31));
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 >> (t2 & 31));
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ((int32_t)t1 >> (t2 & 31)));
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int32_t)t1 >> (t2 & 31));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
         case INDEX_op_deposit_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp32 = (((1 << tmp8) - 1) << tmp16);
@@ -599,8 +585,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_r32(regs, &tb_ptr);
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare32(t0, t1, condition)) {
@@ -638,9 +624,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mulu2_i32:
             t0 = *tb_ptr++;
             t1 = *tb_ptr++;
-            t2 = tci_read_r32(regs, &tb_ptr);
-            tmp64 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, t2 * tmp64);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tmp64 = (uint32_t)tci_read_r(regs, &tb_ptr);
+            tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32
@@ -681,21 +667,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap32_i32
         case INDEX_op_bswap32_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32
         case INDEX_op_not_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32
         case INDEX_op_neg_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
@@ -892,8 +878,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint32_t)t1);
             break;
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
@@ -905,7 +891,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap32_i64
         case INDEX_op_bswap32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
-- 
2.25.1


