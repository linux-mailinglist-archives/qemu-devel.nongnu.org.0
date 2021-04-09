Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B4A35958E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:33:42 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUki5-00046I-LB
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZA-0004aD-3T; Fri, 09 Apr 2021 02:24:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZ8-0001W1-Jr; Fri, 09 Apr 2021 02:24:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id e7so5168244edu.10;
 Thu, 08 Apr 2021 23:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRoQYNlkLYyE9AlFcEvCS75qivi0ECZWMEXZijy0geo=;
 b=jZtsq9FagTXfsvqDf7W34eslAdCA4mGEvi2srm/7/nc6zymz7fBhbd7tT+4090WqQ7
 RNVKiEaLFwYUqEOOGDgwwzEVTB/qgNKRNnqHO/UJyiNiiQHOiL9h+El+jVjh75LrEAXg
 oPaDjM51orhXfYGwrQUnzsINS7hPjwfyaHv+m7Ox2qefMSheSaGUUstZHZXZoKbQPJR+
 6g/elCbzJpocQoUSiady8qamz0sFai1WheOpOjBGb5tYv8p0Td4pe2YZr67HM4VNf45z
 rYk4nQqsGZPs0uLXF2xuErE75GsuwSEDXrVr8TzLA/ym5ScTillo03rkbMgNO4ExKQwO
 ilPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zRoQYNlkLYyE9AlFcEvCS75qivi0ECZWMEXZijy0geo=;
 b=LBSYwbYR9fCFT6pfyRrWC3bI66KvxQz2+2BwwNjtYb9hrr3Ee35ITyr3EQDHECt4Sv
 IvYcwwXtTyPK8kogoZFI4NyY1hKvSaREQ6S5OLoYTeXLw+yq7LKYg2OiTXGddblxsZ5H
 xHWfy0e47iltyYLz9LBGbuaUQLHCsE350+FIJg1vMJBevtydhtfjmvv5GVQCFf+6y9fg
 QAwj1UKhp0Cd5fJNLTXKwuvj3chmi+OU6lMfxMqRb7L3VYeP8w9Qv01RAReTKBWbs0qA
 hbBOFPzI5115E/pokcbQZy/H9EyaWOSYHbzEhWnu0H0FRoU8K7U19l44n8aa4d1q7tor
 Vf9g==
X-Gm-Message-State: AOAM532MjIJwouHgbjOgIJ0lxzZcjAkenk2fj4C+yZfehQjhLcFLq4o2
 DS6ufwREbl7Ym9n35itozoreOsB8kHfTrg==
X-Google-Smtp-Source: ABdhPJycFP3DeWWCiB4FHpmElahwDBNZmZFiZYI0x7QKzBFgxbcU9Ri82gmB1RG/SGZ237kKc9X3IQ==
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr15630569edd.322.1617949464597; 
 Thu, 08 Apr 2021 23:24:24 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 28sm816854edw.82.2021.04.08.23.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 4/9] hw/mips: Use new
 machine_create_constant_clock() helper
Date: Fri,  9 Apr 2021 08:23:56 +0200
Message-Id: <20210409062401.2350436-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the newly added machine_create_constant_clock() helper
to create the CPU reference clocks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c      | 4 ++--
 hw/mips/jazz.c           | 6 +++---
 hw/mips/loongson3_virt.c | 4 ++--
 hw/mips/mipssim.c        | 7 ++++---
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 4f61f2c873b..72dc5702727 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -259,8 +259,8 @@ static void mips_fuloong2e_init(MachineState *machine)
     CPUMIPSState *env;
     DeviceState *dev;
 
-    cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
-    clock_set_hz(cpuclk, 533080000); /* ~533 MHz */
+    cpuclk = machine_create_constant_clock(machine, "cpu-refclk",
+                                           533080000); /* ~533 MHz */
 
     /* init CPUs */
     cpu = mips_cpu_create_with_clock(machine->cpu_type, cpuclk);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1a0888a0fd5..3c220b4df6b 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -185,9 +185,9 @@ static void mips_jazz_init(MachineState *machine,
         exit(EXIT_FAILURE);
     }
 
-    cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
-    clock_set_hz(cpuclk, ext_clk[jazz_model].freq_hz
-                         * ext_clk[jazz_model].pll_mult);
+    cpuclk = machine_create_constant_clock(machine, "cpu-refclk",
+                                           ext_clk[jazz_model].freq_hz
+                                           * ext_clk[jazz_model].pll_mult);
 
     /* init CPUs */
     cpu = mips_cpu_create_with_clock(machine->cpu_type, cpuclk);
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index b15071defc6..b9f18ecd911 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -530,8 +530,8 @@ static void mips_loongson3_virt_init(MachineState *machine)
     sysbus_create_simple("goldfish_rtc", virt_memmap[VIRT_RTC].base,
                          qdev_get_gpio_in(liointc, RTC_IRQ));
 
-    cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
-    clock_set_hz(cpuclk, DEF_LOONGSON3_FREQ);
+    cpuclk = machine_create_constant_clock(machine, "cpu-refclk",
+                                           DEF_LOONGSON3_FREQ);
 
     for (i = 0; i < machine->smp.cpus; i++) {
         int ip;
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index f5d0da05aa1..af11cf9ac25 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -153,11 +153,12 @@ mips_mipssim_init(MachineState *machine)
     ResetData *reset_info;
     int bios_size;
 
-    cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
 #ifdef TARGET_MIPS64
-    clock_set_hz(cpuclk, 6000000); /* 6 MHz */
+    cpuclk = machine_create_constant_clock(machine, "cpu-refclk",
+                                           6000000); /* 6 MHz */
 #else
-    clock_set_hz(cpuclk, 12000000); /* 12 MHz */
+    cpuclk = machine_create_constant_clock(machine, "cpu-refclk",
+                                           12000000); /* 12 MHz */
 #endif
 
     /* Init CPUs. */
-- 
2.26.3


