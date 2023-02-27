Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A56A3CD1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW88-0004Kq-CW; Mon, 27 Feb 2023 00:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6e-0007A7-7z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:24 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6b-0000HT-EJ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:23 -0500
Received: by mail-pl1-x632.google.com with SMTP id i3so5539609plg.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
 b=i2C3OtmDKwgtknA4dBebFr4P1ptXuwnqPyYxCAL15EqXIwP1koYmIBdU/Or2wl8FGI
 uNKtikxkZlG5OvXoskHROlVznFjXOuqRtBcFqQ+qY5XkzQKftr/0ThoWyCXwweJev6EO
 sXTn35OAwpnbly+V/pxsfPRkH7YK1tLAbct+bwpI+5cE+wSLjJ4d9AgBAhv1Te/GhcjK
 s1O+0Lhlt/lJEWLEl9GRNWezin8j+8j2aTNrfXaN/IEyh4oLzGfRI90xGMwqJBuN+I8Y
 dl1FumtdNQ6xTL6a4Cp4p8F9rt9l8G+nUkYz4oYrFA2q71GfmAzWtNXLecBeguOeCqP0
 3M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
 b=dDGSmNRiOeFAukVVXiQroxSUpqdN/nsdxowMlQkh9cDYzHQ15nAETHkHJHGK8WlWXg
 lGMfhe8gTPPQklJFFvqhBbHY1MuWu21kApzr3YH0WknGxnWqfmTPIWIn3hnZZa1hR3Tt
 f5IuMO+LYGS9Y9nADVmwgaJsW6zPcE/iX0dX9ZQo+AviB+23bymwWP6aSn1+0Ub9Otyq
 xqFaEeMYJHWDYixIMZ7CQKhONxL4e1pBleYh9CP4Rz0mMRfDjHdhAS9YqoWSf2ickdu1
 z7U5O57t0cuhrCDYrcQfjONhIaJk4P2EFND6bdPqfBCpPBHVPTA94JwJOFuV0MNC7rjV
 H25A==
X-Gm-Message-State: AO0yUKWEm+dv38foeOuc/hLMEhNa+B/7WoTnGp6bImLIvu+KuBHDanZC
 ZXvFnMUctrTXLza3YDNuKyB//vgE3fMte6HNOAU=
X-Google-Smtp-Source: AK7set/bBU2N8m6R3kw7PiM6j4kSYGyYo//bmKQ9tiTFvyrYfXNRuxWrAF1T4pf/Z+s3Bba8OPBLXw==
X-Received: by 2002:a17:90b:3b4f:b0:233:f394:d83 with SMTP id
 ot15-20020a17090b3b4f00b00233f3940d83mr23795397pjb.48.1677475880647; 
 Sun, 26 Feb 2023 21:31:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 68/76] target/sparc: Drop free_compare
Date: Sun, 26 Feb 2023 19:24:57 -1000
Message-Id: <20230227052505.352889-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


