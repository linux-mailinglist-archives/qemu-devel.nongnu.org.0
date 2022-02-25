Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4694C50C9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:36:48 +0100 (CET)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiGd-0005B6-QB
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhs7-0000y5-DA; Fri, 25 Feb 2022 16:11:27 -0500
Received: from [187.72.171.209] (port=2714 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhs5-0003wK-KZ; Fri, 25 Feb 2022 16:11:27 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:49 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E31CA8006BB;
 Fri, 25 Feb 2022 18:09:48 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 08/49] target/ppc: Implement vextsd2q
Date: Fri, 25 Feb 2022 18:08:55 -0300
Message-Id: <20220225210936.1749575-9-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:49.0288 (UTC)
 FILETIME=[060F3E80:01D82A8C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1dcf9c61e9..cba680075b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -426,6 +426,7 @@ VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
 VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
 VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
+VEXTSD2Q        000100 ..... 11011 ..... 11000000010    @VX_tb
 
 ## Vector Mask Manipulation Instructions
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index aa021bdf54..afe56a19d5 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1825,6 +1825,24 @@ TRANS(VEXTSB2D, do_vexts, MO_64, 56);
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


