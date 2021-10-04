Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C2420747
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:26:14 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJIb-0007td-O1
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIee-0004RW-Ts
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:58 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:43243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeZ-000525-27
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:54 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MA7b8-1mdKFr2yx0-00BYno; Mon, 04
 Oct 2021 09:44:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] linux-user/sparc: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:18 +0200
Message-Id: <20211004074421.3141222-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IkPWyBMtCWyULjUUx1wEAPfYlpIRwjtw7JuKjnNDtq8w7xY+fW4
 6rpOyb0CtrgFDp5PhfwUojBVoJBlZNBD8Z2IkcntNHRsi8eHvISqsCvy0p012ePQTeBDZEb
 Q0HB3dCnyX2C1G/AlyA7qh+Hhnlqrc6wJntA1AzWQRYF+G7/6465obcQkIjO/SFj4R99s22
 bm0D4bsKijAOBoUNfZeKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P5ySPbuQEPI=:5L1Txmpq1bxs0sMHVH8ONY
 pD43oSuAvRnS9hKgut3MaI8/at1bHlzJ5503hVGNtUf2oPZhQBhQsgijfLXeITURRaWPl+woR
 EJLCYOXfPD1iXiet/+5TgvSRhncfuPhodSmttz1e2EGZ+7ESZUfoglDuzsxmGeyFRFQcjJh+G
 BONQYBgEgSPQ46bJPQ988pGa5EFyFfOs78Y6cqx4ACqE0+Sc9X65XUMO2WUQakk8+xtKxKX0f
 lO/Pry3WBby93qzDh47UkX1cpVXRvUkxcPgoctz1pjqgVZEJHJFJEcYt/51z8DiovV6diO0M0
 WfdB+tBctUpdD8ZnfvpRFKEM4nFZC2jwC2qg7Kai4dyjPnwg5wTiGMSYh3dArYDrurDtaa9gT
 jiLmYtX0vJQvRycd9QAq1BO3Hcz81Mg1XIYInEI7azq8jcuQZJSgRQZ+zkOkFzpfFTbCfuInI
 8zCuDWBgERDYuqzArB6109YDwU98JPKvSjWszov1gKiGy3fTALbko+v16QuHzVR4S/yqUJ0Hj
 DDEkD9Aj5beE4ITMEU7lDw9kvOkb1o8J8Glmds56ECzzFZWAy7Jc2uBsyDOZ4kZHTPPiBJXCd
 lkFVwr/aJ4FyVK7FdThPjoprsLbRag3qlbxvwl2EFQa4yKxg2gAXkIM59IXOpvHHy7GS5CxlE
 /gVTiLvI9n2mS79Z46bGNkKvQiPfrqq2RFhw2Q+bHMFLaMOTi0RzYkutYb0LJA6lzxoAFP1tT
 x4f4duB+tLKahVTZG5fbAeiQ9cpwiNTD/rLRCg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-24-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c        | 40 +++++++++++++++++++++-----------
 linux-user/sparc/target_signal.h |  4 ++++
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3bc023d281a7..23e1e761de42 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -242,6 +242,12 @@ static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 }
 
 #ifdef TARGET_ARCH_HAS_SETUP_FRAME
+static void install_sigtramp(uint32_t *tramp, int syscall)
+{
+    __put_user(0x82102000u + syscall, &tramp[0]); /* mov syscall, %g1 */
+    __put_user(0x91d02010u, &tramp[1]);           /* t 0x10 */
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
@@ -291,13 +297,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] = sf_addr +
-                offsetof(struct target_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_sigreturn, %g1 */
-        __put_user(0x821020d8u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(sf->insns, TARGET_NR_sigreturn);
+        env->regwptr[WREG_O7] = default_sigreturn;
     }
     unlock_user(sf, sf_addr, sf_size);
 }
@@ -358,13 +360,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] =
-            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_rt_sigreturn, %g1 */
-        __put_user(0x82102065u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(sf->insns, TARGET_NR_rt_sigreturn);
+        env->regwptr[WREG_O7] = default_rt_sigreturn;
     }
 #else
     env->regwptr[WREG_O7] = ka->ka_restorer;
@@ -775,4 +773,18 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
+#else
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
 #endif
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 34f9a1251909..e661ddd6ab3c 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -69,6 +69,10 @@ typedef struct target_sigaltstack {
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+#else
+/* For sparc64, use of KA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
 #endif
 
 /* bit-flags */
-- 
2.31.1


