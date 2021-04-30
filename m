Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03736F3CC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:43:01 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcIBJ-0007Tz-1F
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHld-0003Vv-3T
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlC-0007cr-Qj
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so890642pjv.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZA4bSMjar5L7uXmkw0P7MvAki5DM6E2paFogrNIkUC8=;
 b=ahqxc2v3Il5K8Rqn9RVLMIiRk/dHOsCYJPrIIvaF/+DyxGe5hMabGdHk2Oc/e2VfWN
 TZ90LOEX/7yexO1zH1ueyoEeTaak6ECC7nql6Rver58XqdF20+3ho46Var2LSZKna9ie
 OnFyc1obYUQ376il4lt645nOM+JZ0umNt6Q33G85w6Lh8ritvqmKJ6Rve6Muq+/q1GjM
 Rwcleu25IcEhVpIkCPoH5Uey2H5qVRzWvmY2ewyfQD+3gRfLEtucyw+5hSfzQQZoteTr
 SVuniHMucxGztSgGUgvsWeEZF/Ndnbf6UC9ZJYEx7DPA4siNzAVmmyMe8IVRNvTLsYqI
 cMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZA4bSMjar5L7uXmkw0P7MvAki5DM6E2paFogrNIkUC8=;
 b=dGQlGE9LC6kMY3TxvH+pfhH4T0GX+TsX8TFST6TVMgyoN5ohpodoAPGpYCY2sxVfFx
 ToMGev5P0FtpBG0gJ9WTykmPZVoYhgJFCjpHHPrhiDL5L4rwI5eX17LrabtuQ2htuTZP
 2GAQbghPLH1fRtdTxwK74lAa4nrIrAf2YDEdMjC8yN2knx9vYWsbnE3L/lbjmsiSbgBO
 2bG5RdPk3tzOY8uuhizmvOP4XjNX0XbHgpnrTKxqeS6UWhbm38eQEXsVsRh7dm0soCvN
 m3nPR1RpH5YYkoHN/adVLAoafEv277SXvz94eTy4FS17T8KyW8W1dUMzuTEDfMXfsKEt
 gtAQ==
X-Gm-Message-State: AOAM531Gnzqobm9CqRTTERDX7ja6M2MivbdyD8TPqayDGZsUNYY2a/VC
 ZW7NAjDONUwQWgXKyprlshjo4iCfsh7Lcw==
X-Google-Smtp-Source: ABdhPJxM+S1578LOVzaWgaYOBaBX/AqrLooxRfQp1GQnZvIXzlgsfzRyqGzURHnE5FCtjASqn1dBpw==
X-Received: by 2002:a17:902:7616:b029:e9:a757:b191 with SMTP id
 k22-20020a1709027616b02900e9a757b191mr2587708pll.74.1619745361449; 
 Thu, 29 Apr 2021 18:16:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Date: Thu, 29 Apr 2021 18:15:38 -0700
Message-Id: <20210430011543.1017113-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn32.decode                   | 12 +++++++
 target/ppc/insn64.decode                   | 15 +++++++++
 target/ppc/translate.c                     | 29 ----------------
 target/ppc/translate/fixedpoint-impl.c.inc | 39 ++++++++++++++++++++++
 4 files changed, 66 insertions(+), 29 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b175441209..52d9b355d4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -16,3 +16,15 @@
 # You should have received a copy of the GNU Lesser General Public
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
+
+&D              rt ra si
+@D              ...... rt:5 ra:5 si:s16                 &D
+
+# If a prefix is allowed, decode with default values.
+&PLS_D          rt ra si:int64_t r:bool
+@PLS_D          ...... rt:5 ra:5 si:s16                 &PLS_D r=0
+
+### Fixed-Point Arithmetic Instructions
+
+ADDI            001110 ..... ..... ................     @PLS_D
+ADDIS           001111 ..... ..... ................     @D
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 9fc45d0614..f4272df724 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -16,3 +16,18 @@
 # You should have received a copy of the GNU Lesser General Public
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
+
+# Many all of these instruction names would be prefixed by "P",
+# but we share code with the non-prefixed instruction.
+
+# Format MLS:D and 8LS:D
+&PLS_D          rt ra si:int64_t r:bool  !extern
+%pls_si         32:s18 0:16
+@PLS_D          ...... .. ... r:1 .. .................. \
+                ...... rt:5 ra:5 ................       \
+                &PLS_D si=%pls_si
+
+### Fixed-Point Arithmetic Instructions
+
+ADDI            000001 10 0--.-- ..................     \
+                001110 ..... ..... ................     @PLS_D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d782a13d27..5a8a3c39c3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -924,19 +924,6 @@ GEN_INT_ARITH_ADD(addex, 0x05, cpu_ov, 1, 1, 0);
 /* addze  addze.  addzeo  addzeo.*/
 GEN_INT_ARITH_ADD_CONST(addze, 0x06, 0, cpu_ca, 1, 1, 0)
 GEN_INT_ARITH_ADD_CONST(addzeo, 0x16, 0, cpu_ca, 1, 1, 1)
-/* addi */
-static void gen_addi(DisasContext *ctx)
-{
-    target_long simm = SIMM(ctx->opcode);
-
-    if (rA(ctx->opcode) == 0) {
-        /* li case */
-        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm);
-    } else {
-        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
-                        cpu_gpr[rA(ctx->opcode)], simm);
-    }
-}
 /* addic  addic.*/
 static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
 {
@@ -956,20 +943,6 @@ static void gen_addic_(DisasContext *ctx)
     gen_op_addic(ctx, 1);
 }
 
-/* addis */
-static void gen_addis(DisasContext *ctx)
-{
-    target_long simm = SIMM(ctx->opcode);
-
-    if (rA(ctx->opcode) == 0) {
-        /* lis case */
-        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm << 16);
-    } else {
-        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
-                        cpu_gpr[rA(ctx->opcode)], simm << 16);
-    }
-}
-
 /* addpcis */
 static void gen_addpcis(DisasContext *ctx)
 {
@@ -7029,10 +7002,8 @@ GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(cmpb, 0x1F, 0x1C, 0x0F, 0x00000001, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
-GEN_HANDLER(addi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
-GEN_HANDLER(addis, 0x0F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER_E(addpcis, 0x13, 0x2, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(mulhw, 0x1F, 0x0B, 0x02, 0x00000400, PPC_INTEGER),
 GEN_HANDLER(mulhwu, 0x1F, 0x0B, 0x00, 0x00000400, PPC_INTEGER),
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index b740083605..7af1b3bcf5 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -16,3 +16,42 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
+
+/*
+ * Incorporate CIA into the constant when R=1.
+ * Validate that when R=1, RA=0.
+ */
+static bool resolve_PLS_D(DisasContext *ctx, arg_PLS_D *a)
+{
+    if (a->r) {
+        if (unlikely(a->ra != 0)) {
+            gen_invalid(ctx);
+            return false;
+        }
+        a->si += ctx->cia;
+    }
+    return true;
+}
+
+static bool trans_ADDI(DisasContext *ctx, arg_PLS_D *a)
+{
+    if (resolve_PLS_D(ctx, a)) {
+        if (a->ra) {
+            tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
+        } else {
+            tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
+        }
+    }
+    return true;
+}
+
+static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
+{
+    int si = a->si << 16;
+    if (a->ra) {
+        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], si);
+    } else {
+        tcg_gen_movi_tl(cpu_gpr[a->rt], si);
+    }
+    return true;
+}
-- 
2.25.1


