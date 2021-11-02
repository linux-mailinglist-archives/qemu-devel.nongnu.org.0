Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98076442F79
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:53:55 +0100 (CET)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuEc-0001wm-Ow
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu57-0001Qv-6B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu54-00065d-Vc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id u1so1799022wru.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aY0k71bB3tkFnE3asC11qT37398GA9pcOZUnhsubY/I=;
 b=qnI+zRR/qNtiq5WLuaJO+MzwLYBR+3w9q9WRfggJH5UNyXSP4RJtoXpxtr6eSzOSwq
 RSqE0k28F45Rm33o7QZgPCh5PgklP9zJ75BxW//k/Pz9yPoFXF2uhU6CEqBKvYkUp/fT
 eKdbL6DV3p2Vhn4WS2I+EyZ4tbLZhH5Z9mveEC4c/KO8GfbEE5vFcs+Xi1E1Mq7AcLPC
 EjPPm6f7erIyIuwm+QXT9n37uc5Ud5Q90SuNGKbhzyW1REM8GOpHcx/tPzWVd9KvF2Rf
 waUwVMbCtP+ApdBSnSsFxmPQSEuIY94hgNBQYT+8uRwho9RlEbFsFmM9UJLIPD2JrOQG
 z6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aY0k71bB3tkFnE3asC11qT37398GA9pcOZUnhsubY/I=;
 b=u38DjGYKaok9UJs9SXp1jGj8zM35EyY1CSE3EV+9yt1+wJdvdpeq5OSvsCZcSRlvqS
 ViB2ihB2dvWSUW8AH0m3KYowQ5T3vl+viE3Pab1Sd638vIFUOSmLNKbtki5H2RfTKDyj
 JH+dpw90bEg0E6V96JFy8Pf8YT6A+cyrik3SqTWmwrEw6iSimZIYxI+55eQ8Luy2RlH2
 Sbc3yWFbDevkqsdPzuZxP0gW9Kr+tGDHI3oUIq5aLHGR1ictpi2s1Itt343mjVAUUCeE
 X7+aiWNKoekh9FqpJg/frrsDq5D9JO3j30uhMCUUtNcIDGQrnbAyHTI7WKYv2ZW9APxS
 imwQ==
X-Gm-Message-State: AOAM532f7uYeJaykQMU/jKAX57gmap1sO1w6DSUxrAh7ZGE4GIEkfOkx
 /xujuQIJ/10iIz4PPzDkGMcg7/Zbqd0=
X-Google-Smtp-Source: ABdhPJxsUsdrVaah1aMWqICH9bPyr60hOORYpJAMdfiK+PYL4Bv7x42+pm9u+x2438VhhADij3+yrw==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr19801975wrt.413.1635860639084; 
 Tue, 02 Nov 2021 06:43:59 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 g18sm5983278wrv.42.2021.11.02.06.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/41] target/mips: Convert MSA load/store instruction format
 to decodetree
Date: Tue,  2 Nov 2021 14:42:15 +0100
Message-Id: <20211102134240.3036524-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert load/store instructions to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-14-f4bug@amsat.org>
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
index 7e5bd783df0..2a7fb925b07 100644
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
@@ -324,9 +314,19 @@ static inline bool check_msa_enabled(DisasContext *ctx)
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
@@ -2096,55 +2096,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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
@@ -2154,6 +2105,28 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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


