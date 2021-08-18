Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37FD3F0D72
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:36:04 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTEB-00061j-OF
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7k-0005qw-4R
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:24 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7i-0005lH-Kw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u1so2698300plr.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bLtXt+lT9me4raRszPf/cWzutepwm37BmFJxuVb8lnI=;
 b=T5CZyFag8HBOBK/jIfxFy3NYgEqQb57tjwrAYxfiX4sgZH5lLQq8jpt8JaOWtbZXXQ
 2vTHJAoB8WIvQ/kFwzFAohRJoN2wjnQ4Wwp9A0RwCmtSMywpnt+dMu3GvurNT1IM6SBX
 iX/RpV9qgBktXAD64mJ67TsaeDz7/4J2S003dYon3qTL/oJQGw6/VGgqSrMSWMUiDhMs
 gfOyZ6i3vMzvNuVP+oEFBwHiumLuauGHuzztqorkrwM9s8DW8ecMEWqUu0HyE7pMi6W5
 yUkUAd/gP84A8O6k2oZ72jq7gmCZwaP48lL5i0C8OtNSWEZnKF791Jc+L7o8+H4XgyQf
 notA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bLtXt+lT9me4raRszPf/cWzutepwm37BmFJxuVb8lnI=;
 b=nPvO+iO+PC7XTSPs4jgABy9ncdCAti9RT7qy4CQg8peWNSSD831wMC7S1qAJ4Vhax5
 9TXdIitVn6118ywiIhw7uLd9wDHIVsqd2R3oUs1UeYSZ9nXN7BQKoSglo+Vx/VjvDmbK
 ZY2CWGsr0ibrCOCbDiT5k5n5Q9aq0FuS3dvE39o+GB3vBxJrw85dW/IP7QGa/fnQ9WRK
 kTuD3BgTOuz7gbnlFD89ElWdYvyyHFXCED3pEgd+aE67hCPDcUVZ8WRWWtJpLVhddK4R
 cVNfiVmg4tobJRJB1NjksoqvhMLz/bckFtPWwy8Eka1RxJx671/r5uR04CPxpQ0Rg0Iu
 cGzA==
X-Gm-Message-State: AOAM533gPuvYEa61x/O8Fo60jSiw+x7pqS1TajJxdI+9ovoiQ4a+SKmD
 KbLqMDZiLR8siZRRDBWL11dA5vhSxg3L5A==
X-Google-Smtp-Source: ABdhPJzePpgJfxu8ggBhgmyAhZRBEfR//xkp0GB3MiTZoDHYBCFigIj1LChKmGl47s3OmI8e00PNBA==
X-Received: by 2002:a17:90b:14b:: with SMTP id
 em11mr11372869pjb.125.1629322161354; 
 Wed, 18 Aug 2021 14:29:21 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/14] tcg/arm: Split out tcg_out_ldstm
Date: Wed, 18 Aug 2021 11:29:05 -1000
Message-Id: <20210818212912.396794-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Expand these hard-coded instructions symbolically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c55167cc84..63b786a3e5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -134,6 +134,9 @@ typedef enum {
     INSN_CLZ       = 0x016f0f10,
     INSN_RBIT      = 0x06ff0f30,
 
+    INSN_LDMIA     = 0x08b00000,
+    INSN_STMDB     = 0x09200000,
+
     INSN_LDR_IMM   = 0x04100000,
     INSN_LDR_REG   = 0x06100000,
     INSN_STR_IMM   = 0x04000000,
@@ -586,6 +589,12 @@ static inline void tcg_out_dat_imm(TCGContext *s,
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
@@ -3119,7 +3128,10 @@ static void tcg_target_qemu_prologue(TCGContext *s)
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
@@ -3147,7 +3159,10 @@ static void tcg_out_epilogue(TCGContext *s)
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


