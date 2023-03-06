Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914486AB408
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyxd-0002Jj-IW; Sun, 05 Mar 2023 19:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxH-00013n-Gk
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:59 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxB-0007EH-6W
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:52 -0500
Received: by mail-pl1-x635.google.com with SMTP id u5so8501838plq.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7Ei+uJfwvrAMJUbS06iREeLmOZ4/altPxVL6duec7o=;
 b=CWlpV74fneFqCGEL8l5NyKc3CubCSu8Yn1RlpkZhqVGf1u7Tgd88bWgTNaSmh6Ylwq
 920+ag5fprqTfM+sGsGfQ/3KDRJ1aU84fZrepJnD61bSNEbxiM7AljYDVlgD/KkwDubH
 gSUIIjlsPiMj41AWJKghpq4e8txgXWwYBowUmtsk/zv7j4tJATZWt6452jqZC+cVOGoO
 UmbGNGOgNJ1KHKeGd6UZDXVsw36+JItY68qNUpFnepN69KST3S4efVQ5cE+D8cCtuI9N
 PGq/rEla52rGfZSF7/BULi5AKcY68S2SjaghN/m3oFsN4qqnDBn7CrcGfHRDUXcUvqIv
 QsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H7Ei+uJfwvrAMJUbS06iREeLmOZ4/altPxVL6duec7o=;
 b=FkzKuWvsZkwXtF7IqNfDpywabcuXy4nJQ6T6c1g66wwo02xHJSpmUh08Ekqd4UTwuu
 Pe0cdlCvzbwyZN0vlTdKikXaIRME8eI+GBCNmL99lNG3zZspwFjNDCAgRXxBujFAvTLH
 lVxATGkfiwVfBFm5UPn2u7hkcUINCRE8ewrn8qpgGEb/GuMbPiwXFNAIhE4qhGdd8vhI
 zY/vK3POo3T49FlPOtc+gsTtB7yzPjE9iC+mZpgVpx421DI6/RIjmpK+/VD0WKpi2ykd
 W2I7W9aiSNrbBJ8MSSrDfOW/JXUr5iwc7Cxuxwn28bye0DdsKTLsDqWJ7C9L2OCQW/Qn
 /kOA==
X-Gm-Message-State: AO0yUKWj9b+Fy7K6prVed7MXh+2wa6hgQOV67knvWEN4j52Dk+ddTyf+
 Aq8l/EO2UeaMWll0VBd3becQOcLxFnl/WfvRKjXriQ==
X-Google-Smtp-Source: AK7set9BA9jIoqmRdsegmy+GYa/53Ae4B1VJhAY24txOH3Qh0DRahY/Yk1tzOWxCjkp7GCLipboEEg==
X-Received: by 2002:a05:6a20:8f0f:b0:cb:7f0d:e25f with SMTP id
 b15-20020a056a208f0f00b000cb7f0de25fmr10791797pzk.41.1678063428020; 
 Sun, 05 Mar 2023 16:43:48 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 58/84] target/sparc: Drop free_compare
Date: Sun,  5 Mar 2023 16:39:28 -0800
Message-Id: <20230306003954.1866998-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Translators are no longer required to free tcg temporaries.
Remove the g1 and g2 members of DisasCompare, as they were
used to track which temps needed to be freed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 560fb32e28..f32f237051 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -93,7 +93,6 @@ typedef struct DisasContext {
 typedef struct {
     TCGCond cond;
     bool is_bool;
-    bool g1, g2;
     TCGv c1, c2;
 } DisasCompare;
 
@@ -1066,16 +1065,6 @@ static inline void gen_op_next_insn(void)
     tcg_gen_addi_tl(cpu_npc, cpu_npc, 4);
 }
 
-static void free_compare(DisasCompare *cmp)
-{
-    if (!cmp->g1) {
-        tcg_temp_free(cmp->c1);
-    }
-    if (!cmp->g2) {
-        tcg_temp_free(cmp->c2);
-    }
-}
-
 static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
                         DisasContext *dc)
 {
@@ -1135,17 +1124,14 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
         cmp->cond = logic_cond[cond];
     do_compare_dst_0:
         cmp->is_bool = false;
-        cmp->g2 = false;
         cmp->c2 = tcg_const_tl(0);
 #ifdef TARGET_SPARC64
         if (!xcc) {
-            cmp->g1 = false;
             cmp->c1 = tcg_temp_new();
             tcg_gen_ext32s_tl(cmp->c1, cpu_cc_dst);
             break;
         }
 #endif
-        cmp->g1 = true;
         cmp->c1 = cpu_cc_dst;
         break;
 
@@ -1167,7 +1153,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
             if (!xcc) {
                 /* Note that sign-extension works for unsigned compares as
                    long as both operands are sign-extended.  */
-                cmp->g1 = cmp->g2 = false;
                 cmp->c1 = tcg_temp_new();
                 cmp->c2 = tcg_temp_new();
                 tcg_gen_ext32s_tl(cmp->c1, cpu_cc_src);
@@ -1175,7 +1160,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
                 break;
             }
 #endif
-            cmp->g1 = cmp->g2 = true;
             cmp->c1 = cpu_cc_src;
             cmp->c2 = cpu_cc_src2;
             break;
@@ -1192,7 +1176,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
         /* We're going to generate a boolean result.  */
         cmp->cond = TCG_COND_NE;
         cmp->is_bool = true;
-        cmp->g1 = cmp->g2 = false;
         cmp->c1 = r_dst = tcg_temp_new();
         cmp->c2 = tcg_const_tl(0);
 
@@ -1258,7 +1241,6 @@ static void gen_fcompare(DisasCompare *cmp, unsigned int cc, unsigned int cond)
     /* For now we still generate a straight boolean result.  */
     cmp->cond = TCG_COND_NE;
     cmp->is_bool = true;
-    cmp->g1 = cmp->g2 = false;
     cmp->c1 = r_dst = tcg_temp_new();
     cmp->c2 = tcg_const_tl(0);
 
@@ -1342,8 +1324,6 @@ static void gen_cond(TCGv r_dst, unsigned int cc, unsigned int cond,
     } else {
         tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
     }
-
-    free_compare(&cmp);
 }
 
 static void gen_fcond(TCGv r_dst, unsigned int cc, unsigned int cond)
@@ -1357,8 +1337,6 @@ static void gen_fcond(TCGv r_dst, unsigned int cc, unsigned int cond)
     } else {
         tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
     }
-
-    free_compare(&cmp);
 }
 
 #ifdef TARGET_SPARC64
@@ -1378,8 +1356,6 @@ static void gen_compare_reg(DisasCompare *cmp, int cond, TCGv r_src)
 {
     cmp->cond = tcg_invert_cond(gen_tcg_cond_reg[cond]);
     cmp->is_bool = false;
-    cmp->g1 = true;
-    cmp->g2 = false;
     cmp->c1 = r_src;
     cmp->c2 = tcg_const_tl(0);
 }
@@ -1391,8 +1367,6 @@ static inline void gen_cond_reg(TCGv r_dst, int cond, TCGv r_src)
 
     /* The interface is to return a boolean in r_dst.  */
     tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
-
-    free_compare(&cmp);
 }
 #endif
 
@@ -3268,7 +3242,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     l1 = gen_new_label();
                     tcg_gen_brcond_tl(tcg_invert_cond(cmp.cond),
                                       cmp.c1, cmp.c2, l1);
-                    free_compare(&cmp);
                 }
 
                 mask = ((dc->def->features & CPU_FEATURE_HYPV) && supervisor(dc)
@@ -3827,7 +3800,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     cpu_src1 = get_src1(dc, insn);                 \
                     gen_compare_reg(&cmp, cond, cpu_src1);         \
                     gen_fmov##sz(dc, &cmp, rd, rs2);               \
-                    free_compare(&cmp);                            \
                 } while (0)
 
                 if ((xop & 0x11f) == 0x005) { /* V9 fmovsr */
@@ -3851,7 +3823,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         cond = GET_FIELD_SP(insn, 14, 17);              \
                         gen_fcompare(&cmp, fcc, cond);                  \
                         gen_fmov##sz(dc, &cmp, rd, rs2);                \
-                        free_compare(&cmp);                             \
                     } while (0)
 
                     case 0x001: /* V9 fmovscc %fcc0 */
@@ -3901,7 +3872,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         cond = GET_FIELD_SP(insn, 14, 17);              \
                         gen_compare(&cmp, xcc, cond, dc);               \
                         gen_fmov##sz(dc, &cmp, rd, rs2);                \
-                        free_compare(&cmp);                             \
                     } while (0)
 
                     case 0x101: /* V9 fmovscc %icc */
@@ -4713,7 +4683,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             tcg_gen_movcond_tl(cmp.cond, dst,
                                                cmp.c1, cmp.c2,
                                                cpu_src2, dst);
-                            free_compare(&cmp);
                             gen_store_gpr(dc, rd, dst);
                             break;
                         }
@@ -4745,7 +4714,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             tcg_gen_movcond_tl(cmp.cond, dst,
                                                cmp.c1, cmp.c2,
                                                cpu_src2, dst);
-                            free_compare(&cmp);
                             gen_store_gpr(dc, rd, dst);
                             break;
                         }
-- 
2.34.1


