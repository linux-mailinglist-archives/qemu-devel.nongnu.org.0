Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D90B36DF6C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:17:40 +0200 (CEST)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpgp-00055T-DV
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbpfV-0004fD-C8
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:16:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbpfO-0002cJ-M4
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:16:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id m5so7684312wmf.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=U4D85nB9vee605spD3gfUuxUCY0DrkBeDdKkqLAVGwI=;
 b=VEwGGl75+IDk79fOOcbM/4sHNW4g45xYSbKSSonJC2XtW54kTCnjObnp1EVWpSD4WD
 CZU2ktfpKSGx1n+TahWjqWREPXy+/6gEF83giqxS8ZZ1lzwdhhoNONNqKwnLWKpOqFvN
 wK9UDyZY0R1Gzp2D4btepIRVkevCIH6xEhX1hO9jcG12W8um2a2zHlF3PHMaq03WdGIu
 wHru5+VYIBC/ek7y41Rj85NiiaqK5H9/HBdkQ9C6pdOU2idkj6hcD/SxYyHRR6+P4mMp
 bom1WIEHirT6yzw37BbPPJSujaF1YvS9S8Vl5YNIQSECmeCO2dqU+sQ/Fo1CgroAJvuO
 2X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U4D85nB9vee605spD3gfUuxUCY0DrkBeDdKkqLAVGwI=;
 b=jqlnJ00wJNevw7BpuoPhRfsHAmHp5ZDXly/m+sNsL87AHRWrpDAieFH4pVynzZNBtg
 yaR4mMieRrPG+NAOS4sHG8EsPLqF2ieG0TFug3GcRzxG6Jh3T/gQZEJxQ2QAtg7kgKW+
 nrNCrWTOh0QTWsFaziLaN25Gi4RR0F047GAWHSg8xRYIYtV5eFy1Az9v/yn+7ZinWOw7
 ZsX/3A3zgr5lAgxia8degMe9WXYdboPRuKeOWbC6VriLShbq3bnqVIkaOHTzjit/d9Dx
 NVQhzT/o61qLp4lf627a3rzfmsvRE6LC7rP7QkxSH/yH5ZbhtOhsGPn8efp3W6d3PdCI
 p8CA==
X-Gm-Message-State: AOAM530qN9UrN3A1WZiJyAfawVBoLqTslKVMTb7KmcGzr/7koM2i2NAH
 /yRa3SwOtGeRE1fT0cYHLKHXDOxFEIZJp6bd
X-Google-Smtp-Source: ABdhPJxatxBFflJWZS2vsDoDeu8fdy2IqHCMtQ0wJVUdXNjqSf6xpsSPbfJ94GEjD2RDC0VRxqroqA==
X-Received: by 2002:a1c:3:: with SMTP id 3mr6023306wma.32.1619637365782;
 Wed, 28 Apr 2021 12:16:05 -0700 (PDT)
Received: from localhost.localdomain.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id u2sm928025wmm.5.2021.04.28.12.16.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:16:05 -0700 (PDT)
From: Frederic Konrad <konrad@adacore.com>
X-Google-Original-From: Frederic Konrad <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/avr/atmega.c: use the avr51 cpu for atmega1280
Date: Wed, 28 Apr 2021 21:15:19 +0200
Message-Id: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Frederic Konrad <frederic.konrad@adacore.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the as documentation:
 (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)

"Instruction set avr51 is for the enhanced AVR core with exactly 128K
 program memory space (MCU types: atmega128, atmega128a, atmega1280,
 atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
 atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."

But when compiling a program for atmega1280 or avr51 and trying to execute
it:

$ cat > test.S << EOF
> loop:
>     rjmp loop
> EOF
$ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
$ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
                  -bios test.elf
qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with 'avr6' CPU
qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU

So this fixes the atmega1280 class to use an avr51 CPU.

Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
---
 hw/avr/atmega.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 44c6afebbb..e3ea5702f5 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -402,7 +402,7 @@ static void atmega1280_class_init(ObjectClass *oc, void *data)
 {
     AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
 
-    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
+    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
     amc->flash_size = 128 * KiB;
     amc->eeprom_size = 4 * KiB;
     amc->sram_size = 8 * KiB;
-- 
2.30.1


