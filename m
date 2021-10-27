Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B541443D097
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:21:19 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnY6-0006YG-Qp
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLp-0004Zg-6T
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLn-00042S-IE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id 192so1863697wme.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/kO/l3nZv9J0gGrC7cR0/+HRvwOX/9ne3z6XoOubpg=;
 b=hIxT6zuS4KnshewdTiIBQFDLNrLP4PpFxSq9wFAceWYmWBzZ3bI78OAyASkyZcb2fq
 W6dDe29auvE/pkE5tBpOCshMQgU89AemDenMa9iBqO85bWfe5mSSN2WXPEbLHkynknGM
 LFZ9o0JAPKYMX+0Xml0SUY2Ls0ZRdyPaedMAINT/TCbrh2j/dVi3tqw9yq/GgC1glQV4
 ttM+jhZvsmLOZCBLcHgDPS71Soh0zw2vUKxKguZFlgcy9jaBLJ8F5SsWjmo6WttrlI/v
 6phHxyfwB9LQaugQ3soWk7CIRC6fyVFdF6As6anY/oTv/43tyuJkbIQkT4ZOTA0Y3x6m
 H3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S/kO/l3nZv9J0gGrC7cR0/+HRvwOX/9ne3z6XoOubpg=;
 b=N5H1u5y93OzbHJh1uHjaHTuNiKTdeO0KhQayNDlXaKgsfYwHNaGL/X0Wc5v3S9UGhB
 VaDFcaqCU7NCqX4Gnd29mfvO4iHW/9ITp5KzPREtR3lcu7a0Bd1eoEQAAXH2kF9XTcBD
 VJlf91RE6o5A/s/73WbbeG5eZdqBBsxEqkKCFXfftb0YBYcHIWpyUb7L4wceAdK5kCEA
 JSmrSluBT6zXjXhH256Wo65+AWnJ3Wyn+TDIPApzk2bsprDFyI/csor+puM3aMDzSml3
 wcVxTxD6rnXYwFOfO1oxIBOlXlbAvS7Ba78SK2a5Q62sVlvKzKa22UnFjmK5uR2xSMzs
 eexw==
X-Gm-Message-State: AOAM5309KQN0tDs7cN2/GRBzVpeYUwPgDZT3t12zhcyl3MsU2C9B5Yvx
 iTAu+q7cNw2Q2p5/ux+zAJWzUeU+xqc=
X-Google-Smtp-Source: ABdhPJy7tJkhVCKTEC+4QMQMsUwIK53rltBhTvLfIMFcK+mQNkCdZyjLTx34RSeQLBQMAL65pSFsWQ==
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr7186284wml.67.1635358113809; 
 Wed, 27 Oct 2021 11:08:33 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u6sm419622wmc.29.2021.10.27.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/32] target/mips: Convert MSA load/store instruction
 format to decodetree
Date: Wed, 27 Oct 2021 20:07:11 +0200
Message-Id: <20211027180730.1551932-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert load/store instructions to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Add TRANS_DF_x() and use an array of 4 functions (tip from Richard)
---
 target/mips/tcg/msa.decode      |  5 ++
 target/mips/tcg/msa_translate.c | 86 +++++++++++----------------------
 2 files changed, 32 insertions(+), 59 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index af374f08969..ca25d79bda4 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -17,12 +17,14 @@
 &msa_ldi            df  wd       sa
 &msa_i5             df  wd ws    sa
 &msa_i8             df  wd ws    sa
+&msa_ldst           df  wd ws    sa
 &msa_bit            df  wd ws       m
 
 %dfm_df             16:7 !function=msa_bit_df
 %dfm_m              16:7 !function=msa_bit_m
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
+@ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
@@ -79,5 +81,8 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  LD                011110 .......... ..... .....   1000 .. @ldst
+  ST                011110 .......... ..... .....   1001 .. @ldst
+
   MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index d0b990a49f6..afb9124501e 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -41,16 +41,6 @@ enum {
     OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
     OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
     OPC_MSA_VEC     = 0x1E | OPC_MSA,
-
-    /* MI10 instruction */
-    OPC_LD_B        = (0x20) | OPC_MSA,
-    OPC_LD_H        = (0x21) | OPC_MSA,
-    OPC_LD_W        = (0x22) | OPC_MSA,
-    OPC_LD_D        = (0x23) | OPC_MSA,
-    OPC_ST_B        = (0x24) | OPC_MSA,
-    OPC_ST_H        = (0x25) | OPC_MSA,
-    OPC_ST_W        = (0x26) | OPC_MSA,
-    OPC_ST_D        = (0x27) | OPC_MSA,
 };
 
 enum {
@@ -322,6 +312,7 @@ static inline bool check_msa_enabled(DisasContext *ctx)
     return true;
 }
 
+typedef void gen_helper_piv(TCGv_ptr, TCGv_i32, TCGv);
 typedef void gen_helper_piii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 
@@ -339,6 +330,15 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
         return FUNC(ctx, a, __VA_ARGS__); \
     }
 
+#define TRANS_DF_x(TYPE, NAME, trans_func, gen_func) \
+    static gen_helper_p##TYPE * const NAME##_tab[4] = { \
+        gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d \
+    }; \
+    TRANS_MSA(NAME, trans_func, NAME##_tab[a->df])
+
+#define TRANS_DF_iv(NAME, trans_func, gen_func) \
+    TRANS_DF_x(iv, NAME, trans_func, gen_func)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -2097,55 +2097,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_VEC:
         gen_msa_vec(ctx);
         break;
-    case OPC_LD_B:
-    case OPC_LD_H:
-    case OPC_LD_W:
-    case OPC_LD_D:
-    case OPC_ST_B:
-    case OPC_ST_H:
-    case OPC_ST_W:
-    case OPC_ST_D:
-        {
-            int32_t s10 = sextract32(ctx->opcode, 16, 10);
-            uint8_t rs = (ctx->opcode >> 11) & 0x1f;
-            uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-            uint8_t df = (ctx->opcode >> 0) & 0x3;
-
-            TCGv_i32 twd = tcg_const_i32(wd);
-            TCGv taddr = tcg_temp_new();
-            gen_base_offset_addr(ctx, taddr, rs, s10 << df);
-
-            switch (MASK_MSA_MINOR(opcode)) {
-            case OPC_LD_B:
-                gen_helper_msa_ld_b(cpu_env, twd, taddr);
-                break;
-            case OPC_LD_H:
-                gen_helper_msa_ld_h(cpu_env, twd, taddr);
-                break;
-            case OPC_LD_W:
-                gen_helper_msa_ld_w(cpu_env, twd, taddr);
-                break;
-            case OPC_LD_D:
-                gen_helper_msa_ld_d(cpu_env, twd, taddr);
-                break;
-            case OPC_ST_B:
-                gen_helper_msa_st_b(cpu_env, twd, taddr);
-                break;
-            case OPC_ST_H:
-                gen_helper_msa_st_h(cpu_env, twd, taddr);
-                break;
-            case OPC_ST_W:
-                gen_helper_msa_st_w(cpu_env, twd, taddr);
-                break;
-            case OPC_ST_D:
-                gen_helper_msa_st_d(cpu_env, twd, taddr);
-                break;
-            }
-
-            tcg_temp_free_i32(twd);
-            tcg_temp_free(taddr);
-        }
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -2155,6 +2106,23 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     return true;
 }
 
+static bool trans_msa_ldst(DisasContext *ctx, arg_msa_ldst *a,
+                           gen_helper_piv *gen_msa_ldst)
+{
+    TCGv taddr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, taddr, a->ws, a->sa << a->df);
+
+    gen_msa_ldst(cpu_env, tcg_constant_i32(a->wd), taddr);
+
+    tcg_temp_free(taddr);
+
+    return true;
+}
+
+TRANS_DF_iv(LD, trans_msa_ldst, gen_helper_msa_ld);
+TRANS_DF_iv(ST, trans_msa_ldst, gen_helper_msa_st);
+
 static bool trans_LSA(DisasContext *ctx, arg_r *a)
 {
     return gen_lsa(ctx, a->rd, a->rt, a->rs, a->sa);
-- 
2.31.1


