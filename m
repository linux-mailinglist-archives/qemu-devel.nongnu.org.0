Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D48397AD3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 21:48:44 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loANX-0004Uo-Fd
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 15:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1loABY-0002fN-0O; Tue, 01 Jun 2021 15:36:20 -0400
Received: from [201.28.113.2] (port=31942 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1loABW-0002Jl-7q; Tue, 01 Jun 2021 15:36:19 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 16:35:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 392E280148B;
 Tue,  1 Jun 2021 16:35:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v6 12/14] target/ppc: Implement vcfuged instruction
Date: Tue,  1 Jun 2021 16:35:26 -0300
Message-Id: <20210601193528.2533031-13-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2021 19:35:45.0706 (UTC)
 FILETIME=[511A38A0:01D7571D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, groug@kaod.org,
 luis.pires@eldorado.org.br, lagarcia@br.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


