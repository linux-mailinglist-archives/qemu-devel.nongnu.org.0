Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1802436A835
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:03:35 +0200 (CEST)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahEM-00049j-5g
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8x-0007sL-Df
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:59 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8t-0003C2-NT
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:59 -0400
Received: by mail-pg1-x52f.google.com with SMTP id b17so1471167pgh.7
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KAt4KJIdZ2Rn7oZ7gMKlRXoCjHm7a4NbLhrIC4Pyqtg=;
 b=UWxhOvA8OCBF5EmNxAuMWGwQDQxgPCUd5EoGG1vWuagNKaGnDWH7/79qc4ilClffV+
 1y+U/XAQ5SMP4XuwQL7KxanOgyud/ouPu8y15ku47SlBhuLNgxHKz4yNJ44T8n0hR3ZL
 VWaJNBgvioRk17mHkXXu5nuagJG7jH/mgEHhBVKJ3i5cC0F8TzNoqV5J0+ZLdrVlU9cc
 W6KXwPViqyZwCFr7nukf2QmlRhYglXlFguQ1eAU5RvGFsNgu8ZryK4dgjwuNlMOMKvVM
 ItcmG4iyhUN5Z247gPFeRcgqwpPlJbgCWg3qHcCcrUg2EqwIcU+yRb4RtSK275waYqX6
 2b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAt4KJIdZ2Rn7oZ7gMKlRXoCjHm7a4NbLhrIC4Pyqtg=;
 b=ZsSY/UKeNNRP4JPTWWsPgUHxLYQGk+CY9rEwuH0QIbU+xZ3LVXl1olPCIQgiZDPjGE
 7pw2zQ2jUKrg4adZoP2cvBAkaWtLQyyCF87Z7yjbs75TBRZ1bcX18U1/mxtr+woZV24P
 k4MfUbB9pids8l6yhe16dkv4FLmOYC5/fy0MQDYb4SFJxFmZiagsr3ZVq5kRJvjaaOah
 /WnbpTY1PmTHwZJ5mgguRFQuQ0xaQjLe16kXiSfc0c+CNQHGYQdE3G/Y3Jl1VHegwT/Z
 zAIY7C7uFlZqCiMPd+deWlvfcNo3iXsdSMfSO6xSq77Hb/MsJzzntY73qZp05egU6mb+
 rmYQ==
X-Gm-Message-State: AOAM533DjLGL6EtPFg1sJr8vXXnTKQvz8DHRMvK8on6dsVGNN0v/nOKe
 4XguUsNLNinDwpN0A1i/nvnmkNyM9CVk7w==
X-Google-Smtp-Source: ABdhPJy5vbwrhlqQ2Y/Ahu8523zg7ku3u6eIBgvETi/S3fHG7aSkdInLTgRxj/I3bz3i1l7acAevEQ==
X-Received: by 2002:a63:344:: with SMTP id 65mr12948598pgd.24.1619366274508;
 Sun, 25 Apr 2021 08:57:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] linux-user/sparc: Clean up init_thread
Date: Sun, 25 Apr 2021 08:57:47 -0700
Message-Id: <20210425155749.896330-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Share code between sparc32 and sparc64, removing a bit of pointless
difference wrt psr/tstate.  Use sizeof(abi_ulong) for allocating
initial register window.  Use TARGET_STACK_BIAS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 33 +++++----------------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fd..cd8b81103f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -663,48 +663,25 @@ static uint32_t get_elf_hwcap2(void)
 
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
2.25.1


