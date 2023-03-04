Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC816AA950
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQGH-0003WE-Ng; Sat, 04 Mar 2023 06:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG7-0003Tg-A1; Sat, 04 Mar 2023 06:41:03 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG5-0008Ta-MI; Sat, 04 Mar 2023 06:41:02 -0500
Received: by mail-ed1-x532.google.com with SMTP id da10so20288194edb.3;
 Sat, 04 Mar 2023 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=if4VvV49pa65j5fAVPx4ylF15nZ6C4JQhn8tvZ+BbSo=;
 b=GaTd50DqLAMS5/uiGPkZHnVipHuUF3ZKS3yT5UOTHf8BwgPjwLpOl/DOkn7TLi9NMH
 7MkU/kmcI7D0moUdyCVrJE7VMwZju4WRAYQd1tnJp1j2JOHk2cnB+l5tz5ZpJd8Sekbm
 wzFycyS8pKJx/tQNohH31PiUtq0cCPlRT7HfMXiR1kP3QOnwH5fQV4ihChBac4Og5x8y
 I+AHkCXcoHJKBFExwKbj+THetR8akRl6bnXv2BW3GOVepxPq/bYkdgJGGLGzX7AVACTf
 +JjWzl5y2MFDbmv6fA4TkC58F92+O2Wcxq/9KaWdJYDV7KYAZ2AmmSrzy7fAVd7/CGoj
 Wt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=if4VvV49pa65j5fAVPx4ylF15nZ6C4JQhn8tvZ+BbSo=;
 b=6B6B1QFolINqVY9jAqKrf8XesGqMHSOeRIAbmA/HFLqNh6inH0AYDt1dFk32d0C47M
 pXtTLGrIaDYtUFqtvg84tmkrxJmdMq5wJVylkcAQ6Txo4rASVewMqYerLHKTZtTk6Km+
 Rz6ettkCSMkUFD54Uz4qUrFnUViLWF9TEFU2kWDERxSc7+sQJAVOBANzFBUIORMQJwX8
 DKDxaWkXlf73lH6L97ay5TN+ObQ24Pye37M4jT2CO1KnEia0m4m/OI+Q6xrmToUa3aJ6
 zvcpfbGUb9kARzXvMW0bATnfVqu+Ec7MgerWOJnSm152O6RN2ezxRyjMrtiSv2atf8oW
 iPsA==
X-Gm-Message-State: AO0yUKXv+2CSPSZdGkGEJKnQg8/Dm2En92wluQUc1/3V1aT1jO+UQrjF
 xKsTRi2vUqo0WTUPwEJSY7IS2EnUFtk=
X-Google-Smtp-Source: AK7set94ggGB50sJdeeFyDyuRkjRCo2jFoB2YwGLJM+vjrqDsQRnNCJ2LduNCPz3F96cy8ODlIc5Aw==
X-Received: by 2002:a17:907:7b8d:b0:8b2:c26c:369e with SMTP id
 ne13-20020a1709077b8d00b008b2c26c369emr5772756ejc.76.1677930059749; 
 Sat, 04 Mar 2023 03:40:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm1993248ejy.113.2023.03.04.03.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 03:40:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/5] hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
Date: Sat,  4 Mar 2023 12:40:41 +0100
Message-Id: <20230304114043.121024-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Commit cef2e7148e32 ("hw/isa/i82378: Remove intermediate IRQ forwarder")
passes s->cpu_intr to i8259_init() in i82378_realize() directly. However, s-
>cpu_intr isn't initialized yet since that happens after the south bridge's
pci_realize_and_unref() in board code. Fix this by initializing s->cpu_intr
before realizing the south bridge.

Fixes: cef2e7148e32 ("hw/isa/i82378: Remove intermediate IRQ forwarder")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/prep.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index d00280c0f8..cfa47c1e44 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -270,9 +270,11 @@ static void ibm_40p_init(MachineState *machine)
     }
 
     /* PCI -> ISA bridge */
-    i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(11, 0), "i82378"));
+    i82378_dev = DEVICE(pci_new(PCI_DEVFN(11, 0), "i82378"));
     qdev_connect_gpio_out(i82378_dev, 0,
                           qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT));
+    qdev_realize_and_unref(i82378_dev, BUS(pci_bus), &error_fatal);
+
     sysbus_connect_irq(pcihost, 0, qdev_get_gpio_in(i82378_dev, 15));
     isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
 
-- 
2.39.2


