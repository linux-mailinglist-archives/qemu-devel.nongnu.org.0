Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7034206CD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:47:56 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIhX-0006th-Bo
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeM-00048F-DH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeJ-0004oa-6m
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:37 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEC8L-1mhRfR2stB-00AFRl; Mon, 04
 Oct 2021 09:44:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] linux-user/aarch64: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:43:57 +0200
Message-Id: <20211004074421.3141222-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UUo/MIhsvSBxqSlSr/5Haj4RKGK6NXQdy2Lhrtm0Ftm+vXIn+ql
 rLFjFpI/4Af8hUSSlQ6FIJgA23Y9oC3Pi6TAod/vgK4a7LhS+9p8Bs87K6BzdLv2m9bkBL5
 G+fc7+VrXDYTm0u2Tb64+QDz/LtsnUL0iE7ayVmVNXvCfiopzFTCbhR8k45hbbVo3YU26Z3
 g+5EgQTuQnBpfhZA1eFgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QyAXt03HjcQ=:D0yY+QJvZK0rSkIUQp/jKI
 L2hzrP5sEYxiLmmtJxm0m+BXZtg3ZX5gJeOqhk34s+zcxOWbaBCrTD+OPozuYqlEe0123T2Hj
 2C+o06JBwpl2pY+MATE1wAJd/a80mPJbZbQcij81kbCroZgiN10zaVdYp3IrOW8SHqkjRf7WQ
 FnQoF9pC0PC+7ISqe0UufRL7pFtxcZb2/Y5Yrnx4PeuLj6vFyFrIvRwpiYrlRS7Y0u3il9R4o
 unIK9iajeLz2Iqz5dWrslA1irXTXo4YXVPXIq1CHe8vZ8q8MYQQ3JSW7fKqzuygHhgV9WpQPR
 SfRjUciVhQO+VXngGD7d/HQXdAfEw4krXsGozVEtvHF837Cd/7mSIBN0tR1+rfumpASufFfFE
 0NGK51mE+Ql7KRhZZS18AKeIDM26C+sWf9cv8arjNnffzBfXakGmmF6Sp+g+R/DLOmMCnBRRH
 Z1DK+P6NQ0XOI3shpOcywPeF2jXI8e4CWoExGe+7yNr2v0VD47sAH8318b2N+rhl6v7/mQIeX
 J2Sqxoq7v6PkhOxGGHRDzeUxuo5XLTYMqEXqc+F3IlOPcJPEwoqmsikKg4w/4Q0TPh/2REHEG
 0HUO4HCDcSDJZ28waUnLxV7/JsO6F3fDn/5A1dlvSAkpAVHcMZyHByxXf+eDJulTaNSBv1I7w
 IxjMGB4wgWUC/XTbTqdyvVtI1tVOvhY/wlTdSr31sKuqpqy1FHswWiO/Rztgr2+MHSXKeUVyk
 28Msm6JQ3B0+vKZaTW3rCWYXLvhXbhh78F8F3A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/signal.c        | 34 ++++++++++++++++++------------
 linux-user/aarch64/target_signal.h |  2 ++
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 49025648cb4f..29c52db3f130 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -109,7 +109,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -461,9 +460,9 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     layout.total_size = MAX(layout.total_size,
                             sizeof(struct target_rt_sigframe));
 
-    /* Reserve space for the return code.  On a real system this would
-     * be within the VDSO.  So, despite the name this is not a "real"
-     * record within the frame.
+    /*
+     * Reserve space for the standard frame unwind pair: fp, lr.
+     * Despite the name this is not a "real" record within the frame.
      */
     fr_ofs = layout.total_size;
     layout.total_size += sizeof(struct target_rt_frame_record);
@@ -496,15 +495,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-        /*
-         * mov x8,#__NR_rt_sigreturn; svc #0
-         * Since these are instructions they need to be put as little-endian
-         * regardless of target default or current CPU endianness.
-         */
-        __put_user_e(0xd2801168, &fr->tramp[0], le);
-        __put_user_e(0xd4000001, &fr->tramp[1], le);
-        return_addr = frame_addr + fr_ofs
-            + offsetof(struct target_rt_frame_record, tramp);
+        return_addr = default_rt_sigreturn;
     }
     env->xregs[0] = usig;
     env->xregs[29] = frame_addr + fr_ofs;
@@ -577,3 +568,20 @@ long do_sigreturn(CPUARMState *env)
 {
     return do_rt_sigreturn(env);
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * mov x8,#__NR_rt_sigreturn; svc #0
+     * Since these are instructions they need to be put as little-endian
+     * regardless of target default or current CPU endianness.
+     */
+    __put_user_e(0xd2801168, &tramp[0], le);
+    __put_user_e(0xd4000001, &tramp[1], le);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 18013e1b2350..7580d99403cb 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* AARCH64_TARGET_SIGNAL_H */
-- 
2.31.1


