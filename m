Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668640A226
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:45:02 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwZI-0002Ov-VY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6s-0001tD-Qa
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6i-0007vr-Nr
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:38 -0400
Received: by mail-pg1-x532.google.com with SMTP id w7so10986415pgk.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n92lxvJQkjhRHc2UltFaxT3DoorMwjjIcHsE8GWq56I=;
 b=bIAdx9CjAqdtLh1iY1+mxrPqmJGYntdqDjbEVEbXboSEfLAbkCarxzTIKmxTkkUDas
 186DG/2m7c+xalAaTDeUg731wwlVogd+LtJ30Wvlgpe1hoTgv4KzhXmgtDQ0LNXNZQSM
 hYreurj91JP1FRmVK6KXBHggYjUTL5anoptCzz0eWd/ZZuKVwZLUgsgslw0URi9Gz6km
 l8+cuPfbLD07kSh3Ky8c0Qx5lLVZGmkeIeFvxZ42eehXmLDYZDNZfk2rJWFiUIoNP/Eu
 05HwSMdkyFw9//hglaHteOhd7UaTQ9G7Z0+VRUxHpM5RFWtYWCPQIsdlVlnv8xhGmKCp
 r7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n92lxvJQkjhRHc2UltFaxT3DoorMwjjIcHsE8GWq56I=;
 b=Nx9wSAIYTmAU25c49ywKgx3Aqs5Oc+BXFLCWM62Cmul9u3cX895Usfnu3DRE94riUS
 re/tabQE+UJr7jAUSNQ04f7Jy08sD6N7sdDeg4obGtGRvVAgMddWH6qallAjNGmyCyZu
 5Krx2yiQIsgXfYGlVj5zPKLMN+U+wQP6jY80MHt8diehuKuXPNfKJNQu7/A5etc3GizL
 Sfoqyh4cOIeuK2pRsh8LRkeDT44lH6FY9vbrnzXwpq/T1YMCrJ5PLycuvSUGDbO0uiXi
 AKP2rLYxQv9aWo2/33b6tJqZQalTuPFLQJT3Nvi7FJTIuMVnrc1faMNySDz0nE+uVZcr
 V7Qg==
X-Gm-Message-State: AOAM533bxtPpVIl2QBqpD0UjxBQb6I3eWRyxAM/oZRzdW+AJNeKD+WiN
 Qwmgaw642r+5Ilr+TtuB1/CtLl7RqwT5ww==
X-Google-Smtp-Source: ABdhPJx205PCFsOxaFprB/tHo5aVVXSZqi00uKBFLAfD+rvbgLxXiprD1JnHIh+hfifYU/HwyD8Oag==
X-Received: by 2002:aa7:8d10:0:b0:414:ab01:656c with SMTP id
 j16-20020aa78d10000000b00414ab01656cmr1906258pfe.13.1631578525618; 
 Mon, 13 Sep 2021 17:15:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/44] tcg/arm: Split out tcg_out_ldstm
Date: Mon, 13 Sep 2021 17:14:51 -0700
Message-Id: <20210914001456.793490-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand these hard-coded instructions symbolically.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 852100bb80..c9e3fcfeac 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -141,6 +141,9 @@ typedef enum {
     INSN_CLZ       = 0x016f0f10,
     INSN_RBIT      = 0x06ff0f30,
 
+    INSN_LDMIA     = 0x08b00000,
+    INSN_STMDB     = 0x09200000,
+
     INSN_LDR_IMM   = 0x04100000,
     INSN_LDR_REG   = 0x06100000,
     INSN_STR_IMM   = 0x04000000,
@@ -593,6 +596,12 @@ static inline void tcg_out_dat_imm(TCGContext *s,
                     (rn << 16) | (rd << 12) | im);
 }
 
+static void tcg_out_ldstm(TCGContext *s, int cond, int opc,
+                          TCGReg rn, uint16_t mask)
+{
+    tcg_out32(s, (cond << 28) | opc | (rn << 16) | mask);
+}
+
 /* Note that this routine is used for both LDR and LDRH formats, so we do
    not wish to include an immediate shift at this point.  */
 static void tcg_out_memop_r(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
@@ -3081,7 +3090,10 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 {
     /* Calling convention requires us to save r4-r11 and lr.  */
     /* stmdb sp!, { r4 - r11, lr } */
-    tcg_out32(s, (COND_AL << 28) | 0x092d4ff0);
+    tcg_out_ldstm(s, COND_AL, INSN_STMDB, TCG_REG_CALL_STACK,
+                  (1 << TCG_REG_R4) | (1 << TCG_REG_R5) | (1 << TCG_REG_R6) |
+                  (1 << TCG_REG_R7) | (1 << TCG_REG_R8) | (1 << TCG_REG_R9) |
+                  (1 << TCG_REG_R10) | (1 << TCG_REG_R11) | (1 << TCG_REG_R14));
 
     /* Reserve callee argument and tcg temp space.  */
     tcg_out_dat_rI(s, COND_AL, ARITH_SUB, TCG_REG_CALL_STACK,
@@ -3109,7 +3121,10 @@ static void tcg_out_epilogue(TCGContext *s)
                    TCG_REG_CALL_STACK, STACK_ADDEND, 1);
 
     /* ldmia sp!, { r4 - r11, pc } */
-    tcg_out32(s, (COND_AL << 28) | 0x08bd8ff0);
+    tcg_out_ldstm(s, COND_AL, INSN_LDMIA, TCG_REG_CALL_STACK,
+                  (1 << TCG_REG_R4) | (1 << TCG_REG_R5) | (1 << TCG_REG_R6) |
+                  (1 << TCG_REG_R7) | (1 << TCG_REG_R8) | (1 << TCG_REG_R9) |
+                  (1 << TCG_REG_R10) | (1 << TCG_REG_R11) | (1 << TCG_REG_PC));
 }
 
 typedef struct {
-- 
2.25.1


