Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099862AD154
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:33:02 +0100 (CET)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcP5J-00027Z-1V
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP3A-0000lu-Bo
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:48 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP33-00072P-Lg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:47 -0500
Received: from localhost.localdomain ([82.252.154.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MplPf-1jy9fn0hjh-00q7g7; Tue, 10 Nov 2020 09:30:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] linux-user/sparc: Fix errors in target_ucontext structures
Date: Tue, 10 Nov 2020 09:30:32 +0100
Message-Id: <20201110083034.224832-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110083034.224832-1-laurent@vivier.eu>
References: <20201110083034.224832-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9oFgvkDpRNm4PETcAFgPop46tS7RCuM9Y/k184dnD7KJWoost+6
 5kJJ6Wk1eSBH92h2Ag/jDbfmh6qBwRls2w9WXhIYSLBvoJy/PBTHwZyQrpP6gX1D/dTwOvX
 KTEJd7L4EKHsdT+4OHeyECPty8dHTdqDEqr9PPloXDMZT85xlPUhBSGKwFFmxnrLqgKHbeO
 /AOGEmpMEdRtJyZehPP/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BxLXC0GnuQ4=:gvWezoI7K93AO3gcla9Bgi
 HRmgI+APnAqGdGj8yPfntH4Savr5xij1pFl3DfOgdDwkRYjkEFi55SNMiiVobwLRyqXcY4UHh
 wjQ+cEVlReWvRd+FGpmpKHhBBHnbT0Xahl22XHnLTTuWGDSg55qK42WppDUoJEJtsrCkfTzHs
 rMZmMftL8KcOQRLnnyFOaz1tj3R+5TMNtWPjkEmRuEW9zmspUbSn5RMP8cf0XAf3GK29vg3H9
 nUGNDJTUcTh2ulgEUnAqD4EH11BEkfzpJdUpmdq/VKxoKDyjTNBW0B6e6ANwOt9TEKGzIlcfB
 X5F5qy15w/wlCACCx2/R0KYf/Z6Cipxknmj0lXFFMlGySSi8LMD5Y/EdG9IvoY10qy4ytVBEO
 2Vylgmxic3K4FVL4rNTS7+BZadljlrf28b9mSQ86YjzRRVvJfvXQeWxzFTOAs3Wig7O05d8dJ
 3KxalpiIzg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 03:30:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The various structs that make up the SPARC target_ucontext had some
errors:
 * target structures must not include fields which are host pointers,
   which might be the wrong size.  These should be abi_ulong instead
 * because we don't have the 'long double' part of the mcfpu_fregs
   union in our version of the target_mc_fpu struct, we need to
   manually force it to be 16-aligned

In particular, the lack of 16-alignment caused sparc64_get_context()
and sparc64_set_context() to read and write all the registers at the
wrong offset, which triggered a guest glibc stack check in
siglongjmp:
  *** longjmp causes uninitialized stack frame ***: terminated
when trying to run bash.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201105212314.9628-2-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d796f50f665b..57ea1593bfc9 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -349,10 +349,15 @@ typedef abi_ulong target_mc_greg_t;
 typedef target_mc_greg_t target_mc_gregset_t[SPARC_MC_NGREG];
 
 struct target_mc_fq {
-    abi_ulong *mcfq_addr;
+    abi_ulong mcfq_addr;
     uint32_t mcfq_insn;
 };
 
+/*
+ * Note the manual 16-alignment; the kernel gets this because it
+ * includes a "long double qregs[16]" in the mcpu_fregs union,
+ * which we can't do.
+ */
 struct target_mc_fpu {
     union {
         uint32_t sregs[32];
@@ -362,11 +367,11 @@ struct target_mc_fpu {
     abi_ulong mcfpu_fsr;
     abi_ulong mcfpu_fprs;
     abi_ulong mcfpu_gsr;
-    struct target_mc_fq *mcfpu_fq;
+    abi_ulong mcfpu_fq;
     unsigned char mcfpu_qcnt;
     unsigned char mcfpu_qentsz;
     unsigned char mcfpu_enab;
-};
+} __attribute__((aligned(16)));
 typedef struct target_mc_fpu target_mc_fpu_t;
 
 typedef struct {
@@ -377,7 +382,7 @@ typedef struct {
 } target_mcontext_t;
 
 struct target_ucontext {
-    struct target_ucontext *tuc_link;
+    abi_ulong tuc_link;
     abi_ulong tuc_flags;
     target_sigset_t tuc_sigmask;
     target_mcontext_t tuc_mcontext;
-- 
2.28.0


