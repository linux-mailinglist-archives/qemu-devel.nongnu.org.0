Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E550346DD2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:20:47 +0100 (CET)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqKM-0008G6-II
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqEC-000898-HE; Tue, 23 Mar 2021 19:14:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqEB-0004vr-1d; Tue, 23 Mar 2021 19:14:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id z2so22552625wrl.5;
 Tue, 23 Mar 2021 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3a+HGyI7KD3Ew+RNtm2N2A+m/+QQ+Xa+aHzvmMpU2j8=;
 b=SkxObxIQxeD5qsuG0LUtPT+ZQe0sGbsBkDCFCA9p4SIgVXXKVlQjT7vyk1qJLrrEMH
 6yU7Ryk2IoWxI/YeHCWsoK7sJScHbF9V1tz6uoZwqskpkEUcDSRWZ98ZCZwcjxGrKIY3
 TIALF3N3HQdJOlhXDEPkUw2W7h1AU4UwMngW0w56ZTswL+kI8bs2Z71zjZQ6CqQ1iiCv
 YLWNHNhxKOtysGMIErFkPcOj4D1lMPOzBWJ3RxDA2HrsXhT/EgEzfMDQpgM0jXU2Uhfn
 7B8AwHkPrZk25ptlkdpL5xEtpmf+WJbGodUGqNHvHHDLYJO1tMbICXd7hpr79LXmd+72
 eSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3a+HGyI7KD3Ew+RNtm2N2A+m/+QQ+Xa+aHzvmMpU2j8=;
 b=Ehdrl36PVKavgf+FSnQMlataQvwNHJ2deb6Nhqcel+t8nUbWyzqfWjWOYcgO5j2VyH
 sZDJE/eAkYquJD3Z4AcoOTLl6HbEGM13ixS994zdjUG4+Yhl4rFOCrz46Nab/M1FQBLZ
 /uQz3GedircEZUjIVjG6Z9UXEdSTxukrgU7i4HTc8tp2zT6qnDmNVmU3vkw9VO8c7m4y
 R913Wg+r6IIWP6gcJp2Pb0ThpKr7OwXMmcqSxJnnnZnG7kHQzJ5nuWyU005dQ1QKvVNw
 NOTB7m3ghbkrE8Ju0jMbgVp5isDbYGGY7mO7vEcO+2eBX84dPyD+rAJffPvkwmgtlOLD
 kY8Q==
X-Gm-Message-State: AOAM531HGtKvaV6WO680RfxH5dAO8W6BY4NnDn4KNGTFKo0lxUKXoel4
 SFiBVoqsaXkkckDCr3LousU/tDkAwOJA+A==
X-Google-Smtp-Source: ABdhPJyYKc0C5evaS3iWXj+2CWlFoUvA2EpnS08gh7bRTgeEc6Y8e2hChepYD/RuFDuwkf73YSVZRg==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr289901wrs.83.1616541261203;
 Tue, 23 Mar 2021 16:14:21 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm475865wrv.47.2021.03.23.16.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/isa/vt82c686: Name output IRQ as 'intr'
Date: Wed, 24 Mar 2021 00:13:56 +0100
Message-Id: <20210323231358.396520-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
References: <20210323231358.396520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
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
index 05d084f6982..87473ec121f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -387,7 +387,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     qemu_irq *isa_irq;
     int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 4f61f2c873b..931385c760f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -206,7 +206,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
+    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
     pci_ide_create_devs(dev);
-- 
2.26.2


