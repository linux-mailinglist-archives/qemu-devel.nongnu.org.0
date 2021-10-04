Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3A420707
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:10:08 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ31-0001Xi-67
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeR-0004Jq-R0
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:43 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:33885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeM-0004sk-Vv
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:43 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mr7iw-1nBGR918Ew-00oHAM; Mon, 04
 Oct 2021 09:44:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] linux-user/i386: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:05 +0200
Message-Id: <20211004074421.3141222-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3Hn4Y6DOOZamlkovEm0vKdk0tNNiCY9r1+xDPG3nJLDaigqX7Ff
 QO/v0C8VWCCVNkbIzzAyxWCsm5xCNS5Qgx6a+0orfP24gPMrVV+9m+osgn/TCM3xT8HElBR
 OtjX+VqbuOK5LcVfo6OQZKUsgGxoj14blTiYFHKTJoZ8CqcjU4A2OOiojuEsyEMBdkGF5iX
 HtRSCRyT6KX3nNBqS/aqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KEL9EdmPuG4=:KAo/KQ3jH3oCeu4yqmwnND
 fxFE6X2insTNGQCwgfpArycwCnCq+KYVMXC5jgmkSIDKTrXIe85bhwE0QeVgWkY9S4oLJV47P
 F6bemA9KEhB7GcB76mrDvFuufA2PrdbrMIbdwX1kmL6r7jjoO/5V4t1l4mOLQw6Y0pXpAncsv
 SQp6rmVDKJal3tYEhjP0QBmjsDCtCevvabei/UR9t7TqVJ4ghd7ESCceO80BdyupCa2Dm/gvz
 8/oHU4iQgIv6RxFm8wGSr7/3jOG+mE5DmZT7WMGprvefalMOzZv4Wn/Kxc0CkvVoSAV53cj/w
 k6Qdv6DRlD5d0VHADKYKIITq24KnQZNc4Vbt6yFHVvKgWhZG/VtlDYbzg/ZIveNWwpPWFmYSG
 N4S2xTzortYwYhPHLcAQq2wHDggQGEM5CIzgs0oVypw5wfpSJbIjFNqcw8DF0r0BNWja7HHr/
 h/OS0F/4OwI12vwKtXKKavc+y91BFWBrA79Y6AOAIoBFQgvEDB1V8nJEZqftoGTEYXoUiccP0
 I0PL0w9xuzfZS93ZmXR/59ggVWINofaZD1ArsxvQknyijyBKyF5rIxkLJDa9wLIBtR6llzqqe
 wPfuPWgPqDPqu5vaH+ObVzemojRyBKDQFrzMOu3YUaat9e70yT29xP1N2ulumqfIr+EvLG7Xe
 SnB9Y5hTuoFVvd4iuSA/TDYKN/iia2cbKlJLlsX/2N1EZBBnetPmq9fG70c3YnAIk1/CDpj30
 GeG3wR0yx1bCaEfCMkzTqtaOmGCML7XDJdgxHA==
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.
Note that x86_64 does not use this code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/signal.c          | 56 +++++++++++++++++++++----------
 linux-user/i386/target_signal.h   |  2 ++
 linux-user/x86_64/target_signal.h |  3 ++
 3 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 3b4b55fc0a24..b38b5f108eaf 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -310,6 +310,22 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
 }
 
 #ifndef TARGET_X86_64
+static void install_sigtramp(void *tramp)
+{
+    /* This is popl %eax ; movl $syscall,%eax ; int $0x80 */
+    __put_user(0xb858, (uint16_t *)(tramp + 0));
+    __put_user(TARGET_NR_sigreturn, (int32_t *)(tramp + 2));
+    __put_user(0x80cd, (uint16_t *)(tramp + 6));
+}
+
+static void install_rt_sigtramp(void *tramp)
+{
+    /* This is movl $syscall,%eax ; int $0x80 */
+    __put_user(0xb8, (uint8_t *)(tramp + 0));
+    __put_user(TARGET_NR_rt_sigreturn, (int32_t *)(tramp + 1));
+    __put_user(0x80cd, (uint16_t *)(tramp + 5));
+}
+
 /* compare linux/arch/i386/kernel/signal.c:setup_frame() */
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUX86State *env)
@@ -338,16 +354,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
-        uint16_t val16;
-        abi_ulong retcode_addr;
-        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
-        __put_user(retcode_addr, &frame->pretcode);
-        /* This is popl %eax ; movl $,%eax ; int $0x80 */
-        val16 = 0xb858;
-        __put_user(val16, (uint16_t *)(frame->retcode+0));
-        __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+6));
+        /* This is no longer used, but is retained for ABI compatibility. */
+        install_sigtramp(frame->retcode);
+        __put_user(default_sigreturn, &frame->pretcode);
     }
 
     /* Set up registers for signal handler */
@@ -416,14 +425,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
-        uint16_t val16;
-        addr = frame_addr + offsetof(struct rt_sigframe, retcode);
-        __put_user(addr, &frame->pretcode);
-        /* This is movl $,%eax ; int $0x80 */
-        __put_user(0xb8, (char *)(frame->retcode+0));
-        __put_user(TARGET_NR_rt_sigreturn, (int *)(frame->retcode+1));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+5));
+        /* This is no longer used, but is retained for ABI compatibility. */
+        install_rt_sigtramp(frame->retcode);
+        __put_user(default_rt_sigreturn, &frame->pretcode);
     }
 #else
     /* XXX: Would be slightly better to return -EFAULT here if test fails
@@ -592,3 +596,19 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+#ifndef TARGET_X86_64
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_rt_sigtramp(tramp + 8);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
+#endif
diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
index 50361af8746e..64d09f2e75bd 100644
--- a/linux-user/i386/target_signal.h
+++ b/linux-user/i386/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* I386_TARGET_SIGNAL_H */
diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
index 4ea74f20dd42..4673c5a88691 100644
--- a/linux-user/x86_64/target_signal.h
+++ b/linux-user/x86_64/target_signal.h
@@ -21,4 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* For x86_64, use of SA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* X86_64_TARGET_SIGNAL_H */
-- 
2.31.1


