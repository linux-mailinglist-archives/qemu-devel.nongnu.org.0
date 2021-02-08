Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B9312911
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:53:16 +0100 (CET)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wfr-0000NM-44
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRH-0001H0-PI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:11 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRF-0005jt-88
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:11 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x9so7025838plb.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPMFB2Q7bqmshseEZXdi4DH7vz7QmPfw5K/IzP922xY=;
 b=qu7eNuks6726v8OOMHl8PZoy0qeqLKKGuWn4UB/jMjbdJ30LZ/WKv3dXAdeMVxzdCU
 ZQtHTD3jr86kkyq7ok8ORCzzQp+K2EnAGUDBDIu/5kgM251xJxY9gxK6mXgRS47E3oJS
 UtWGaPNTAxptAU3OQO5laV3v6EvJHx36H8R1rxMr+HM0XiYnwJHE8FJf/wvUDRSTdXZW
 l/Fzzkog+JfjsU9w0mDegI+cd42Y+w3GG3O7BP+qJThdHItN3mAuFWsfpckbpuyItAbo
 43wlerD+8v+SHxaqdbRRPsQjvr1BBjMC6jtMEyGEytMEdEf2THXBeGMt2uO603iOvURU
 l1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPMFB2Q7bqmshseEZXdi4DH7vz7QmPfw5K/IzP922xY=;
 b=rhurFPmHzN9ftOPBNYMe/PiVxBfwd/PJz3j0tj7SnPjcwPkKL9l/WOCU4/JuNfoTeD
 leAQKGo3cWaJW+YUBXN9lelCy4/aWcQ4KLawAAJQQ8ibALYOXha4K8DuN+DjH9xlZkrI
 XYWUvNIA/QXJxydTgryYprrahLwZP9EDgV6qr5/YX6AE/3WAe/dHD+ZqkkOG7zbtLHU3
 ByHgxeDSke4L1rDrRAZXW97mqH+2w3LC0Rk9Xh+juRV5sqJX0yhUfS1tprIXGSLEAB5C
 CY+51PFb9SZiekrLCKVtDGm1PG2fGA2mWWvfVOHH5uLlYI3xLNxAlLUt0IkcsA3f2q2o
 eOyg==
X-Gm-Message-State: AOAM533Uy0EfUKXdExJa+ARpx3EVAwNJ3R/b6DI7L7yS6Sm6y9+cb2X1
 sw0c0OH/yodi3eifh32Rr63zO9P6z9Fklw==
X-Google-Smtp-Source: ABdhPJw8l/kAgNwean6hcuBLhSBx/2LMqrGVmi6LokCk1f9NMgXbLWH1nkpKBFFfW37sBRyFPF2Bmg==
X-Received: by 2002:a17:90a:6a07:: with SMTP id
 t7mr14649215pjj.194.1612751887931; 
 Sun, 07 Feb 2021 18:38:07 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/70] tcg/tci: Reduce use of tci_read_r64
Date: Sun,  7 Feb 2021 18:36:53 -0800
Message-Id: <20210208023752.270606-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In all cases restricted to 64-bit hosts, tcg_read_r is
identical.  We retain the 64-bit symbol for the single
case of INDEX_op_qemu_st_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 93 +++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 9c8395397a..0246e663a3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
-{
-    return tci_read_reg(regs, index);
-}
-#endif
-
 static void
 tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
 {
@@ -146,9 +139,7 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    uint64_t value = tci_read_reg64(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
+    return tci_read_r(regs, tb_ptr);
 }
 #endif
 
@@ -407,8 +398,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
@@ -689,7 +680,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_mov_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i64:
@@ -713,7 +704,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint64_t *)(t1 + t2) = t0;
@@ -723,62 +714,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
             break;
         case INDEX_op_divu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
             break;
         case INDEX_op_rem_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
             break;
         case INDEX_op_remu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -786,41 +777,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp64 = (((1ULL << tmp8) - 1) << tmp16);
@@ -828,8 +819,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
@@ -899,21 +890,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i64
         case INDEX_op_not_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i64
         case INDEX_op_neg_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
-- 
2.25.1


