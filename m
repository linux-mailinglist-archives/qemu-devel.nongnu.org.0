Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF36AB3C2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyu7-0004XF-Us; Sun, 05 Mar 2023 19:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytn-0004SU-QS
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:19 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytl-0006d6-Nt
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:19 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so11558628pjb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JTXrHJQrrpslsxd2EAo8VPOVpFwsOEquZiN+QCjLK4=;
 b=uQm7JcyqgrHbCtmkXW880FENQfiEBsi66Nlrhx3tRpxOobbujeincjQoI1v+Y0vnT7
 xhA1+eOrrGLyHTsMcfOgN3QyGfX1TV1E54DW5MnT3xGnT5ROW+6th54impylhAPOVS0W
 yp2pAXjxR9sEJqcuoZPk0uuOxmZnwOpiDslo5l9XGbEtE+R3+1suAckKC997WS/ofxQG
 TayN9ejPCQODRKj3ANSXp3DVjCw0GQIisRbBn2/ETmhwqoQEaX29nW4YnAKSVEo8RsD2
 e6vH1RbO0lgsrB9OZoANIfwpA/CspfY/g55myZYQyvvEGfsfJ85Gdke2Vyw5bv87vdxe
 yC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JTXrHJQrrpslsxd2EAo8VPOVpFwsOEquZiN+QCjLK4=;
 b=Q2pi6QLPutQPqX2KIzCONFtELfbPZllhPLX7LXfsB8tgV+ZsIot6npMqypL/m8PMU3
 xKCJjdDAnLlLi7vO88wpG36JJwzDIwFo+fLtyrt3Xm/qELjO+OyDBs+yYWEn/LSRQwRP
 yHxT9rrLlJHji+c6cXSB0TdY/8iSE5uK6gpivZFedHj+jNksKHrk0qWad3j39ZTLjUOe
 outmOkVDWFsuHHlkJ5QED8JZYZqyH97ql/thCE9UmpLpCAtINCRzrNblzF6tMzfHrL5e
 7bs1nhcWbc4q+CrslxDI7bki7+3sFQ+B1EK/BbwB0qf5TW8b2IKzbB2CJrCwBwFvXXGR
 JcEg==
X-Gm-Message-State: AO0yUKWXD8K9zBMMrzaMWe/KG/l7bz/dAXKdVartTQmb5QEXUuYv48uy
 y5iPbw1kvVU1r1nc3TzLoBshhWZYqFmVN3neh3NZGVdf
X-Google-Smtp-Source: AK7set+MBcHFgkCR0Lf+EEdsjvcLYqA2Par2BegBd9zzbLC/IvY0JPp+GohYsavkWlJ5iTSg4slINw==
X-Received: by 2002:a17:90b:38c3:b0:239:fd9b:85bd with SMTP id
 nn3-20020a17090b38c300b00239fd9b85bdmr9734811pjb.27.1678063215371; 
 Sun, 05 Mar 2023 16:40:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 22/84] target/arm: Drop tcg_temp_free from translator-m-nocp.c
Date: Sun,  5 Mar 2023 16:38:52 -0800
Message-Id: <20230306003954.1866998-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-m-nocp.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/arm/tcg/translate-m-nocp.c b/target/arm/tcg/translate-m-nocp.c
index 5df7d46120..9a89aab785 100644
--- a/target/arm/tcg/translate-m-nocp.c
+++ b/target/arm/tcg/translate-m-nocp.c
@@ -91,7 +91,6 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     } else {
         gen_helper_v7m_vlstm(cpu_env, fptr);
     }
-    tcg_temp_free_i32(fptr);
 
     clear_eci_state(s);
 
@@ -303,8 +302,6 @@ static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
     tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
     tcg_gen_or_i32(fpca, fpca, aspen);
     tcg_gen_brcondi_i32(tcg_invert_cond(cond), fpca, 0, label);
-    tcg_temp_free_i32(aspen);
-    tcg_temp_free_i32(fpca);
 }
 
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
@@ -328,7 +325,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     case ARM_VFP_FPSCR:
         tmp = loadfn(s, opaque, true);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
@@ -351,7 +347,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
         tcg_gen_or_i32(fpscr, fpscr, tmp);
         store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_temp_free_i32(tmp);
         break;
     }
     case ARM_VFP_FPCXT_NS:
@@ -400,8 +395,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        tcg_temp_free_i32(tmp);
-        tcg_temp_free_i32(sfpa);
         break;
     }
     case ARM_VFP_VPR:
@@ -423,7 +416,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
                             R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
         store_cpu_field(vpr, v7m.vpr);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        tcg_temp_free_i32(tmp);
         break;
     }
     default:
@@ -491,7 +483,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
         tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
         tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(sfpa);
         /*
          * Store result before updating FPSCR etc, in case
          * it is a memory write which causes an exception.
@@ -505,7 +496,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         store_cpu_field(control, v7m.control[M_REG_S]);
         fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(fpscr);
         lookup_tb = true;
         break;
     }
@@ -546,7 +536,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
         tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
         tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(control);
         /* Store result before updating FPSCR, in case it faults */
         storefn(s, opaque, tmp, true);
         /* If SFPA is zero then set FPSCR from FPDSCR_NS */
@@ -554,9 +543,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, tcg_constant_i32(0),
                             fpdscr, fpscr);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(sfpa);
-        tcg_temp_free_i32(fpdscr);
-        tcg_temp_free_i32(fpscr);
         break;
     }
     case ARM_VFP_VPR:
@@ -598,7 +584,6 @@ static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value,
     if (a->rt == 15) {
         /* Set the 4 flag bits in the CPSR */
         gen_set_nzcv(value);
-        tcg_temp_free_i32(value);
     } else {
         store_reg(s, a->rt, value);
     }
@@ -666,7 +651,6 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
     if (do_access) {
         gen_aa32_st_i32(s, value, addr, get_mem_index(s),
                         MO_UL | MO_ALIGN | s->be_data);
-        tcg_temp_free_i32(value);
     }
 
     if (a->w) {
@@ -675,8 +659,6 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
 }
 
@@ -717,8 +699,6 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
     return value;
 }
-- 
2.34.1


