Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3715312913
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:53:44 +0100 (CET)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wgJ-0000nk-SL
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRS-0001W5-Ds
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:22 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRQ-0005oU-5A
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:22 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e9so7028509plh.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0x6yAz9IWt//DqIhrZQq1lj8QzyPzdXLy5ti7im2Qlc=;
 b=ms9hPp+xNSRHOyFZBZTroCbE/SPWwzW+5nbNgmt0rSohoysYtiLF6E+IeDD+YW7nWu
 1QNAJHO69KvXRJpjInebJQxGuQazZMb4zhXMRsVZOIVr522++WosWQ7wT2adfcQB1bsg
 uTKX0JPyQ7PClNpZJ7NvfhaWpvzFbNdy+IVWSWAgnIf8LZ2xtdsRclsoxYJ3GKbXYSnJ
 +Oa2vCZik/fnZHJ/jYf8PJFPxtuGwRRgUg1PFmga2lDccrvzhnYiGzW7h6iuRn1V3rhZ
 wmUivQzILtdz5ZVIXixtQnF0g7E/xdtXFLfAuWhSDUbMpDXKRqv9QtJ3CGCEL9C5UYZe
 f5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0x6yAz9IWt//DqIhrZQq1lj8QzyPzdXLy5ti7im2Qlc=;
 b=U8wUDv+i+FKj0nNO566PobjdKvy6Arip6qtBg1t4SQjztymu2kjSP1DDdkLMYsdjoa
 vxodo8hm7V9hm60deA84zlm1sc9W7aj918Dd3z3LrI2xeyy3eZ1BBCGoSbcoG7o4u0ty
 gehLchQIhPaFY82Asu4lvxgFLFgeM2sHqXDK9QADa53HN3K457qwJWmg/RYt5UeVMT7y
 suC2cwrnhAAWRYh1M9J3qoN5EtSHyAeQB/BZCtQFYjgnyduj5zaiMsRfg/hfsEQqORdI
 BSfyCPW7qWMDQf+LJbrk5WrUgvFIH8W5H6ZNgh+n6mQjlRTSvCHiHFPNaVOw0ECLrCde
 E+kw==
X-Gm-Message-State: AOAM530D8QBANgPeT26Nzcqk9dS0N4aF9szJ2/uSCAUmZvFPBQJCBUhf
 Wq0936w12YeZPU3GDSWzm6eaXcgDP/Rlpg==
X-Google-Smtp-Source: ABdhPJyPdGp30l28Fw5uv/ile2tfzmi4ujBI1bMzssxYs5VvMfZL3fJFc9KHmP5A3Op4oYF7Ip1IFg==
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id
 o1-20020a1709026b01b02900dad2952582mr14301840plk.14.1612751898767; 
 Sun, 07 Feb 2021 18:38:18 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/70] tcg/tci: Split out tci_args_rrr
Date: Sun,  7 Feb 2021 18:37:02 -0800
Message-Id: <20210208023752.270606-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 154 ++++++++++++++++++++----------------------------------
 1 file changed, 57 insertions(+), 97 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0bc5294e8b..1736234bfd 100644
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
@@ -366,7 +374,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint8_t op_size = tb_ptr[1];
         const uint8_t *old_code_ptr = tb_ptr;
 #endif
-        TCGReg r0, r1;
+        TCGReg r0, r1, r2;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
@@ -503,101 +511,71 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -732,62 +710,44 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


