Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6C6A3A87
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW1u-0008D1-0F; Mon, 27 Feb 2023 00:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1d-0007Rh-KA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:15 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1b-0007Cs-Mf
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:13 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8837056pjb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUdQc0vOWU2ksX0RP7JNSAL2uqNTzPqxOne2f4ZPS34=;
 b=DABoIIBjeLCSWX9fNpvYc9qNBud2YuoAWQDZDiWduAFTnM/ZVQHWEKyMAsdYHPgOZm
 WYH9VVE86nARsQz3jmcu18/G8RmwKHt1WNK5/GVFzYNK7i6Z+OpJw6EsYY751SinJwwZ
 odhhfmdWzM+dm7Om0LgErwBIEbfU1fa/NEyUx1M442sA8ybg59wO2TFqhX/UA9Y4U38a
 3VZErgUKnNMjJl8G7Cm6dHvrSE2zu1I8zavR5MV3jiKW2/AI31JEVRc3UjzjOTjLbFIx
 Zxpmz/JZf5/FUGT49WTsRKK0gjGSYcc4VZUpAkhD1QFyc5WM6Bi58Q+JvSj8s8o6hZwT
 BODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUdQc0vOWU2ksX0RP7JNSAL2uqNTzPqxOne2f4ZPS34=;
 b=LqkzTv7t8c3fVJ59YVijG2KBtX7YsQ7grF+Hg9ICKpbh2iTZdkckAtaTy2xzr6v4yV
 5YRtRfsaYxRJA86gQBh918U/7ambwZueSUQ1vqwADl7sk3u6c/YBThxQsu0Ma9noYG9f
 s4paLFqy6X4WVhXNIMtkkTSgsKj1QcO3LZDNotSMpH/RRVXgchN7N1upHHD902HCNLea
 aMC7BMifVQ+oMmzhCD6hYt9WqxORyz8KaVMPFWx5xkME/uuWvn3pyTPMXvE1ctIwnVKi
 drMpTlclRLNxjEZMAEhqEHPo1a8C+zKeg+kxyRXNNWaJOkZoWO/CEMO2lIhFUwf/AA4N
 pQdA==
X-Gm-Message-State: AO0yUKUEvd+f8owXLZpsbGrdTUPGp0SF2iweQZafe9yU20WEOE7RKzoK
 0TvMmZjQhGBhdkPeeAMJHZImNU6k1+hun94VDKs=
X-Google-Smtp-Source: AK7set9dRRiuDvKK4eWySxtMxmoRw/RRzPlMLAB3jiLJiW+qG+T3MNFS5JqeAtCpVAX9ZVNRUKaOzQ==
X-Received: by 2002:a17:903:74d:b0:19c:d550:8cd4 with SMTP id
 kl13-20020a170903074d00b0019cd5508cd4mr8911733plb.7.1677475570866; 
 Sun, 26 Feb 2023 21:26:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 22/76] target/cris: Drop cris_alu_m_free_temps
Date: Sun, 26 Feb 2023 19:24:11 -1000
Message-Id: <20230227052505.352889-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 23 -----------------------
 target/cris/translate_v10.c.inc |  4 ----
 2 files changed, 27 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 76db745fe2..439af701e6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2101,12 +2101,6 @@ static inline void cris_alu_m_alloc_temps(TCGv *t)
     t[1] = tcg_temp_new();
 }
 
-static inline void cris_alu_m_free_temps(TCGv *t)
-{
-    tcg_temp_free(t[0]);
-    tcg_temp_free(t[1]);
-}
-
 static int dec_movs_m(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -2124,7 +2118,6 @@ static int dec_movs_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_MOVE,
             cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2145,7 +2138,6 @@ static int dec_addu_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_ADD,
             cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2165,7 +2157,6 @@ static int dec_adds_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2185,7 +2176,6 @@ static int dec_subu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2205,7 +2195,6 @@ static int dec_subs_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2225,7 +2214,6 @@ static int dec_movu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2244,7 +2232,6 @@ static int dec_cmpu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2265,7 +2252,6 @@ static int dec_cmps_m(CPUCRISState *env, DisasContext *dc)
             cpu_R[dc->op2], cpu_R[dc->op2], t[1],
             memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2286,7 +2272,6 @@ static int dec_cmp_m(CPUCRISState *env, DisasContext *dc)
             cpu_R[dc->op2], cpu_R[dc->op2], t[1],
             memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2312,7 +2297,6 @@ static int dec_test_m(CPUCRISState *env, DisasContext *dc)
          cpu_R[dc->op2], t[1], c, memsize_zz(dc));
     tcg_temp_free(c);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2331,7 +2315,6 @@ static int dec_and_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2351,7 +2334,6 @@ static int dec_add_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_ADD,
          cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2370,7 +2352,6 @@ static int dec_addo_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, 0);
     cris_alu(dc, CC_OP_ADD, cpu_R[R_ACR], t[0], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2413,7 +2394,6 @@ static int dec_addc_mr(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_ADDC, cpu_R[dc->op2], t[0], t[1], 4);
     do_postinc(dc, 4);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2432,7 +2412,6 @@ static int dec_sub_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], memsize);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2452,7 +2431,6 @@ static int dec_or_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_OR,
             cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2484,7 +2462,6 @@ static int dec_move_mp(CPUCRISState *env, DisasContext *dc)
     t_gen_mov_preg_TN(dc, dc->op2, t[1]);
 
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 9660f28584..5e9d1c0fe8 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -922,9 +922,6 @@ static int dec10_ind_alu(CPUCRISState *env, DisasContext *dc,
         dc->delayed_branch = 1;
         return insn_len;
     }
-
-    cris_alu_m_free_temps(t);
-
     return insn_len;
 }
 
@@ -1058,7 +1055,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                          t[0], c, size);
                 tcg_temp_free(c);
-                cris_alu_m_free_temps(t);
                 break;
             case CRISV10_IND_ADD:
                 LOG_DIS("add size=%d op=%d %d\n",  size, dc->src, dc->dst);
-- 
2.34.1


