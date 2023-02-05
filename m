Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD168AE7B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 07:14:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOYHA-0005Oy-Ub; Sun, 05 Feb 2023 01:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pOYH9-0005Of-0N
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 01:13:19 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pOYH7-0003jI-A6
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 01:13:18 -0500
Received: by mail-pl1-x635.google.com with SMTP id v23so9182575plo.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 22:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KM5kkPB7zAIOrYAX7gUgzJ4YxU3a5JVhtbQVDJ1jb6U=;
 b=DLgnp1uH71sd/mTdzSoFwxui9PtI0EamtpQ2IK32wWSVTWQ4toJfC1HxS0zCOnHDXe
 S2GfI+BJLwUuQjSmelt6c8yDRgbb2Uy4u68VQmdo9gt582LcXXWnB5hyP55iY49pBjF5
 qSxgrO8qsYLLM45p0cNUCRGeWdA0u8RNRn4prz0qGqrqheyUgq9OGDtJ5yiSH1PRn8ja
 vuAENvkV46E1+spJOKLtULv9LQj0BD+2vgHmQ/wsIl6XNosm8ORuGazOs35VlgprwJvv
 JWPXpbcsfn68VZkY4qILNAicpHLTfEDfRfX7rNadYiAuB8zGcoc1AcAcDcHU3H/HjPIA
 bOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KM5kkPB7zAIOrYAX7gUgzJ4YxU3a5JVhtbQVDJ1jb6U=;
 b=VPGYTSOEq13OSWq/eY7ep9smBVwYpmtXAyFAnCR3X+/AF4xYlf3InLZz2GZ2mwQx1G
 LvmHurcdBlLDTSZjND9xqt3Vt8JDPvMID/K6X6N5eYB+7M9icbE19sOZ8KxvjDcRQNRd
 I8W7FieA1kVQmpjCbaFZiRjqJk+H+m5oC+ewoZmJH+5XVat8Wi2t96vwF24I8yGcJIwB
 JCmV2iQIdeFGl27uk+OTGOaeE6jnKRUFViPg1+JdjKfKdy0sorGyFBC84Yi6GW6Rd5qr
 YsKATKLb5Eukd3d2Ma+/b/Bp6B0zkutjT6McK0eACchH2QGi2VbaGgG/gMFRdZuol9MR
 fCLQ==
X-Gm-Message-State: AO0yUKVOvddQDjgVzkj1b/+r2i2qMyT75zfUWEI4/l+YCFBsGGwuJqsi
 kj/oE4NHCBAd6BTepcVgMRSQ1b35paM=
X-Google-Smtp-Source: AK7set822d4lvZatN9cAgNOw9BTu8+I9MmSjtO1FuFTLKf6cl63LFlk0NuQXjPUHQKlNp6jdco+FIA==
X-Received: by 2002:a17:902:dccb:b0:18f:a27c:fe with SMTP id
 t11-20020a170902dccb00b0018fa27c00femr13285493pll.55.1675577595179; 
 Sat, 04 Feb 2023 22:13:15 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:3721:f84c:32de:fbfc])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b00198fcb1b2c2sm1425376pld.218.2023.02.04.22.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 22:13:14 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] linux-user: add support for xtensa FDPIC
Date: Sat,  4 Feb 2023 22:12:30 -0800
Message-Id: <20230205061230.544451-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Define xtensa-specific info_is_fdpic and fill in FDPIC-specific
registers in the xtensa version of init_thread.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
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
2.30.2


