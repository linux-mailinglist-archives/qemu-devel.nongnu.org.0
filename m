Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF3531E0E0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:55:19 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTqw-0006XN-5w
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLR-000862-Hd
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:45 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLN-0007J8-Vm
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:45 -0500
Received: by mail-pf1-x433.google.com with SMTP id u143so9153226pfc.7
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTYpj8j1BDaPmAY+nQ2t8wqeA00FmJJ79xXvarenAZc=;
 b=VSIEpuYy1KK6CMXSFshvldt+HmJCp4wCM+haWpdRDsY1W0URVXJ5JoKB9KaJIsd1Gr
 hzS7DSlbPkaEZ9cpqcBYBOmhFHvhS3C6PFi8Gf+4bCd4uflSadLdWfUfCmb6Ng1PSpHR
 s9RsVE5NjFgtUUPgTkobZAuchHk6yMoHwwzQfIFYm4Hpf66pXY0p/C1k0YKHcjIl0Frt
 1wTKvhHt2KgYdR/eNGh7qLACP2/T8Bvq0Pi+wpHgLti9uwjNrfiL5lX7L4byxUuVNWLw
 I+0jgeE85Nu0DTpp5HK1WTWLqT6C1y0/jUJk8epuJZHHqPrqcKEIIrnptRnq4fJ1Qnym
 Cp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTYpj8j1BDaPmAY+nQ2t8wqeA00FmJJ79xXvarenAZc=;
 b=f98HnX49jKZlPCZ166ogkl+M9JnVXKhX3rxsempx6QGyozoei8s+Zo6a6niY0HoGto
 25OR7b8bYyYpHYc0g+hVch++fMJwdhnMJDaeb4OnEYjo98fXHgfd7DkkFrxM0NtGbwlI
 2MuV1DXNcwnHDg8czrT9ZJaQ3gxnpJiJo1tKhaR+OmMbnOV77koESz2InIxwgkXHbBkC
 1aM90NCdjoA4H57QMYuSAduZ0N6DiyhPIl+JLNH0FYANkKGyyA2zfZ8bug9/dTrCxmLI
 +mtTCNRkfB0NVsHiotuAMEwpQObnE5FlKr6FJa6Iceiz4hzMWYF6/kuPlm8DiZn1KJz8
 18Rw==
X-Gm-Message-State: AOAM532jjxLXsg2QUNd4T22IVdpgVjsFrE68tLtkmjvnqg1DJo+oS6iI
 /kGu+OEPDif/ukmidlimJ91YzGtGcIJzuQ==
X-Google-Smtp-Source: ABdhPJzIH3QDMDJbXqVFB4xzuUYdBhlEeEbX7RtIz291R2o0zi+fbmInf8Ljx/oV1btcbgUyRhjYaw==
X-Received: by 2002:a63:e554:: with SMTP id z20mr958107pgj.448.1613593360142; 
 Wed, 17 Feb 2021 12:22:40 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/71] tcg/tci: Split out tci_args_rrr
Date: Wed, 17 Feb 2021 12:19:45 -0800
Message-Id: <20210217202036.1724901-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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


