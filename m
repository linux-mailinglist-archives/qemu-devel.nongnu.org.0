Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFDA2D916D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:38:14 +0100 (CET)
Received: from localhost ([::1]:44744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobsT-0004Rj-4h
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobn1-0005FJ-MH
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:35 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobn0-0003K6-2h
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:35 -0500
Received: by mail-wm1-x344.google.com with SMTP id 3so13731835wmg.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=hsXHV4AFOOIdXtetkHTd4UEGVYrsSP6f6ckFnsp0Foq3UPs8aqLars5N+Fp3W+o8OU
 /1D3qP8zc0PWsxn+6rJ2xDu7nysW4KXwtjWZs4DRXTnvX1HWMDZ6ohSOZP/xbsLvOxTr
 +taSwho4sPKef7m3FIzM333tSTqLBM8KWrIvH3MwYqDsGZ79V1hYEJ/B7whI6a1lXpDy
 RHUywAdp1fwzv9SiTxpdPQnuwNN4jG/hnkS5zfb/WUSJHdsCVsKMQJzRCEQfDgk6pcGg
 9NcjEUt9WApTQtAauXt8McXZc2nKzEUuErUfPwc2qsP8En98CUN5aDGklo1GHrBw3JAv
 WfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7+gpz5nBbN/ysI0JfpfLjTz+oao1gnIR+w+URSQBzdk=;
 b=AHLi6pozuPx8u6RmfM/12ApnlFhm6doUH+UZFudzISMJpj7T9LAowb6khQraxQc1bI
 NcEBuOPzsARwc8p56xkaULT50kcLcR6WPYQ/5rSqBktX6Cp52rORfnwY45DjQxD9whVr
 ivUI25sO9Xf3oTvLwJSwMuPRJgPRK7YGSGUMUstnU71ePL0ylGVtQN4mwCLuLiXdsWu3
 Wbs1sobsUrCWdDEOlhMRopVSzOaCre5miRDN5IiYkdRbECsWamBNMtUF+djQakHGeSyy
 QJjyBj6JvPPLRiOVa7tb8zOl33pthaQ7oUKCzxCp61QI9PxbCGykrW8HgMwZVvmk/VkG
 suvA==
X-Gm-Message-State: AOAM531g3mAcwijabUKSKDe2X+A2SHTnQL/VYuSRlwP/Sqt4PLXKrdhW
 OGXefLLwSI1Ha99acPnSO9JM4VvSkC0=
X-Google-Smtp-Source: ABdhPJyN8ZniYuDR8O8KBRqxIhmMOZthZ+/wPlv1jarzV1G0WaPo+zPVMvnFVZyA6z80SUMcz3jjog==
X-Received: by 2002:a1c:151:: with SMTP id 78mr25525305wmb.24.1607905952453;
 Sun, 13 Dec 2020 16:32:32 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b13sm22115944wrt.31.2020.12.13.16.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_SET() macro
Date: Mon, 14 Dec 2020 01:32:12 +0100
Message-Id: <20201214003215.344522-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214003215.344522-1-f4bug@amsat.org>
References: <20201214003215.344522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
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


