Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D9379E41
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:20:52 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJt5-0001Ol-DP
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrI-0007K1-Kj; Tue, 11 May 2021 00:19:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrG-0000TQ-IV; Tue, 11 May 2021 00:19:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id s6so21193029edu.10;
 Mon, 10 May 2021 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvjYpJUwPPmwk0d8vTJ2ieq8cyVViRv2inIUUD5YBiM=;
 b=qmq4tvg6RUAds/rdzUzYtEPdOXhRk+Tjfa6JfMaJ07NWZUxWuPmFRRPe3qy9Psc2CZ
 dOIj9N2rQJP5sf7Vh6UvT0vXXoV6dsLYzkD2CZcB82KwXGz2A6jhjy0rK+QsaxvalA58
 clTs/yFpPEuLj6zMqWSMfs1yCSleeF9EnCW+YmBCRgZ7LdRLWX8YJc9Ez6ReQEThSNH/
 79cvXPP9OY3k/m7s7FyqB1FDPs2Q+93fedUOB5ENGF+jjxVko8K1lfHq/9gekdWcIiqn
 FzmAJgGXIUR9nDo2kS/lGttQuiE26J4Q9n6R2XpGXba7Wxxu7orBhZ5tmxZfmioH/FQV
 Hfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uvjYpJUwPPmwk0d8vTJ2ieq8cyVViRv2inIUUD5YBiM=;
 b=ZibRXgnRZ2xw8+jfG4ej3qrg1pIGhLfk2OlFNM5URMf2T0n/qlbi9gnJZGcbM8wAA3
 za0n/wCvmSSwhYAT0u+kOSHGeq0fjWURURfhDw9reKN9BovzmtPfKORfiMExUBJuSky1
 pz4Cv0sLtDnbNxYAr4+H0SkX1xfL+jEjfkY8R5CH/Zc/61Z9AjhgbMHl8viQiXBE+27u
 q5xDYm/T6v8f6xifxJHiu8KAjBBySxax503Y0sdNo/Hp3MSbs0p+DqswbSH0n5wkfqr1
 KOuv9UAGSjoyRPbolPLDaYx0xuUe6g+Pxl2N8XZ8z6iETyqt/e3OSMlnDwT5CpZ+XgtO
 6MSA==
X-Gm-Message-State: AOAM533NHl9naBimyFWL8Pu3qcPbXMldUDsjCAAP6RELRTsWjPo6q0DC
 sWX7aXJEtIaS5QYqdV/39+tQRkytCmGFzg==
X-Google-Smtp-Source: ABdhPJzmMxF7DAKKFb0gxgyqSH3oZLW1u6D8aKiTlq5BPjKA0AW6N3h5uRrhDC4AwlAB7JnB/YObUg==
X-Received: by 2002:a50:fc0b:: with SMTP id i11mr34512393edr.259.1620706736519; 
 Mon, 10 May 2021 21:18:56 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 11sm10228499ejx.55.2021.05.10.21.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:18:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] hw/isa/vt82c686: Name output IRQ as 'intr'
Date: Tue, 11 May 2021 06:18:43 +0200
Message-Id: <20210511041848.2743312-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511041848.2743312-1-f4bug@amsat.org>
References: <20210511041848.2743312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Named IRQs are easier to understand in the monitor.
Name the single output interrupt as 'intr'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 2 +-
 hw/mips/fuloong2e.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f57f3e70679..b177016125d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -615,7 +615,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     qemu_irq *isa_irq;
     int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c1b8066a13b..3e7a7e4389d 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -204,7 +204,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
+    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
     pci_ide_create_devs(dev);
-- 
2.26.3


