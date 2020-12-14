Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED92D9998
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:17:27 +0100 (CET)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koofG-0000ds-Qr
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSH-00020n-9w
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:02 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSE-0003zo-49
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:01 -0500
Received: by mail-ot1-x341.google.com with SMTP id h18so15762949otq.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GhRqALWf9y48BIzmwb6ec/JDv3hDJBRmMXBLeIk5tow=;
 b=Gh0oVxRD6W5bvguomgwjsjrN3rlaY4gSvqOyMvbVVdG6cptTBYiauKyY8OlPPX6Gm6
 gWSQG8rJ+Z1tNqVnJD8U4fO3xbIEkTBjaENpZEc6BQLcN3a/IWuA3ZJIrEFKyfL6AsYs
 SnHFXOBEvV2xnIW77vw88nLo7pLBagpHH5mreRPnqzJnUs2o9Lw1zWN3KcpOKO0zPP+z
 L2ue18Gm6uHzjB6lXGxLsnJ/qpkQR/dv0UbNg2hC08XQtf/Sk3yWD2tyjnSKWCqdXc3b
 JAWHG8/7DWcJpNFifRa8NlZeB8JvLit1cy2BYxp87YF0JqenYYuMBpGl7hyYluPPA2ID
 ST3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GhRqALWf9y48BIzmwb6ec/JDv3hDJBRmMXBLeIk5tow=;
 b=aOvXR5acs8SwwnB8MYuOez1zRqvqNomz1Srdzcut6qnjzIgp0i891mvGUpfbmGvA+m
 kN6hD4t/kfPqZ5l4J+082KYiVi/O6Gu4KV6VaX94jd/6ll6fN77me6o3Kwdv8CHBC8ZE
 XJ1wFy4k7m3dls3FJuMrj1YMVWUdPLd4vuNXJmFqM5+KOBY9lIiJd0fLXRwP9lkfGKLJ
 TPuBk20HBEdev8/zojbPi6Szy17795D3n+GffqEed8zb5gdvH8Bq3pN/9OtflTi+yIae
 4KHo2HybK+f6MJwOGg3aS9hkegx67JItCOXStZ3vNvyE3Sr4sDGxCSZb+gfLrK/6pjWt
 UjXg==
X-Gm-Message-State: AOAM532ClWQtAYC7CNC4M3h4Grz9i+MdzFQQoXJZC8uZhOyFdHZtmdn6
 Vnf78u/gjwY1c5OKOpm7JDnWgLPQLPAje/cB
X-Google-Smtp-Source: ABdhPJz+Nnya842Wj+nFl0Yko9e9x0wCAFroEWFy1Wyvtc+JIheZVHiQ6jejz/XICl43uAyGmJ+fUg==
X-Received: by 2002:a05:6830:1e7a:: with SMTP id
 m26mr10522980otr.78.1607954636517; 
 Mon, 14 Dec 2020 06:03:56 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/43] disas: Push const down through host disasassembly
Date: Mon, 14 Dec 2020 08:02:55 -0600
Message-Id: <20201214140314.18544-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/dis-asm.h | 4 ++--
 disas.c                 | 4 +---
 disas/capstone.c        | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 2164762b46..d1133a4e04 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -358,7 +358,7 @@ typedef struct disassemble_info {
     (bfd_vma addr, struct disassemble_info * info);
 
   /* These are for buffer_read_memory.  */
-  bfd_byte *buffer;
+  const bfd_byte *buffer;
   bfd_vma buffer_vma;
   int buffer_length;
 
@@ -462,7 +462,7 @@ int print_insn_rx(bfd_vma, disassemble_info *);
 
 #ifdef CONFIG_CAPSTONE
 bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
-bool cap_disas_host(disassemble_info *info, void *code, size_t size);
+bool cap_disas_host(disassemble_info *info, const void *code, size_t size);
 bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count);
 bool cap_disas_plugin(disassemble_info *info, uint64_t pc, size_t size);
 #else
diff --git a/disas.c b/disas.c
index de1de7be94..a61f95b580 100644
--- a/disas.c
+++ b/disas.c
@@ -299,10 +299,8 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
 }
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, const void *ccode, unsigned long size)
+void disas(FILE *out, const void *code, unsigned long size)
 {
-    /* TODO: Push constness through the disas backends. */
-    void *code = (void *)ccode;
     uintptr_t pc;
     int count;
     CPUDebug s;
diff --git a/disas/capstone.c b/disas/capstone.c
index 7462c0e305..20bc8f9669 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -229,7 +229,7 @@ bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size)
 }
 
 /* Disassemble SIZE bytes at CODE for the host.  */
-bool cap_disas_host(disassemble_info *info, void *code, size_t size)
+bool cap_disas_host(disassemble_info *info, const void *code, size_t size)
 {
     csh handle;
     const uint8_t *cbuf;
-- 
2.25.1


