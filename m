Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735596B090E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:30:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtr2-0001gW-36; Wed, 08 Mar 2023 08:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqu-0001cD-77
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:08 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqs-00064T-Hs
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:07 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MRSdf-1pxM1d0OSj-00NUUT; Wed, 08
 Mar 2023 14:29:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/28] linux-user: add support for xtensa FDPIC
Date: Wed,  8 Mar 2023 14:28:34 +0100
Message-Id: <20230308132857.161793-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nFZixO7LBMEv975btAPm7kCQHI0Y9++A8uX2PfpieA8/yulWQ+5
 1hkLBByYi57yWaCTctwkm7ve/yylRu0NpKr6SvlBCDiv8HEvhpCRqdBOBZGveH7j7fK7pjD
 FYqd+7FH870gLaD+LtQWhWbbYSBbOngYfJ8ZBfzKgjQsY0uTXa1vLBezthwL4vebf1QfMHX
 fiXvF2n2fQg4OeOx5vq6Q==
UI-OutboundReport: notjunk:1;M01:P0:9v7rkzWnp7Q=;ois5yiRvCWQz0058nu1TCRlj6bn
 YqVSL0FFOZhMLe2yJ1NfzLptP7TYlO/DSWYZ1cySlZEmVFEyJchcZv2nsihcvMkjP1z+CK+ZA
 7Q9VAxFPl8kU6xnkQ/PUWyL4H3v6TOREPaYCtFy8RrFb37bb6w5beN/B7Sa26V+x7i+RVeamW
 GN0EjRyO3mlHQHEoiaGv6VDPvR1geVquvShnNOvNTLpVqwMDG4uW4ri8TFis3OFoRQkbY3TaQ
 RLY21WdKkcltehfcfGJCnavuoPMSeqfPOc38Z9h78LaOBB+kuSSGinSLsTq9J/CArLz01DbDW
 wN+sAiSHPTSxhpyTmwuNPtVkROCKI1yCi84ZinIzXnmGgVWUy/eRLp6YiV2Y9gT1qTXFTsETz
 eaI6tC0Ri5jKwl4KV2w3aeG4wb6jkpYOt85M9Xu3kqDwKmRODOUkVjEOMDq4MkwpastSo00m6
 RGY2SMhQsWzwr7l0ZgsI9mfItAQo1IG9U3u9BneZ0BWd3obkFRaoJ118Cp4hDz5A3j1Vc8RWC
 6KlxcEGx4Tq3ZZsgfVyv9bKEosx0FZ/X7RFVK0yyn9jhA26Ej8mERG0Kx8Lq0g6SyQe617EH2
 wvVl4yKkAMNfV8vZrLh9rK6P1BVPTOuSFFIOHSy/uxo02lorg1LljZN7r2X6mu9jgX7bJl2x4
 dVQurhopnx2gAbG0ucXHIAXkhEwXSenAoZZsPLRBqQ==
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


