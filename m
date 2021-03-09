Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EB332A79
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:31:51 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeKs-0003Aw-Jq
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoi-0005m8-3h
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:36 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdog-0002tl-8X
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:35 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ci14so28404360ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWE4iITGQtw0Zu8anXgs5cqYaPVWJB0Yrp4jvBlh0aA=;
 b=qXriO2HKZXCVcg+DQTQzMW6chrbBJNEYdTAAuOzs30Iy+0OXmKhzsjm/sooHMhFKNf
 4X8eSQ741Q0ND7RFSg0406ooDi33PBQj26No+RhrwEEcG794gU9hRfXoEAVXDgpN1N6U
 Hwc+yBrbPAkua79nizB+v/yDNF+9m5JCVowvRhPaBeNhenwuDAAvLtMSZohxbo9VcVwd
 3btIYfZF67QffrCe4npM0ptatcaRfkUz7GR3UPV1GOtdQBxQ0W7OSEr60SuaGYMi6uUy
 mQUmswmHHgfF6gSJYjGrmFms+Z6s1Te4j69geW/bniwQ7oVAC2wUyHyH9hXgdLIOTC3v
 MOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vWE4iITGQtw0Zu8anXgs5cqYaPVWJB0Yrp4jvBlh0aA=;
 b=esMJsbD6ExAJgyPY49ibLtu3Scgu2ytI0+Fqn+tEGV/N/FKbauq3cWOqFBoDy6RKgc
 BRHN4ayOHQJOaTdEgqtQPlOIULV88vzGky6s5rPsSTnWMlhFALYbHx+HgoyRIpsFhdRI
 RNJyxyPTZ7WGxwbNvjOu7JI9BOaFAacmWEXlB4IzvfwINDH8FGckP8CBrYedBc0qUK/q
 d487AoFGTGIyGKe25PZY4KajHuVht3sO4CdS6RAoWaBTpTWMe3xEpHdprqWG0OWMPhmP
 R/zBonXw9em/jbx0Dx7tCkyKqVHWCNQ3t1B3WOccDN7aaaPTiCN6HkDx5/byNAzk9a0N
 AsmA==
X-Gm-Message-State: AOAM531g/lCfAsiUp9V2cOJM2BBlRSE0vUZVcsskWV8dUkYXr8+OcRuq
 ysFoj7cUblbuqfGyHUOQ3rwy3EVbaT8=
X-Google-Smtp-Source: ABdhPJzzbZsylLIDcLe7ZMpato9JJFkRXbQoTCHWrQPgrZXr9CfbvcyDoi4ZhPe7tCHBrUn6QYnJ0w==
X-Received: by 2002:a17:906:3899:: with SMTP id
 q25mr20559042ejd.157.1615301912484; 
 Tue, 09 Mar 2021 06:58:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id lu5sm8674820ejb.97.2021.03.09.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 19/22] target/mips/tx79: Introduce LQ opcode (Load
 Quadword)
Date: Tue,  9 Mar 2021 15:56:50 +0100
Message-Id: <20210309145653.743937-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index 79001359242..b5396f48c2d 100644
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
@@ -65,3 +69,7 @@ PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
 PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
+
+# SPECIAL
+
+LQ              011110 ..... ..... ................     @ldst
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5fcb859f866..0d20a0e3b84 100644
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
index f1c6546d70c..bfa0faab44f 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
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
2.26.2


