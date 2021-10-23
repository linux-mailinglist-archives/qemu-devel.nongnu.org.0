Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD44385B7
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:08:57 +0200 (CEST)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePCC-0004ph-Sn
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtF-0005iY-Av
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtD-0005Zv-JM
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e12so4785963wra.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9oAdN638f3glmAR3nDrRo61QUNkEAnYfFRDh/cNbuiI=;
 b=VGHe+dDetJUka8N7Pzf+NIT3YdfcYVIwE1UhHVQRY7xcdpzKKekpLfaqaLBIKKMitf
 jOtRna7a80Yz+nsqshu5rN/7cH4W1VNCzgC95k4d03NrBKUfvc+pLRESM99wCNtOUzEP
 3SRGdymVsOxHxauL7hjDTYUw4WC9AZ8DGr/uZosWIbCDVWEg4uZRDBn19Vu4ZopJpcDt
 f20op9uSn+4eR6ijTVekcszx+aZuaef/gM6x2jVb9vLhEf9hrdBqlyB/NZnrbWZnPx5d
 ixuXYzRCTXPGC1hcySCj9Uexh1/eZT21gAyU4tnLE7OBqw43WvIqe1Htq0jziFa0CXdH
 zULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9oAdN638f3glmAR3nDrRo61QUNkEAnYfFRDh/cNbuiI=;
 b=UsNoqmzjGU+Xmy9p7jGRyl0OCPNP6VDxxo+5ZbjUKt29wf+INm1L8wXtTbODuS0uqP
 6933IWaJod8LfmuuXJM0UyaZGrj77cSuOLNOjHNb55bQ4zhGCzHxZ2a39vZKRCYpb+2H
 Fga1HUZZFHYE9GOW6BrgWABNXRyLBR8CjcaTlmeIlXz21e59ODt/La7xdGmRlVpyGSpe
 xw8Y4p+yDlapDhZgOCKCBGtiWF1IC5k4tuPOydBLDgFBGiIHadU0CCEmeqLPngqRkZmG
 UPkByYKSaroaHveCgPWMN0hgaByQQnpvCEvLdjaAWh275Hje7HA/1U/jc2uhf3yXV28N
 YbtQ==
X-Gm-Message-State: AOAM531mCZseCkXHe88NiUcVxV/jXJQxk9Otvh5uMqT4QQwGelfSB/Lw
 wHEbCsYNoeIexbTctCesJTMhVDIIiwE=
X-Google-Smtp-Source: ABdhPJw+XrdGbIdBk6cjtCs24BkxXy9Qs1t9x25e5nBoc7HLycCgPbh8sXlWNPWXO78Yaj5R9j8BKA==
X-Received: by 2002:a05:6000:247:: with SMTP id
 m7mr2645421wrz.106.1635025758217; 
 Sat, 23 Oct 2021 14:49:18 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v13sm7361069wrp.11.2021.10.23.14.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/33] target/mips: Convert MSA load/store instruction format
 to decodetree
Date: Sat, 23 Oct 2021 23:47:45 +0200
Message-Id: <20211023214803.522078-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert load/store instructions to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  4 ++
 target/mips/tcg/msa_translate.c | 99 +++++++++++++--------------------
 2 files changed, 44 insertions(+), 59 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 3dd07dced57..5fe6923ace5 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -17,6 +17,7 @@
 &msa_ldst           df wd ws    sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
+@ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
@@ -73,5 +74,8 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  LD                011110 .......... ..... .....   1000 .. @ldst
+  ST                011110 .......... ..... .....   1001 .. @ldst
+
   MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 2866687635d..52af99636a4 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -38,16 +38,6 @@ enum {
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
@@ -298,6 +288,10 @@ static inline bool check_msa_access(DisasContext *ctx)
 #define TRANS_MSA(NAME, trans_func, gen_func) \
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, gen_func)
 
+#define TRANS_DF_E(NAME, trans_func, gen_func) \
+        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
+                    gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -2104,55 +2098,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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
@@ -2162,6 +2107,42 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     return true;
 }
 
+static bool trans_msa_ldst(DisasContext *ctx, arg_msa_ldst *a,
+                           void (*gen_msa_b)(TCGv_ptr, TCGv_i32, TCGv),
+                           void (*gen_msa_h)(TCGv_ptr, TCGv_i32, TCGv),
+                           void (*gen_msa_w)(TCGv_ptr, TCGv_i32, TCGv),
+                           void (*gen_msa_d)(TCGv_ptr, TCGv_i32, TCGv))
+{
+
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv taddr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, taddr, a->ws, a->sa << a->df);
+
+    switch (a->df) {
+    case DF_BYTE:
+        gen_msa_b(cpu_env, twd, taddr);
+        break;
+    case DF_HALF:
+        gen_msa_h(cpu_env, twd, taddr);
+        break;
+    case DF_WORD:
+        gen_msa_w(cpu_env, twd, taddr);
+        break;
+    case DF_DOUBLE:
+        gen_msa_d(cpu_env, twd, taddr);
+        break;
+    }
+
+    tcg_temp_free_i32(twd);
+    tcg_temp_free(taddr);
+
+    return true;
+}
+
+TRANS_DF_E(LD, trans_msa_ldst, gen_helper_msa_ld);
+TRANS_DF_E(ST, trans_msa_ldst, gen_helper_msa_st);
+
 static bool trans_LSA(DisasContext *ctx, arg_r *a)
 {
     return gen_lsa(ctx, a->rd, a->rt, a->rs, a->sa);
-- 
2.31.1


