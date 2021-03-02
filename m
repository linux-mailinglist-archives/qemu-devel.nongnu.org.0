Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6232A943
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:24:16 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9gt-0007WK-By
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HZ-00036f-T7
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:05 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HX-0007bk-Qp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id k22so12467881pll.6
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v2unlqfJMNyj9BFPXRcywsgxR3r17wjB0hRJKjBA1xY=;
 b=JtXcUd1klUFsE6pso+rRtO4uJNRmQ0M8FaP3j7r9g8VAL8RkEvDUhzYR7Rq9sJsfjt
 XE18KVG06wu+x46ZGlXLF6+05SDxGmbG3R5yg+IDlte9aBR9hLk2V2f3/B9kNGzWhGkj
 7zMh/mVvAZD7VnPjHFwKOzRDIzcUIqCvoJKr5kbDd7PVe8vhM9RROxcbQ29bE+IyPECr
 tpTS69PK3qMKgmH0BonzTTFx14gZpfhbT3NenHF+iH043r5Smj5jQdP6Jjz9ZWsJc99v
 URc6X+QvOiLhsZPq7+l9M17t0jiSvnkrEjFUpxPMHhCamCsG4izAFxIBCNCrbwzZZ4ZE
 Vv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2unlqfJMNyj9BFPXRcywsgxR3r17wjB0hRJKjBA1xY=;
 b=r55NSuKgtWaZEdIeVdXIRzm3Zfv2A2K3p9BZIhZLUiyY9P5aC2TOg6rm3tHKkGITas
 sprri2elp8wCe/9IPg/NLLSLPdyifGYxfivpfVW1jSKAOsdd5a0vNfP1reEwcgE9KIV1
 1BGy2QME5wBPy5DzDYJPfhOEqVEIMUQkewLFyreaF3pnWrBN4vDVjflWs85GBOEoi4Fs
 Ir0MA3mvxUFBxXUyYfVU975D3riucAvYUkFJ+EximiQvNAaP9qgwujFU4oIqKrdOCMql
 WLnd1khE9O5/niXEKEWtPMDb8kOy0FyEh1j2kYJxMSYRnvlRPIkt9BeFfbqOrQBdzHNv
 qhKQ==
X-Gm-Message-State: AOAM533+Q4oVYxtVbikmNZ5BFb6ChQnCAbixirosU49luRWuL1jz/C/y
 t8z8POs5E2qFL+UZC6THVx0U7xy4TRwizQ==
X-Google-Smtp-Source: ABdhPJwmWR+dxsk3O2oB1wksXYQ3YMBgWT7snD18t1OHayqjmwsvMCdBOCyOULrKLu8p3f5BTSvEdw==
X-Received: by 2002:a17:90a:5914:: with SMTP id
 k20mr5535871pji.199.1614707882471; 
 Tue, 02 Mar 2021 09:58:02 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/27] tcg/tci: Reduce use of tci_read_r64
Date: Tue,  2 Mar 2021 09:57:32 -0800
Message-Id: <20210302175741.1079851-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In all cases restricted to 64-bit hosts, tcg_read_r is
identical.  We retain the 64-bit symbol for the single
case of INDEX_op_qemu_st_i64.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 93 +++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index cef12f263d..9efe69d05f 100644
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
 
@@ -390,8 +381,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -672,7 +663,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_mov_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i64:
@@ -696,7 +687,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint64_t *)(t1 + t2) = t0;
@@ -706,62 +697,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
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
 
@@ -769,41 +760,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
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
@@ -811,8 +802,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -882,21 +873,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


