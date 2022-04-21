Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0650A5DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:36:24 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZn6-0004Gr-1p
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd2-0005R6-Cd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd0-00077k-PR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:56 -0400
Received: by mail-io1-xd2d.google.com with SMTP id p62so5685078iod.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGQntkmBNb70hQZGHLgUoeJ3BSXEiaygJllOksu/0OM=;
 b=wbl65uu7KXiff+qAyQwWq+rbhrmxYXpsfGNzylYqEh8ZJ+uMp2Hql7rYms6NQQPZuW
 DdLOSk+VefmMCmLTObSkWkjmHtQlYhS8MIyVccIMQ6ITXH6AZx5hRNqSPzmpKdycdR8T
 AJOBWtaIYc/EavnDV0l09/LllzO0XEG4k2sfbTcdGPfoGvaODcpPVTzv7HNVUkd0n2sy
 4+H1bwexjmn0SK1SByU4eO6wXV7G+aMpKusPM2j0cRaBX6rhIgFs9w3C1Rg4s972EjN7
 7H198wuFdNWJzzMQTvilZRJIrYhTlgiA11nbX3A78LtICi7EZyfVq8GQPz8S4FkoGWN0
 xsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGQntkmBNb70hQZGHLgUoeJ3BSXEiaygJllOksu/0OM=;
 b=J874wG0i/0kf/Gaow1Tm1R8g5jqltQSzojwsoUytd70ff61Jrr/c7o9AyNySKdqppo
 NmQMCv0fh0WDeJQgKM4ZY0HSfmPMDh6i/Oa19Uxt0BWmnCg8Q0lbNa4fGDpEmcM04881
 ymYbxegA4k0O06JIqjfI7f0xL6Qnz77l4nYKApqZxNb2DjzUcmybBAt57Z4sH2leWQMo
 Vd3hxZ/1iH3FHE8Vmv4Vq0syJpcBa85vjVOfqbp76gsZXjxD9MFwYZUm0Zno5kF1/jp6
 h2gotXOWd7hTRlVGfuUwILLUdrk8N0qvocERV64xNRIaZNDdDEXD5BXmtXbaaDA9NiKj
 BIFQ==
X-Gm-Message-State: AOAM531hx81jb69Kamfb/WwVOREvVRg6gpEKoYFuJdX9eCRLxtLorySi
 nQJvDhUkJyxGJtAMzyLZLgrPSWZZyig5yA==
X-Google-Smtp-Source: ABdhPJz7th2ystjkVwzm61UEPe+iByKlYm0iXvXqRIimm36QNw2gFzyiwJ0zI3AByJLfKI+4T831Lg==
X-Received: by 2002:a05:6638:2491:b0:323:d48f:8417 with SMTP id
 x17-20020a056638249100b00323d48f8417mr23205jat.315.1650554511577; 
 Thu, 21 Apr 2022 08:21:51 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 48/64] target/nios2: Create gen_jumpr
Date: Thu, 21 Apr 2022 08:17:19 -0700
Message-Id: <20220421151735.31996-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2d.google.com
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
---
 target/nios2/translate.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 98efb4e10a..e39e349389 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -36,7 +36,6 @@
 #include "semihosting/semihost.h"
 
 /* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
@@ -189,6 +188,16 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
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
@@ -432,8 +441,7 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 /* PC <- ra */
 static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, R_RA));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, R_RA, false);
 }
 
 /*
@@ -463,8 +471,7 @@ static void jmp(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, false);
 }
 
 /* rC <- PC + 4 */
@@ -483,10 +490,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
 
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
-
-    dc->base.is_jmp = DISAS_JUMP;
+    gen_jumpr(dc, instr.a, true);
 }
 
 /* rC <- ctlN */
@@ -908,11 +912,6 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


