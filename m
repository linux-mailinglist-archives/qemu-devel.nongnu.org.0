Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06869CBE5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:20:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU64X-0002Gg-Jz; Mon, 20 Feb 2023 08:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64V-0002Fk-3D
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:19:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64T-000760-DG
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:19:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id p8so1315234wrt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QWW26zXAXrkV/pg8r+DTRtljT9tVsN1Ste5FUqYSr0=;
 b=WTXkfJK1Jj6vPQWUWO5JAdoWpxSdPRhMQof6MYlN4Dywl/X+re0BwNTf/3fQBgSlzG
 WQKiFm/AKzflq35HvzB7FIt5KHduxx/VnvwIK7XNbiPdl61q8sJslo/hVqfMlDaIUusH
 ZlpriSnlmRUSiftMmQ5KiskArMJvnOPWrgU8ShywM3jHttnUxcLlH9LyCLG9ooA36Inf
 aiNCgCtxhWuDloaqGRO4roS3NDelg9v+vxrf0zE2WE1EbR1vF/4q4VyqcGdJWKydomfI
 f7LTA/uJvikXP5XtJiiRB//lzK38ZtNOTfohItfQh06+25VMf7DnNJXOP4YZbeA32zr/
 2dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QWW26zXAXrkV/pg8r+DTRtljT9tVsN1Ste5FUqYSr0=;
 b=gU/oZoY6KNxhBCMksiQa2n+4USYj1MhNCG1+PB8Ql4zJIipCW3Ls0xDeSZuZWUPRKx
 q7sP4fhpiu7rh6APBujYyC/B3Cre3ddER/SkcgJYIxiUg74k8p2IX/8ghJBl0I3HePVg
 7tfvd9QjgexNI7I7Il7EnHjPWSAAb4I3aTSPBd9Hh3VMu4wo7Nh4GAtVdbO9A6O3DtLI
 MoFdAdJD2kZn+3g+7hxLRepw9DWks1uHCwp8qzhke8MUR6zVCKwnuyZEdv8v76ogqDlw
 Ibep1ebKTsgI6ZafV9r5C4oROKna4zdGMc+3OsTruueYpXwi8ZpmAgPrIY8odD31sqTk
 bz4w==
X-Gm-Message-State: AO0yUKXy5tbflYq/cgRRRssYafsC6IV8xpkCJARKl8jEkPqPyQWDJoik
 PzQwV4Amce8WEjlvodPOQ1ZMgzmIzkHp0ily
X-Google-Smtp-Source: AK7set+6JN1gfJ0akOx19NleM4fvSRrAgGjY6RCrG1vN7om+ixr7LZOsdHz4UjZxpEZH72H6BlRufQ==
X-Received: by 2002:adf:e301:0:b0:2c5:46d1:69e1 with SMTP id
 b1-20020adfe301000000b002c546d169e1mr1444651wrj.36.1676899148515; 
 Mon, 20 Feb 2023 05:19:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b002c559def236sm118731wro.57.2023.02.20.05.19.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 05:19:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 5/5] hw/audio/pcspk: Open-code pcspk_init()
Date: Mon, 20 Feb 2023 14:18:37 +0100
Message-Id: <20230220131837.26292-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220131837.26292-1-philmd@linaro.org>
References: <20230220131837.26292-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

pcspk_init() is used in 3 places and is 2-lines of code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c             |  3 ++-
 hw/isa/i82378.c          |  5 ++++-
 hw/mips/jazz.c           |  5 ++++-
 include/hw/audio/pcspk.h | 10 ----------
 4 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..73bd98997f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1319,7 +1319,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
             /* connect PIT to output control line of the HPET */
             qdev_connect_gpio_out(hpet, 0, qdev_get_gpio_in(DEVICE(pit), 0));
         }
-        pcspk_init(pcms->pcspk, isa_bus, pit);
+        object_property_set_link(OBJECT(pcms->pcspk), "pit", OBJECT(pit), NULL);
+        isa_realize_and_unref(pcms->pcspk, isa_bus, &error_fatal);
     }
 
     /* Super I/O */
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index e3322e03bf..f0964cdcd9 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -68,6 +68,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     uint8_t *pci_conf;
     ISABus *isabus;
     ISADevice *pit;
+    ISADevice *snd;
 
     pci_conf = pci->config;
     pci_set_word(pci_conf + PCI_COMMAND,
@@ -102,7 +103,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     pit = i8254_pit_init(isabus, 0x40, 0, NULL);
 
     /* speaker */
-    pcspk_init(isa_new(TYPE_PC_SPEAKER), isabus, pit);
+    snd = isa_new(TYPE_PC_SPEAKER);
+    object_property_set_link(OBJECT(snd), "pit", OBJECT(pit), NULL);
+    isa_realize_and_unref(snd, isabus, &error_fatal);
 
     /* 2 82C37 (dma) */
     isa_create_simple(isabus, "i82374");
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..a4e035cd66 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -144,6 +144,7 @@ static void mips_jazz_init(MachineState *machine,
     SysBusDevice *sysbus;
     ISABus *isa_bus;
     ISADevice *pit;
+    ISADevice *snd;
     DriveInfo *fds[MAX_FD];
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     MemoryRegion *bios2 = g_new(MemoryRegion, 1);
@@ -252,7 +253,9 @@ static void mips_jazz_init(MachineState *machine,
     isa_bus_irqs(isa_bus, i8259);
     i8257_dma_init(isa_bus, 0);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    pcspk_init(isa_new(TYPE_PC_SPEAKER), isa_bus, pit);
+    snd = isa_new(TYPE_PC_SPEAKER);
+    object_property_set_link(OBJECT(snd), "pit", OBJECT(pit), NULL);
+    isa_realize_and_unref(snd, isa_bus, &error_fatal);
 
     /* Video card */
     switch (jazz_model) {
diff --git a/include/hw/audio/pcspk.h b/include/hw/audio/pcspk.h
index 9506179587..6be75a6b86 100644
--- a/include/hw/audio/pcspk.h
+++ b/include/hw/audio/pcspk.h
@@ -25,16 +25,6 @@
 #ifndef HW_PCSPK_H
 #define HW_PCSPK_H
 
-#include "hw/isa/isa.h"
-#include "hw/qdev-properties.h"
-#include "qapi/error.h"
-
 #define TYPE_PC_SPEAKER "isa-pcspk"
 
-static inline void pcspk_init(ISADevice *isadev, ISABus *bus, ISADevice *pit)
-{
-    object_property_set_link(OBJECT(isadev), "pit", OBJECT(pit), NULL);
-    isa_realize_and_unref(isadev, bus, &error_fatal);
-}
-
 #endif /* HW_PCSPK_H */
-- 
2.38.1


