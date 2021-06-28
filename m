Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ACE3B6AE8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:16:34 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzYP-0000iu-Ux
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQb-00013k-8k
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQS-0006Ix-QQ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:29 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so765294pjb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loMJ2WbopmUDgBUYo0lpIFqDair2sU9QatnNWOiWnBA=;
 b=jp1WcUG7Q+os/x2l/DMPPGlbe60rKjJYTxriADwqZIxYhCQbweIhEAvJxVfHOsrMP+
 A6KCdCkODZ1wlwmPfeHNVRERM/lvpNShrwzqwDrgOuNUZlnzpDU/75vbOVDy4iUATPLS
 UxWQtEjGFjDPCyUz4e35MrvS5CE/cgHcY7TYXkq+ImzywwwRNu2WiscgPZanoXDGMyih
 JmqLnS0xZXJw1HlDulNj/LUQwO4cvqh0YbAGkYtgBfAxJ0Uq5YD5cr3kpdaLjZWTZGaJ
 Rv7reKRH63/rLF8Vu9QCnwfw0nnhMKEV3o+x2qmERG9jG92Xg1pS2IlRsx4xawANa4D+
 rHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loMJ2WbopmUDgBUYo0lpIFqDair2sU9QatnNWOiWnBA=;
 b=OAUt51dKo/rWGtv/R0DUNgYiRhWihQlfPQNmaWa/b4A7U069159rvePMw8lFmF2JvC
 bz9+AuYECGu5W21dBzgysFmdHNy46Be+uDPKlWbGGlqtVkFnQhLIpjzBQ0GXht2EDztH
 oUmAnQbaOeEKeCpE0NSViHf57quqSz/V8XNaOmTwoxw8mObVumnMi7NRjlhkkRzsQCD9
 3rJ89CCAMaX8pUnnhELGCVl+Lq0hHD792+Hld3vrBeHTbDagHhCRaF80LbhNs47vh/XM
 WcJ/0tpxuHh1mrrXq3H/QwjhU33pF3ABLnDg49cKpifQXPSEBlmyx5cSZEmZjjSOUmfa
 3MIQ==
X-Gm-Message-State: AOAM532bIolssiDDdPwBMaceJ+fPzBcRyalKABRaG4sJE1suJdE8M00b
 lTXVOF4H9i1GsNcMVAMN/iqRJu3wcX2eYg==
X-Google-Smtp-Source: ABdhPJxBsDKONUISUkhu4WTZW7Va4Mae+KLjLCPi3RCnucJfb5cGEdHGXk5R4+srf5/8JCOTSiDJ2g==
X-Received: by 2002:a17:902:778b:b029:128:c0ef:9d7e with SMTP id
 o11-20020a170902778bb0290128c0ef9d7emr12122531pll.36.1624918097935; 
 Mon, 28 Jun 2021 15:08:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] target/nios2: Use pc_next for pc + 4
Date: Mon, 28 Jun 2021 15:08:10 -0700
Message-Id: <20210628220810.2919600-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have pre-computed the next instruction address into
dc->base.pc_next, so we might as well use it.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index abc7e5f96a..930f3d3395 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -211,7 +211,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
+    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
     jmpi(dc, code, flags);
 }
 
@@ -265,7 +265,7 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     I_TYPE(instr, code);
 
-    gen_goto_tb(dc, 0, dc->pc + 4 + (instr.imm16.s & -4));
+    gen_goto_tb(dc, 0, dc->base.pc_next + (instr.imm16.s & -4));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -275,9 +275,9 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGLabel *l1 = gen_new_label();
     tcg_gen_brcond_tl(flags, cpu_R[instr.a], cpu_R[instr.b], l1);
-    gen_goto_tb(dc, 0, dc->pc + 4);
+    gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
-    gen_goto_tb(dc, 1, dc->pc + 4 + (instr.imm16.s & -4));
+    gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -435,7 +435,7 @@ static void nextpc(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     if (likely(instr.c != R_ZERO)) {
-        tcg_gen_movi_tl(cpu_R[instr.c], dc->pc + 4);
+        tcg_gen_movi_tl(cpu_R[instr.c], dc->base.pc_next);
     }
 }
 
@@ -448,7 +448,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
+    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
-- 
2.25.1


