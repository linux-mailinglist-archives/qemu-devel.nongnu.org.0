Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938182D1D9F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:45:44 +0100 (CET)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPGI-0005ZZ-HW
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEQ-0004Ni-M9
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:46 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEP-0004Zb-DR
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:46 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so21893309ejk.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=oMrXzCMidZc248nX2yK3SmiVrEf6cZ6xNdkoOkqcLkn2QDwAoKVGGT+XPqGqU6G+vJ
 LyQuubtFxpUW4NmZq8BF6d+AfkEyQ+/hj+ymVn4IUkVPwt757f2A0vsnFYeqTDJNrd91
 Xs+nGEUJP3UxjvRPnD6OwO2oJBfjIvc3rwsErWe20tLJAXHIldHWY0TcQSq6aJfHZta8
 4S/8LyqgUlZ30J2a91meuLx/cCYcNA9BWYugb2FIiXhbPaxmMqEbxlcLB/kXbSHskX1E
 RMc44eKgDz9D3qLvl7apff3YUbnBT7QoeCTV3hOEXK8VdannhnPekpHYWi3umYgLuvw3
 c+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=JT1/9VB5t6K1zn2eHhRHqzutUSsBGttMOeLc6dDUmJ8AaJ+FNS0wiDx6G8RYGJdmo2
 StHIwApO7a2j5wzSgrGvlC+BsTuZ8lKHXJ/ui1xHctWJ8QKnf/tnOxgxxpsk0xBs5D5X
 dgRhMKMcHuoR418M7YMDD515LFCju5eHYxPfSd5umzsJLL7WORfdXaBPik5LynO9S2S4
 89wjBuS3SGt9tyPw1CU9hx0dK8tKtzFzaGHCS1zbh92pRror/kMET/OjaTdHrSwnQvRd
 m3qYD96fvE2KceXGBQFk+Qm1fwxGs4xJLQfNqzGVq5EQMOSeyTIXNruxeaWj2c4HJQeD
 7kIw==
X-Gm-Message-State: AOAM53054F9c7TGmo/nK8F9TOwGmyO+52kfxuszUX+OxRMB94K5/eYN7
 OGPJfScgvyZwkDbsWecTw+n/NfV3utQ=
X-Google-Smtp-Source: ABdhPJxSH+39VwfK4NBSQyKyFosabDqGC4gqyutZXzEXHLPJnR1rc77d51lTK7tBDxlLB/b1kVLOUA==
X-Received: by 2002:a17:906:e082:: with SMTP id
 gh2mr20032295ejb.406.1607381023593; 
 Mon, 07 Dec 2020 14:43:43 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id qh23sm12920956ejb.71.2020.12.07.14.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:43:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
Date: Mon,  7 Dec 2020 23:43:30 +0100
Message-Id: <20201207224335.4030582-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207224335.4030582-1-f4bug@amsat.org>
References: <20201207224335.4030582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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


