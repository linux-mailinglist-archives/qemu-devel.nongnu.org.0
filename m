Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C053E33F42E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:48:28 +0100 (CET)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYPL-0001PH-Nk
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCM-00053a-M2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:02 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:46794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCG-000779-9g
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:02 -0400
Received: by mail-oi1-x236.google.com with SMTP id w125so13614756oib.13
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGPMXTCgMzduqFJf+6gnUyz7CITA8QmqXQgJwuC6k0c=;
 b=E+JwhfdpXAbN0SlLuUOWaHaVQPClnUZX07FRDAQtL1iR2bHzwLeYxlBGnMHChM6E5H
 RjJ8EUslGcyI5UQ90+f0CBDHTjTYlS5R7As93T3hidqL0zikUba1IB0GsSEhtRziXRqv
 UAptDhjmOu0L28rG882vXisRpzUz6ft46TPdo2f0wUpuzivg1uJ9faeDQU6Gm2RuMbRU
 zXUZwFow/c2Nq9Shut8ZrW/TIMRza47LSGPyEJChYfngMWgxU77YsX1eGSoLGePrhpb6
 R18THBmxy5nrZaUdVp/g2mfsJv6cKq9tIN/I/BHH9mbPVrjaDLiuLrYJRy8FTR5B6JfA
 UCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGPMXTCgMzduqFJf+6gnUyz7CITA8QmqXQgJwuC6k0c=;
 b=URJrkgTEYaQ62oYRXaPUzAfcujL5tpRZy/qrEbo9efU39RYaz6PBNDD9JTqjJGWGHE
 r6KL2+Gb6gf0Gt0oRagZLvj1T0Gf8kIZURAxCpeLD1bXR2s5C3dN69RB8Cwbw5QbfOvL
 Z5HwC4hatgXBGw57B2Js5H8JqZG0p0wyHoHBikCebqP6WkWaikgolC8Sd0SwMyOe2ZCp
 dnURJC8i81weCc6L0n4wQgxRzUlQ3FyxF/VpyVv3KU4DVI1bvnWEW7cI+w+p7BTqpeAw
 iEcegvGMiV2+qzxSAe+qQCAQfP/oz1lT4JpqUF3HXnvp8hZvnvyzU+MXPa/VzCh+aXUw
 aWkA==
X-Gm-Message-State: AOAM532teYCuy59tdHc6v2Cw1U1FVsqEw1CD5ghOr7162Q2dl6Cap2U6
 UyvPUozeP4vp3yST2aDWlNMGG9LmRfir9vyD
X-Google-Smtp-Source: ABdhPJyfwdAXHaJ0s+pFm3Qs8z0da8PcaOH734RQGryBf339UpGZ4bA9+bdHpWPC73bD3G2oz9JZMw==
X-Received: by 2002:a05:6808:b09:: with SMTP id
 s9mr3186736oij.36.1615995295051; 
 Wed, 17 Mar 2021 08:34:55 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/38] tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
Date: Wed, 17 Mar 2021 09:34:15 -0600
Message-Id: <20210317153444.310566-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
 tcg/tci.c | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 22ede4016d..854fc8df5d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -214,6 +214,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrcl(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *c2 = tci_read_b(tb_ptr);
+    *l3 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -224,6 +233,17 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *c4 = tci_read_b(tb_ptr);
+    *l5 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
@@ -390,7 +410,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
-        tcg_target_ulong label;
         TCGCond condition;
         target_ulong taddr;
         uint8_t tmp8;
@@ -399,7 +418,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
         TCGReg r3, r4;
-        uint64_t v64, T1, T2;
+        uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -596,13 +615,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare32(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare32(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -622,13 +638,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, tmp64);
             break;
         case INDEX_op_brcond2_i32:
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_r64(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(tmp64, v64, condition)) {
+            tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
+            T1 = tci_uint64(regs[r1], regs[r0]);
+            T2 = tci_uint64(regs[r3], regs[r2]);
+            if (tci_compare64(T1, T2, condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -768,13 +783,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare64(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
-- 
2.25.1


