Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00376387162
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:43:58 +0200 (CEST)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisWM-0007FD-2c
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKV-0006u6-VJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:43 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKS-0006v4-Qi
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:43 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MwxRN-1lX7453OZP-00yTwY; Tue, 18
 May 2021 07:31:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/59] linux-user/sparc: Clean up init_thread
Date: Tue, 18 May 2021 07:30:45 +0200
Message-Id: <20210518053131.87212-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A+V8BPEdLq7Ux9hJEFv4mAbW7gmXjpjxN8GRKXhvyvRIViu2WdG
 vwG4nIf8En+t2iG+i5lmLcG6PGlKKJkBGEnal0RdW7C+xoEaS8lS8y/HkGN5jGzYrQeqMOw
 eNjKmtQ83AsAWdXjKewTsaVgW7tZu33Q9qRqkOY7WgGeWc/CBr+bnPZbfDvlRyGsVmdN9MM
 vgPZ159LNgU4ufONy2y7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MwvuRD7FbiQ=:y5ymzWnrZHdCjyyQd0/QxQ
 Gn43F+GKJ2tIG6wD6m1Wou50YbQHtYZkRnnIhBpzXkeQoWdP8unsuUK7UMbdIjRwb3xPFnKly
 teGXfGbf37nYWsxBAd2HRbVT5V2ilC/1IY5e5FlGAC1w8dckC3EGHLPF7L4Adv+2prqNgmbAx
 2S77oubj+Vy2dxwhx2V8TO1woMJyI/SGAw61GgqQPOrfGJYYvkSfytuMNgyGbc3gYu+wUuxgW
 8R5vLSJZWlNzlUTYrN0Hf49vAkeyhcm9o25V28C515n2CiZw/TmtyoOmZaMMrsALaCffz2rrD
 pYqsREXuDnikL99OAk41mhXMlsNxJPO3sXG9PQa1buo9q/Sbdm5y5M0Tr7tXire0G3NRDSzX9
 k5e85omxL46qjh83hfMSva3CXsHT4IquG+Ejq5fio6fyeKu573YObmy/IcSsDG3SdtaSjylsf
 qsovBZ2D3AZq74nXy/zuaVvHDaFVWRjHeIT3TngsZ/CrnDHoqQpQdvF0wXBx+6herUkAgXrGy
 cUNfdX4mFBud9J2nWleQSI=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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


