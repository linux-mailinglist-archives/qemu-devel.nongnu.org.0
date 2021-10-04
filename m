Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE04206F7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:01:56 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIv5-0000CT-PJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeP-0004GJ-7Y
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:41 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeL-0004qo-HM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:40 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MAchM-1mdsEF0VVg-00B4nI; Mon, 04
 Oct 2021 09:44:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] linux-user/alpha: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:01 +0200
Message-Id: <20211004074421.3141222-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XVeBUSeOwZnzOlG+IEND3rgkvbLJ6109GbKVXTYia06403FDWPD
 B+U4UPe4XFgcBQr0kOGVCYG+VciCuNVvFM0TL5CxXHVvXTiq5IXhRDVzsOqGKUhmBrbLIf4
 xdpcOCK91V0H+04KeKLal7mCtxUZVwkuMZM4wUJFkxML07hWnQcqb/CzeDpSK+YTqWkbE2q
 2UfFgkCfl7gAX1qhAH3sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FSkllQucq2U=:YUaKR6QqyjVtDtZE+bvL/b
 oB3eMiVamvxxrHmhMWTmfHuVtdDDdCb/mJMggLToZFaoNrnphe9Gx4ZrMH1T3Gse0rrap0Pl7
 pxcD6HGFgrGs2NqRi2FWsI6j98QMA3XnyD9c4sk2foif7YL00vZOmhpokzWwo95nCUvcRvEe/
 IuB3PCKwtAIFW+wUFdNHC0W8Sb+EdJL61G9aOO5jkNSBtfwLnTUUUowOhxp4KidTdTtiYp1HL
 pgtZ4AXSnH5tdfdkoSx9wxEB2fCX5bOqgqXOGy1P/C4UAtETSnC+Ct6X49g/eG9nIrAid8XWE
 bGydb69DaWQ+nFRuZofkraBFoWmA9wzVkbOy8TT+11uONWcFBduV6CuL/Vgl5H3vEqcmBuyGz
 KeYmxPoUINwfulRQoPfG15hbYVbN5oYv5fxj/4mKMbPc3h2TOdiSBrLDa8OA2/f7EP7RBUq9+
 yV6tyvdMoui6Q6hMPC3r2BRrf29TV/aINEtlCiJdYY8sUEiBVmEGHqw9Ujor0XI3PahyDhNvn
 rLE60uqGu5ZSD5lNbQpkuy8xsDAm7WG36OpGG6B0ran6zBywlueAgc7xXivI6y/8H9WB3AzGz
 aC9YLv5xv/i0SLSoL6ueWvBtFzmncv4cFdUw8Bf2SdVgf2Qx8qv4zFzCCu4QgZVWkya+ECzZT
 SPynbyTYwGbUghfzLnmtVWJVx2byDgjHiB2MmHQcp8iUEyaGwGwfEdmxYg2LxmBP8xgV6clep
 GvOzTKxIs1IgY/h89xa8EZLlN33mcXnZf2DFgQ==
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
Use them when the guest does not use ka_restorer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/signal.c        | 34 +++++++++++++++++++-------------
 linux-user/alpha/target_signal.h |  1 +
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 3a820f616b3f..bbe3dd175a7c 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -55,13 +55,11 @@ struct target_ucontext {
 
 struct target_sigframe {
     struct target_sigcontext sc;
-    unsigned int retcode[3];
 };
 
 struct target_rt_sigframe {
     target_siginfo_t info;
     struct target_ucontext uc;
-    unsigned int retcode[3];
 };
 
 #define INSN_MOV_R30_R16        0x47fe0410
@@ -142,12 +140,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb() */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = default_sigreturn;
     }
 
     unlock_user_struct(frame, frame_addr, 1);
@@ -196,12 +189,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb(); */
-        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
+        r26 = default_rt_sigreturn;
     }
 
     if (err) {
@@ -269,3 +257,21 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6 * 4, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(INSN_MOV_R30_R16, &tramp[0]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn, &tramp[1]);
+    __put_user(INSN_CALLSYS, &tramp[2]);
+
+    default_rt_sigreturn = sigtramp_page + 3 * 4;
+    __put_user(INSN_MOV_R30_R16, &tramp[3]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn, &tramp[4]);
+    __put_user(INSN_CALLSYS, &tramp[5]);
+
+    unlock_user(tramp, sigtramp_page, 6 * 4);
+}
diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 250642913e2a..0b6a39de6576 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -93,6 +93,7 @@ typedef struct target_sigaltstack {
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #define TARGET_ARCH_HAS_KA_RESTORER
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
-- 
2.31.1


