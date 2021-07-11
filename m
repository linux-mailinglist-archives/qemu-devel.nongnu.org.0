Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196063C3F75
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:18:21 +0200 (CEST)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gqC-0002Fn-53
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZs-0007Px-Ec
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZm-0000y9-Bb
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n33so9971519wms.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ioXSilflQ9D/7iC6aQQSA4Z9B5BUAvIuRmyKh4puuJM=;
 b=oSTnvDnhxqUIip049n/7PvJnoMGuGju5oL3f4sqqWNjDB/ZzWE9etBDq5YslZogBtV
 Y71HOVNpEtpyh7arIxbPzleQzYvz2qWoGIrVvaRsyUOmJ2Bb5poySx2uAfSFL0EdtaQf
 6KLJ4eqEEnsjajQ2wtCogXYMn4dhizSdIBJs4i6IbJdgBP8RKIdhQwTNxO2qCRcsgHeB
 XMCgsSVxI2gu+RBiopz7uO7HOw4S8sxkSpSP435XAKFBK0WHl+ZbDtiUvrYX1PaxOuGm
 Z8HidoVLTaFpjIqQNtzF24IEe/ZGYOm/nCW3Qlj40cRWfdTJ9ktGvMqGBGkSte5MQ36p
 cURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ioXSilflQ9D/7iC6aQQSA4Z9B5BUAvIuRmyKh4puuJM=;
 b=mpIy2p492pPeK7rgXBty8/yPg3nhAF4F8E+Q/N7A+WZCvBbjjkLyTCmS6D8jphYhXx
 +MOYxaO57lIvfdXBqeRu24e4MSpH8LiiHJz+w/eAx26IX4+RjIHJu72LEqGoWjNabaNA
 2CM5iUfjCSYsnRQao6kdpVah5mp0znjuTwnKs/ZFs+Sswf6reSMLdYuL1k9s6XjjqX3M
 3jq4RCeiG/uw9JGimrvl3x0cOfS/Gm7p7RXX58zxj39mpwwDmAzkDzdWkXJb9EfIUXe2
 irJPBp4eg0PZ2hMhI2Qq1GAMVZ0dF/+OyL7SD5//O7aQS1XVYZj158zDALQ6MbKxIjap
 vmsA==
X-Gm-Message-State: AOAM533lW0P9dDYSymJ63Ze4v+Y/LDGwVtxx2nJxzIDuc24yaN3JOJ8X
 yX/BBkAfLqnIn4c2LkAbIig/uB9jDb/TncWl
X-Google-Smtp-Source: ABdhPJwZfgr87frmIRPdRX8Y+h9zV3mP4awbsewqYI9C7ao7cXTzSkubX1acK9T65xZIaXqAnsHAbw==
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr10563064wme.35.1626037279696; 
 Sun, 11 Jul 2021 14:01:19 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l16sm18868933wmj.47.2021.07.11.14.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] target/mips/tx79: Introduce LQ opcode (Load Quadword)
Date: Sun, 11 Jul 2021 23:00:08 +0200
Message-Id: <20210711210016.2710100-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the LQ opcode (Load Quadword) and remove unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-26-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  8 ++++++++
 target/mips/tcg/translate.c      | 16 ++-------------
 target/mips/tcg/tx79_translate.c | 35 ++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 2f65dce2431..0af5c6d0ed1 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
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
@@ -62,3 +66,7 @@ PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
 PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
+
+# SPECIAL
+
+LQ              011110 ..... ..... ................     @ldst
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index ae33c75f088..82a7f2bcc63 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1180,7 +1180,6 @@ enum {
 
 enum {
     MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
-    MMI_OPC_LQ        = 0x1E << 26,    /* Same as OPC_MSA */
     MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
 };
 
@@ -15179,11 +15178,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
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
@@ -16082,14 +16076,8 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
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
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 402790249f3..d9193b4d86e 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -334,6 +334,41 @@ static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
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
2.31.1


