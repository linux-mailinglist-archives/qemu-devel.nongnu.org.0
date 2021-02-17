Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B631E098
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:37:38 +0100 (CET)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTZn-00058c-MQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLO-00084o-7O
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:43 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLL-0007IG-MK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:42 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y25so5878874pfp.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6sBjD/Gklksw/pC9kJWfSGVfQExpOAv9Sf85vKHjqp4=;
 b=RJ/mZngUYlj44dBdw+UPnVzawIbWA1IIrL2SnKAg00o8wUq63578y0k0txokMrK0lW
 RLpC8F6fULPmyelK0kXaLgcnsoHTOUIyQmbkRIQo49zVM5UUiKivMbMkZ+aUpAccROxY
 nmXT1LNrChvrxp7wot3YKxCPPrwdiivMppkAUcRCnVHC9+k7/bC/DRkYRg4Fj2LFxgRu
 95xgERdhieuf7QSqDakm2RJrhUPwmNLQdns+np0a0z5naUhY5iksqrY7qs/GqZurEtM4
 TMMsn63RTc1MOR/rrkBZxReRXr8cKIKt9LSbNK+BXJK9S5/i4Wj+HMRsG0EGuI+3jD8g
 5G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6sBjD/Gklksw/pC9kJWfSGVfQExpOAv9Sf85vKHjqp4=;
 b=NQQ7Avd56RU/vdSOVGPfymn+fXfOENubMRNfhdOTsKSrN/3whnx6fZv6qvH6PC3k3c
 CS4myEGtaHo68FzQ55sJ4p2XHWHAZv42nd9EkqMBFUFYTVtHGQEEM3/tLq/D/BO/YgDj
 fk5edX5LeQTbGAiHQemVIqiCHrmn78Oj4QtsXIjUiAwmE3eFj9d84uSnVPlO4VgTPkDd
 w7BkVFY1AZdCkwJup0jlhZMRR1V/LLdebna/MaUAOCujleQOsm5o/5rnTdc4wzZhDI1s
 DTDUuUV3bcqV8SOn/XFw19Dr6XtxFKgGv84+wqhWkMOuXa8ZbKapYzWcrTzkw9tG/EaK
 NtNQ==
X-Gm-Message-State: AOAM530NwvO7gB5rYP1qEjHVKa4EyzxUQSJX/BsZshBeiDqNZSnigXLX
 2dIBBnYwvh+uw7d3+lJ9BddmBMMeFEIgFQ==
X-Google-Smtp-Source: ABdhPJyohbbfL0EUiOXN5idDLrGWfEbLmLW1ycCbkrUt1UIhUQfrOSVXCMksNezSqe4eT4F8D69fzQ==
X-Received: by 2002:a63:347:: with SMTP id 68mr994347pgd.164.1613593358269;
 Wed, 17 Feb 2021 12:22:38 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/71] tcg/tci: Split out tci_args_rr
Date: Wed, 17 Feb 2021 12:19:44 -0800
Message-Id: <20210217202036.1724901-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
 tcg/tci.c | 67 +++++++++++++++++++++++++------------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5acf5c38c3..e5aba3a9fa 100644
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
@@ -422,9 +429,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -635,58 +641,50 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -799,21 +797,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


