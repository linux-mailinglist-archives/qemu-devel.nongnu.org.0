Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757CB40A230
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:52:01 +0200 (CEST)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwg4-0000sM-Gf
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6u-0001vI-BA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:40 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6g-0007vY-JA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:39 -0400
Received: by mail-pf1-x42b.google.com with SMTP id e16so10450072pfc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uTLZzqxs9XAa07bAQKkmrTrRThGv91dnwDKo1jmYb9Q=;
 b=thcmJxM2l+P7OP9IoKLJ4QHcRwRI0+20avQnUyuQgHhOlKjXFylYKTxujIWqEmXJ/m
 Fwj0JwZp2TJunGiJFVyNDfwrI95HoCX5bjq8J7crfOf3xqNiSqBiNL8IRawJGej/BYJj
 iYJOTu/H6a0CGRbhaCncacqDeJcFxYoH1N0zsAB+lyvMF5yaiF8f7AT/Ox12WQG9cAuP
 JobdQITkvLqwQneq6i/IoPNC9rSQ808gfgRTF92Li/L4IwrJ2y+047CXQ8ICPlMXojis
 9Ne90cj/Hn0aJPG0WByioR66vGxRVcVm/1Wj5u+rY750jRd8vqUtLiaLR38wD9RILT81
 TK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTLZzqxs9XAa07bAQKkmrTrRThGv91dnwDKo1jmYb9Q=;
 b=bZpSFuriq9jIxol8UVL8lbDC8QbTGKt3s+vl9e+W4cHnvaPN/NJ74P86MbRc3Dbn33
 dVewT1mKJ1Is3YIN2zLqFFnv9AERaHsRMUAFKeUH6NtylwWO7udMWIqm72cppdceC/YC
 Aa8FCoSB8o4cgcFRpk2slXvrdBW3Slah6po/gVUCQ4sigx8E0veAKZoCaGqN0BLoSwUK
 K2SXuNbgrw0T5Um7L6eabjrc8wiPuCyZg4oCRCLMvcv80GWYEB+Tbciwig3WOsvm2AGl
 /MZU5aB38lnvCYgzX/Tfe+M/+K/piOMmenLTNT5hp+64i5Y5JPVEkjsqp4ITfACQBAid
 HWiA==
X-Gm-Message-State: AOAM532skCpye9fCSlWjoZIVrXiruZ5uMZKs/wRDkeBIoP3NLlVFO9gp
 ukC2wGE/FUKfINA7e8GUnuIzRU7tX6PVgQ==
X-Google-Smtp-Source: ABdhPJzrz6hOElmtE1R1NRmwonrkFZanejcKdQuEcFrHGbuS0TL3lRamgYqUZQh4/vCfjAlxDuaz0g==
X-Received: by 2002:aa7:88c9:0:b0:3fc:38d8:fc32 with SMTP id
 k9-20020aa788c9000000b003fc38d8fc32mr1986572pff.81.1631578525031; 
 Mon, 13 Sep 2021 17:15:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/44] tcg/arm: Support armv4t in tcg_out_goto and tcg_out_call
Date: Mon, 13 Sep 2021 17:14:50 -0700
Message-Id: <20210914001456.793490-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv4T has BX as its only interworking instruction.  In order
to support testing of different architecture revisions with a
qemu binary that may have been built for, say ARMv6T2, fill in
the blank required to make calls to helpers in thumb mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 49 ++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 7d15c36f85..852100bb80 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1211,7 +1211,8 @@ static inline void tcg_out_st8(TCGContext *s, int cond,
         tcg_out_st8_12(s, cond, rd, rn, offset);
 }
 
-/* The _goto case is normally between TBs within the same code buffer, and
+/*
+ * The _goto case is normally between TBs within the same code buffer, and
  * with the code buffer limited to 16MB we wouldn't need the long case.
  * But we also use it for the tail-call to the qemu_ld/st helpers, which does.
  */
@@ -1219,38 +1220,56 @@ static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
+    bool arm_mode = !(addri & 1);
 
-    if ((addri & 1) == 0 && disp - 8 < 0x01fffffd && disp - 8 > -0x01fffffd) {
+    if (arm_mode && disp - 8 < 0x01fffffd && disp - 8 > -0x01fffffd) {
         tcg_out_b_imm(s, cond, disp);
         return;
     }
-    tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
+
+    /* LDR is interworking from v5t. */
+    if (arm_mode || use_armv5t_instructions) {
+        tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
+        return;
+    }
+
+    /* else v4t */
+    tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
+    tcg_out_bx_reg(s, COND_AL, TCG_REG_TMP);
 }
 
-/* The call case is mostly used for helpers - so it's not unreasonable
- * for them to be beyond branch range */
+/*
+ * The call case is mostly used for helpers - so it's not unreasonable
+ * for them to be beyond branch range.
+ */
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
+    bool arm_mode = !(addri & 1);
 
     if (disp - 8 < 0x02000000 && disp - 8 >= -0x02000000) {
-        if (addri & 1) {
-            /* Use BLX if the target is in Thumb mode */
-            if (!use_armv5t_instructions) {
-                tcg_abort();
-            }
-            tcg_out_blx_imm(s, disp);
-        } else {
+        if (arm_mode) {
             tcg_out_bl_imm(s, COND_AL, disp);
+            return;
         }
-    } else if (use_armv7_instructions) {
+        if (use_armv5t_instructions) {
+            tcg_out_blx_imm(s, disp);
+            return;
+        }
+    }
+
+    if (use_armv5t_instructions) {
         tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
         tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
-    } else {
+    } else if (arm_mode) {
         /* ??? Know that movi_pool emits exactly 1 insn.  */
-        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, TCG_REG_R14, TCG_REG_PC, 0);
+        tcg_out_mov_reg(s, COND_AL, TCG_REG_R14, TCG_REG_PC);
         tcg_out_movi_pool(s, COND_AL, TCG_REG_PC, addri);
+    } else {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
+        tcg_out_mov_reg(s, COND_AL, TCG_REG_R14, TCG_REG_PC);
+        tcg_out_bx_reg(s, COND_AL, TCG_REG_TMP);
     }
 }
 
-- 
2.25.1


