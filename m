Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D656312917
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:55:50 +0100 (CET)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wiL-0003xQ-AD
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRR-0001VM-EP
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:21 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRO-0005oI-TE
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:21 -0500
Received: by mail-pf1-x42f.google.com with SMTP id j12so8736229pfj.12
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SycMd2jWeSgxswrzk2jq/EmJnAdi6ZgvEeestJkdRLA=;
 b=u+DHUausGSg2Zb5HYzAPBdVlGVT7Mw3m2Q6EO/akMZKT7SPOvSFpdGLR7mLqzNtkjS
 WBF85W9rOTnWly+GxiSvt0p3cl2eQZtqZLP0U7wAgbj11XmTwn2GLswlzSooUm9t6ghp
 bhJrpIf1V/ap0/Iqj4RLPztHY1DHGJsk8Z5M0/IBv5TC/dr2nnwp32TJoQy6gUHAHxQk
 7louWn/ne8qRtmDVATluP2MmM+Yzs/aUZzOIef+dRIFuUMA5UQ4/M4CioSD3OMmW4yl1
 /Xf/sc/sHcOsKqolDVhtqUCnzH4c/db8zOlyYgpHETnokhfb3ox8o0L4J5zG2aI3urp2
 rBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SycMd2jWeSgxswrzk2jq/EmJnAdi6ZgvEeestJkdRLA=;
 b=MDnDJX6VVM0jAbVJFgghoKCHrFiLbnJV0X7QXbJaqzzUnWjBg4vNwFTeWSmqz9BUIK
 oMXLjF5VHPig2d2lSB7esT9pRmvkFJ6ynOKHuLY0epQzqOE6MYbnNgF9BDLBuJxqgsHE
 yI9pAT0RYdQWKDdTtdFaGXm6ytMQbFknpBQwg5w5qpe2y/qNVxjo9QjvVW6ZO/zlj0TA
 f3zElLqCkk/S6CQLosVGo9xhrfqgPtM3qxaRM4/grb8PU43v0D//UK9iP3BGKqa+xP2Q
 kGR+HPkBCZkOGmOY/HKDLLEG/moAqQS0i8jvBGnuzh9Kw3tIz0Z3Ti4spS6cq/AErjz9
 MaFw==
X-Gm-Message-State: AOAM532FwdTKrhdibBZ4wUcGeFnvq0AYI+j6kaJBntT4yeX9YixoEBBB
 ymvGIAnLNkAOY28nm3VFaDU1jABfcxFoVA==
X-Google-Smtp-Source: ABdhPJwFpt9Up/p/abQcns53TjvkyD020MnPfD8PRwMgKKJ6iNq8s6Ucy5H2LcUJ8DWAp70iS584og==
X-Received: by 2002:a63:e101:: with SMTP id z1mr14879027pgh.190.1612751897630; 
 Sun, 07 Feb 2021 18:38:17 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/70] tcg/tci: Split out tci_args_rr
Date: Sun,  7 Feb 2021 18:37:01 -0800
Message-Id: <20210208023752.270606-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 tcg/tci.c | 67 +++++++++++++++++++++++++------------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index be298ae39d..0bc5294e8b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,13 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_rr(const uint8_t **tb_ptr,
+                        TCGReg *r0, TCGReg *r1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
@@ -439,9 +446,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         CASE_32_64(mov)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
             t0 = *tb_ptr++;
@@ -652,58 +658,50 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
         CASE_32_64(ext16s)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
         CASE_32_64(ext8u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint8_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
         CASE_32_64(ext16u)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint16_t)regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
         CASE_32_64(bswap16)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap16(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
         CASE_32_64(bswap32)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap32(regs[r1]);
             break;
 #endif
 #if TCG_TARGET_HAS_not_i32 || TCG_TARGET_HAS_not_i64
         CASE_32_64(not)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, ~t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = ~regs[r1];
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i32 || TCG_TARGET_HAS_neg_i64
         CASE_32_64(neg)
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, -t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = -regs[r1];
             break;
 #endif
 #if TCG_TARGET_REG_BITS == 64
@@ -816,21 +814,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (int32_t)regs[r1];
             break;
         case INDEX_op_ext32u_i64:
         case INDEX_op_extu_i32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint32_t)t1);
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = (uint32_t)regs[r1];
             break;
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap64(t1));
+            tci_args_rr(&tb_ptr, &r0, &r1);
+            regs[r0] = bswap64(regs[r1]);
             break;
 #endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
-- 
2.25.1


