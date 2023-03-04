Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008C6AA951
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQGG-0003VZ-CE; Sat, 04 Mar 2023 06:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG7-0003Te-1m; Sat, 04 Mar 2023 06:41:03 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG5-0008TC-3c; Sat, 04 Mar 2023 06:41:02 -0500
Received: by mail-ed1-x532.google.com with SMTP id cy23so20063329edb.12;
 Sat, 04 Mar 2023 03:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Fsw6q5WagNedxBCFgTdET8uBtnuynOtVv9rkGhTlOo=;
 b=eD3prtXqvJmL697l2893S14PWEHhFsxhIol/mdOmUNfXdnZ/u5ThMiGTmiewZdRyfw
 N2Gp/m6o4rKJgtwqSKAKQc/cmxwMhczNhbtCeJQ0+6Zrbjz2HekOAI8i1ZfhTPt+YL/a
 W5HOLnCBBWT2s2TOgVfJdsr2dn3srfZy1eh/zl63VajEdhDbOux6hHmxy1iR5JMBcYJk
 KCC5WLc4rXTLIsVrTHIrbh4l+BLVI1WKd+PxqEQ2vmnvQuY0fPF3uMmmUOMVZoHPxWbD
 Dc1uVS3c7OtOx8nh54fd3ldcpZ1n3WQond9nOwxjaZVeXJO3ZHGt/EgDn+NqJiKdkGXV
 gbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Fsw6q5WagNedxBCFgTdET8uBtnuynOtVv9rkGhTlOo=;
 b=cUXQXNMNA+EdCTCl8V1HL0yiXpfmqzGnvROtMjySF+B6B0safYDxfkiJxeNXDUwnjA
 5Fm3eMe/b13E6haPkQ2AVpqx7cDuLILYc7gi2V/QgrpmFVgT2HMkzr2XT9Py9An2zr2q
 be4byqYZFwpUMjcwYGAaNKsh9dz+Y54GNMGdeXNuv80xtD0GiOLyOC4dXrw3J9sE7Kcl
 gULilCaN/7loC4jZz/hmig7o5IiZWFDk5d3XKdPaHzcAOqR4My/hjtU0/4tnXQ7OyhcQ
 kPaVaWZuLpwDv3pPS3jIQD6Kn2dD9gNIn5/tW48CabLl3NIvQF8TqUjHMbfx0T9NzJU7
 6DXw==
X-Gm-Message-State: AO0yUKXLscm8rmgwpBOD0BQxfs+HbNpY9Ceg7QUbGXBM+ywB5zBA+UdB
 mtFborzfJ6Kl878AebzDGj4BBgPszYQ=
X-Google-Smtp-Source: AK7set+t3W3mIWTM7nCqTTpOv1qeB7zk8re+TJj0dtq9JQMx3bLoN5pKn1WSM8KhXMvyWWoE2cSGsA==
X-Received: by 2002:a17:907:1ca3:b0:8ea:2055:4f1b with SMTP id
 nb35-20020a1709071ca300b008ea20554f1bmr6419058ejc.24.1677930058520; 
 Sat, 04 Mar 2023 03:40:58 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm1993248ejy.113.2023.03.04.03.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 03:40:58 -0800 (PST)
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
Subject: [PATCH 2/5] hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
Date: Sat,  4 Mar 2023 12:40:40 +0100
Message-Id: <20230304114043.121024-3-shentey@gmail.com>
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
 hw/alpha/dp264.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 4161f559a7..e92295ac86 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -16,6 +16,7 @@
 #include "hw/ide/pci.h"
 #include "hw/isa/superio.h"
 #include "net/net.h"
+#include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/datadir.h"
 
@@ -110,11 +111,12 @@ static void clipper_init(MachineState *machine)
      * Importantly, we need to provide a PCI device node for it, otherwise
      * some operating systems won't notice there's an ISA bus to configure.
      */
-    i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(7, 0), "i82378"));
-    isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
-
+    i82378_dev = DEVICE(pci_new(PCI_DEVFN(7, 0), "i82378"));
     /* Connect the ISA PIC to the Typhoon IRQ used for ISA interrupts. */
     qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
+    qdev_realize_and_unref(i82378_dev, BUS(pci_bus), &error_fatal);
+
+    isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
 
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
     mc146818_rtc_init(isa_bus, 1900, rtc_irq);
-- 
2.39.2


