Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D46B53EB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvj-0008CB-MU; Fri, 10 Mar 2023 17:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvh-0008Ah-2P
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:37 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvf-00030S-9p
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:36 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N8nrc-1qfDYb2wPG-015pYD; Fri, 10
 Mar 2023 23:09:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 05/28] linux-user: add support for xtensa FDPIC
Date: Fri, 10 Mar 2023 23:09:04 +0100
Message-Id: <20230310220927.326606-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZouFUeU7XVhD6UfZr07DfvEy61Uhggok1KwuvV18q+UcVNDlbi1
 kBn3vpAJqb2fYd3vZUBqypogoIusN0ox1RqPUyIOA+w9tPrmM8Y8UWMRhehGQGevn0F95jx
 XiDcxuriNaoeJMv7wOwIFfuMCA6NX+f71ksn+PEqtl1ui8dSljH/iyJxPViIJk9vyUujera
 aK2WU88o9HSuSb8Nj7Thg==
UI-OutboundReport: notjunk:1;M01:P0:bpDUbaImUSg=;+K2+CKuYya4g2utNYTpqXR2B1Bn
 5DwjGJYH7FMJbAopsEjNnhZnv6kzKCaywym2/puuOCLqLf6IgURVgB4Ez9hsPFTGvtGXrPBw6
 sBnXS69v401qGIhPuPtKIIcPEqdVVz5cPdmK1sbbAagNHtWE33Rk6/LKzqtKoU31azzZC7EAh
 H3YDxsLZDDhfg9pcL/Xoi0Vqy/GoWhPaQKEerIzfr4d/h0toAX8SN6WqBuZuuepFGZbX597iJ
 elgjz+qn+GXtlq2u6tEO3NC7TEplbTwIBzuwMyXAKr69tz01Co3DhinRMsMoo0EU6m/kCUfEE
 DptcVMY9sb+ud1hfMpmepohon6zZ57XuW2rk+KoDLpKULfIny73BSz/7FZC4uITJJ4OwF32KJ
 jqmNrQBAdYcEOONl4YAG9yh/7xmNdBwQm2aakRgBUb6qHMyICNCd9zwXqCwonb6xte/mq/IIb
 r9lJgqJI6dXGBsMg8FKKftDK/+VWFHbmM4574+0BeInatWCo6Pqko3BmDLQWm6i0MvFgbvF1x
 TaRnfq7Ovdv/Jnj1oMjvNmRAnrBchOYRBf4h7qJCwKUWJAjCVboNQf6oPcNvfjslzUsUTXg8K
 7FtRVx9wVr1+lNaAOPaNqc1ThqIbRI55lKe0JbRLr1v8aSbMNVM/85sTAIwsC9oXTAeLjTo7u
 +LnDqMwmh37fpKvX6dJP8dwQmrqCNN9bPZ/DyyXw9w==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Max Filippov <jcmvbkbc@gmail.com>

Define xtensa-specific info_is_fdpic and fill in FDPIC-specific
registers in the xtensa version of init_thread.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Message-Id: <20230205061230.544451-1-jcmvbkbc@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/elf.h        |  1 +
 linux-user/elfload.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/elf.h b/include/elf.h
index 8bf1e72720d5..e8bfe38a9fbd 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1619,6 +1619,7 @@ typedef struct elf64_shdr {
 #define ELFOSABI_MODESTO        11      /* Novell Modesto.  */
 #define ELFOSABI_OPENBSD        12      /* OpenBSD.  */
 #define ELFOSABI_ARM_FDPIC      65      /* ARM FDPIC */
+#define ELFOSABI_XTENSA_FDPIC   65      /* Xtensa FDPIC */
 #define ELFOSABI_ARM            97      /* ARM */
 #define ELFOSABI_STANDALONE     255     /* Standalone (embedded) application */
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5928c14dfc97..150d1d450396 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1748,6 +1748,15 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->windowstart = 1;
     regs->areg[1] = infop->start_stack;
     regs->pc = infop->entry;
+    if (info_is_fdpic(infop)) {
+        regs->areg[4] = infop->loadmap_addr;
+        regs->areg[5] = infop->interpreter_loadmap_addr;
+        if (infop->interpreter_loadmap_addr) {
+            regs->areg[6] = infop->interpreter_pt_dynamic_addr;
+        } else {
+            regs->areg[6] = infop->pt_dynamic_addr;
+        }
+    }
 }
 
 /* See linux kernel: arch/xtensa/include/asm/elf.h.  */
@@ -2207,11 +2216,16 @@ static void zero_bss(abi_ulong elf_bss, abi_ulong last_bss, int prot)
     }
 }
 
-#ifdef TARGET_ARM
+#if defined(TARGET_ARM)
 static int elf_is_fdpic(struct elfhdr *exec)
 {
     return exec->e_ident[EI_OSABI] == ELFOSABI_ARM_FDPIC;
 }
+#elif defined(TARGET_XTENSA)
+static int elf_is_fdpic(struct elfhdr *exec)
+{
+    return exec->e_ident[EI_OSABI] == ELFOSABI_XTENSA_FDPIC;
+}
 #else
 /* Default implementation, always false.  */
 static int elf_is_fdpic(struct elfhdr *exec)
-- 
2.39.2


