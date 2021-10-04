Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5FD42071E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:14:06 +0200 (CEST)
Received: from localhost ([::1]:36150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ6r-0000my-TH
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeT-0004LI-Pk
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeO-0004ud-RG
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:44 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MaHOX-1mLUvj3iBp-00WCBR; Mon, 04
 Oct 2021 09:44:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] linux-user/microblaze: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:08 +0200
Message-Id: <20211004074421.3141222-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4l7eGtcRveYhX4odyEQivFKvdbJIzUWFifdlAqmvuB2neBA0v/d
 GVU4W/P9LZ29soWEb2EFWa1QwQXqSD9ITVIOUs1b8oQ/hY54BGTcOLqxwf838k0h7gxRaun
 tNF5kWbi1qzvgJ9GdngQxSLayJY5s56LqOmvR9l4TJtMOKgZ/RnXUsNWrAMrwr2DMzwO372
 jRvSMb6CDWdJda9QdffWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IpcpzYlwy5Y=:6F48JdVxwBB7HPWNs5D4Ki
 yfcPQH6pukA7IxPTE2ZMYIiOXMDyy+EMkUWgtOlik6bGfbOJdTw2oErCY9qsMRVR1WJ3r8odd
 fG1+GBF82xkJmYYfaXRBELHIAJy/FX3M6VhF96XRWyVOjnYzoZMRikckmmqbJX1N4OSmjQCEu
 BQEsnowl1SMU7/MfiWeEOkaUGSOFxincBRFD48zjqvpOA5OFNNCoc71bGbWF3YX3y7ir/UYi3
 cZjfOiH/HZ8yGEH/bFdGByYUP4v6h8ZYANZoOkEZ9t6RZiS7gPdcuPW9kuuZut7PLL0Oiodnz
 Df02qi4NcE8gprF5CPUV2693R4zy+mttBtN6RzPnDXsZokGSV2YIlIxblsLXHTA5weZIE2bbW
 sC4befQc4WgtA8l695RskwB5uewzlrxLNHSttMp/U2Lzm48kihdfup0ogEeAaMqd7wTSFtfNQ
 6OJ6lGwp7PPyqpyalhNd2aJKUUNF9jP9DRePg4dsU5oXl6d2ufJ8buMYXSrT0aLezfkL+fcL/
 7TC3WGGBRaVoli/ieUSdTAbdAgR5C1SxP8ISp2pa4FT5a/Iq3nQ/vsWuXhakFrxo4+GPbMwmP
 73EzAnMJqOuB6qCZNqZ/Jx8c0mSjt92Ce1qnFiT37r+9/y1qN2TubOhRculsyYe6ElOERX3fh
 Fhc3MzbwT/lvIoqLfGDiXyVAAelPKZ1BejR5TwC3cLw+mdEWDXUSijdYS5+IwbMzf/yFckoG7
 iEQYsQF24NpHSN7NuiCD9SORZ9dw+meXX80a9A==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the rt signal trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/microblaze/signal.c        | 24 +++++++++++++++++-------
 linux-user/microblaze/target_signal.h |  2 ++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index b822679d1805..8ebb6a1b7dfe 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -161,17 +161,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Kernel does not use SA_RESTORER. */
 
-    /* addi r12, r0, __NR_sigreturn */
-    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, frame->tramp + 0);
-    /* brki r14, 0x8 */
-    __put_user(0xb9cc0008U, frame->tramp + 1);
-
     /*
      * Return from sighandler will jump to the tramp.
      * Negative 8 offset because return is rtsd r15, 8
      */
-    env->regs[15] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp) - 8;
+    env->regs[15] = default_rt_sigreturn - 8;
 
     /* Set up registers for signal handler */
     env->regs[1] = frame_addr;
@@ -220,3 +214,19 @@ long do_rt_sigreturn(CPUMBState *env)
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * addi r12, r0, __NR_rt_sigreturn
+     * brki r14, 0x8
+     */
+    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, tramp);
+    __put_user(0xb9cc0008U, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index 1c326296de42..e8b510f6b182 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -21,4 +21,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MICROBLAZE_TARGET_SIGNAL_H */
-- 
2.31.1


