Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D12E8E5B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:17:34 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAkn-0000RC-FE
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwANC-0005Jt-C9
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:10 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwANA-0006WD-U6
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:10 -0500
Received: by mail-wr1-x433.google.com with SMTP id m5so29434384wrx.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Omfw76hY3844Y9bacXeVCDYHAMRLixZrIVClYxgLMv4=;
 b=MyOGgJwTQshcoYZEbauhdm0dtPNPGqTZEckd0BxS1cTfbaulIP33kGtdowDHmW+Ytk
 97TSMenDuEYyvTQrw6PpeHvxRX9DT6PXnTeGFlOlx5KsbozW6vVuqjgfZO9URW698WWu
 7O2A6avC1cEtVwcwEY2sg9DA+eq1Bba5xPe1UOfm875GujUdANY5u7+8pIZ+Ut7TY5Wf
 89S8opK7Q5RB9aTQOkzfA0eRdThvZrZiT8lXJPbnJh3tPoD8jQXfvxISFN8+/NGjnyz3
 viy2PxxXLzn3pfhUwMSF3PjlIU8B9lM6KMCADFiToPsa+63M2nZHFE8CGg3SFF1RjZGX
 s9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Omfw76hY3844Y9bacXeVCDYHAMRLixZrIVClYxgLMv4=;
 b=Zhs6cdXImDwWTmXa2RSLAXfh0R3Ej3bTz2LwZ+VxeBQTiux56LmDhV9RaGiPG52bFL
 lKbq93bKl6+6HB2L2p5WcwUQgVkpJNUezRYNXQDkHUALQZudjt5v8Ypk5RLO9BbRNHmY
 IVSFGviDLXa06+YzzcoGwjyfjFaLC8pxJgCjWok8vxKjuPwBlFUQTdM+iwH2hr5uEF2v
 Tik6/K8vChPwHm/L3irxNmQTZlZTg3urKlm2vBQ8foY3EAuLZz+9Z4KKcLrw60sdQjPs
 5aN2vayxbScx6HG/inW3pm1HRvknaFXlHOkudw2R4hJM7EnSmyV6NtZerrHtivTb4zOv
 Apjg==
X-Gm-Message-State: AOAM530hDB5ql3AZ9VZtclb4dsjYAB+J03vBOGZXZungpOSSnB5knroV
 d1Diy1smHfJR33ILx4HTNnP6gmjgzgg=
X-Google-Smtp-Source: ABdhPJzNAQD1NWOUcthC4P+yxUFupCJvUTNCnA2dzbnevgQNJJ662bcqmvWNryjx2fMSZ3SZtZ6fxA==
X-Received: by 2002:adf:8185:: with SMTP id 5mr74922900wra.44.1609707187308;
 Sun, 03 Jan 2021 12:53:07 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id v1sm29176820wmj.31.2021.01.03.12.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:53:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/35] hw/mips/fuloong2e: Correct cpuclock in PROM environment
Date: Sun,  3 Jan 2021 21:50:20 +0100
Message-Id: <20210103205021.2837760-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Missed in 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency
to 533 MHz"), we need to tell the kernel the correct clock.

Fixes: 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency to 533 MHz").
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201224031750.52146-7-jiaxun.yang@flygoat.com>
[PMD: Reworded]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 9b44ac6cf97..29805242caa 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -99,7 +99,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
-static uint64_t load_kernel(CPUMIPSState *env)
+static uint64_t load_kernel(MIPSCPU *cpu)
 {
     uint64_t kernel_entry, kernel_high, initrd_size;
     int index = 0;
@@ -159,7 +159,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
 
     /* Setup minimum environment variables */
     prom_set(prom_buf, index++, "busclock=33000000");
-    prom_set(prom_buf, index++, "cpuclock=100000000");
+    prom_set(prom_buf, index++, "cpuclock=%u", clock_get_hz(cpu->clock));
     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
     prom_set(prom_buf, index++, NULL);
 
@@ -330,7 +330,7 @@ static void mips_fuloong2e_init(MachineState *machine)
         loaderparams.kernel_filename = kernel_filename;
         loaderparams.kernel_cmdline = kernel_cmdline;
         loaderparams.initrd_filename = initrd_filename;
-        kernel_entry = load_kernel(env);
+        kernel_entry = load_kernel(cpu);
         write_bootloader(env, memory_region_get_ram_ptr(bios), kernel_entry);
     } else {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-- 
2.26.2


