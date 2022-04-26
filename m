Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3415108E7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:24:30 +0200 (CEST)
Received: from localhost ([::1]:59106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQnW-0001Zp-1G
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpz-0001rc-6i
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpx-0005Rs-JQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 u6-20020a17090a1f0600b001d86bd69427so3268659pja.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FydhLHa4yRdKoi+QMZFm3ACoytrW9DGPCspIkMaQe9I=;
 b=UEanv7dasubxQge87dL0Fakxp502DYRAjTJIHVkkH9kNJa+VF3FmkUSi9SnkRzf5SL
 Sg5kqdvtVEdRg4yev1LuBuqS3E9wEFnpPGWJNKLf+IHKjB6WQd7hudR5SDq2qKZ6SJhh
 7gKfCb6gkWPV2yo7RGLL+WdQHAPlYy31an9gDrlaRziyqYbU1KMDYTyk9I9ZRPrlL7Dd
 AEIfydJrKUZ5pc0rQjGuw5w/Ig2RQawaJ+R3ZUkAa/dC4sBauOWZyw6JH56nYG/IB7rZ
 vaIlPxJ20Dy0QesoRHe8dBW1gPmOlmXI5a8Jvtvt6fMzK95j+gMi1uoWnnPnVq4+31Cc
 DXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FydhLHa4yRdKoi+QMZFm3ACoytrW9DGPCspIkMaQe9I=;
 b=VFBZ9zfxZf/mE1HUG3PqYP0i2ZwJ4GMvXYOJcc+g1vMig/paOmqt5bdWDLq0dIZ1nZ
 /+sjlabDpHoOasqJ38l9TLT5AVJA2PRh2Roi+a/RF1fHy9EYdWOn2iHYZRwyN1EX1nEP
 7Znw9mEfvassDFJlKtCD7K0j1lMvaPvDyieeF+FVN5smKcDSaFqGElos+GRFf/Oa81mS
 xsI05ND0EufbVQ0Y7YX/mnfbJhNZwFJUDIgeYRxnVdgUWtyt73fmiO1lARa4JZHOKE2S
 o92+AmMgH/NeDx4Ux3UKTGv1h/TuC8onwssHLPxCa1GsvtJZT5SNeoSeJ/Top7NlEp71
 +7kA==
X-Gm-Message-State: AOAM5330Hypn41K5nBLjkH2G13bpiqeCi79BSJgRkHfHa/H4VCQDnKRQ
 95XojJVamTJNICCEdQ73sS/KWrDz3I2qRA==
X-Google-Smtp-Source: ABdhPJww8O0tOLjfV78J9tazr/nJ0hlOC43DlBUVChLgFWIggT7JChvu4A5tJIOZG574zAZgTTtAFw==
X-Received: by 2002:a17:902:6ac7:b0:150:24d6:b2ee with SMTP id
 i7-20020a1709026ac700b0015024d6b2eemr24976450plt.168.1650997376254; 
 Tue, 26 Apr 2022 11:22:56 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/68] target/nios2: Create gen_jumpr
Date: Tue, 26 Apr 2022 11:18:51 -0700
Message-Id: <20220426181907.103691-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a function to perform an indirect branch.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-49-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e2742a8556..8616813365 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -36,7 +36,6 @@
 #include "semihosting/semihost.h"
 
 /* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
@@ -195,6 +194,16 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
     }
 }
 
+static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
+{
+    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, regno));
+    if (is_call) {
+        tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
+    }
+    tcg_gen_exit_tb(NULL, 0);
+    dc->base.is_jmp = DISAS_NORETURN;
+}
+
 static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     t_gen_helper_raise_exception(dc, flags);
@@ -437,8 +446,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, R_RA, false);
 }
 
 /*
@@ -468,8 +476,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, false);
 }
 
 /* rC <- PC + 4 */
@@ -488,10 +495,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
-
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, true);
 }
 
 /* rC <- ctlN */
@@ -909,11 +913,6 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-    case DISAS_JUMP:
-        /* The jump will already have updated the PC register */
-        tcg_gen_exit_tb(NULL, 0);
-        break;
-
     case DISAS_NORETURN:
         /* nothing more to generate */
         break;
-- 
2.34.1


