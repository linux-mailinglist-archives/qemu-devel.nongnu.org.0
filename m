Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E631A6B4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:21:11 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfsE-00078F-9V
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmJ-00021S-FC
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:03 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:59123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmF-0003T0-SQ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:03 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MirfI-1ln2rr1cCS-00eusS; Fri, 12 Feb 2021 22:14:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] m68k: add MSP detection support for stack pointer swap
 helpers
Date: Fri, 12 Feb 2021 22:14:47 +0100
Message-Id: <20210212211448.413489-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210212211448.413489-1-laurent@vivier.eu>
References: <20210212211448.413489-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ikPHirOPuCaaPY2JYhjO7iNTArPheFvomotWGTu7EQQw4XKU1N8
 TbxMjyhS3Uu/6S3jALGB3sqKj+4aojxXlCyT+lzFCmlGFjEUEk7yutD9C6oZz+8zDYmFLjR
 olqGFhgva1uOdUHqYHGa9jNNcYxk4me7yw6Qx5JTHvFItImt+ZELamCEqWWH0pXVs32ueWQ
 8y/wBFwKsPGu13uFix1Lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hJQNBmbJjxk=:moIXFUqObaktXUQOJHYYrO
 G/REz0ON1V9ZLWH1NZmY5Ow1Atr/iOyPgzK2ljbJIbOeJfJtbP/Tnn4Z4htY0dTTGfzBAgsv0
 aPCXfsikadUc6lq9GnRDwpce+gq5WrHGHN6MmaBipYUNMqCK75hFpdl3NFFD+vFvRI8U5dkEl
 PMyJn3r+qDU9x8YspuUXhX0Qx7rP5aMnmc4w2ZxcB8CD34uDIIHNhz9hrx0RCX57AKbB7+Hfl
 Rz+Rj/qia867TRIjX1eTBaQEeXm9ftv6HDKZcnuFR1OqJvLr1rV33ghxQdv78OaGLWy4FxSnb
 ezSKC4PCmauP/LFFEaSws9qlaHgQNMiMyWNQhaqgv16ZTncty0VqbYtoAqXh2fPYcJXT5eY6F
 11r/M2g+xanTvlo8bG2TusRIIo7c/Iv7TKh965+S2PSaIodHv9/ZlpFjrsgxYmGl1pV7+R4LH
 Q75T+SbY1A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Message-Id: <c61ad2d8b39f3b03b431819b6bf602a1c332b921.1612137712.git.balaton@eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h    | 9 ++++++++-
 target/m68k/cpu.c    | 1 +
 target/m68k/helper.c | 3 ++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 5d2cb012e510..7c3feeaf8a64 100644
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
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index ff3c4c1c9802..37d2ed9dc79c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -160,6 +160,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_FPU);
     m68k_set_feature(env, M68K_FEATURE_CAS);
     m68k_set_feature(env, M68K_FEATURE_CHK2);
+    m68k_set_feature(env, M68K_FEATURE_MSP);
 }
 
 /*
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 1efd6e4f6555..4185ca94cefe 100644
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
2.29.2


