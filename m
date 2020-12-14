Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39BF2D9166
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:31:29 +0100 (CET)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koblw-00034P-Up
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkF-0001np-43
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:43 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkD-0002LI-JM
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:42 -0500
Received: by mail-wm1-x342.google.com with SMTP id a3so13732037wmb.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=bZ49axg2QA1VF/rhtfJjgauhCKc+TyWH/lAR93tVPC2nur3w1QNfvH6/H2A//5PJmj
 TRTI8A9sNKBcSK+Lxzp3ld2X0Jiw38FIlK5jZQuBqLEZ/SFe163WpgXlOshX7zLX9KKH
 9MM/d7naLGqKNMFDomksyRTsoRlNq/Q8TgC04eqDpOkfYnqyNaLc8C5Yh5W9dqn2N3NO
 /efszko1LI+eTb5FLOa7PBQrUU5+kN6pbr+h+Z7tbBDlls9vxtE+cwG0sR1uxEk1sGP9
 Vh8lLoLRY55KVZ2dV5id6mgTt6URODHb04Vs4HrdJ8Qy5IS+b1XRA1hv1I/iissu28Aq
 kLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=aE5IG3JgZwfe/RJ5tViiPFHPLHrW86DDSjz0GM6kqY2H9spfuT1cXvDYqLfMtcJPc1
 IZ7X6ocha5yzz0T1Wp2p7LFFuEU6uC9EmAK0VpIZVNGFlDjvI8fSVNHBTdkX/yTFzOcl
 T2936LGMQA2AG02a3REdiTKv0Haadhj2+afQYURqvUTXxGrA5sfvC5k93UpEpLEvHZu6
 R8hL9TN3sTVzc0vswkPfQhvxSYh0XvH7KphGdui0Oi/LHNPbGgQWXk7gqEqBY9JEqV2K
 i4yPJb5gDqQ98rD1V4QsQk5PDsPLYtAbE/MuLfHfxcDmWlz+EUw+d8eU65zMuxtPZ6kC
 UUfg==
X-Gm-Message-State: AOAM5339gHFO/jlBCPywHKM3kSa04l2/ufXWSvUVmukaGVAKwnnWJtBZ
 mUc2er27/6RGV2KLelSo8ooNyQIQjNw=
X-Google-Smtp-Source: ABdhPJynGAzIJ/EjDdO9m47vqxWS06lDICKczBAV3K/Jg6VQ0eKjc8YnuwwPd08Lb5JKY5nlyksmag==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr9197656wmj.63.1607905779917; 
 Sun, 13 Dec 2020 16:29:39 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u10sm26819614wmd.43.2020.12.13.16.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:29:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
Date: Mon, 14 Dec 2020 01:29:23 +0100
Message-Id: <20201214002928.343686-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214002928.343686-1-f4bug@amsat.org>
References: <20201214002928.343686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we are going to add more macros, keep the function body clear.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025..aae28fd929d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,22 +989,22 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
+#define GET_FEATURE(_flag, _hwcap) \
+    do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-#define GET_FEATURE(flag, hwcap) \
-    do { if (cpu->env.insn_flags & (flag)) { hwcaps |= hwcap; } } while (0)
-
     GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
 
-#undef GET_FEATURE
-
     return hwcaps;
 }
 
+#undef GET_FEATURE
+
 #endif /* TARGET_MIPS */
 
 #ifdef TARGET_MICROBLAZE
-- 
2.26.2


