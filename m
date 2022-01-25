Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E149B50E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:29:41 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCLtC-0004tP-Os
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7V-0000oi-RP; Tue, 25 Jan 2022 07:40:27 -0500
Received: from [187.72.171.209] (port=20411 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7T-0006vl-2g; Tue, 25 Jan 2022 07:40:21 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A79ED8009AB;
 Tue, 25 Jan 2022 09:20:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 08/38] target/ppc: Implement vextsd2q
Date: Tue, 25 Jan 2022 09:19:13 -0300
Message-Id: <20220125121943.3269077-9-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:37.0038 (UTC)
 FILETIME=[F57024E0:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 757791f0ac..1c935eeac8 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -426,6 +426,7 @@ VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
 VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
 VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
+VEXTSD2Q        000100 ..... 11011 ..... 11000000010    @VX_tb
 
 ## Vector Mask Manipulation Instructions
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ec782c47ff..99606a8718 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1792,6 +1792,24 @@ TRANS(VEXTSB2D, do_vexts, MO_64, 56);
 TRANS(VEXTSH2D, do_vexts, MO_64, 48);
 TRANS(VEXTSW2D, do_vexts, MO_64, 32);
 
+static bool trans_VEXTSD2Q(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp = tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, false);
+    set_avr64(a->vrt, tmp, false);
+    tcg_gen_sari_i64(tmp, tmp, 63);
+    set_avr64(a->vrt, tmp, true);
+
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
 GEN_VXFORM_NOA_2(vctzb, 1, 24, 28)
 GEN_VXFORM_NOA_2(vctzh, 1, 24, 29)
 GEN_VXFORM_NOA_2(vctzw, 1, 24, 30)
-- 
2.25.1


