Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0A6117BD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:42:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSPR-0005Gz-QC; Fri, 28 Oct 2022 12:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPC-0003t4-Jq; Fri, 28 Oct 2022 12:40:29 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSP9-0007mk-WB; Fri, 28 Oct 2022 12:40:25 -0400
Received: by mail-oi1-x22f.google.com with SMTP id t10so6703168oib.5;
 Fri, 28 Oct 2022 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bsy8BU3/DSIqWvxk//Ob8TXQFsLrkgw1RJYkrJFuC9c=;
 b=foi0ubOxsGKCtsTXnjqPLH7C0N8W5f4JPW9GOb84/19BCOlb+yuQzHJsnFgsdSQZGc
 V9nXTqgCV7aU65cr1rUOjYHyKUKczMfn6pNbn1aF4dfKgrad+jT10eFI/jA6sYjkyWKV
 ZIz8S7JnjV2csAa3GUpb+jMju3eMuCbu6qH/DTdNdl6qr6C7f1DLDcKBIxxGiFxICpps
 4q9+u1W4hO9SCxHMKMRs2G9ac1SrMxF+2uM/TjSgcStzVQBPTeKN2aW2hbxZovJ7KqGI
 RFAY4tjoZMrhiwj1eQXPpE5Vcjh0XAHfmDmWRZvXCd85JfeeS9I7Sb8fSla3hWvVq3Gy
 OF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bsy8BU3/DSIqWvxk//Ob8TXQFsLrkgw1RJYkrJFuC9c=;
 b=0Kmbv+1i6+8vFNBhQI+lGhDLSoVdyzCs9zNNZZYkTGjunXssfWcXQmfVNtZo7hngHF
 1SBSN+gyrwz+tIdhG9HKAmI68kgdgxb1qC0LerLDIdWfgObYH3NnloPuaG9QUvEafs3+
 ay3kcbqYoSA0451V9rF+Mjfm6sToci9TTRaLQtfKcu/VUnN/yPiCl47qHXmc06gbrecT
 LpAmt5IvF/uJ6ynAmYH1TRKcEsC7XhrgdNP+7tiCncJN2WGY1QQHSmSIgNIU9+U567hj
 JcC54py4RX9Ur0p4lIpiS55qjYifNXi+kgKgkm4+JcXwn9joO6oJENY2UN3IWlHHwcOy
 PtYw==
X-Gm-Message-State: ACrzQf2VEfP4V1Ys0OvYYYhK9wuPl53VecVV+KFYTf3vTBvBOYdyEJjB
 rTeiIL238UeumteV07+O5wJQokpdiiVafA==
X-Google-Smtp-Source: AMsMyM4+12MBVHxwCV3iu/3oW+EXqjiFY+U2qbky0TcLuQKv2Z77f41MnWNGroYVLOxQO1uX4R8kig==
X-Received: by 2002:a05:6808:2116:b0:359:dc32:4f6e with SMTP id
 r22-20020a056808211600b00359dc324f6emr1051145oiw.86.1666975222140; 
 Fri, 28 Oct 2022 09:40:22 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 05/62] target/ppc: move msgclrp/msgsndp to decodetree
Date: Fri, 28 Oct 2022 13:38:54 -0300
Message-Id: <20221028163951.810456-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221006200654.725390-6-matheus.ferst@eldorado.org.br>
[danielhb: ppc32 build fix in trans_(MSGCLRP|MSGSNDP)]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode                      |  2 ++
 target/ppc/translate.c                        | 26 -------------------
 .../ppc/translate/processor-ctrl-impl.c.inc   | 26 +++++++++++++++++++
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index bba49ded1b..5ba4a6807d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -913,3 +913,5 @@ TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
 
 MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
 MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
+MSGCLRP         011111 ----- ----- ..... 0010101110 -   @X_rb
+MSGSNDP         011111 ----- ----- ..... 0010001110 -   @X_rb
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 231bc9551e..9e200cec24 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6241,28 +6241,6 @@ static void gen_icbt_440(DisasContext *ctx)
 
 /* Embedded.Processor Control */
 
-#if defined(TARGET_PPC64)
-static void gen_msgclrp(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-static void gen_msgsndp(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-#endif
-
 static void gen_msgsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
@@ -6896,10 +6874,6 @@ GEN_HANDLER(vmladduhm, 0x04, 0x11, 0xFF, 0x00000000, PPC_ALTIVEC),
 GEN_HANDLER_E(maddhd_maddhdu, 0x04, 0x18, 0xFF, 0x00000000, PPC_NONE,
               PPC2_ISA300),
 GEN_HANDLER_E(maddld, 0x04, 0x19, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER2_E(msgsndp, "msgsndp", 0x1F, 0x0E, 0x04, 0x03ff0001,
-               PPC_NONE, PPC2_ISA207S),
-GEN_HANDLER2_E(msgclrp, "msgclrp", 0x1F, 0x0E, 0x05, 0x03ff0001,
-               PPC_NONE, PPC2_ISA207S),
 #endif
 
 #undef GEN_INT_ARITH_ADD
diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
index 208f2c2391..d704a322a8 100644
--- a/target/ppc/translate/processor-ctrl-impl.c.inc
+++ b/target/ppc/translate/processor-ctrl-impl.c.inc
@@ -68,3 +68,29 @@ static bool trans_MSGSND(DisasContext *ctx, arg_X_rb *a)
 #endif
     return true;
 }
+
+static bool trans_MSGCLRP(DisasContext *ctx, arg_X_rb *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
+    REQUIRE_SV(ctx);
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
+static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
+    REQUIRE_SV(ctx);
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.37.3


