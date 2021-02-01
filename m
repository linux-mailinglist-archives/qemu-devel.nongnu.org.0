Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF83309FAB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 01:23:14 +0100 (CET)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Mzp-00062A-Nd
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 19:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvk-0001uM-9V
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:19:00 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:34435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvd-0001AV-65
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:19:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F0212746398;
 Mon,  1 Feb 2021 01:18:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2CCA6746395; Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Message-Id: <c61ad2d8b39f3b03b431819b6bf602a1c332b921.1612137712.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 6/6] m68k: add MSP detection support for stack pointer swap
 helpers
Date: Mon, 01 Feb 2021 01:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
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

On m68k there are two varities of stack pointers: USP with SSP or ISP/MSP.

Only the 68020/30/40 support the MSP register the stack swap helpers don't
support this feature.

This patch adds this support, as well as comments to CPUM68KState to
make it clear how stacks are handled

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/m68k/cpu.c    | 1 +
 target/m68k/cpu.h    | 9 ++++++++-
 target/m68k/helper.c | 3 ++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 31f96df2a2..5586589301 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -160,6 +160,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_FPU);
     m68k_set_feature(env, M68K_FEATURE_CAS);
     m68k_set_feature(env, M68K_FEATURE_CHK2);
+    m68k_set_feature(env, M68K_FEATURE_MSP);
 }
 
 /*
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 5d2cb012e5..7c3feeaf8a 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -85,7 +85,13 @@ typedef struct CPUM68KState {
     uint32_t pc;
     uint32_t sr;
 
-    /* SSP and USP.  The current_sp is stored in aregs[7], the other here.  */
+    /*
+     * The 68020/30/40 support two supervisor stacks, ISP and MSP.
+     * The 68000/10, Coldfire, and CPU32 only have USP/SSP.
+     *
+     * The current_sp is stored in aregs[7], the other here.
+     * The USP, SSP, and if used the additional ISP for 68020/30/40.
+     */
     int current_sp;
     uint32_t sp[3];
 
@@ -484,6 +490,7 @@ enum m68k_features {
     M68K_FEATURE_CF_EMAC,
     M68K_FEATURE_CF_EMAC_B,   /* Revision B EMAC (dual accumulate). */
     M68K_FEATURE_USP, /* User Stack Pointer. (680[012346]0, ISA A+, B or C).*/
+    M68K_FEATURE_MSP, /* Master Stack Pointer. (680[234]0) */
     M68K_FEATURE_EXT_FULL,    /* 68020+ full extension word. */
     M68K_FEATURE_WORD_INDEX,  /* word sized address index registers. */
     M68K_FEATURE_SCALED_INDEX, /* scaled address index registers. */
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 1efd6e4f65..4185ca94ce 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -463,7 +463,8 @@ void m68k_switch_sp(CPUM68KState *env)
     env->sp[env->current_sp] = env->aregs[7];
     if (m68k_feature(env, M68K_FEATURE_M68000)) {
         if (env->sr & SR_S) {
-            if (env->sr & SR_M) {
+            /* SR:Master-Mode bit unimplemented then ISP is not available */
+            if (!m68k_feature(env, M68K_FEATURE_MSP) || env->sr & SR_M) {
                 new_sp = M68K_SSP;
             } else {
                 new_sp = M68K_ISP;
-- 
2.21.3


