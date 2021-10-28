Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D483143F16E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:17:42 +0200 (CEST)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCmL-0007Cz-UW
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCem-0008Pm-CW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCek-0005or-Je
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso2510507wmd.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dSryxovJuIqr2NQdn09/ooghk5w+xZ8fMvrjNtNqa6k=;
 b=RTK/j9o8lfhaPXKQxE3DQHXcTuNfYc1qBCmO8h4kPS6FInW+ccRI/F0FztskseOlXl
 ZLMP9xJ60jcW7FrgBbG572zbgMDRMUQHrVETvGa41fI5pKGPSg05kfEzfm4N0mJzAdZR
 nJr+dJJ0lktfTlv4tRvB0fDtfZhV2eCjKH07zIb+8QT8cyf2vW9KdAVnEtuSAZBiApUf
 4kde3orwb5GMstkMekJ1z57LsUxaZPFKvd7djVifsQWUU4GpcjdAMvnJBEAdP8INyJf+
 BVIs2cjOHcGbcn4I/eQTFH2kyk0bYAtl6SHP5Awro9GhJ5WUgQ45C33HYsF2i6GB989p
 bJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dSryxovJuIqr2NQdn09/ooghk5w+xZ8fMvrjNtNqa6k=;
 b=NniJ2fw9O+4F+MWqKLIton8YNxGdIrzFiMCNLhIgtYbmVNUCrURKBqNSN/kuAyG3Gd
 C1vdevfcWuwm4D7/1hd283SMi3G/QhwTm3jwHygi6rcOLTCPM+tjzj+secWmygmHy85S
 Rh40zyKYLousdB7VzA5Zq/3B8J7y5T/ag4slMGUy29lBYzgEK+wZYqzgdvg93AWX0BK9
 5RyG6md9fSLyqEaPr28dl37QufWd6NMwWK9t2eo9ribSoYnrOjqalVkgKyjSncNADP9a
 iYJRgCOt34ZeCmufitCttPREMsaRqHMg316Z164z00HN0RuwnAA/3tGXG5atHvfE4zbi
 2OHA==
X-Gm-Message-State: AOAM530UV7nEhD7F6jGG9B1CebrraTPcTAd7WmNLL/kKbKSaSFmFQSrh
 uLXOIjZ6yNekM9FpTmY2ts8/GKuc8+0=
X-Google-Smtp-Source: ABdhPJxkkoSv6biLHxZYZqOoG5kK+O9+DFa/CkTBs0VFTQ5uPMdB0L2mo87ZPGQJo349s6elHNfpbg==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr6803880wmq.54.1635455389083; 
 Thu, 28 Oct 2021 14:09:49 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k15sm3974336wrx.13.2021.10.28.14.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/32] target/mips: Convert MSA load/store instruction
 format to decodetree
Date: Thu, 28 Oct 2021 23:08:24 +0200
Message-Id: <20211028210843.2120802-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert load/store instructions to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211027180730.1551932-14-f4bug@amsat.org>
---
v3:
- Renamed &msa_ldst -> &msa_i
- Remove TRANS_MSA(), call check_msa_enabled in trans_X()
---
 target/mips/tcg/msa.decode      |  4 ++
 target/mips/tcg/msa_translate.c | 91 ++++++++++++---------------------
 2 files changed, 36 insertions(+), 59 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 24847599a05..0aeb83d5c5b 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -22,6 +22,7 @@
 %bit_m              16:7 !function=bit_m
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
+@ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
@@ -78,5 +79,8 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  LD                011110 .......... ..... .....   1000 .. @ldst
+  ST                011110 .......... ..... .....   1001 .. @ldst
+
   MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 8fc02bd5e24..53cafe53f14 100644
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
@@ -322,9 +312,19 @@ static inline bool check_msa_enabled(DisasContext *ctx)
     return true;
 }
 
+typedef void gen_helper_piv(TCGv_ptr, TCGv_i32, TCGv);
 typedef void gen_helper_piii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 
+#define TRANS_DF_x(TYPE, NAME, trans_func, gen_func) \
+    static gen_helper_p##TYPE * const NAME##_tab[4] = { \
+        gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d \
+    }; \
+    TRANS(NAME, trans_func, NAME##_tab[a->df])
+
+#define TRANS_DF_iv(NAME, trans_func, gen_func) \
+    TRANS_DF_x(iv, NAME, trans_func, gen_func)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -2094,55 +2094,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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
@@ -2152,6 +2103,28 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     return true;
 }
 
+static bool trans_msa_ldst(DisasContext *ctx, arg_msa_i *a,
+                           gen_helper_piv *gen_msa_ldst)
+{
+    TCGv taddr;
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    taddr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, taddr, a->ws, a->sa << a->df);
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


