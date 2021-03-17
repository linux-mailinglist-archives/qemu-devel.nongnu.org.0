Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814033F402
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:38:22 +0100 (CET)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYFZ-000702-EB
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCG-0004wx-HX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:34:59 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:43437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCC-00075q-DF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:34:56 -0400
Received: by mail-oi1-x235.google.com with SMTP id y7so2813279oih.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/JpQCcUrKRnv9+kGh5cCSzc4dhrThbAR0CKm4hnpyM=;
 b=bH63AyUgNE6lZLEutsBwFaOaC0Mhoxugx8IJy65APxBt4jlnVNkrflqfGgWw5g9OEC
 sJeErsOo7ID7VHsJNDgGxJhwwDDP6kstymsvjBtuZ9Ce2icoL49Mx5QEgk0psXKJPwba
 DTTQiJS0XYEOjfXJifzbreO4ANF/OXf+KB5rw3QS2Iza/Wr0vFy6SycurW2kc4CmSfye
 gz7RNFHS95IUQPA82lX/om3vSLcM4xBc4wGAj6Spjdw740xyrFQVeusNJzNnsIZJL2pb
 64wQLw+tgZ/L9ETlk+OAbZ6O46emsON0msuUKQFULi+RXE6u7mGfwi2nyQQ2he0SL24L
 eBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/JpQCcUrKRnv9+kGh5cCSzc4dhrThbAR0CKm4hnpyM=;
 b=rmZFKDU33EoCcIoh3V0WqUeKVv9tBO7hQTVK1S7WXaeMadXUGfN8ngqxga5G67B28j
 1mIu4HyeZmio6z1duBNRh9a7tOJKs3KL760KSc5p59QJraoIzo3QeyhQp5drzqtnCgm6
 M54ZwFdPvX0/giiqiJExNH94WLYQqy31eQLYHJNDXM+hMlTm0Ry4L8Z3l5YZU1W1++FM
 p9slaxknyCLOLyJy+ZQzfCYGccaTrEUmGkjlfafMP0V/NAj5ScnZR4XLeeXsKeMRwCII
 H5hL26Ng+kKLlzM1Tbw63y45h9z7r4RbpKJMVa79TZlR/slfCIotAMUB3Ze8Z9Po5D1b
 pVtA==
X-Gm-Message-State: AOAM532ux4de43dtZt4/Hh9WPZUcKCTQ2Um9R7oRgrjuoptuO2YPZih+
 OPtJ0M0B/HoI6KAwdUM93K/p1WZR2k/M/uyS
X-Google-Smtp-Source: ABdhPJxJL2Ec/2iwhLxVPn69q3BX+hFbtFFzI5Y+Buu0EH8Db3xpVcI8h8Z5vyW3ia3r9alyaDYsGA==
X-Received: by 2002:aca:4004:: with SMTP id n4mr3154801oia.89.1615995291090;
 Wed, 17 Mar 2021 08:34:51 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/38] tcg/tci: Split out tci_args_rrr
Date: Wed, 17 Mar 2021 09:34:11 -0600
Message-Id: <20210317153444.310566-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 154 ++++++++++++++++++++----------------------------------
 1 file changed, 57 insertions(+), 97 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e5aba3a9fa..1c879a2536 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -191,6 +191,14 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_rrr(const uint8_t **tb_ptr,
+                         TCGReg *r0, TCGReg *r1, TCGReg *r2)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
@@ -349,7 +357,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
-        TCGReg r0, r1;
+        TCGReg r0, r1, r2;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
@@ -486,101 +494,71 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Arithmetic operations (mixed 32/64 bit). */
 
         CASE_32_64(add)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 + t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] + regs[r2];
             break;
         CASE_32_64(sub)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 - t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] - regs[r2];
             break;
         CASE_32_64(mul)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 * t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] * regs[r2];
             break;
         CASE_32_64(and)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 & t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] & regs[r2];
             break;
         CASE_32_64(or)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 | t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] | regs[r2];
             break;
         CASE_32_64(xor)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 ^ t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] ^ regs[r2];
             break;
 
             /* Arithmetic operations (32 bit). */
 
         case INDEX_op_div_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int32_t)regs[r1] / (int32_t)regs[r2];
             break;
         case INDEX_op_divu_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 / (uint32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] / (uint32_t)regs[r2];
             break;
         case INDEX_op_rem_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int32_t)regs[r1] % (int32_t)regs[r2];
             break;
         case INDEX_op_remu_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] % (uint32_t)regs[r2];
             break;
 
             /* Shift/rotate operations (32 bit). */
 
         case INDEX_op_shl_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 << (t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] << (regs[r2] & 31);
             break;
         case INDEX_op_shr_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1 >> (t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint32_t)regs[r1] >> (regs[r2] & 31);
             break;
         case INDEX_op_sar_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1 >> (t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int32_t)regs[r1] >> (regs[r2] & 31);
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, rol32(t1, t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = rol32(regs[r1], regs[r2] & 31);
             break;
         case INDEX_op_rotr_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ror32(t1, t2 & 31));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = ror32(regs[r1], regs[r2] & 31);
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i32
@@ -715,62 +693,44 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* Arithmetic operations (64 bit). */
 
         case INDEX_op_div_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int64_t)regs[r1] / (int64_t)regs[r2];
             break;
         case INDEX_op_divu_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint64_t)regs[r1] / (uint64_t)regs[r2];
             break;
         case INDEX_op_rem_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int64_t)regs[r1] % (int64_t)regs[r2];
             break;
         case INDEX_op_remu_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (uint64_t)regs[r1] % (uint64_t)regs[r2];
             break;
 
             /* Shift/rotate operations (64 bit). */
 
         case INDEX_op_shl_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 << (t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] << (regs[r2] & 63);
             break;
         case INDEX_op_shr_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 >> (t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = regs[r1] >> (regs[r2] & 63);
             break;
         case INDEX_op_sar_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = (int64_t)regs[r1] >> (regs[r2] & 63);
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, rol64(t1, t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = rol64(regs[r1], regs[r2] & 63);
             break;
         case INDEX_op_rotr_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ror64(t1, t2 & 63));
+            tci_args_rrr(&tb_ptr, &r0, &r1, &r2);
+            regs[r0] = ror64(regs[r1], regs[r2] & 63);
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
-- 
2.25.1


