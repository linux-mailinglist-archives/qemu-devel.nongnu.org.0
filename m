Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CF4881ED
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:56:13 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65e8-0001bO-7n
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I6-0001M2-9Q
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:34 -0500
Received: from [2607:f8b0:4864:20::102a] (port=54952
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I4-0003ch-RF
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:26 -0500
Received: by mail-pj1-x102a.google.com with SMTP id oa15so6230868pjb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0Tsxo+6wwyGjGP1LUKn3jwXiyZIm9+mz8iPkc8Ojds=;
 b=Ln4P5WnsUcLvpdXdqnMPVLWmUroSdcwfUscxRuHu80Trv1uVLnyBrAxtTFJjX5wo5K
 K6BJcUSrtLTt7Y64+ZO2OPh5VgOzNx2QWnzcYR7qsCE36J+IV/mTw3Ake5khoEW12KsU
 ZbaFxeelcIjZ3LowekyLkoRkTMWFJmG/b+x1nWvrmsuR6FBNkDRBG7TSlhmblmcj9c2p
 aAUrAZKr7T7SkRdlUwqBVzLeEKfVwIm10U7zSRVXeoOhAvhEcZvKwNYvlEeeoFXNWr7y
 SvZvzTGxjKxvMthalQOrVdMcw0ey53SSxvjyj8JfIvAFUtGKVUNHieQCGmOtkbVc+TAp
 Pnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0Tsxo+6wwyGjGP1LUKn3jwXiyZIm9+mz8iPkc8Ojds=;
 b=fbCQVF732Edvcm7E4FEULLZzaeBzzzd4Zrxl/D7bchwVwULnmxUACCRDCLMmhR8lDG
 YYF89x0ZhQDHXFw/tddn3rZs7s/CLvqwh4GIRcPcnmVu2ezJaXBozf50Rvef+hWA9peF
 qrvN4o4gDfQllx99ZLzSA8AsO2qesk0UYZv5UIfk+lArQLb6HylVAev1uS9efStnq3sa
 t4BqRThKKgWEjqaGoxxLixpgMCRekhJzQr39ZE5Q/Vhr+3N/bPB3LW8kvv8om65lWASp
 UIAZbjm+/vX34Xe0lcsa85t+n4tZd5KJ/WRSLcf5uurh+V7CptoBZN6PjxhWFgkY6dIt
 bLrg==
X-Gm-Message-State: AOAM530fFv3fnRByqkluiGj0CsKsH93PvBPVsAjPFo9xEwK1kSO7PAxj
 drgskuVzKRFy60w2VvVKQzSJsyNuymiT9A==
X-Google-Smtp-Source: ABdhPJx80KxOdH5QdcxR3uSUDM8+sYMHGvbaRVTHJQWGzDhvxgbmxzsUBQkGOhKlVpb01aZjOVzpLw==
X-Received: by 2002:a17:90b:1bd1:: with SMTP id
 oa17mr19220455pjb.242.1641623603554; 
 Fri, 07 Jan 2022 22:33:23 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] tcg/arm: Support unaligned access for softmmu
Date: Fri,  7 Jan 2022 22:33:11 -0800
Message-Id: <20220108063313.477784-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063313.477784-1-richard.henderson@linaro.org>
References: <20220108063313.477784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8a20224dd1..b6ef279cae 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -34,7 +34,6 @@ bool use_idiv_instructions;
 bool use_neon_instructions;
 #endif
 
-/* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
@@ -1397,16 +1396,9 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
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
@@ -1441,27 +1433,32 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /*
      * Check alignment, check comparators.
-     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
+     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
      * to reduce the number of sequential conditional instructions.
      * Almost all guests have at least 4k pages, which means that we need
      * to clear at least 9 bits even for an 8-byte memory, which means it
      * isn't worth checking for an immediate operand for BIC.
      */
+    /* For unaligned accesses, test the page of the last byte. */
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


