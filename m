Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CD49B683
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:38:24 +0100 (CET)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMxj-0002c1-7q
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLIT-0004YU-Id; Tue, 25 Jan 2022 07:51:43 -0500
Received: from [187.72.171.209] (port=39682 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLIS-0000Wd-3g; Tue, 25 Jan 2022 07:51:41 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9D5F080001E;
 Tue, 25 Jan 2022 09:20:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 33/38] target/ppc: Implement do_helper_XX3 and move xxperm*
 to use it
Date: Tue, 25 Jan 2022 09:19:38 -0300
Message-Id: <20220125121943.3269077-34-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:46.0017 (UTC)
 FILETIME=[FACA3B10:01D811E5]
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
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

do_helper_XX3 is a wrapper for instructions that only call its helper.
It will be used later to implement instructions like xscmp*dp.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vsx-impl.c.inc | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index e1fea01a3a..330411f8a6 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1159,7 +1159,8 @@ GEN_VSX_HELPER_X2(xvrspiz, 0x12, 0x09, 0, PPC2_VSX)
 GEN_VSX_HELPER_2(xvtstdcsp, 0x14, 0x1A, 0, PPC2_VSX)
 GEN_VSX_HELPER_2(xvtstdcdp, 0x14, 0x1E, 0, PPC2_VSX)
 
-static bool trans_XXPERM(DisasContext *ctx, arg_XX3 *a)
+static bool do_helper_XX3(DisasContext *ctx, arg_XX3 *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
     TCGv_ptr xt, xa, xb;
 
@@ -1170,7 +1171,7 @@ static bool trans_XXPERM(DisasContext *ctx, arg_XX3 *a)
     xa = gen_vsr_ptr(a->xa);
     xb = gen_vsr_ptr(a->xb);
 
-    gen_helper_VPERM(xt, xa, xt, xb);
+    helper(cpu_env, xt, xa, xb);
 
     tcg_temp_free_ptr(xt);
     tcg_temp_free_ptr(xa);
@@ -1179,25 +1180,8 @@ static bool trans_XXPERM(DisasContext *ctx, arg_XX3 *a)
     return true;
 }
 
-static bool trans_XXPERMR(DisasContext *ctx, arg_XX3 *a)
-{
-    TCGv_ptr xt, xa, xb;
-
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    REQUIRE_VSX(ctx);
-
-    xt = gen_vsr_ptr(a->xt);
-    xa = gen_vsr_ptr(a->xa);
-    xb = gen_vsr_ptr(a->xb);
-
-    gen_helper_VPERMR(xt, xa, xt, xb);
-
-    tcg_temp_free_ptr(xt);
-    tcg_temp_free_ptr(xa);
-    tcg_temp_free_ptr(xb);
-
-    return true;
-}
+TRANS(XXPERM, do_helper_XX3, gen_helper_VPERM);
+TRANS(XXPERMR, do_helper_XX3, gen_helper_VPERMR);
 
 static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
 {
-- 
2.25.1


