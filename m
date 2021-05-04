Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378BB3725C4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:22:07 +0200 (CEST)
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoRa-0002HQ-4Y
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo04-0005IM-FK; Tue, 04 May 2021 01:53:42 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51127 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo00-0004kV-Pa; Tue, 04 May 2021 01:53:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK4xscz9sXH; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=Xk1wYOuZSpZWxh2ux/tBAmxZ1jpImU1ImlZmhp9mW8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=azv2z9J/mErL83AOAoT9QXVFaLY4N1WtUEUecMWWwpubJbocbTTUdU+3M5FDyHf97
 CzJDjWPDrPrJQlvptPRrFjXujgYi9ujgJyh1y9iM0yDmyVatnNOPqSjetDOBZ6/U2a
 4CKRHOVczwG/GLggkGyJfrlOIqX6OrG2nJ4rjyKY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/46] target/ppc: Remove MSR_SA and MSR_AP from hflags
Date: Tue,  4 May 2021 15:52:42 +1000
Message-Id: <20210504055312.306823-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Nothing within the translator -- or anywhere else for that
matter -- checks MSR_SA or MSR_AP on the 602.  This may be
a mistake.  However, for the moment, we need not record these
bits in hflags.

This allows us to simplify HFLAGS_VSX computation by moving
it to overlap with MSR_VSX.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-8-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         |  4 +---
 target/ppc/helper_regs.c | 10 ++++------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3c28ddb331..2f72f83ee3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -600,14 +600,12 @@ enum {
     HFLAGS_DR = 4,   /* MSR_DR */
     HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
-    HFLAGS_VSX = 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ MSR_AP */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
-    HFLAGS_SA = 22,  /* MSR_SA */
-    HFLAGS_AP = 23,  /* MSR_AP */
+    HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 };
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index f85bb14d1d..dd3cd770a3 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -99,11 +99,8 @@ void hreg_compute_hflags(CPUPPCState *env)
     QEMU_BUILD_BUG_ON(MSR_DR != HFLAGS_DR);
     QEMU_BUILD_BUG_ON(MSR_IR != HFLAGS_IR);
     QEMU_BUILD_BUG_ON(MSR_FP != HFLAGS_FP);
-    QEMU_BUILD_BUG_ON(MSR_SA != HFLAGS_SA);
-    QEMU_BUILD_BUG_ON(MSR_AP != HFLAGS_AP);
     msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
-                (1 << MSR_DR) | (1 << MSR_IR) |
-                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
+                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
 
     if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
@@ -143,8 +140,9 @@ void hreg_compute_hflags(CPUPPCState *env)
         QEMU_BUILD_BUG_ON(MSR_VR != HFLAGS_VR);
         msr_mask |= 1 << MSR_VR;
     }
-    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
-        hflags |= 1 << HFLAGS_VSX;
+    if (ppc_flags & POWERPC_FLAG_VSX) {
+        QEMU_BUILD_BUG_ON(MSR_VSX != HFLAGS_VSX);
+        msr_mask |= 1 << MSR_VSX;
     }
     if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
         hflags |= 1 << HFLAGS_TM;
-- 
2.31.1


