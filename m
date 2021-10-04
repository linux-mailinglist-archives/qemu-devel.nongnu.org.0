Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA74206FF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:06:24 +0200 (CEST)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIzM-0005QS-VH
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeO-0004D0-2y
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:40 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeK-0004po-LP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:39 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MkW10-1nDUQb3uKE-00m4Ew; Mon, 04
 Oct 2021 09:44:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] linux-user/mips: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:10 +0200
Message-Id: <20211004074421.3141222-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xvvdkEmr98B5CPc7SE/Er3pcIEah+YIIYdmvPXFXP/b2CE7FMsW
 YwjgEwjUp1Y3LZNJNuyzXvL5Xz6S9SQVhaXxTE/CCMY4w6JqW64SMsc+JCpTZUlK0KdhF/u
 C2PoCke7CWpS0uOeiEBuFFL3GRZjeqTxYjlGziUeZi81zn2KX+S6gGzxRldcr3CZF2UpLv+
 2CS41U8Cg+jD/XvQVNZNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OVEiW1ipNe4=:JsTg7sjQtGGIsHiJrUAAj0
 xhX1MJgbBcLy4Rrv+N5gRKvAKf/oNT27gRwvq1hXlQzN965Gnu4dH6eyLFgOIZwKntoi08I9c
 bb+Y0kFq7x4uKvat6gZFhVJEPVPIGoHZB3R0Ajs+OjhPp3UShj/doloHnkiHWaHcKvjlIHdkD
 cIknS6WRXOYD9MYsYLi0kxFJMh0f+3tC3oyHIBtnhKUDrnmkNa110B+U/mTglJQ+Ad6uApV5g
 ImHky8H/1VsjmOkqaujey7WgvaeiqeiB94kNxEXvYtuV1kDjUqIT7zXH55hEiyLfHwCXp7F8t
 T41IZZO8OeW5+Vt2QXJ8J2Ahr5ljWEfUqELRypJ/bWE69qNaRK/F9NDTD7JCn1HyM61KyLdVH
 vxU/s5avE/xYdNBxeYytVDaivKjtZ9xTGNQt9+CJGPFo/vII6tzdAKv14tTvdhEvF2u1KNyaO
 7KeyIdNvhwVqVent38dMXYZRTfXex34OyEKxkrPEetFgmr58ORTsJMrJrqamET+/ixKDrMU1t
 8Bpo/Lx+vH6PB/s3XQWZFL5pIeZHRToddgdTdlJ/5I6ZFa97fubnRhfYBlC1Ph0xLVpXFbWcf
 w6jgN8ysOofwZOq2L0URiPHhlG8IMTT4HgOqSdlga86y6XLSzernjN8bG9A6IEs7Sj3icxtJb
 XYqNOJctN5O8JWYog3202Ji1OhYlt76cY8wu18X21j+DOs7Z/sj3kaMCfml6QroURfCyN0DWq
 eSrkuouRcwsEXtl9agRnNX891okY/TXbLbTA4g==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-16-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/signal.c          | 34 ++++++++++++++++++++++---------
 linux-user/mips/target_signal.h   |  1 +
 linux-user/mips64/target_signal.h |  2 ++
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 64072779b94a..8f79e405ecb7 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -209,8 +209,6 @@ void setup_frame(int sig, struct target_sigaction * ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->sf_code, TARGET_NR_sigreturn);
-
     setup_sigcontext(regs, &frame->sf_sc);
 
     for(i = 0; i < TARGET_NSIG_WORDS; i++) {
@@ -231,7 +229,7 @@ void setup_frame(int sig, struct target_sigaction * ka,
     regs->active_tc.gpr[ 5] = 0;
     regs->active_tc.gpr[ 6] = frame_addr + offsetof(struct sigframe, sf_sc);
     regs->active_tc.gpr[29] = frame_addr;
-    regs->active_tc.gpr[31] = frame_addr + offsetof(struct sigframe, sf_code);
+    regs->active_tc.gpr[31] = default_sigreturn;
     /* The original kernel code sets CP0_EPC to the handler
     * since it returns to userland using eret
     * we cannot do this here, and we must set PC directly */
@@ -305,8 +303,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->rs_code, TARGET_NR_rt_sigreturn);
-
     tswap_siginfo(&frame->rs_info, info);
 
     __put_user(0, &frame->rs_uc.tuc_flags);
@@ -335,11 +331,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->active_tc.gpr[ 6] = frame_addr
                              + offsetof(struct target_rt_sigframe, rs_uc);
     env->active_tc.gpr[29] = frame_addr;
-    env->active_tc.gpr[31] = frame_addr
-                             + offsetof(struct target_rt_sigframe, rs_code);
-    /* The original kernel code sets CP0_EPC to the handler
-    * since it returns to userland using eret
-    * we cannot do this here, and we must set PC directly */
+    env->active_tc.gpr[31] = default_rt_sigreturn;
+
+    /*
+     * The original kernel code sets CP0_EPC to the handler
+     * since it returns to userland using eret
+     * we cannot do this here, and we must set PC directly
+     */
     env->active_tc.PC = env->active_tc.gpr[25] = ka->_sa_handler;
     mips_set_hflags_isa_mode_from_pc(env);
     unlock_user_struct(frame, frame_addr, 1);
@@ -379,3 +377,19 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+#endif
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index d521765f6b2c..780a4ddf29de 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -73,6 +73,7 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index d857c55e4c6c..275e9b7f9a2a 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -76,4 +76,6 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MIPS64_TARGET_SIGNAL_H */
-- 
2.31.1


