Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416E30EA01
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:13:25 +0100 (CET)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U96-0003EM-6V
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiz-0005Hk-Ds
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:25 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tih-0003u3-Iq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:23 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s15so878413plr.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yS0gR/bmpwa/O4hUImsRvwlOE8hTboZh4LibIY9+LNE=;
 b=twoeh6Ref1+fBXfIf4gfW2QqhB3T69Yc+QE+/gmUf47fVkKCKDd4Zbc3/NgqpfHCwg
 UTLhgFjCDEUVFbzJENYdje+lf98DIqmU0RQZOx8l7BFqyp8q2JJjhe60mb010L5ZjA/e
 cCzQRiU/IeC1vqrc2KX1Ar+8XQW4rubH9MPKgU+mrgqzYOx6HyNf/6y/gr8nLVDQ9TcP
 Gu8v2RJ2HaXKtd+ih0GhzyKVjkx4ftJvXuOSyZWD/aEvmZSV4bh/ou+Vjr0hYHv3CIga
 svssWftPyfUSzwmj8kc8TjsyBRo/DUfmXwxI49dfePn//BKHnOpTlT6J5v+pO25eVDF7
 pv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yS0gR/bmpwa/O4hUImsRvwlOE8hTboZh4LibIY9+LNE=;
 b=P1rk95JT2h0zRT34sPH5EF0+2lIlpEHwv7Sw2L1kkP/N2xuMcpyVdB3lOpQsTpA2F2
 qI20QNbtcz4QZUZSw9/vzwrA0HHZzSDTMemTZ3zUGFEg1BvdGmzLFuaJ5LAI/H4qPWsP
 Vibbk2ZzqEuVcIBom/kkI2Wxcz37oCSYtGIVXc3qLP2biSZT6GBg+LTCuiwmht/kgBQn
 9n9ozaMmlRZ8iyd/kqKwvWswcENIm/ar4Yi+hHtJLIGpeHZqwqLYr+nz11KtikI03yRE
 Bw2IpdPrTZpwp7RJZEQlAwg4TMY6gp25yVxWWoZBCqmFCfwOiEYTiPG9QhbPjdmT7esq
 9o+A==
X-Gm-Message-State: AOAM530Z7uf94eU+OIlH3HmGparrIapQ30kId6chCK6YP8OyqgpRhXkZ
 6Cl3fWgs85YdxmF01SpgxXO78DcxYOp1MsRl
X-Google-Smtp-Source: ABdhPJwYCXu+qgB+wcHxvGXu0kTYideTX8YEAKapvE3Ts4JTwu3Sg7dVjT5oASA1HuQkpUcp3G8fRw==
X-Received: by 2002:a17:902:9a49:b029:df:fab8:384 with SMTP id
 x9-20020a1709029a49b02900dffab80384mr5826517plv.37.1612403165705; 
 Wed, 03 Feb 2021 17:46:05 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/93] tcg/tci: Remove TCG_CONST
Date: Wed,  3 Feb 2021 15:44:05 -1000
Message-Id: <20210204014509.882821-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only allow registers or constants, but not both, in any
given position.  Removing this difference in input will
allow more code to be shared between 32-bit and 64-bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |   6 +-
 tcg/tci/tcg-target.h         |   3 -
 tcg/tci.c                    | 189 +++++++++++++----------------------
 tcg/tci/tcg-target.c.inc     |  82 ++++-----------
 4 files changed, 89 insertions(+), 191 deletions(-)

diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
index 38e82f7535..f51b7bcb13 100644
--- a/tcg/tci/tcg-target-con-set.h
+++ b/tcg/tci/tcg-target-con-set.h
@@ -10,16 +10,12 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I2(r, r)
-C_O0_I2(r, ri)
 C_O0_I3(r, r, r)
-C_O0_I4(r, r, ri, ri)
 C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I2(r, 0, r)
-C_O1_I2(r, ri, ri)
 C_O1_I2(r, r, r)
-C_O1_I2(r, r, ri)
-C_O1_I4(r, r, r, ri, ri)
+C_O1_I4(r, r, r, r, r)
 C_O2_I1(r, r, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, r, r)
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 8f7ed676fc..9c0021a26f 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -157,9 +157,6 @@ typedef enum {
 
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
-
-    /* Special value UINT8_MAX is used by TCI to encode constant values. */
-    TCG_CONST = UINT8_MAX
 } TCGReg;
 
 /* Used for function call generation. */
diff --git a/tcg/tci.c b/tcg/tci.c
index 935eb87330..fb3c97aaf1 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -255,61 +255,6 @@ tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return taddr;
 }
 
-/* Read indexed register or constant (native size) from bytecode. */
-static tcg_target_ulong
-tci_read_ri(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    tcg_target_ulong value;
-    TCGReg r = **tb_ptr;
-    *tb_ptr += 1;
-    if (r == TCG_CONST) {
-        value = tci_read_i(tb_ptr);
-    } else {
-        value = tci_read_reg(regs, r);
-    }
-    return value;
-}
-
-/* Read indexed register or constant (32 bit) from bytecode. */
-static uint32_t tci_read_ri32(const tcg_target_ulong *regs,
-                              const uint8_t **tb_ptr)
-{
-    uint32_t value;
-    TCGReg r = **tb_ptr;
-    *tb_ptr += 1;
-    if (r == TCG_CONST) {
-        value = tci_read_i32(tb_ptr);
-    } else {
-        value = tci_read_reg32(regs, r);
-    }
-    return value;
-}
-
-#if TCG_TARGET_REG_BITS == 32
-/* Read two indexed registers or constants (2 * 32 bit) from bytecode. */
-static uint64_t tci_read_ri64(const tcg_target_ulong *regs,
-                              const uint8_t **tb_ptr)
-{
-    uint32_t low = tci_read_ri32(regs, tb_ptr);
-    return tci_uint64(tci_read_ri32(regs, tb_ptr), low);
-}
-#elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register or constant (64 bit) from bytecode. */
-static uint64_t tci_read_ri64(const tcg_target_ulong *regs,
-                              const uint8_t **tb_ptr)
-{
-    uint64_t value;
-    TCGReg r = **tb_ptr;
-    *tb_ptr += 1;
-    if (r == TCG_CONST) {
-        value = tci_read_i64(tb_ptr);
-    } else {
-        value = tci_read_reg64(regs, r);
-    }
-    return value;
-}
-#endif
-
 static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
     tcg_target_ulong label = tci_read_i(tb_ptr);
@@ -504,7 +449,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            t0 = tci_read_ri(regs, &tb_ptr);
+            t0 = tci_read_i(&tb_ptr);
             tci_tb_ptr = (uintptr_t)tb_ptr;
 #if TCG_TARGET_REG_BITS == 32
             tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
@@ -539,7 +484,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_setcond_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
@@ -547,7 +492,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_setcond2_i32:
             t0 = *tb_ptr++;
             tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_ri64(regs, &tb_ptr);
+            v64 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(tmp64, v64, condition));
             break;
@@ -555,7 +500,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_setcond_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
@@ -628,62 +573,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 / t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 % t2);
             break;
         case INDEX_op_and_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -691,33 +636,33 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int32_t)t1 >> (t2 & 31)));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
@@ -734,7 +679,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_brcond_i32:
             t0 = tci_read_r32(regs, &tb_ptr);
-            t1 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare32(t0, t1, condition)) {
@@ -760,7 +705,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_brcond2_i32:
             tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_ri64(regs, &tb_ptr);
+            v64 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(tmp64, v64, condition)) {
@@ -870,62 +815,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
             break;
         case INDEX_op_divu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
             break;
         case INDEX_op_rem_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
             break;
         case INDEX_op_remu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -933,33 +878,33 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
@@ -976,7 +921,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_brcond_i64:
             t0 = tci_read_r64(regs, &tb_ptr);
-            t1 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1b66368c94..feac4659cc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -92,8 +92,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i32:
     case INDEX_op_remu_i64:
-        return C_O1_I2(r, r, r);
-
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
     case INDEX_op_sub_i32:
@@ -126,8 +124,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
-        /* TODO: Does R, RI, RI result in faster code than R, R, RI? */
-        return C_O1_I2(r, ri, ri);
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
@@ -135,11 +134,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return C_O0_I2(r, ri);
-
-    case INDEX_op_setcond_i32:
-    case INDEX_op_setcond_i64:
-        return C_O1_I2(r, r, ri);
+        return C_O0_I2(r, r);
 
 #if TCG_TARGET_REG_BITS == 32
     /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
@@ -147,11 +142,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub2_i32:
         return C_O2_I4(r, r, r, r, r, r);
     case INDEX_op_brcond2_i32:
-        return C_O0_I4(r, r, ri, ri);
+        return C_O0_I4(r, r, r, r);
     case INDEX_op_mulu2_i32:
         return C_O2_I2(r, r, r, r);
     case INDEX_op_setcond2_i32:
-        return C_O1_I4(r, r, r, ri, ri);
+        return C_O1_I4(r, r, r, r, r);
 #endif
 
     case INDEX_op_qemu_ld_i32:
@@ -294,41 +289,6 @@ static void tcg_out_r(TCGContext *s, TCGArg t0)
     tcg_out8(s, t0);
 }
 
-/* Write register or constant (native size). */
-static void tcg_out_ri(TCGContext *s, bool const_arg, TCGArg arg)
-{
-    if (const_arg) {
-        tcg_out8(s, TCG_CONST);
-        tcg_out_i(s, arg);
-    } else {
-        tcg_out_r(s, arg);
-    }
-}
-
-/* Write register or constant (32 bit). */
-static void tcg_out_ri32(TCGContext *s, bool const_arg, TCGArg arg)
-{
-    if (const_arg) {
-        tcg_out8(s, TCG_CONST);
-        tcg_out32(s, arg);
-    } else {
-        tcg_out_r(s, arg);
-    }
-}
-
-#if TCG_TARGET_REG_BITS == 64
-/* Write register or constant (64 bit). */
-static void tcg_out_ri64(TCGContext *s, bool const_arg, TCGArg arg)
-{
-    if (const_arg) {
-        tcg_out8(s, TCG_CONST);
-        tcg_out64(s, arg);
-    } else {
-        tcg_out_r(s, arg);
-    }
-}
-#endif
-
 /* Write label. */
 static void tci_out_label(TCGContext *s, TCGLabel *label)
 {
@@ -416,7 +376,7 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     uint8_t *old_code_ptr = s->code_ptr;
     tcg_out_op_t(s, INDEX_op_call);
-    tcg_out_ri(s, 1, (uintptr_t)arg);
+    tcg_out_i(s, (uintptr_t)arg);
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
@@ -450,7 +410,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_setcond_i32:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
+        tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
 #if TCG_TARGET_REG_BITS == 32
@@ -459,15 +419,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
-        tcg_out_ri32(s, const_args[3], args[3]);
-        tcg_out_ri32(s, const_args[4], args[4]);
+        tcg_out_r(s, args[3]);
+        tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
         break;
 #elif TCG_TARGET_REG_BITS == 64
     case INDEX_op_setcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-        tcg_out_ri64(s, const_args[2], args[2]);
+        tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
 #endif
@@ -513,8 +473,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_rotl_i32:     /* Optional (TCG_TARGET_HAS_rot_i32). */
     case INDEX_op_rotr_i32:     /* Optional (TCG_TARGET_HAS_rot_i32). */
         tcg_out_r(s, args[0]);
-        tcg_out_ri32(s, const_args[1], args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
+        tcg_out_r(s, args[1]);
+        tcg_out_r(s, args[2]);
         break;
     case INDEX_op_deposit_i32:  /* Optional (TCG_TARGET_HAS_deposit_i32). */
         tcg_out_r(s, args[0]);
@@ -548,8 +508,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
     case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
         tcg_out_r(s, args[0]);
-        tcg_out_ri64(s, const_args[1], args[1]);
-        tcg_out_ri64(s, const_args[2], args[2]);
+        tcg_out_r(s, args[1]);
+        tcg_out_r(s, args[2]);
         break;
     case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
         tcg_out_r(s, args[0]);
@@ -562,7 +522,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
-        tcg_out_ri64(s, const_args[1], args[1]);
+        tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
@@ -596,8 +556,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_rem_i32:      /* Optional (TCG_TARGET_HAS_div_i32). */
     case INDEX_op_remu_i32:     /* Optional (TCG_TARGET_HAS_div_i32). */
         tcg_out_r(s, args[0]);
-        tcg_out_ri32(s, const_args[1], args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
+        tcg_out_r(s, args[1]);
+        tcg_out_r(s, args[2]);
         break;
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
@@ -612,8 +572,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_brcond2_i32:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
-        tcg_out_ri32(s, const_args[3], args[3]);
+        tcg_out_r(s, args[2]);
+        tcg_out_r(s, args[3]);
         tcg_out8(s, args[4]);           /* condition */
         tci_out_label(s, arg_label(args[5]));
         break;
@@ -626,7 +586,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #endif
     case INDEX_op_brcond_i32:
         tcg_out_r(s, args[0]);
-        tcg_out_ri32(s, const_args[1], args[1]);
+        tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-- 
2.25.1


