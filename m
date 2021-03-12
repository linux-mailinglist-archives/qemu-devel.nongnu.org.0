Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46C339379
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:34:00 +0100 (CET)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkjf-0006WU-GJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkak-0005un-6f
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:46 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkai-000559-Iu
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:45 -0500
Received: by mail-wr1-x431.google.com with SMTP id 61so2101640wrm.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cj7xaGDPrgy2UUgO8dM6PRrVcsRJS/AQHkPM7IdHo58=;
 b=Oy+8h9Urgsi8flv6zMXCr8t3k4HIqX9EM+KD3MldAL45NjN8bfWVD9CAn3HRPLNS96
 FXcjO1+I1xir0DYHbvrXv5y0XBekACXWuWlNmaNyCoNsJ3dGFnV66bh02M67hDBjlNYL
 Bwxgd4e+dWOTMKgeJArLIVy3SzLPAsSOEm2DX3QwauEpNZN4AmJ61+71KRag/pXw5i6u
 P8cR+XkeeifaNHu6z7DpLw4fjgC20gQBIOrQ5FhgnHHWS11C6YfspXjF83GAyMQf84ix
 ETq/SmYKyay6bXIaj4uWQ3KlvOC3XKCXOKLIL+a65aR4SpciMqJPUWOzE9zOk/YH0yXZ
 ytUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cj7xaGDPrgy2UUgO8dM6PRrVcsRJS/AQHkPM7IdHo58=;
 b=ffIJ/6T0/SZTm53cZSOm4cKTz+VKQad6LmkLEgiGaoFlyL/Jk+PKf5sUoFkCr3RA+h
 AFLeuxOAuuPomgRyzMcXlu+Si0CJC8Vzbn8KTYxSW53g1FYKnt/z/ozVKQkYNnJZO7hL
 aoDFoee6GG7M/WOFukuXL2QIfOSLqm+GQS3a/Ow6Is1lGqVZ0OwmdPsCcuctHB+WTjVk
 e1xfOf1GkEnJrL6/bI/RWI7CMxoWD27JQ3qI8rh9qtHI4eXWbCH+YaR7M780pYH3OiYz
 dR519viekYCCoLBwu6ZAEQg1pRfwSEm0MpNk5VBknd0qTkf4MukJsZVl1rhZSbio+IDP
 FElA==
X-Gm-Message-State: AOAM532PvyjYJT+fQcEhprLZ0xB1/Ab473VpkCyaajRT05kO4mg14oFo
 qDcHqAGIPVH7EuIl6cC3gRc5XhJ8S1I=
X-Google-Smtp-Source: ABdhPJwXptNh9KrFE+vicYo0lLqav6YOgn1veqRUNAkRTGtFTzaEzhcgj9xnuyOsnzUcpOfWXwxENg==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr14602282wrm.273.1615566282091; 
 Fri, 12 Mar 2021 08:24:42 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a5sm8254544wrs.35.2021.03.12.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:24:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] target/mips/tx79: Introduce LQ opcode (Load Quadword)
Date: Fri, 12 Mar 2021 17:24:30 +0100
Message-Id: <20210312162434.1869129-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312162434.1869129-1-f4bug@amsat.org>
References: <20210312162434.1869129-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the LQ opcode (Load Quadword) and remove unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-26-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  8 ++++++++
 target/mips/translate.c      | 16 ++--------------
 target/mips/tx79_translate.c | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 0f748b53a64..f1f17470a00 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -13,6 +13,8 @@
 
 &rtype           rs rt rd sa
 
+&itype           base rt offset
+
 ###########################################################################
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
@@ -22,6 +24,8 @@
 @rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
 
+@ldst            ...... base:5 rt:5 offset:16            &itype
+
 ###########################################################################
 
 MFHI1           011100 0000000000  ..... 00000 010000   @rd
@@ -37,3 +41,7 @@ PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
 
 PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
+
+# SPECIAL
+
+LQ              011110 ..... ..... ................     @ldst
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c518bf3963b..c822083f031 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1167,7 +1167,6 @@ enum {
 
 enum {
     MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
-    MMI_OPC_LQ        = 0x1E << 26,    /* Same as OPC_MSA */
     MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
 };
 
@@ -24429,11 +24428,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void gen_mmi_lq(CPUMIPSState *env, DisasContext *ctx)
-{
-    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_LQ */
-}
-
 static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
 {
     gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
@@ -25332,14 +25326,8 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_branch(ctx, op, 4, rs, rt, offset, 4);
         }
         break;
-    case OPC_MDMX: /* MMI_OPC_LQ */
-        if (ctx->insn_flags & INSN_R5900) {
-#if defined(TARGET_MIPS64)
-            gen_mmi_lq(env, ctx);
-#endif
-        } else {
-            /* MDMX: Not implemented. */
-        }
+    case OPC_MDMX:
+        /* MDMX: Not implemented. */
         break;
     case OPC_PCREL:
         check_insn(ctx, ISA_MIPS_R6);
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index ad83774b977..b5a9eb3de76 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -177,6 +177,41 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * SQ      rt, offset(base)  Store Quadword
  */
 
+static bool trans_LQ(DisasContext *ctx, arg_itype *a)
+{
+    TCGv_i64 t0;
+    TCGv addr;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    addr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, addr, a->base, a->offset);
+    /*
+     * Clear least-significant four bits of the effective
+     * address, effectively creating an aligned address.
+     */
+    tcg_gen_andi_tl(addr, addr, ~0xf);
+
+    /* Lower half */
+    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+    gen_store_gpr(t0, a->rt);
+
+    /* Upper half */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+    gen_store_gpr_hi(t0, a->rt);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
-- 
2.26.2


