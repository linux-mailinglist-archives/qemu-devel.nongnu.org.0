Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824E40A255
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:07:39 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwvC-00025M-99
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9j-0006ns-5x
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw9e-0001RM-4j
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:18:34 -0400
Received: by mail-pg1-x52a.google.com with SMTP id w8so11003528pgf.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gxykVKzYkSvuUxjtPtSETsJM3+ta8X5HmQHDSXeQ23I=;
 b=p7kGEiU+OuIq6beNeeGUjkE3PxLteer+TH29Pqt6d7ltdZgbN6ebE31OyyIu9o1pwZ
 280qkewTze8pDIwfWNPB3+V4yscHVX0bPBA8HNnUfmy7jc5omwW7FrlaOcetXeOTNE6D
 k7ItjHSRHDnglbyiMN11D3h0CNWcFxHX7kSX6XzDvyK3g/1NtdD4DQJVSXlbb638SSub
 VRaQ5p1uMY9olxFXv9kWYxjwhmVgU9Da5rg5fnstYKvHzUIuTudI04KRcRnJ/1uVpGeP
 w/xftQyZd1Wfva3wnYilTAl67oWDGz8ZoUVWdMfurNbfRflPpgi0w7zJYud8ZOgZzUQa
 a7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxykVKzYkSvuUxjtPtSETsJM3+ta8X5HmQHDSXeQ23I=;
 b=8BQj/NyBJ3NInDlolxH0T224CzQfVvvWVRsCTE9YzSKVw8W064GGNnlVXEPrk8CnlB
 X/wATyOdGz/gUJTT42t6qPRJmFBbaPNVXYuZLPuyAjcYQ7dKPA/1VkkGgC2Z/enu016Z
 a/UhTlt1xPVGAQcVQiIFovLby34luBCPOiMZhw3WjKGCpaX/Xur8CQgVWpCMrSsacq9x
 R/NfBOcbr2mJHZ4pV6TgTt7NB3ilm2UMYfZhoExR8aui8vTZe7Nd4j1SgwjkedNcuHdP
 AJmL0tt/zZns+wOpD2Fr+ka2H1Rm5F2+Jfh22yIkJfO7Cmub64KxGFoj4b4kx2s8SiTA
 HV6A==
X-Gm-Message-State: AOAM531NomLu40/2KJHIqcOzMlAUT089cHPHpMDnP+wI6wWUdTZf7E3a
 C8DzWSGnPkeWkLau/TJG54ZvJI8FDDMcNw==
X-Google-Smtp-Source: ABdhPJzM1vFDBEDV7wEy7Rk8OW4eqyvm1rojO/HDijkZiYzSpJnn+uG8gcQvXMBGuJdp0nbOaiI8gA==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr13303369pgm.143.1631578708647; 
 Mon, 13 Sep 2021 17:18:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2638909pjb.48.2021.09.13.17.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:18:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/44] tcg/arm: More use of the ARMInsn enum
Date: Mon, 13 Sep 2021 17:14:55 -0700
Message-Id: <20210914001456.793490-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 tcg/arm/tcg-target.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c068e707e8..cf0627448b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -570,7 +570,7 @@ static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
                 (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, int opc, int rd,
+static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, ARMInsn opc, int rd,
                             int rn, int rm, int shift)
 {
     tcg_out32(s, (cond << 28) | (0 << 25) | opc |
@@ -603,14 +603,14 @@ static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
     }
 }
 
-static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, int opc,
+static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, ARMInsn opc,
                             int rd, int rn, int im)
 {
     tcg_out32(s, (cond << 28) | (1 << 25) | opc |
                     (rn << 16) | (rd << 12) | im);
 }
 
-static void tcg_out_ldstm(TCGContext *s, ARMCond cond, int opc,
+static void tcg_out_ldstm(TCGContext *s, ARMCond cond, ARMInsn opc,
                           TCGReg rn, uint16_t mask)
 {
     tcg_out32(s, (cond << 28) | opc | (rn << 16) | mask);
@@ -637,8 +637,8 @@ static void tcg_out_memop_8(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | ((imm8 & 0xf0) << 4) | (imm8 & 0xf));
 }
 
-static void tcg_out_memop_12(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
-                             TCGReg rn, int imm12, bool p, bool w)
+static void tcg_out_memop_12(TCGContext *s, ARMCond cond, ARMInsn opc,
+                             TCGReg rt, TCGReg rn, int imm12, bool p, bool w)
 {
     bool u = 1;
     if (imm12 < 0) {
@@ -873,7 +873,7 @@ static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rI" constraint.
  */
-static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, int opc, TCGArg dst,
+static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, ARMInsn opc, TCGArg dst,
                            TCGArg lhs, TCGArg rhs, int rhs_is_const)
 {
     if (rhs_is_const) {
@@ -887,8 +887,8 @@ static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, int opc, TCGArg dst,
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rIK" constraint.
  */
-static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, int opc, int opinv,
-                            TCGReg dst, TCGReg lhs, TCGArg rhs,
+static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, ARMInsn opc,
+                            ARMInsn opinv, TCGReg dst, TCGReg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
     if (rhs_is_const) {
@@ -903,8 +903,8 @@ static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, int opc, int opinv,
     }
 }
 
-static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, int opc, int opneg,
-                            TCGArg dst, TCGArg lhs, TCGArg rhs,
+static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, ARMInsn opc,
+                            ARMInsn opneg, TCGArg dst, TCGArg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
     /* Emit either the reg,imm or reg,reg form of a data-processing insn.
-- 
2.25.1


