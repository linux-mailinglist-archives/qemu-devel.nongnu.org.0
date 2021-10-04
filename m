Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844C420729
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:19:15 +0200 (CEST)
Received: from localhost ([::1]:44654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJBq-0006Zx-Lc
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeZ-0004Pr-A4
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:52 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:42841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeR-0004wf-J5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:49 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McGtA-1n5GxO1LLg-00cgQY; Mon, 04
 Oct 2021 09:44:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] linux-user/xtensa: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:19 +0200
Message-Id: <20211004074421.3141222-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yOh9WAT3bb04r9IEmSGWPhDeaPOBZwJRmLGiIoAqiKMoK8onVzq
 VJmwPPh6lkBuTJOtjoeo5rb4zclA3EWx8uD2mY+keNR9we170TmUibU4hLYgE+eV4vpgwg5
 eamVwkupqzNeEPr5lIPxcfKnOsjjejwhwhFNLfoas7nVINlgFPQYnHiZAuXQ0NTQzT0UEJJ
 43I3gatgi36OFMnqzVFrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/RCtgT+yquE=:LVd1hJxhWUWMLe5lvFAcIm
 Hc3DYAR4/YY5ETL+VptKGMHKc3EoLf/LGwP3TjqKOoGwW4nQkQ3JUftnDOCAhST8Cu0YNFHXz
 Wt7pQIhc+CyLvJNNfuZYjwcu2EOoPn3y4YYWVkDj0OUJer2h+F062UCVQxzUaEtUbucTsmpPl
 Bg0jR5XJGNaCoL8BtnNRMvm5n8uZRff3dz+JVIWOM0jpSiNpqUDhalRVu/1roqnXzALT9bWaf
 M3OIJz8t9fXFf27K2uCtZN3wr+/FqpjgZ/lxMMwsG9A49oDXEnzIm8LpFFg5mxx/UbvYcptTX
 g0p9p6cY3Fd9xQ0wOc18FI3TQdlLjAj19sXyWvUy4BmAhPuescE/sONAEjbJVg4zgUufbv0R9
 VmP35bTtuMXo6nEa2zrq5J+RYGSi0EMflXDIMwi+zMWp+KCQe9DQaoSWw7FQWbomoR8AYnQD3
 K8Ft2j1ftDqsHr7b4+fBzyadQwAxuWnuZwXFofguhfxY+lXGWIF0ZFQBXnU08uaHY+o5TaQbY
 z5jG7LIxHt6UINqbUAI/kvBpE69KIrVYKhluv+b3DPpYk7CKkmny5q0Bkbrp6PeE0aFProsDG
 92DoIgy1HO6+YlsDz3MEkGZprdZELedgnOzmXSyfl8ynKHsPTqO2lK2clFeEu/BZPtBtbj11D
 y9Oqf7d4c7h1JuF2vSHAR+63dizv12IBPUFUbXxeBQwfImy66qrQcb5W8VnBeW+ppZum1rPfo
 zcJpEjLj2+XVphupXk7WxL+2cGl/37rsqb1/ww==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-25-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/xtensa/signal.c        | 56 ++++++++++++++++++++-----------
 linux-user/xtensa/target_signal.h |  2 ++
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 7a3bfb92cadc..81572a5fc7b3 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -128,6 +128,29 @@ static int setup_sigcontext(struct target_rt_sigframe *frame,
     return 1;
 }
 
+static void install_sigtramp(uint8_t *tramp)
+{
+#ifdef TARGET_WORDS_BIGENDIAN
+    /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
+    __put_user(0x22, &tramp[0]);
+    __put_user(0x0a, &tramp[1]);
+    __put_user(TARGET_NR_rt_sigreturn, &tramp[2]);
+    /* Generate instruction:  SYSCALL */
+    __put_user(0x00, &tramp[3]);
+    __put_user(0x05, &tramp[4]);
+    __put_user(0x00, &tramp[5]);
+#else
+    /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
+    __put_user(0x22, &tramp[0]);
+    __put_user(0xa0, &tramp[1]);
+    __put_user(TARGET_NR_rt_sigreturn, &tramp[2]);
+    /* Generate instruction:  SYSCALL */
+    __put_user(0x00, &tramp[3]);
+    __put_user(0x50, &tramp[4]);
+    __put_user(0x00, &tramp[5]);
+#endif
+}
+
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUXtensaState *env)
@@ -164,26 +187,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         ra = ka->sa_restorer;
     } else {
-        ra = frame_addr + offsetof(struct target_rt_sigframe, retcode);
-#ifdef TARGET_WORDS_BIGENDIAN
-        /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
-        __put_user(0x22, &frame->retcode[0]);
-        __put_user(0x0a, &frame->retcode[1]);
-        __put_user(TARGET_NR_rt_sigreturn, &frame->retcode[2]);
-        /* Generate instruction:  SYSCALL */
-        __put_user(0x00, &frame->retcode[3]);
-        __put_user(0x05, &frame->retcode[4]);
-        __put_user(0x00, &frame->retcode[5]);
-#else
-        /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
-        __put_user(0x22, &frame->retcode[0]);
-        __put_user(0xa0, &frame->retcode[1]);
-        __put_user(TARGET_NR_rt_sigreturn, &frame->retcode[2]);
-        /* Generate instruction:  SYSCALL */
-        __put_user(0x00, &frame->retcode[3]);
-        __put_user(0x50, &frame->retcode[4]);
-        __put_user(0x00, &frame->retcode[5]);
-#endif
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(frame->retcode);
+        ra = default_rt_sigreturn;
     }
     memset(env->regs, 0, sizeof(env->regs));
     env->pc = ka->_sa_handler;
@@ -264,3 +270,13 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint8_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6, 0);
+    assert(tramp != NULL);
+
+    default_rt_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+    unlock_user(tramp, sigtramp_page, 6);
+}
diff --git a/linux-user/xtensa/target_signal.h b/linux-user/xtensa/target_signal.h
index c60bf656f6b6..1c7ee73154ac 100644
--- a/linux-user/xtensa/target_signal.h
+++ b/linux-user/xtensa/target_signal.h
@@ -20,4 +20,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif
-- 
2.31.1


