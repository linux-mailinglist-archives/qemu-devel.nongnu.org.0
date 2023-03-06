Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E866AB3C7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyus-0007GP-Ej; Sun, 05 Mar 2023 19:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytl-0004Rp-Pg
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:19 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytj-0006cS-94
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso11540939pjr.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXx54BdgufaxSWnmWZfkICtqjBEVUmlgVE9qxesmKXY=;
 b=iOS/db7Cts+0NghnRYJ4bFBB+xWtwQEeXhe7IzyNA7f7qhBfPmDCS9lTPxFGpWUH7w
 0p9HNA0sy6Ym8qCp+VssdYHKQPHWBWMc6CbJRYNCy3wxEKJ8oUdQxcTt6gcHhHnUwRkK
 wexrVo/3m1BARH14uWT8xeyihAibxKof6XHwUlZG034es7pWH+hIY6VretpNlzWUfXto
 F9HGqdiBFSGggoaLVyytjMpUrKGFRT0fPFkYZhplUmwFOiym6hF8inqD/gxv9zRqqOXk
 5t7fzfM2TKCtCd+bxUBitlJXob9UpJUAxc9s2YnvAAaGmSUFXKy0J9NidCVlwwQfYkjj
 hhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXx54BdgufaxSWnmWZfkICtqjBEVUmlgVE9qxesmKXY=;
 b=QCiFaxNmVJh3SkFS5jpfKmMk5Y/9MLLz9Gdtt3hXXU2Hf9bYBBudGlteNKoRHkWLej
 EPsKVLy5rWn+SRH1+Ye0Gzt1c/YlTC8A9lnJiZ4lJVTr5aOoKrTNTMY4FsX1x1bh4mr0
 uolQuwVYrXQT8Zoh/xuPdxkLx3XJK1tE/iuJMPSb40MC0l8FD5eB/i0ZJOw8gvDGxKIY
 X2y21awKDANfZCS/xinldIhcJWSkKO89AVLEqFKlBz313yBlnrB0xqMUiV/7VDMo1Gdo
 8ho/p8mpADrxS3xzc2ik4dw4F5q3DNP7xvLMUfUCF55xbc1CeWoerYWxoYQMlAqOub9f
 Rshg==
X-Gm-Message-State: AO0yUKWIXpCmVgoVsUOTRGK5wjWeMW0EWToXiavabymXQSMEXECUdHMT
 O370DFFLzXVDH8unwoePw0Ryu9aLPU1R2vU5vE6A9Q==
X-Google-Smtp-Source: AK7set8wKUSGmzD7akJ4ypLhFpHcruVPOCEQ0e82WA65riybxbLVC3QpPpPrVruAM95DsLYCtWJHAQ==
X-Received: by 2002:a17:90b:3b45:b0:231:284:ea4d with SMTP id
 ot5-20020a17090b3b4500b002310284ea4dmr9426874pjb.22.1678063213500; 
 Sun, 05 Mar 2023 16:40:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 20/84] target/arm: Drop new_tmp_a64_zero
Date: Sun,  5 Mar 2023 16:38:50 -0800
Message-Id: <20230306003954.1866998-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Only the use within cpu_reg requires a writable temp,
so inline new_tmp_a64_zero there.  All other uses are
fine with a constant temp, so use tcg_constant_i64(0).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  1 -
 target/arm/tcg/translate-a64.c | 41 +++++++++++++++-------------------
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 8ac126991f..0576c4ea12 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -18,7 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 38804e7077..e7fa6497cd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -408,13 +408,6 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-TCGv_i64 new_tmp_a64_zero(DisasContext *s)
-{
-    TCGv_i64 t = tcg_temp_new_i64();
-    tcg_gen_movi_i64(t, 0);
-    return t;
-}
-
 /*
  * Register access functions
  *
@@ -433,7 +426,9 @@ TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 TCGv_i64 cpu_reg(DisasContext *s, int reg)
 {
     if (reg == 31) {
-        return new_tmp_a64_zero(s);
+        TCGv_i64 t = tcg_temp_new_i64();
+        tcg_gen_movi_i64(t, 0);
+        return t;
     } else {
         return cpu_X[reg];
     }
@@ -1532,7 +1527,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
-                                new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11001: /* PACIASP */
@@ -1543,7 +1538,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11010: /* PACIBZ */
         if (s->pauth_active) {
             gen_helper_pacib(cpu_X[30], cpu_env, cpu_X[30],
-                                new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11011: /* PACIBSP */
@@ -1554,7 +1549,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11100: /* AUTIAZ */
         if (s->pauth_active) {
             gen_helper_autia(cpu_X[30], cpu_env, cpu_X[30],
-                              new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11101: /* AUTIASP */
@@ -1565,7 +1560,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11110: /* AUTIBZ */
         if (s->pauth_active) {
             gen_helper_autib(cpu_X[30], cpu_env, cpu_X[30],
-                              new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11111: /* AUTIBSP */
@@ -2285,7 +2280,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
                 if (op4 != 0x1f) {
                     goto do_unallocated;
                 }
-                modifier = new_tmp_a64_zero(s);
+                modifier = tcg_constant_i64(0);
             }
             if (s->pauth_active) {
                 dst = tcg_temp_new_i64();
@@ -3550,10 +3545,10 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     if (s->pauth_active) {
         if (use_key_a) {
             gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         } else {
             gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
     }
 
@@ -5628,7 +5623,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacia(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacia(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x09): /* PACIZB */
@@ -5636,7 +5631,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacib(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacib(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0a): /* PACDZA */
@@ -5644,7 +5639,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacda(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacda(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0b): /* PACDZB */
@@ -5652,7 +5647,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacdb(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacdb(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0c): /* AUTIZA */
@@ -5660,7 +5655,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autia(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autia(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0d): /* AUTIZB */
@@ -5668,7 +5663,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autib(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autib(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0e): /* AUTDZA */
@@ -5676,7 +5671,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autda(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autda(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0f): /* AUTDZB */
@@ -5684,7 +5679,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autdb(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autdb(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x10): /* XPACI */
-- 
2.34.1


