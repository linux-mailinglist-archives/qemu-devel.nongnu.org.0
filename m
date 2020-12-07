Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BE2D1DA0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:46:05 +0100 (CET)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPGf-0005xx-1f
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEb-0004dY-3g
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:57 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEZ-0004e6-LN
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:56 -0500
Received: by mail-ej1-x641.google.com with SMTP id jx16so21834950ejb.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=Cd4kKXgh9x7YLjGpu/9bBPDEkaKfzGTSYOEIyrUdYLRKcQG//reFMCmA4w6s4YFwHq
 n+5B2YJuKA2vy2F6/wvyMn49obDSpPyp/syPj1dH6JLo33QIJBim7nSm2Lk4pu8lh6Qg
 pRKE+/w73GnIlmSM4AZto3lHYmIaJZhDfVEjw+umtkRrt+XoGIjZQHTNpohvonAxJv3f
 SALADJlc5tJghIvjdxQKD/tHhE2XG0GNxNC0D3KVpJsYxCCP0CtJIvtF2tIVVCOSDG8O
 BW2UyTlYMpY7ckWw23RDs4KE0xYq2PhWKbBAmgTwh982xAdxTliM+sIyLybHNyj8+n/I
 pk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=a6FUOKNoYNPsnUdlXU0ErF2tAZzSO+WH6VbPyPyhcmRXNYAIb8NjIyN6PuBRDVpT3v
 hDWPbSROfU4pHiHrLX/+I9c1o7vuciYGKnqwQmAiWIxq1RBXJpxhrWL/I5lCggAA5xm0
 c/6xHxtxkFB3cJ24cIEb4vLbQzwhIJLguWWY1qI1jtiL4inW0T4Iy0Gmz6apSeCfC1K0
 9T2CD7xrThrA6GuNAk7uf4Nn+P2t65mL9BGy7wuBD7iwYGKqqb3+WFJFgDRV3DfPkCsb
 0I48jlHaCxIScLNwyl6+MWuAoerryyEvWgFRagAysGK6FHMP1cd7qIEuff9uCZgf5unr
 tHyQ==
X-Gm-Message-State: AOAM5333AO/ItadK8qWMyqt2kCRawS9fpd/H+8FZTui+DgtU4XLCk4aB
 3ljKHTkx3pd2SIXp8dILxxo0uzDVViE=
X-Google-Smtp-Source: ABdhPJwDnOwEQcKLlx3X511x8QX5swe8td66qSwvcprh+DBZLCTi8yfn0fl5B/1j9b1WBqXS2cc0yA==
X-Received: by 2002:a17:906:4016:: with SMTP id
 v22mr21385100ejj.266.1607381034137; 
 Mon, 07 Dec 2020 14:43:54 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d6sm13679046ejy.114.2020.12.07.14.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:43:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_SET() macro
Date: Mon,  7 Dec 2020 23:43:32 +0100
Message-Id: <20201207224335.4030582-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207224335.4030582-1-f4bug@amsat.org>
References: <20201207224335.4030582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
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

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_SET() macro which
checks if a CPU register has bits set.

Use the macro to check for MSA (which sets the MSAP bit of
the Config3 register when the ASE implementation is present).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e1d7e7677c..b7c6d30723a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -992,17 +992,21 @@ enum {
 #define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
+    do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
     GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
-- 
2.26.2


