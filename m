Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E2383C3C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:28:55 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihz4-000386-Fc
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlP-0005xt-IF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:47 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlC-0004NT-A0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:47 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MKKIZ-1m3PRH1SWd-00Lly4; Mon, 17
 May 2021 20:14:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/59] linux-user/sparc: Clean up init_thread
Date: Mon, 17 May 2021 20:13:38 +0200
Message-Id: <20210517181424.8093-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MdJeTTAapOhwkAst6sAs6yOLfu+KbboABLZoAAFiPmHdCGdqNuU
 9OGa2IgPFsQOHV3OIgFtHXDypfWQlmPSrE14Ors/5Y2CnwV+SyiaPtJGVInL99Wdt6pr6d9
 3NoS5GzgaPKNg85yS38Fxd2e5iabT461+95pgKXBgcqomXO60qqkUHq2xfuGq7ueF5ZdLJN
 59iUtkqhVtccNR6mYuPDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dA9xL49SBV0=:bjNKeyydv/skOY7pt3gRcl
 h/m/4cYqWGicIN7JktKIgRmN05j6RR/8lHAqmmzDho4e0RsZUK7UROy5pryl74fGIc2CmpmSj
 u29EdHW1N+AjGCQeI4SS0ETwFnCjE4wUIH2cHmdoyf6UWmvucfFddnCWSe9ehB37DmzOU1Txc
 ckQPkgCeEAndvHS7BWIT0llQG5LXK4cz6lJPwETAvm9v2mp8CmZj7NC5kbd6ghWHmuzGA2MZI
 UFvaHdHw7ZaHRwtHFFiCR2ty3OOkrjN8WN/8Z/WN0sWlOl9udPRrvJN57G0stJsgC55ptlB90
 2o1y6/8Q5RpvuNs58t72IzouoUyIZb0vJ71jyyAgcpOHuIHAQfJ291j5a0g7q1W8gLzb3PrAO
 BXAdR3wVHSFThgpNs/3Lsm63fuDnPK6Vn2ucz2pxJCXVah/qkNB1SCQ13/miBEk+Pg94u9Ehn
 aJNOqr0jv7MfiwdF7mI1jiQb+mfN/kYNi+wbILzYAe+cMVTmO6mNFvzcDKwVGGFiZKk9bTdCl
 pl9tsbenp1AopZBpqTn3pA=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Share code between sparc32 and sparc64, removing a bit of pointless
difference wrt psr/tstate.  Use sizeof(abi_ulong) for allocating
initial register window.  Use TARGET_STACK_BIAS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 33 +++++----------------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fc9c4f12be92..ffc03d72f935 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -676,48 +676,25 @@ static uint32_t get_elf_hwcap2(void)
 
 #define ELF_CLASS   ELFCLASS64
 #define ELF_ARCH    EM_SPARCV9
-
-#define STACK_BIAS              2047
-
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-#ifndef TARGET_ABI32
-    regs->tstate = 0;
-#endif
-    regs->pc = infop->entry;
-    regs->npc = regs->pc + 4;
-    regs->y = 0;
-#ifdef TARGET_ABI32
-    regs->u_regs[14] = infop->start_stack - 16 * 4;
-#else
-    if (personality(infop->personality) == PER_LINUX32)
-        regs->u_regs[14] = infop->start_stack - 16 * 4;
-    else
-        regs->u_regs[14] = infop->start_stack - 16 * 8 - STACK_BIAS;
-#endif
-}
-
 #else
 #define ELF_START_MMAP 0x80000000
 #define ELF_HWCAP  (HWCAP_SPARC_FLUSH | HWCAP_SPARC_STBAR | HWCAP_SPARC_SWAP \
                     | HWCAP_SPARC_MULDIV)
-
 #define ELF_CLASS   ELFCLASS32
 #define ELF_ARCH    EM_SPARC
+#endif /* TARGET_SPARC64 */
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-    regs->psr = 0;
+    /* Note that target_cpu_copy_regs does not read psr/tstate. */
     regs->pc = infop->entry;
     regs->npc = regs->pc + 4;
     regs->y = 0;
-    regs->u_regs[14] = infop->start_stack - 16 * 4;
+    regs->u_regs[14] = (infop->start_stack - 16 * sizeof(abi_ulong)
+                        - TARGET_STACK_BIAS);
 }
-
-#endif
-#endif
+#endif /* TARGET_SPARC */
 
 #ifdef TARGET_PPC
 
-- 
2.31.1


