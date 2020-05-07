Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A333D1C8166
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 07:13:02 +0200 (CEST)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWYqD-0007ZP-Ns
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 01:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jWYiM-0008LA-2R; Thu, 07 May 2020 01:04:54 -0400
Received: from ozlabs.org ([203.11.71.1]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jWYiK-0007wd-HM; Thu, 07 May 2020 01:04:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49HhFr0vWdz9sTZ; Thu,  7 May 2020 15:04:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1588827856;
 bh=0Defog9BMQ96zbUpzXIYlfo59cZ5ZBvaXqV8R8t0Wck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LdaYpvqN/2hfttT9c/lrVEYTCruQIlglIALce3z8FiNYWVwhjNFFXWGD/1Pbq5R60
 VHNNtZa4u6qktRJsSZW5gjs7uKMjJ7x6641eSGbHp1LvLSULRqez1imu4Q5U59JMoJ
 g2E4/EdWDm5RdkqgKCM51nCiGMPPEysA++PHD7W0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 18/18] target-ppc: fix rlwimi, rlwinm, rlwnm for Clang-9
Date: Thu,  7 May 2020 15:02:28 +1000
Message-Id: <20200507050228.802395-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507050228.802395-1-david@gibson.dropbear.id.au>
References: <20200507050228.802395-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 01:04:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, npiggin@gmail.com, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, Daniele Buono <dbuono@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

Starting with Clang v9, -Wtype-limits is implemented and triggers a
few "result of comparison is always true" errors when compiling PPC32
targets.

The comparisons seem to be necessary only on PPC64, since the
else branch in PPC32 only has a "g_assert_not_reached();" in all cases.

This patch restructures the code so that the actual if/else is done on a
local flag variable, that is set accordingly for PPC64, and always
true for PPC32.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20200505183818.32688-2-dbuono@linux.vnet.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 807d14faaa..338529879f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1882,6 +1882,7 @@ static void gen_rlwimi(DisasContext *ctx)
         tcg_gen_deposit_tl(t_ra, t_ra, t_rs, sh, me - mb + 1);
     } else {
         target_ulong mask;
+        bool mask_in_32b = true;
         TCGv t1;
 
 #if defined(TARGET_PPC64)
@@ -1890,8 +1891,13 @@ static void gen_rlwimi(DisasContext *ctx)
 #endif
         mask = MASK(mb, me);
 
+#if defined(TARGET_PPC64)
+        if (mask > 0xffffffffu) {
+            mask_in_32b = false;
+        }
+#endif
         t1 = tcg_temp_new();
-        if (mask <= 0xffffffffu) {
+        if (mask_in_32b) {
             TCGv_i32 t0 = tcg_temp_new_i32();
             tcg_gen_trunc_tl_i32(t0, t_rs);
             tcg_gen_rotli_i32(t0, t0, sh);
@@ -1933,12 +1939,18 @@ static void gen_rlwinm(DisasContext *ctx)
         tcg_gen_extract_tl(t_ra, t_rs, rsh, len);
     } else {
         target_ulong mask;
+        bool mask_in_32b = true;
 #if defined(TARGET_PPC64)
         mb += 32;
         me += 32;
 #endif
         mask = MASK(mb, me);
-        if (mask <= 0xffffffffu) {
+#if defined(TARGET_PPC64)
+        if (mask > 0xffffffffu) {
+            mask_in_32b = false;
+        }
+#endif
+        if (mask_in_32b) {
             if (sh == 0) {
                 tcg_gen_andi_tl(t_ra, t_rs, mask);
             } else {
@@ -1973,6 +1985,7 @@ static void gen_rlwnm(DisasContext *ctx)
     uint32_t mb = MB(ctx->opcode);
     uint32_t me = ME(ctx->opcode);
     target_ulong mask;
+    bool mask_in_32b = true;
 
 #if defined(TARGET_PPC64)
     mb += 32;
@@ -1980,7 +1993,12 @@ static void gen_rlwnm(DisasContext *ctx)
 #endif
     mask = MASK(mb, me);
 
-    if (mask <= 0xffffffffu) {
+#if defined(TARGET_PPC64)
+    if (mask > 0xffffffffu) {
+        mask_in_32b = false;
+    }
+#endif
+    if (mask_in_32b) {
         TCGv_i32 t0 = tcg_temp_new_i32();
         TCGv_i32 t1 = tcg_temp_new_i32();
         tcg_gen_trunc_tl_i32(t0, t_rb);
-- 
2.26.2


