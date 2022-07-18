Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221055788D0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:51:48 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUuJ-0007H2-0a
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSb-00087B-31; Mon, 18 Jul 2022 13:23:09 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:39741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSH-0001pv-Cd; Mon, 18 Jul 2022 13:23:07 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10c0119dd16so25523184fac.6; 
 Mon, 18 Jul 2022 10:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5O+lOxgfGYc63X22DZ+LQRrJZY3GJ8jI9PfnGl3F1zY=;
 b=pI+qGsLvGPP3aECncBAVuW3tJ/5ijaoqsbiG2GovwJygJWiXncqB1ad9iQQpqyqRpO
 hs51aaF8YEFCL8uMleI1IBjqFtRM8aDShFdtxDKVtzQhOOmY6kzoLLkAM7v/lDm/shP7
 wDBDxS4a4dG7moZNkyEruPoqMTIQmgjN2V41yF+AHvevDA0rNA7qCFZSOUIhMLWNb83a
 YIx7N0vXFtzveuqg7yNA8nasiKFyRcYDk3nI2RMbRQoCLC8kTAdhGcmv0dXod06syKZY
 90j6GuiIbHN8Q/SKyN3umxY1Sb9S1m4FQH1JY9wO2K1P32NQtjtO3mVeJebk1BrkRvgM
 Adew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5O+lOxgfGYc63X22DZ+LQRrJZY3GJ8jI9PfnGl3F1zY=;
 b=xcGxn09Iy8DHsJT54MGL+dtJbxV3um8cSIZwh/y437rXkLLgyXjq0b9LbpcC3i+JZ5
 0HQkjzXFpNcg4a2dKVovb7UPoAIiNfLzPOTwdlGcTkMKm/DIh+Yjku6heeJ06CkFAUDI
 983Ar7eP0UcqiFf0q7mR/2NSSg7we9N0J2kfvuMWlnWSvDf+l0YIu7zOlrcxeCUlOLwH
 ajthICXRmjI1M74Sh0gsixRRkmcu/zOgUIx2t6/sLwyoyplE8hPLOvqNoKfgf7f5yM2A
 a4ayWRMUlifzkleXrG1NPFbcKF6vE+CNSkJ4T8S+uvgQYEqZ0iyJpiW7M5PGbo2l/5Tw
 3K9g==
X-Gm-Message-State: AJIora/ARLv3q3aswSSEQUuOiMfRWGXJ/uQXHnM1gbatCfHbUbZgxuHv
 QM6sfZ7pDjyDO+QJmqXUOKY6AcZm18g=
X-Google-Smtp-Source: AGRyM1uBYB3yJwcxmGIYGXn8nZz57Y8lwYaCMymNRlGwE/uhP1Ya10ANz07LNH/CJp+KMUZdwVhXsA==
X-Received: by 2002:a05:6870:5712:b0:10b:b268:1681 with SMTP id
 k18-20020a056870571200b0010bb2681681mr14614857oap.117.1658164967826; 
 Mon, 18 Jul 2022 10:22:47 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 14/30] target/ppc: Move tlbie[l] to decode tree
Date: Mon, 18 Jul 2022 14:21:52 -0300
Message-Id: <20220718172208.1247624-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Also decode RIC, PRS and R operands.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220712193741.59134-2-leandro.lupori@eldorado.org.br>
[danielhb: mark bit 31 in @X_tlbie pattern as ignored]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c                        |  4 +-
 target/ppc/insn32.decode                     |  8 ++
 target/ppc/translate.c                       | 64 +-------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 87 ++++++++++++++++++++
 4 files changed, 99 insertions(+), 64 deletions(-)
 create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 769031375d..4f2355e941 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6373,7 +6373,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                        PPC_FLOAT_EXT |
                        PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
                        PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
                        PPC_SEGMENT_64B | PPC_SLBI |
                        PPC_POPCNTB | PPC_POPCNTWD |
@@ -6591,7 +6591,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                        PPC_FLOAT_EXT |
                        PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
                        PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
                        PPC_SEGMENT_64B | PPC_SLBI |
                        PPC_POPCNTB | PPC_POPCNTWD |
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f7653ef9d5..092e01113f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -856,3 +856,11 @@ VMODSD          000100 ..... ..... ..... 11111001011    @VX
 VMODUD          000100 ..... ..... ..... 11011001011    @VX
 VMODSQ          000100 ..... ..... ..... 11100001011    @VX
 VMODUQ          000100 ..... ..... ..... 11000001011    @VX
+
+## TLB Management Instructions
+
+&X_tlbie        rb rs ric prs:bool r:bool
+@X_tlbie        ...... rs:5 - ric:2 prs:1 r:1 rb:5 .......... -     &X_tlbie
+
+TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
+TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index da11472877..440ec8a700 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5424,64 +5424,6 @@ static void gen_tlbia(DisasContext *ctx)
 #endif  /* defined(CONFIG_USER_ONLY) */
 }
 
-/* tlbiel */
-static void gen_tlbiel(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    bool psr = (ctx->opcode >> 17) & 0x1;
-
-    if (ctx->pr || (!ctx->hv && !psr && ctx->hr)) {
-        /*
-         * tlbiel is privileged except when PSR=0 and HR=1, making it
-         * hypervisor privileged.
-         */
-        GEN_PRIV;
-    }
-
-    gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-/* tlbie */
-static void gen_tlbie(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    bool psr = (ctx->opcode >> 17) & 0x1;
-    TCGv_i32 t1;
-
-    if (ctx->pr) {
-        /* tlbie is privileged... */
-        GEN_PRIV;
-    } else if (!ctx->hv) {
-        if (!ctx->gtse || (!psr && ctx->hr)) {
-            /*
-             * ... except when GTSE=0 or when PSR=0 and HR=1, making it
-             * hypervisor privileged.
-             */
-            GEN_PRIV;
-        }
-    }
-
-    if (NARROW_MODE(ctx)) {
-        TCGv t0 = tcg_temp_new();
-        tcg_gen_ext32u_tl(t0, cpu_gpr[rB(ctx->opcode)]);
-        gen_helper_tlbie(cpu_env, t0);
-        tcg_temp_free(t0);
-    } else {
-        gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-    }
-    t1 = tcg_temp_new_i32();
-    tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
-    tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
-    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
-    tcg_temp_free_i32(t1);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* tlbsync */
 static void gen_tlbsync(DisasContext *ctx)
 {
@@ -6683,6 +6625,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/branch-impl.c.inc"
 
+#include "translate/storage-ctrl-impl.c.inc"
+
 /* Handles lfdp */
 static void gen_dform39(DisasContext *ctx)
 {
@@ -6921,10 +6865,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
  * XXX Those instructions will need to be handled differently for
  * different ISA versions
  */
-GEN_HANDLER(tlbiel, 0x1F, 0x12, 0x08, 0x001F0001, PPC_MEM_TLBIE),
-GEN_HANDLER(tlbie, 0x1F, 0x12, 0x09, 0x001F0001, PPC_MEM_TLBIE),
-GEN_HANDLER_E(tlbiel, 0x1F, 0x12, 0x08, 0x00100001, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER_E(tlbie, 0x1F, 0x12, 0x09, 0x00100001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
new file mode 100644
index 0000000000..7793297dd4
--- /dev/null
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -0,0 +1,87 @@
+/*
+ * Power ISA decode for Storage Control instructions
+ *
+ * Copyright (c) 2022 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Store Control Instructions
+ */
+
+static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
+{
+#if defined(CONFIG_USER_ONLY)
+    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+    return true;
+#else
+    TCGv_i32 t1;
+    int rb;
+
+    rb = a->rb;
+
+    if ((ctx->insns_flags2 & PPC2_ISA300) == 0) {
+        /*
+         * Before Power ISA 3.0, the corresponding bits of RIC, PRS, and R
+         * (and RS for tlbiel) were reserved fields and should be ignored.
+         */
+        a->ric = 0;
+        a->prs = false;
+        a->r = false;
+        if (local) {
+            a->rs = 0;
+        }
+    }
+
+    if (ctx->pr) {
+        /* tlbie[l] is privileged... */
+        gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+        return true;
+    } else if (!ctx->hv) {
+        if ((!a->prs && ctx->hr) || (!local && !ctx->gtse)) {
+            /*
+             * ... except when PRS=0 and HR=1, or when GTSE=0 for tlbie,
+             * making it hypervisor privileged.
+             */
+            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+            return true;
+        }
+    }
+
+    if (!local && NARROW_MODE(ctx)) {
+        TCGv t0 = tcg_temp_new();
+        tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
+        gen_helper_tlbie(cpu_env, t0);
+        tcg_temp_free(t0);
+    } else {
+        gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
+    }
+
+    if (local) {
+        return true;
+    }
+
+    t1 = tcg_temp_new_i32();
+    tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
+    tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
+    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
+    tcg_temp_free_i32(t1);
+
+    return true;
+#endif
+}
+
+TRANS_FLAGS(MEM_TLBIE, TLBIE, do_tlbie, false)
+TRANS_FLAGS(MEM_TLBIE, TLBIEL, do_tlbie, true)
-- 
2.36.1


