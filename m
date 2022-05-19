Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424752DE7E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 22:36:19 +0200 (CEST)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrmsc-0000IS-5y
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 16:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nrmf1-0006Qv-R2; Thu, 19 May 2022 16:22:16 -0400
Received: from [187.72.171.209] (port=38888 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nrmf0-0007Ny-DX; Thu, 19 May 2022 16:22:15 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 19 May 2022 17:18:47 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2581F800C32;
 Thu, 19 May 2022 17:18:47 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v2 09/12] target/ppc: introduce do_va_helper
Date: Thu, 19 May 2022 17:18:19 -0300
Message-Id: <20220519201822.465229-10-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 May 2022 20:18:47.0387 (UTC)
 FILETIME=[A54F7AB0:01D86BBD]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vmx-impl.c.inc | 32 +++++------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 764ac45409..e66301c007 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2553,20 +2553,17 @@ static void gen_vmladduhm(DisasContext *ctx)
     tcg_temp_free_ptr(rd);
 }
 
-static bool trans_VPERM(DisasContext *ctx, arg_VA *a)
+static bool do_va_helper(DisasContext *ctx, arg_VA *a,
+    void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
     TCGv_ptr vrt, vra, vrb, vrc;
-
-    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
     REQUIRE_VECTOR(ctx);
 
     vrt = gen_avr_ptr(a->vrt);
     vra = gen_avr_ptr(a->vra);
     vrb = gen_avr_ptr(a->vrb);
     vrc = gen_avr_ptr(a->rc);
-
-    gen_helper_VPERM(vrt, vra, vrb, vrc);
-
+    gen_helper(vrt, vra, vrb, vrc);
     tcg_temp_free_ptr(vrt);
     tcg_temp_free_ptr(vra);
     tcg_temp_free_ptr(vrb);
@@ -2575,27 +2572,8 @@ static bool trans_VPERM(DisasContext *ctx, arg_VA *a)
     return true;
 }
 
-static bool trans_VPERMR(DisasContext *ctx, arg_VA *a)
-{
-    TCGv_ptr vrt, vra, vrb, vrc;
-
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    REQUIRE_VECTOR(ctx);
-
-    vrt = gen_avr_ptr(a->vrt);
-    vra = gen_avr_ptr(a->vra);
-    vrb = gen_avr_ptr(a->vrb);
-    vrc = gen_avr_ptr(a->rc);
-
-    gen_helper_VPERMR(vrt, vra, vrb, vrc);
-
-    tcg_temp_free_ptr(vrt);
-    tcg_temp_free_ptr(vra);
-    tcg_temp_free_ptr(vrb);
-    tcg_temp_free_ptr(vrc);
-
-    return true;
-}
+TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
+TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
 
 static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
 {
-- 
2.25.1


