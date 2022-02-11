Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E24B1B9D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:50:36 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL51-00006r-57
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:50:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnX-0004l7-9k
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:31 -0500
Received: from [2607:f8b0:4864:20::632] (port=38861
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnV-0007RR-9A
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id c3so3414893pls.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ketepLsla6Fb9Bi8BESWHNr++JeX+OGmr7bPr/0gl9Q=;
 b=sDy9WM39MjTlY9fYGPwHjWuv9WsKJ0Grr8ukp8YsPm7tp9Nr+JY/ZfBP9kmvyLvquN
 F1+D2zqpm91/aisap8Ntsck8EWSvo0hp8OVHH80gktsHn5Oam3gB2i2n97e1WK4PwsRn
 Jn4LO9O56B31y6iEv3YHDLcJfkhFrVGaBh3CyGoBqjMbhxuu/QAlAlytk1NmQhK3+LUa
 V0JWFRV8AXNZ6GE6aPEitI5Z7Hhz97XpD0f458c5DaK7u5gfAmsrLPt9iQVhWF0VKjLm
 4o1Q5YYkdQwfYodHAxg64iui9yxHv0OkFo7LkzS8J37SGJaDmq0FoGSiO9aSNjU3Myyz
 c4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ketepLsla6Fb9Bi8BESWHNr++JeX+OGmr7bPr/0gl9Q=;
 b=L/80glWuFRhXAApts6BACWIuY2mZgw0IrXC8pZ3STQkrBU9ubWjRUB709sbg0dw25F
 nHH0IaxWlPAAVyeK2XUjIqbTRQiFReiw+/R3FazpWPVdocvJ1llMyOGg37AB0jC/n9bF
 rWlC2dLHWEfmnQxZZH6DZWfhEmlKb1QP842trXC3eXHjP32ahk4BmSavO4y1OFP01XHs
 ujG8kRdCA27Q+0YIIz1XLJ0kGP69/GfIsvNTplqn6JkFtiEqlewSBjyYGz3XVJjJRlkl
 qZ5OpaycDGj+2g3r3KpDMbXrtysQblXoSWr2aN5gswFxOpk5Dy135KmcDE1rkM0ZuVLX
 U/wA==
X-Gm-Message-State: AOAM532voUekC98aobIbSIoXxAA6xVhSgB8YvKbYQbbb0H5b/sMsB+VX
 XZr/YQV1eEYp8bL+XD93JZAwJMTjTkkeXEIn
X-Google-Smtp-Source: ABdhPJynLeuB263Tatj7eyStzWt3OnvdTud5iaACsRfJDiAsPV4duUQY6nVDhqMRhjINNmUfiv+yLw==
X-Received: by 2002:a17:902:7595:: with SMTP id
 j21mr10009335pll.79.1644543147672; 
 Thu, 10 Feb 2022 17:32:27 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/34] tcg/arm: Support unaligned access for softmmu
Date: Fri, 11 Feb 2022 12:30:46 +1100
Message-Id: <20220211013059.17994-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From armv6, the architecture supports unaligned accesses.
All we need to do is perform the correct alignment check
in tcg_out_tlb_read.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 41 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 4b0b4f4c2f..d290b4556c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1396,16 +1396,9 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-
-    /*
-     * We don't support inline unaligned acceses, but we can easily
-     * support overalignment checks.
-     */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
+    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
+    unsigned a_mask = (1 << get_alignment_bits(opc)) - 1;
+    TCGReg t_addr;
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
     tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
@@ -1440,27 +1433,35 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /*
      * Check alignment, check comparators.
-     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
+     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
      * to reduce the number of sequential conditional instructions.
      * Almost all guests have at least 4k pages, which means that we need
      * to clear at least 9 bits even for an 8-byte memory, which means it
      * isn't worth checking for an immediate operand for BIC.
+     *
+     * For unaligned accesses, test the page of the last unit of alignment.
+     * This leaves the least significant alignment bits unchanged, and of
+     * course must be zero.
      */
+    t_addr = addrlo;
+    if (a_mask < s_mask) {
+        t_addr = TCG_REG_R0;
+        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
+                        addrlo, s_mask - a_mask);
+    }
     if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
-        tcg_target_ulong mask = ~(TARGET_PAGE_MASK | ((1 << a_bits) - 1));
-
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, mask);
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
         tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
-                        addrlo, TCG_REG_TMP, 0);
+                        t_addr, TCG_REG_TMP, 0);
         tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
     } else {
-        if (a_bits) {
-            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo,
-                            (1 << a_bits) - 1);
+        if (a_mask) {
+            tcg_debug_assert(a_mask <= 0xff);
+            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
         }
-        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, addrlo,
+        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
                         SHIFT_IMM_LSR(TARGET_PAGE_BITS));
-        tcg_out_dat_reg(s, (a_bits ? COND_EQ : COND_AL), ARITH_CMP,
+        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
                         0, TCG_REG_R2, TCG_REG_TMP,
                         SHIFT_IMM_LSL(TARGET_PAGE_BITS));
     }
-- 
2.25.1


