Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B5F69236E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPl-0000yP-Vx; Fri, 10 Feb 2023 11:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPh-0000gz-Vk
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPg-00008w-Cu
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:17 -0500
Received: by mail-wm1-x32d.google.com with SMTP id bg26so4278105wmb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoAgqkkVaW/90nUxacTI0iLIaEIQyrnwnsSs7qVHgZI=;
 b=h/VgQ1mxtjpmlfyI6vqQAuS3QYkgq5B2uf+HVCT2KccHs39TESlkSOCk1euN7ognzZ
 yUFx2OAm8Bh4Qe/tWSPrq+TloufGjebkKamwLDGcw7UThdB/KlZCYKZ42WqggndsIt1o
 Tvu/IyTNVYqQWFzUZULT2Z0RGeAa3CSF4Zo6pYqYVaQKYD42vwC7ssK8n7gH6fOM1Yb8
 VjTaNIOO++IDPZT7cSIBPmQMIbg34yIzw8Jmc6Siyd2Ny402Ef11MDqRV91xNa98+Pod
 t1+oTAxnA4ODOZ8WCY/gfqa0N1K5mqhWOG4f4UHtDOkzSVUwx6C0jvQRmgcZeYRqvAIa
 dA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoAgqkkVaW/90nUxacTI0iLIaEIQyrnwnsSs7qVHgZI=;
 b=Rt4EasstF3VkZNoI9rmSk5IvSbBD5+PY1R3FY/8PF/Qw4E5fpAE0tSFmVXdIziy27x
 qZbxijQFm5d7HPFf+GASjILhCstTqpXjALCVVHnx//ZKl1+hLS78afhx2kM0TcgA0iC4
 UDzDFUk1+7t+A7EXl+SqJA9y8E2Lhi4Mlsec96llyTT47hf+A85GQaCCNZPP3fp6Apfe
 or9nvmc4Pa1rwvNi2t8qwSlOO9iNIe25TjakuO104KhsQXTm2m5Ru9xcI1d4Xnedg6ed
 ILR79ABlfj40FtBYA5wjSICZPkSBaBMLkDQt3XiCeebC5/sYjJEcaLovXrPF0BqIDRjO
 qz8Q==
X-Gm-Message-State: AO0yUKWl6c28xHRm9n00ETExSFMZ79zqoH3l7lrSLl4btrF+vJW8Kw55
 j8TM/adjYK8PeZ7e+JtwMTj7QsbC7sqdFQar
X-Google-Smtp-Source: AK7set9EdAeDWb2j5hBDCkRPvdxPVfg+jo+dg5GyDUz/6cKQI8Y/3Tp6BJWWuIYRVi0PtJ5ZZzi4Nw==
X-Received: by 2002:a05:600c:308a:b0:3dc:43a0:83bb with SMTP id
 g10-20020a05600c308a00b003dc43a083bbmr13562208wmn.3.1676047092078; 
 Fri, 10 Feb 2023 08:38:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b003cfa622a18asm8969649wmc.3.2023.02.10.08.38.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 05/11] hw/mips/jazz: Rename ISA input IRQs as 'isa_irqs_in'
Date: Fri, 10 Feb 2023 17:37:38 +0100
Message-Id: <20230210163744.32182-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following code:

     /* ISA devices */
     i8259 = i8259_init(isa_bus, ...);

gives the false idea that the function is creating a i8259
device. Instead this function returns an array of input IRQs.
Rename the variable to clarify:

     /* ISA devices */
     isa_irqs_in = i8259_init(isa_bus, ...);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/jazz.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..fc7898006c 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -130,7 +130,7 @@ static void mips_jazz_init(MachineState *machine,
     MIPSCPU *cpu;
     MIPSCPUClass *mcc;
     CPUMIPSState *env;
-    qemu_irq *i8259;
+    qemu_irq *isa_irqs_in;
     rc4030_dma *dmas;
     IOMMUMemoryRegion *rc4030_dma_mr;
     MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
@@ -248,8 +248,8 @@ static void mips_jazz_init(MachineState *machine,
     isa_bus = isa_bus_new(NULL, isa_mem, isa_io, &error_abort);
 
     /* ISA devices */
-    i8259 = i8259_init(isa_bus, env->irq[4]);
-    isa_bus_irqs(isa_bus, i8259);
+    isa_irqs_in = i8259_init(isa_bus, env->irq[4]);
+    isa_bus_irqs(isa_bus, isa_irqs_in);
     i8257_dma_init(isa_bus, 0);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     pcspk_init(isa_new(TYPE_PC_SPEAKER), isa_bus, pit);
-- 
2.38.1


