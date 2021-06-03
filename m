Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE1399D36
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:53:44 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj6l-0005DJ-3A
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loie6-0008Li-4G; Thu, 03 Jun 2021 04:24:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59657 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidy-0000cc-E0; Thu, 03 Jun 2021 04:24:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5s5HgHz9t6S; Thu,  3 Jun 2021 18:22:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708561;
 bh=lznL8IteIEJZwg67FqGurw6QmprSyuWvhZaAKobZq/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N/AHrEiPSc2z/t/uJDHlu/zq/FKxfPHgcwyI9c2pdKIPoTgvZV7467YjE1R4UdR73
 wnRouKqWMrzWxFf0V7hLG4boSxgDBU8rltp3eTDA+AReKT4EYgq9/+bBEL9Ksvg4qh
 GUiX/bl9F9erhjZbiDnlrBUa+BwXmLt5xCfHPxuE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 39/42] target/ppc: Implement vcfuged instruction
Date: Thu,  3 Jun 2021 18:22:28 +1000
Message-Id: <20210603082231.601214-40-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-13-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode               |  7 ++++
 target/ppc/translate.c                 |  1 +
 target/ppc/translate/vector-impl.c.inc | 56 ++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 target/ppc/translate/vector-impl.c.inc

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d4044d9069..77edf407ab 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -23,6 +23,9 @@
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
+&VX             vrt vra vrb
+@VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
+
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
@@ -97,3 +100,7 @@ SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
 SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
+
+## Vector Bit Manipulation Instruction
+
+VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 3c3cb1b664..ed5515f8e2 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7538,6 +7538,7 @@ static int times_4(DisasContext *ctx, int x)
 #include "translate/vmx-impl.c.inc"
 
 #include "translate/vsx-impl.c.inc"
+#include "translate/vector-impl.c.inc"
 
 #include "translate/dfp-impl.c.inc"
 
diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translate/vector-impl.c.inc
new file mode 100644
index 0000000000..117ce9b137
--- /dev/null
+++ b/target/ppc/translate/vector-impl.c.inc
@@ -0,0 +1,56 @@
+/*
+ * Power ISA decode for Vector Facility instructions
+ *
+ * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
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
+#define REQUIRE_ALTIVEC(CTX) \
+    do {                                                \
+        if (unlikely(!(CTX)->altivec_enabled)) {        \
+            gen_exception((CTX), POWERPC_EXCP_VPU);     \
+            return true;                                \
+        }                                               \
+    } while (0)
+
+static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 tgt, src, mask;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_ALTIVEC(ctx);
+
+    tgt = tcg_temp_new_i64();
+    src = tcg_temp_new_i64();
+    mask = tcg_temp_new_i64();
+
+    /* centrifuge lower double word */
+    get_cpu_vsrl(src, a->vra + 32);
+    get_cpu_vsrl(mask, a->vrb + 32);
+    gen_helper_cfuged(tgt, src, mask);
+    set_cpu_vsrl(a->vrt + 32, tgt);
+
+    /* centrifuge higher double word */
+    get_cpu_vsrh(src, a->vra + 32);
+    get_cpu_vsrh(mask, a->vrb + 32);
+    gen_helper_cfuged(tgt, src, mask);
+    set_cpu_vsrh(a->vrt + 32, tgt);
+
+    tcg_temp_free_i64(tgt);
+    tcg_temp_free_i64(src);
+    tcg_temp_free_i64(mask);
+
+    return true;
+}
-- 
2.31.1


