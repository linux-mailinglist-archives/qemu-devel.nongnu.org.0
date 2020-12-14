Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700462D99A2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:19:41 +0100 (CET)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koohQ-000458-Fe
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSS-00026G-E0
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:12 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSN-00040k-OP
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:12 -0500
Received: by mail-oi1-x244.google.com with SMTP id q25so19223073oij.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mZ7Cv5t9pDHcLwkTAHUkGoZLzbW+EIVJw5j5xRLRZ3w=;
 b=llWe3wZt78bposQlakYx4jKASaeOxfGJ3Bv8D+GtjqYFn2n5Q9U5qjtYDEsvUsA+WZ
 Rfj5WcNvylazl1uwXt66xcx0O1/RUSmCl++TMKZD9lAkhJWDsbLf4vwvVP0jr1G7I9Db
 VEI5sIYDXEGBEGdVwY9OTqbdA2l9R+V5SUEB3LVhb0g9fbpgHnp4km1wfy23L1i10FRZ
 g7y8pz5A3pwdENvN/7+wGrbB5GTTXwhUJO4cMnpLRkTdQE+yANpPXCAnsBwhRPYaMmkS
 UNJxqLUO5l3oPTLLc9bmWqesU1Rw7zfgLpaiOo+sRe7W7YW0a0b03DP1zRryWyq+Ivg2
 /YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZ7Cv5t9pDHcLwkTAHUkGoZLzbW+EIVJw5j5xRLRZ3w=;
 b=TJN23gjzGHWO16JOIRg5IECm3nYTOYxLAt/5jzBKlflQYiyDWs61BtNec/JeDj58PO
 x7lin07AZjBC4uQjHiHwcPu0wkbezwAiLEV7Q3y9ntwt58IP77TCwjOsv4jFCJo2LqUT
 aMSF4ddMP103jyyBAv0F6OG/kWM1ERQdrHuRWbyt3BBWySfCeHxQ5gGtEvjDw2GJghCZ
 a4eeLWddbtkfbNU4DPtuzScHosesjW+lZe2q54IfvlK/xTw5MfGb9vmiVLwFWAXKFFrl
 E7QLMrCr35IlKxer9J2tpdp6TZVvyeoYJgw1KonQ7lZFq+3HQIJbWAhxUPKGfqhm3DaI
 4SRw==
X-Gm-Message-State: AOAM531VWdML0R8Piku3FGZyqhYjGjnClAahFCmHd3VOghiy60ljUzR9
 WjaqnZtPvQxsEo244ITN3ytkqjskI4MLle/M
X-Google-Smtp-Source: ABdhPJzrfcyGzIOh42bNxpess4VOE5mgRlx4ueEygasxsjsl9t/JDW7or8Qchjv4Bto9exgdFvaAIQ==
X-Received: by 2002:aca:47c2:: with SMTP id u185mr17970978oia.56.1607954645344; 
 Mon, 14 Dec 2020 06:04:05 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/43] tcg/sparc: Use tcg_tbrel_diff
Date: Mon, 14 Dec 2020 08:03:01 -0600
Message-Id: <20201214140314.18544-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
 tcg/sparc/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index d599ae27b5..8f04fdf981 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -440,7 +440,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 13-bit constant relative to the TB.  */
     if (!in_prologue && USE_REG_TB) {
-        test = arg - (uintptr_t)s->code_gen_ptr;
+        test = tcg_tbrel_diff(s, (void *)arg);
         if (check_fit_ptr(test, 13)) {
             tcg_out_arithi(s, ret, TCG_REG_TB, test, ARITH_ADD);
             return;
@@ -537,15 +537,15 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, uintptr_t arg)
+static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
 {
-    intptr_t diff = arg - (uintptr_t)s->code_gen_ptr;
+    intptr_t diff = tcg_tbrel_diff(s, arg);
     if (USE_REG_TB && check_fit_ptr(diff, 13)) {
         tcg_out_ld(s, TCG_TYPE_PTR, ret, TCG_REG_TB, diff);
         return;
     }
-    tcg_out_movi(s, TCG_TYPE_PTR, ret, arg & ~0x3ff);
-    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, arg & 0x3ff);
+    tcg_out_movi(s, TCG_TYPE_PTR, ret, (uintptr_t)arg & ~0x3ff);
+    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
 }
 
 static inline void tcg_out_sety(TCGContext *s, TCGReg rs)
@@ -1313,7 +1313,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_movi_imm13(s, TCG_REG_O0, a0);
             break;
         } else if (USE_REG_TB) {
-            intptr_t tb_diff = a0 - (uintptr_t)s->code_gen_ptr;
+            intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
             if (check_fit_ptr(tb_diff, 13)) {
                 tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
                 /* Note that TCG_REG_TB has been unwound to O1.  */
@@ -1345,8 +1345,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             }
         } else {
             /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_TB,
-                           (uintptr_t)(s->tb_jmp_target_addr + a0));
+            tcg_out_ld_ptr(s, TCG_REG_TB, s->tb_jmp_target_addr + a0);
             tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
             tcg_out_nop(s);
         }
-- 
2.25.1


