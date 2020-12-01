Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F82CA413
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:42:47 +0100 (CET)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5vb-0005VF-3C
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5ou-0007AI-PA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:56 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5os-0000QN-KX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:51 -0500
Received: by mail-wm1-x343.google.com with SMTP id e25so5020053wme.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KpnrV7YwK9WYm4vVFUQwZNgnw+LJbwKa3oXlJxpsFpw=;
 b=bhNiS0dKN/8c9Hzi2wj4c4FkyfkWXl6Fob6fX8Ts32lqVF61lmG406MgsmJOhYxcJe
 2WVV+ZoxKPRHVY3Km2VhuIlHkvh18AyYbmWNhQtLJMxPcQ7jbqnaJVw68cjLWCY9YDAZ
 r/foFy/2z9NT47EPTPWzEN+lQOOXukLIVd6AXl24Gba8AYBmiSO5XzOIuhT98Nr3ObNq
 5jSb1ojIAzGbgNMWW60ZQCFEXD1U1TlB4cSbexpZJdAvsXkSfFMKZYmioHm7sM1ISuYI
 yLteG8bgH4hu/ZB5zse0VUFz4kqWJwVTVFFjUwZpRn2fnSZc6oK7XJuhjC919yCjBd1S
 ucAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KpnrV7YwK9WYm4vVFUQwZNgnw+LJbwKa3oXlJxpsFpw=;
 b=SXHp0jbguFgZcEer+jOI0XTACy9ai5oujBHedP7kLum8g+ctWBjyup/S6rTtrwq3hz
 sBBN/NDljkQMN+V9pGuJ96CuTvp1l5zebL/uMMWgILufhGE5zsftJn8GMwCMYhPWnPht
 ihaPvyirp+JjRDAFYsjRqS6i59j1JmsC/8Zbaq86mU++tkdvq7LF2NWb1ymccs1SLrLa
 8bqKWFl1Nd9JvyTuf9mEhoZGzeIkGrMTk55s30AqNqY5IWA2vSEU09wrYa7GjWE2RH0j
 1bExYbVD62UFad0oxblc8IWaYq7Ab4Exg7tzpcdiVVTowCocrks261P7jVdyx2S2A0nF
 WFkg==
X-Gm-Message-State: AOAM530vfR6NDhSjo/nhAvPGNn6wXeBJAmMTPeeEBqxe2iyu60zDyR6C
 MBf55/vVJt8VUiseFuDnrRg=
X-Google-Smtp-Source: ABdhPJyk2V4S+zPDBmBLZlzLLWadgQrXu4zCos3yXuSPElAHytzu4K5tIM2wG0pFHx0jVxvsnSysOA==
X-Received: by 2002:a1c:3cd5:: with SMTP id j204mr2724984wma.53.1606829747950; 
 Tue, 01 Dec 2020 05:35:47 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j14sm3233631wrs.49.2020.12.01.05.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
Date: Tue,  1 Dec 2020 14:35:23 +0100
Message-Id: <20201201133525.2866838-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201133525.2866838-1-f4bug@amsat.org>
References: <20201201133525.2866838-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_EQU() macro which
checks if a CPU register has bits set to a specific value.

Use the macro to check the 'Architecture Revision' level
of the Config0 register, which is '2' when the Release 6
ISA is implemented.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b7c6d30723a..73c1972183b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -995,17 +995,25 @@ enum {
 #define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
     do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_EQU(_reg, _mask, _val, _hwcap) \
+    do { \
+        if ((cpu->env._reg & (_mask)) == _val) { \
+            hwcaps |= _hwcap; \
+        } \
+    } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_REG_EQU(CP0_Config0, 7 << CP0C0_AR, 2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_EQU
 #undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
-- 
2.26.2


