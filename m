Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14570309FAC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 01:23:15 +0100 (CET)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Mzq-00062Y-62
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 19:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvb-0001mg-OU
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:16943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6MvX-00017d-NZ
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 88AD7746357;
 Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 21969746351; Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Message-Id: <19e5c0fa8baed6479ed0502fd3deb132d19457fb.1612137712.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/6] m68k: add missing BUSCR/PCR CR defines, and
 BUSCR/PCR/CAAR CR to m68k_move_to/from
Date: Mon, 01 Feb 2021 01:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The BUSCR/PCR CR defines were missing for 68060, and the move_to/from helper
functions were also missing a decode for the 68060 M68K_CR_CAAR CR register.

Added missing defines, and respective decodes for all three CR registers to
the helpers.

Although this patch defines them, the implementation is empty in this patch
and these registers will result in a cpu abort - which is the default prior
to this patch.

This patch aims to reach full coverage of all CR registers within the helpers.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/m68k/cpu.h    |  4 ++++
 target/m68k/helper.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 2b1cdf241b..ae34c94615 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -393,6 +393,10 @@ typedef enum {
 #define M68K_CR_DACR0    0x006
 #define M68K_CR_DACR1    0x007
 
+/* MC68060 */
+#define M68K_CR_BUSCR    0x008
+#define M68K_CR_PCR      0x808
+
 #define M68K_FPIAR_SHIFT  0
 #define M68K_FPIAR        (1 << M68K_FPIAR_SHIFT)
 #define M68K_FPSR_SHIFT   1
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 9e81ee53ad..69acdc3b35 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -255,6 +255,11 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     case M68K_CR_DTT1:
         env->mmu.ttr[M68K_DTTR1] = val;
         return;
+    /* Unimplemented Registers */
+    case M68K_CR_CAAR:
+    case M68K_CR_PCR:
+    case M68K_CR_BUSCR:
+        break;
     }
     cpu_abort(env_cpu(env),
               "Unimplemented control register write 0x%x = 0x%x\n",
@@ -309,6 +314,11 @@ uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
     /* MC68040/MC68LC040 */
     case M68K_CR_DTT1: /* MC68EC040 only: M68K_CR_DACR1 */
         return env->mmu.ttr[M68K_DTTR1];
+    /* Unimplemented Registers */
+    case M68K_CR_CAAR:
+    case M68K_CR_PCR:
+    case M68K_CR_BUSCR:
+        break;
     }
     cpu_abort(env_cpu(env), "Unimplemented control register read 0x%x\n",
               reg);
-- 
2.21.3


