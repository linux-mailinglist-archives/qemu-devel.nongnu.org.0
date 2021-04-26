Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE20D36AAE0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 04:56:46 +0200 (CEST)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larQT-0001BB-OK
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 22:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNa-0007ta-Fz
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:47 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNW-0007YO-ET
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id t3so846688plz.1
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KAt4KJIdZ2Rn7oZ7gMKlRXoCjHm7a4NbLhrIC4Pyqtg=;
 b=HFvd6fwHj1g4Yp7MCdvzD9Y8L5ZpmoEWJtxUQrHIKHeRmfzsnL3VhCWTTLrx6Crw62
 neDZu9J4daGPUMhsp5qq6oVwDpU9W4L1VgopkY6TfPhZAEDhoJXIqJCdE05v7qlyTvBL
 fZkQXJVkcOuxgC/e4jNN6jS+Y1Mj5Ym19zqalgDVbChkGhDMW+hc4TUhHvSs/oly6Ny0
 ZPrrNmFHqgG264bHju8tg82qTH4ST8jwcaP75ixIY/MH8J0/Q5r6CzmDQt0utv/attBl
 Ng7X13elyh2swBMSa08/ZF2Y3cjlZVQgPr1T1YnHdmfBzBvw+Il+R/OAahayZYYOZvA1
 YkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAt4KJIdZ2Rn7oZ7gMKlRXoCjHm7a4NbLhrIC4Pyqtg=;
 b=bTChE62cy7t1EDqxtu/q8sfLZwmaPvyR4yeRb0IZgZOOhqd32LNWzA3mo0x1XOK/rt
 u7gvWvDGPiwNkI1jJqhdgzMDcEs8fcfvdFFlhZkW8qC2MWP8dCMRGk2kyC5BEo9xq9MQ
 MkUhm3b/n4zBXW+yFGOj7eHr4iyxaIkj2tZrQIyufcYHcb3vWBgpOt9sJN7dVXTHHUgQ
 AWkoubZ3JOxz5kgQPGSC2kGsd9WZXb3jY55p4bhY9YHXwNhSKSG4Zegu+NHBDeyRA+87
 hBaHrDtbcBFHJYiFbIEY+LA+GfOP0A1MKCFpZ2omIJ9P4Wo3L9JM3PqZyNAxWB3mLQ9F
 LMJw==
X-Gm-Message-State: AOAM532bAZzVzEew0rmLF3GBUwQ9iCBUeEffyXPA0PoT3gq6zyHXbRXn
 g5c+NC3PC+Y1bFz36YbdIxVlWfaO0mdlnQ==
X-Google-Smtp-Source: ABdhPJw7Yb5DMYJPSVlyUPxctBP+HOf6JefN40Mu6S3VkXgNNIpUuSRTsI7xz2rLSWo6sO8BfVwQVQ==
X-Received: by 2002:a17:90a:f2c7:: with SMTP id
 gt7mr20634352pjb.157.1619405620837; 
 Sun, 25 Apr 2021 19:53:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/25] linux-user/sparc: Clean up init_thread
Date: Sun, 25 Apr 2021 19:53:15 -0700
Message-Id: <20210426025334.1168495-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


