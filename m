Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AACA6D8670
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 20:59:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk8Ly-0008Me-8U; Wed, 05 Apr 2023 14:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pk8Lv-0008MA-Tx
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 14:59:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pk8Lu-0002DW-AE
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 14:59:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso40463759pjb.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680721164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iEdcsTW1hEUvLFvYsO3M1U005BBk9gqYd/+r2kFboD0=;
 b=pTRUXT2zyFaZcozFdzAOCjIlkpMOcFWTtZD565n6ybUEsSmEFlHF9g6Uuw4jx/bpfL
 U5f/kYsVvlyWMpD2s78NL8EeDBmXP1iWRv2ZNQ22WbsXX+HF6iI4iPsKzxSGJpKK+or7
 BUkgF+d6Bixv38ivOBgmaSwcU+P3Hxo4AOtuRrd/6+daYFueYNnijXwWh9J36kru1Shf
 2wjGCoLgYb3Ra9+b3LSlzTa5+Lu3SaOECDPlOLXcLB2uH7V/EkIrfZ2+tMd1FA2cnmmh
 cKtFYZVUiI/0Ta4ApgkmCBPNcZES3CdlyjV4urzf6awiCSDipSW73lAJa53k/hxSTxD7
 i5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680721164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEdcsTW1hEUvLFvYsO3M1U005BBk9gqYd/+r2kFboD0=;
 b=WiGwqHghRmhVaC1cjNK9YWyDbQNd2SCi7npNq43p3fzJcKSnJzG54NtvAunwws4rLC
 fxF2OBQWxJQwOzxb9AmuT4z80SNUX6P4suaMp6c6/YejvLL6LGGz2KqR3KEQv5YnV85Q
 tbNONzjykfXFMIMskEVhtnJ/mUC41sOxAOqj1iXQ+C4hXS52tS0SMbgfrxpWaXEDjoOY
 TYX7b1EPcwmlCq4G3euVM5NjThSPhy1NXpqOdXFJJv/CQHCrR2UT6aaK0lOs61ViKrFG
 D7jLI/wpuKhYnv/dSkhBS2aPrwnaTAvSrLkRRRg8hkZ13o43Sh2WrfjwU9QP0C6FGRQK
 2zsQ==
X-Gm-Message-State: AAQBX9fgubRnW28lbwUsgeBWeKnFvDawG7RT8I6Nt5lluPNe0s4Upi41
 qXXImcFJyqBm15vKhJBMarBsVOu+nr8U65VFOZQ=
X-Google-Smtp-Source: AKy350YSymPtadW9/imFrBFe2tpVuJoaFjWjv/HVAoQodKRw/9QpDjAtpJoO2/B/MgLYZXNvtg9H0Q==
X-Received: by 2002:a17:90b:1b4d:b0:237:24eb:99d8 with SMTP id
 nv13-20020a17090b1b4d00b0023724eb99d8mr7758820pjb.19.1680721163986; 
 Wed, 05 Apr 2023 11:59:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:ce11:4532:7f18:7c59])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090a348d00b002310ed024adsm1738134pjb.12.2023.04.05.11.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 11:59:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-8.1] target/sparc: Use tcg_gen_lookup_and_goto_ptr
Date: Wed,  5 Apr 2023 11:59:22 -0700
Message-Id: <20230405185922.2122668-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 137bdc5159..47940fd85e 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -322,7 +322,7 @@ static void gen_goto_tb(DisasContext *s, int tb_num,
         /* jump to another page: currently not optimized */
         tcg_gen_movi_tl(cpu_pc, pc);
         tcg_gen_movi_tl(cpu_npc, npc);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -4153,7 +4153,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 /* End TB to notice changed ASI.  */
                                 save_state(dc);
                                 gen_op_next_insn();
-                                tcg_gen_exit_tb(NULL, 0);
+                                tcg_gen_lookup_and_goto_ptr();
                                 dc->base.is_jmp = DISAS_NORETURN;
                                 break;
                             case 0x6: /* V9 wrfprs */
@@ -4162,7 +4162,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 dc->fprs_dirty = 0;
                                 save_state(dc);
                                 gen_op_next_insn();
-                                tcg_gen_exit_tb(NULL, 0);
+                                tcg_gen_lookup_and_goto_ptr();
                                 dc->base.is_jmp = DISAS_NORETURN;
                                 break;
                             case 0xf: /* V9 sir, nop if user */
@@ -5661,7 +5661,7 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
                 tcg_gen_movi_tl(cpu_pc, dc->pc);
             }
             save_npc(dc);
-            tcg_gen_exit_tb(NULL, 0);
+            tcg_gen_lookup_and_goto_ptr();
         }
         break;
 
-- 
2.34.1


