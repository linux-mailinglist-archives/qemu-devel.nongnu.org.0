Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE95F5FB7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:43:57 +0200 (CEST)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHng-0002GW-96
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHit-00033W-7K
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:59 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-0002v3-0d
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id l4so566163plb.8
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jAIVd+PsPK9H32Q3dy80h0gD9cIPUyDfdmmHNOLwGXc=;
 b=BaqvSJbAI3vez9VNGhHeEOxIer7l9IUKYzVdXZCa0U0lpGQQV5zSDB/a8B77LxARue
 UfulY+MKKx6XEPMAq1rlYPbLuFb94PaD9rcSSM7sk3R5A6Ntvg+O+s7S/q4G9krJQPEC
 vzqTKFS7NQEnyaeAf8/TgVKbcoZ4DjncUl6oLhshVXGQ6b8T/1WL0DDMebbbtkyGaECT
 tSl0XIOLdAFFP4KXOLjYdbUgI5JbWi/H6suS3b4ZE7RPPAdTnAxFpkKCEtXHyNBDLsxV
 MdhqQ6Kopbs6RT3l9UBOR26Na67mGrOAAoWkKvlDAmIHZawAAyNZv+rWt0Yoq0TLPJqy
 ZvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jAIVd+PsPK9H32Q3dy80h0gD9cIPUyDfdmmHNOLwGXc=;
 b=mmuy3vm0wWHbzF3sOso9lWDG7UbUG1oMYArExlmTVqdykPz5jn7aW5KeUYoTO7/Sje
 zh4GQ87XO0Zc/vNcHgVOUSr0nxrIjbSGMuV3203K1M2zsQtQrru8mcuk/IjSKTMeIjmR
 5X8ew9E8zypHEeoU0JepTC2vH8xRYwBXmxS/vSoSnUCAwAbkv5bffSRnbwY5YMUO4qbl
 AyZi+76TDsXqyxvEahLwApXDmlky5/PU/bcYI6Vb4fjjEatBvI8MTci7iU7yOPi+GFNN
 Dkx6Njwj/zwcCopbEnVrt13UFRTL5ubs1qniLr3Xs3QDtoY8MFyKMqS5/Grd45dQGEd2
 //Nw==
X-Gm-Message-State: ACrzQf3BTaEde+Btxy9iHmVNR6bsa1cAmFelyklyjnNHoa3WEjoolux8
 XLU83luVEbXg1yVsm+7d3FsldV/QjQUsaA==
X-Google-Smtp-Source: AMsMyM5CkV9R30mJ6FwYrB60iNln6R/xhSjoXNAwUf55zMlQhlodcAKgzDZ6KnuaNmT/m/rJ9NTH/Q==
X-Received: by 2002:a17:902:ebc7:b0:17e:7378:1da8 with SMTP id
 p7-20020a170902ebc700b0017e73781da8mr2636139plg.152.1665027533288; 
 Wed, 05 Oct 2022 20:38:53 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 6/9] target/arm: Change gen_jmp* to work on displacements
Date: Wed,  5 Oct 2022 20:38:43 -0700
Message-Id: <20221006033846.1178422-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e0b1d415a2..336f151c4a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -270,6 +270,12 @@ static uint32_t read_pc(DisasContext *s)
     return s->pc_curr + (s->thumb ? 4 : 8);
 }
 
+/* The pc_curr difference for an architectural jump. */
+static target_long jmp_diff(DisasContext *s, target_long diff)
+{
+    return diff + (s->thumb ? 4 : 8);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
@@ -2596,7 +2602,7 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, int diff)
+static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 {
     target_ulong dest = s->pc_curr + diff;
 
@@ -2612,10 +2618,8 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 }
 
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
-static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
+static void gen_jmp_tb(DisasContext *s, target_long diff, int tbno)
 {
-    int diff = dest - s->pc_curr;
-
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
@@ -2657,9 +2661,9 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
     }
 }
 
-static inline void gen_jmp(DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, target_long diff)
 {
-    gen_jmp_tb(s, dest, 0);
+    gen_jmp_tb(s, diff, 0);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
@@ -8326,7 +8330,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
 static bool trans_B(DisasContext *s, arg_i *a)
 {
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8341,14 +8345,14 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
         return true;
     }
     arm_skip_unless(s, a->cond);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8368,7 +8372,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
+    /* This jump is computed from an aligned PC: subtract off the low bits. */
+    gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
     return true;
 }
 
@@ -8529,10 +8534,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
          */
     }
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
 
     gen_set_label(nextlabel);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8612,7 +8617,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (a->f) {
         /* Loop-forever: just jump back to the loop start */
-        gen_jmp(s, read_pc(s) - a->imm);
+        gen_jmp(s, jmp_diff(s, -a->imm));
         return true;
     }
 
@@ -8643,7 +8648,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
-    gen_jmp(s, read_pc(s) - a->imm);
+    gen_jmp(s, jmp_diff(s, -a->imm));
 
     gen_set_label(loopend);
     if (a->tp) {
@@ -8651,7 +8656,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
     return true;
 }
 
@@ -8750,7 +8755,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel);
     tcg_temp_free_i32(tmp);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
-- 
2.34.1


