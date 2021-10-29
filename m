Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B944044E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:46:05 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYlI-0003gu-Sx
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRw-00028o-Rf; Fri, 29 Oct 2021 16:26:04 -0400
Received: from [201.28.113.2] (port=65208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRu-0001sK-7w; Fri, 29 Oct 2021 16:26:04 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:25:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 83B6E800B36;
 Fri, 29 Oct 2021 17:25:51 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 11/34] target/ppc: Move vcfuged to vmx-impl.c.inc
Date: Fri, 29 Oct 2021 17:24:01 -0300
Message-Id: <20211029202424.175401-12-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:25:52.0050 (UTC)
 FILETIME=[2AFC6920:01D7CD03]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

There's no reason to keep vector-impl.c.inc separate from
vmx-impl.c.inc. Additionally, let GVec handle the multiple calls to
helper_cfuged for us.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
- vecop_list removed
---
 target/ppc/helper.h                        |  2 +-
 target/ppc/int_helper.c                    |  2 +-
 target/ppc/translate.c                     |  1 -
 target/ppc/translate/fixedpoint-impl.c.inc |  2 +-
 target/ppc/translate/vector-impl.c.inc     | 48 ----------------------
 target/ppc/translate/vmx-impl.c.inc        | 16 ++++++++
 6 files changed, 19 insertions(+), 52 deletions(-)
 delete mode 100644 target/ppc/translate/vector-impl.c.inc

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 72e66c5fe8..401575b935 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -46,7 +46,7 @@ DEF_HELPER_4(divwe, tl, env, tl, tl, i32)
 DEF_HELPER_FLAGS_1(popcntb, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(cmpb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_3(sraw, tl, env, tl, tl)
-DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 913d76be6e..f03c864e48 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -324,7 +324,7 @@ target_ulong helper_popcntb(target_ulong val)
 }
 #endif
 
-uint64_t helper_cfuged(uint64_t src, uint64_t mask)
+uint64_t helper_CFUGED(uint64_t src, uint64_t mask)
 {
     /*
      * Instead of processing the mask bit-by-bit from the most significant to
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 659859ff5f..fc9d35a7a8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7407,7 +7407,6 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 #include "translate/vmx-impl.c.inc"
 
 #include "translate/vsx-impl.c.inc"
-#include "translate/vector-impl.c.inc"
 
 #include "translate/dfp-impl.c.inc"
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 220b099fcd..fa519c2d3e 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -407,7 +407,7 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
 #if defined(TARGET_PPC64)
-    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+    gen_helper_CFUGED(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
 #else
     qemu_build_not_reached();
 #endif
diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translate/vector-impl.c.inc
deleted file mode 100644
index 197e903337..0000000000
--- a/target/ppc/translate/vector-impl.c.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-/*
- * Power ISA decode for Vector Facility instructions
- *
- * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
-{
-    TCGv_i64 tgt, src, mask;
-
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
-    REQUIRE_VECTOR(ctx);
-
-    tgt = tcg_temp_new_i64();
-    src = tcg_temp_new_i64();
-    mask = tcg_temp_new_i64();
-
-    /* centrifuge lower double word */
-    get_cpu_vsrl(src, a->vra + 32);
-    get_cpu_vsrl(mask, a->vrb + 32);
-    gen_helper_cfuged(tgt, src, mask);
-    set_cpu_vsrl(a->vrt + 32, tgt);
-
-    /* centrifuge higher double word */
-    get_cpu_vsrh(src, a->vra + 32);
-    get_cpu_vsrh(mask, a->vrb + 32);
-    gen_helper_cfuged(tgt, src, mask);
-    set_cpu_vsrh(a->vrt + 32, tgt);
-
-    tcg_temp_free_i64(tgt);
-    tcg_temp_free_i64(src);
-    tcg_temp_free_i64(mask);
-
-    return true;
-}
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 92b9527aff..e36c66589c 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1559,6 +1559,22 @@ GEN_VXFORM3(vpermxor, 22, 0xFF)
 GEN_VXFORM_DUAL(vsldoi, PPC_ALTIVEC, PPC_NONE,
                 vpermxor, PPC_NONE, PPC2_ALTIVEC_207)
 
+static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
+{
+    static const GVecGen3 g = {
+        .fni8 = gen_helper_CFUGED,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &g);
+
+    return true;
+}
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.25.1


