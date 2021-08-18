Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C6D3F0D94
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:41:04 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTJ1-0007h3-9x
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7q-0006DT-QX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7n-0005oF-1v
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so3300492pjl.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4ML6y7H6wqkUViLdFf24+VFsSyj9FBO2oO9/0ZfWQE0=;
 b=ac2g6rsxNklpad1s9f7B8Zi8bght+mPkQWYW7m3C4wyfEto7kEVjRTUqWQm0PzYirA
 SXow364WxHig4aJV0wiLHsy/J9nN9KuFPgFqUxBf4PCG2Zn/0ebnYOi3ioydEkOMD3lm
 NyBhOwTlZtPHHsIOCcsvQBDQlq+mFFc7LgSnuOSWJ/+JXx/aOEAwlYpJjNc2zqXdlfy6
 Er4tA/1+nY7bhOO0+BeJQrz7AG+tAj7+LpVxiyQyr0rJ/I/Sue4e3gqXij8VRFuE30Uu
 5T9ugAbNvZIomPtCTsLSyF3xTFZ3RI29Sle5a8mMbTOw0ORzjgNw7G0raJo6gn9UsOgT
 3b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ML6y7H6wqkUViLdFf24+VFsSyj9FBO2oO9/0ZfWQE0=;
 b=RQuygiU/y7yG//rWLlJVBueFCQv6RnQhTRYPVL1Zgqy0+t1iixio7sUZeaijEvulXI
 tFFDT+0ktAPx1UubPaudGFP+jPmXsKcS2/DfDd/zBIqmzAzfEVcpi5cMO9WWn3lOMWJa
 bdHWV7ZOiJPS/MXGUcqybm9K4O5MN0c6e3cWEj+RYQoriQqHJHIsZBRkqPYi67KAvv8N
 X87mit8dCd8Bf65RGuUKUafcHaoG0Wn7UBLmE4nxRj120AWsuJA+xETPvWbp2hdhEWqb
 tT22+Mrd6ciP0xV8uvu8SMoGxMjTPXO/M5QjgW1t595Y4WuljtdVrXt3s+u98zJ3ycld
 tRvg==
X-Gm-Message-State: AOAM533mp5/fP8kbIr9US3JIgxhjVHyWFoYIGdotj3z3ohjs6g8FsQzK
 mn3ZQ8+KraGwhdQjrzF3JgWjo3fhndJ+4w==
X-Google-Smtp-Source: ABdhPJydnnOW8Qi6HeIeAtNK91+ZtC/vdAA4FZyImDunNKIcLRgMAucl+iopO6gglAdRWw2muKoUuQ==
X-Received: by 2002:a17:90a:6684:: with SMTP id
 m4mr11493738pjj.226.1629322165743; 
 Wed, 18 Aug 2021 14:29:25 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/14] tcg/arm: More use of the ARMInsn enum
Date: Wed, 18 Aug 2021 11:29:09 -1000
Message-Id: <20210818212912.396794-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b20c313615..2f55b94ada 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -563,7 +563,7 @@ static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
                 (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, int opc, int rd,
+static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, ARMInsn opc, int rd,
                             int rn, int rm, int shift)
 {
     tcg_out32(s, (cond << 28) | (0 << 25) | opc |
@@ -596,14 +596,14 @@ static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
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
@@ -630,8 +630,8 @@ static void tcg_out_memop_8(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | ((imm8 & 0xf0) << 4) | (imm8 & 0xf));
 }
 
-static void tcg_out_memop_12(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
-                             TCGReg rn, int imm12, bool p, bool w)
+static void tcg_out_memop_12(TCGContext *s, ARMCond cond, ARMInsn opc,
+                             TCGReg rt, TCGReg rn, int imm12, bool p, bool w)
 {
     bool u = 1;
     if (imm12 < 0) {
@@ -866,7 +866,7 @@ static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rI" constraint.
  */
-static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, int opc, TCGArg dst,
+static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, ARMInsn opc, TCGArg dst,
                            TCGArg lhs, TCGArg rhs, int rhs_is_const)
 {
     if (rhs_is_const) {
@@ -880,8 +880,8 @@ static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, int opc, TCGArg dst,
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
@@ -896,8 +896,8 @@ static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, int opc, int opinv,
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


