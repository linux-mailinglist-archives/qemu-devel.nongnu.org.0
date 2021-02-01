Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D837B309FA8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 01:21:02 +0100 (CET)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Mxh-00032N-Va
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 19:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvc-0001mj-2O
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:34169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6MvX-00017b-NH
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A31C3746358;
 Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1DBBE746340; Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Message-Id: <a8bd70b66e3dbdb7d2ab7a852af71cdbf341d50c.1612137712.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/6] m68k: improve comments on m68k_move_to/from helpers
Date: Mon, 01 Feb 2021 01:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>

Add more detailed comments to each case of m68k_move_to/from helpers to list
the supported CPUs for that CR as they were wrong in some cases, and
missing some cpu classes in other cases.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/m68k/helper.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 3ff5765795..9e81ee53ad 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -187,13 +187,15 @@ void HELPER(cf_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
 void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
 {
     switch (reg) {
-    /* MC680[1234]0 */
+    /* MC680[12346]0 */
     case M68K_CR_SFC:
         env->sfc = val & 7;
         return;
+    /* MC680[12346]0 */
     case M68K_CR_DFC:
         env->dfc = val & 7;
         return;
+    /* MC680[12346]0 */
     case M68K_CR_VBR:
         env->vbr = val;
         return;
@@ -210,25 +212,30 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
         }
         m68k_switch_sp(env);
         return;
-    /* MC680[34]0 */
+    /* MC680[46]0 */
     case M68K_CR_TC:
         env->mmu.tcr = val;
         return;
+    /* MC68040 */
     case M68K_CR_MMUSR:
         env->mmu.mmusr = val;
         return;
+    /* MC680[46]0 */
     case M68K_CR_SRP:
         env->mmu.srp = val;
         return;
     case M68K_CR_URP:
         env->mmu.urp = val;
         return;
+    /* MC680[46]0 */
     case M68K_CR_USP:
         env->sp[M68K_USP] = val;
         return;
+    /* MC680[234]0 */
     case M68K_CR_MSP:
         env->sp[M68K_SSP] = val;
         return;
+    /* MC680[234]0 */
     case M68K_CR_ISP:
         env->sp[M68K_ISP] = val;
         return;
@@ -236,12 +243,15 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     case M68K_CR_ITT0:
         env->mmu.ttr[M68K_ITTR0] = val;
         return;
+    /* MC68040/MC68LC040 */
     case M68K_CR_ITT1:
          env->mmu.ttr[M68K_ITTR1] = val;
         return;
+    /* MC68040/MC68LC040 */
     case M68K_CR_DTT0:
         env->mmu.ttr[M68K_DTTR0] = val;
         return;
+    /* MC68040/MC68LC040 */
     case M68K_CR_DTT1:
         env->mmu.ttr[M68K_DTTR1] = val;
         return;
@@ -254,39 +264,50 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
 uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
 {
     switch (reg) {
-    /* MC680[1234]0 */
+    /* MC680[12346]0 */
     case M68K_CR_SFC:
         return env->sfc;
+    /* MC680[12346]0 */
     case M68K_CR_DFC:
         return env->dfc;
+    /* MC680[12346]0 */
     case M68K_CR_VBR:
         return env->vbr;
-    /* MC680[234]0 */
+    /* MC680[2346]0 */
     case M68K_CR_CACR:
         return env->cacr;
-    /* MC680[34]0 */
+    /* MC680[46]0 */
     case M68K_CR_TC:
         return env->mmu.tcr;
+    /* MC68040 */
     case M68K_CR_MMUSR:
         return env->mmu.mmusr;
+    /* MC680[46]0 */
     case M68K_CR_SRP:
         return env->mmu.srp;
+    /* MC680[46]0 */
     case M68K_CR_USP:
         return env->sp[M68K_USP];
+    /* MC680[234]0 */
     case M68K_CR_MSP:
         return env->sp[M68K_SSP];
+    /* MC680[234]0 */
     case M68K_CR_ISP:
         return env->sp[M68K_ISP];
     /* MC68040/MC68LC040 */
     case M68K_CR_URP:
         return env->mmu.urp;
-    case M68K_CR_ITT0:
+    /* MC68040/MC68LC040 */
+    case M68K_CR_ITT0: /* MC68EC040 only: M68K_CR_IACR0 */
         return env->mmu.ttr[M68K_ITTR0];
-    case M68K_CR_ITT1:
+    /* MC68040/MC68LC040 */
+    case M68K_CR_ITT1: /* MC68EC040 only: M68K_CR_IACR1 */
         return env->mmu.ttr[M68K_ITTR1];
-    case M68K_CR_DTT0:
+    /* MC68040/MC68LC040 */
+    case M68K_CR_DTT0: /* MC68EC040 only: M68K_CR_DACR0 */
         return env->mmu.ttr[M68K_DTTR0];
-    case M68K_CR_DTT1:
+    /* MC68040/MC68LC040 */
+    case M68K_CR_DTT1: /* MC68EC040 only: M68K_CR_DACR1 */
         return env->mmu.ttr[M68K_DTTR1];
     }
     cpu_abort(env_cpu(env), "Unimplemented control register read 0x%x\n",
-- 
2.21.3


