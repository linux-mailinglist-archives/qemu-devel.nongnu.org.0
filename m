Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52F3375F5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:43:05 +0100 (CET)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMWm-0005Aa-NN
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTy-00034X-9V
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:10 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTw-0006Cm-0h
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:09 -0500
Received: by mail-qt1-x836.google.com with SMTP id f12so1265871qtq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTYpj8j1BDaPmAY+nQ2t8wqeA00FmJJ79xXvarenAZc=;
 b=X8m8lbesjyIXrNYg85ChhA/GhauhMirBifsoPuU4u0qNsA/RFhJRZ9hfovf/4uPQ6t
 mTwWgrYD/+vONd/TWM5z9Qqt//oecAabCN8fTXm4KuJPIxk9Ql3n4DyFVKmGLQSLSx1L
 AivDhH6pMZ7q+tHbCbiVc+G7DU/qO+MzIyJ4qEi9wSox+zgdgrib29OV3FZR8I1UKf2x
 E3MWpNGlv75vUbAIjFI007pVG27fViYiTTYJNR6wHgmcgvkNNIV89XswUU/FMyOk7g+2
 xN70x3dmT6QBsOmq5w24GIrGii4+t8YDl0N+YxpY5Fy1B4C5oDr3upsizIn0NL3qPL4t
 oDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTYpj8j1BDaPmAY+nQ2t8wqeA00FmJJ79xXvarenAZc=;
 b=fYSS36RYw8z0vmu+qWLR4vTodtzofwM8Oy/6rOcPUyg+8zW7kRYDXOj96q8S0chPZQ
 3fPWzywyZouMzQuCa3+U1kZ4kgafOChmadHcYFK67/yaf3NDw1sxwUOL63vAF7zk6v0X
 MoxADlLlxZBR0xu0Y1N0tiE+puWbpv179bOy1WuJoovGn9Jw64obFqj+mZqno09KhFNI
 coM7HJrv7hue6WLyt/CZvwJVYs3InSph5BB3vZs66VQ5ICzKkeNK2GiAunsdkJaG99mD
 9juG2cuxgFze0DL1Ep/TJvj5nUplNQNw5yOQQm3Rbu2I4GoS4Tw3SaLpWRidzV8gwxEk
 nw0Q==
X-Gm-Message-State: AOAM533OhzVr2j4Ms+Pjo/1Ey1jAyMD+ALvCuKgAlV2HsuI32DgMKuN/
 yyX4rZjPlzeItdmdZVyQFbxfb0rDZJ8Rx7Md
X-Google-Smtp-Source: ABdhPJzghvzWMARL21njnYLuzlC+oYSvunZCsOTOWAeKvLd7APuypr9E0zbPD6ZsaS/EPhHD4dmpcw==
X-Received: by 2002:ac8:3981:: with SMTP id v1mr7510924qte.183.1615473606870; 
 Thu, 11 Mar 2021 06:40:06 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/57] tcg/tci: Split out tci_args_rrr
Date: Thu, 11 Mar 2021 08:39:06 -0600
Message-Id: <20210311143958.562625-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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


