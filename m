Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64023B09C0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:00:43 +0200 (CEST)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvipO-0005hA-Cb
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidg-0005F9-R5
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:36 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidb-0005Lr-8R
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id e20so17454885pgg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/lN13zaTHZB/kVsExqcKdAsEK0/M5Qen0CO6QpX8H8=;
 b=sfHOrJXgZ7p/0GEO6UzlRgLke9CLZYOrprOMfiA4EzPg8G03hqfY5vMi8zWbjz5j2d
 mptRCjoIln4CTyoNXiAzg/2v/OcNPGBxbuv68FKYpGrC6wuG7TtZo16IsG4bFDCX7QiM
 e4eL6gT17SWsW3/dhTmpdXPMGfejZjkLyB0useaSwL3Uvx0FgRLo2qvU/kqm9O87dcg0
 MBHPRxVrjuf1gPXGGlpPfwbmmNJACYyD8C1ycRWJZCn0904BOVPwgbvJ3V/K4QUpYa26
 c8EI1NFuBiQsdACD/kqf56BGPYTAet7Xf7zZ3hOhgEnOO9j9F48KFYMw5x5azgFX2eHL
 Ztkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/lN13zaTHZB/kVsExqcKdAsEK0/M5Qen0CO6QpX8H8=;
 b=CrcRFiHsIJHiNGTzL/TgEGF8o0Ts/OzsifXUXT0VculCdPapN0vbspLGqWpJe71V3V
 BRZHyQKFxS2S9rc2AEraU/0+8EU3whKt+4rWvgj8TflT1amMsFinUlv21dwu8dwJq/XK
 MAyS3WERj44BBIbDbZP35mPNRCw0/5kgqNH1ebTrIe7f7yym79rDpbKIt2hL/kZyZdSo
 qJUrZK+u/7YXj8RB2rhuGWI0dmt3MNXrFMO9q7MF2kKm9bc+GYRkBSqm67drCy8y5tFa
 WaXn1kyGCF05wmOndBsRYvYlO3qduSEZHOZnUg9fL6Jw7nOql1vO3brtxwMBeX5Jh2x1
 v2lQ==
X-Gm-Message-State: AOAM533NBmRyf0HeqY53I19sFlyXGMtE88lARJDzEihY/6JucBDXWwiH
 /FhIuPaqeLjqy5d5UhNAdNKwrPO4rCyRlw==
X-Google-Smtp-Source: ABdhPJzI7btic9gJ9tslkVGE9debAJXQcmd05Ncfg5xoAp1Smp+daU5Y2DLGw1JhtbjDzlz3cInlnA==
X-Received: by 2002:aa7:8507:0:b029:2ea:559:da5 with SMTP id
 v7-20020aa785070000b02902ea05590da5mr4169508pfn.45.1624376910016; 
 Tue, 22 Jun 2021 08:48:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/15] target/cris: Improve JMP_INDIRECT
Date: Tue, 22 Jun 2021 08:48:18 -0700
Message-Id: <20210622154820.1978982-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use movcond instead of brcond to set env_pc.
Discard the btarget and btaken variables to improve
register allocation and avoid unnecessary writeback.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index ea6efe19d9..05be0a41bd 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -522,17 +522,6 @@ static void t_gen_swapr(TCGv d, TCGv s)
     tcg_temp_free(org_s);
 }
 
-static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
-{
-    TCGLabel *l1 = gen_new_label();
-
-    /* Conditional jmp.  */
-    tcg_gen_mov_tl(env_pc, pc_false);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
-    tcg_gen_mov_tl(env_pc, pc_true);
-    gen_set_label(l1);
-}
-
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
     return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
@@ -3319,8 +3308,17 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* fall through */
 
         case JMP_INDIRECT:
-            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
+            tcg_gen_movcond_tl(TCG_COND_NE, env_pc,
+                               env_btaken, tcg_constant_tl(0),
+                               env_btarget, tcg_constant_tl(npc));
             is_jmp = dc->cpustate_changed ? DISAS_UPDATE : DISAS_JUMP;
+
+            /*
+             * We have now consumed btaken and btarget.  Hint to the
+             * tcg compiler that the writeback to env may be dropped.
+             */
+            tcg_gen_discard_tl(env_btaken);
+            tcg_gen_discard_tl(env_btarget);
             break;
 
         default:
-- 
2.25.1


