Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B712C820B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:24:07 +0100 (CET)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgLm-00033q-GW
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjgKI-0002an-4z
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:22:34 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjgKG-0002Jq-H6
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:22:33 -0500
Received: by mail-wm1-x342.google.com with SMTP id k10so11457307wmi.3
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wGVntoN2liXaamI1cMHbBYcL2IQ5cPw3L1dFFi7CllQ=;
 b=ljUO8XVByb95avqkx0maT4FhOmfFyLID16Ad+yciKvAV9FlwxM1nG7hBjzZA8cuZlx
 okNmYJg0UGU2YK85V6xAc0JyT18EMbDV64kWeHYv7fcGoO44GTYPm0/wZySXAFfi2w0/
 3ajFqVbeGfmaj1/TUcFcelZDUKGmULHOVSiE4SYBH7O2bBzbz88pYEjE7SiOvivTDAVA
 SbNGgZy/X+1JlZNbSKt449mZxxyfDhrMcqFPtsc2OdJ0jC2lSlUXBPBCd4EYe73ESI58
 zahl1wc3cs6y87GLKTpcNSNe4BhLFe25OQNZrlTNLpW2Qe2NovY0+2TdCRHMOK4M2I3N
 axfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wGVntoN2liXaamI1cMHbBYcL2IQ5cPw3L1dFFi7CllQ=;
 b=A/9SZ2CbVfSbAvjQ/fN+5bxAbY5EajCoK7GdzNEgBdIWsGbvSD1b/fzKLPIXmZoVT4
 /69GUTNTu5f/ZclNrcYvkIRa1KLSKgIrqzLWXKMFWuHXZEDDtqL4UtaepKWHc5aQtU08
 N9X+I6rcdgsI1bqNcklhkE7bXQQ26bT9DwkuL6dj9Nkv6fQowMAJmmjfMr5dlG737axP
 b2rF2Y+hnMGg+/eX5HEbpd0s4YaBYpcrQ9RL0N6MRgJsJe9sUUV3Knmt356jW/G2q+uv
 R0vDAZPkSTd0Gl5U74a45a87pIbvssUeLxQTLWNumjtZzqx7wB3S/2exDTXpMC95kzz3
 DjLg==
X-Gm-Message-State: AOAM533jQ5rcc5Ov3qSco0P3VBtwlG70YLIor0fCDnCpzxY+nzdyVxjb
 rMu2SbxPtEJcP3nutqr4AiM=
X-Google-Smtp-Source: ABdhPJynN2tUxs+/TleLaGuFEBQKXDVSeeLgOY9vCvk4VHILuvgkkBOXWzHYKX5DTtJB7tv18kwWkQ==
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr22660490wmg.55.1606731751047; 
 Mon, 30 Nov 2020 02:22:31 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id r21sm28649555wrc.16.2020.11.30.02.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 02:22:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] target/mips: Allow executing MSA instructions on
 Loongson-3A4000
Date: Mon, 30 Nov 2020 11:22:28 +0100
Message-Id: <20201130102228.2395100-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Loongson-3A4000 is a GS464V-based processor with MIPS MSA ASE:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg763059.html

Commit af868995e1b correctly set the 'MSA present' bit of Config3
register, but forgot to allow the MSA instructions decoding in
insn_flags, so executing them triggers a 'Reserved Instruction'.

Fix by adding the ASE_MSA mask to insn_flags.

Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Buggy since 5.1, so probably not a big deal.
---
 target/mips/translate_init.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index ea85d5c6a79..79f75ed863c 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -832,7 +832,7 @@ const mips_def_t mips_defs[] =
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-        .name = "Loongson-3A4000",
+        .name = "Loongson-3A4000", /* GS464V-based */
         .CP0_PRid = 0x14C000,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
@@ -885,7 +885,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A,
+        .insn_flags = CPU_LOONGSON3A | ASE_MSA,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2


