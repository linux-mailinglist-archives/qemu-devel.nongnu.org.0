Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D936A8B1F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:23:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNZ-0000jv-S0; Thu, 02 Mar 2023 16:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNX-0000iy-JE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:19 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNV-0002Pr-UT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:19 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so2431342edy.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmugA3fzaeNvlM19J/fLc0olU36YpaC1a2NgOcFBtws=;
 b=EzOjY1AYBnUzNQlH92kS2I/1ij6HEtVnP3ussoBGUZOWSmXiJs0+4ng6JSuPsttMBn
 jEWJIT1cMCk4v8sfueSHiWjz5AOvfhxObzd/zYFzdX5Pzh7Ow90b9p1xAxh7tuKAVzsM
 hQVmcrkCL3/4NoQqbak2K5NwYGO5wC9epwb47ZP6IqSaTbWCDdpRWExJQ81uefCq7xJh
 m62hQuC7iAyjVHQuzlZ4z6ktkkAuMz9WTwRm69CjVW6d3vdv7dssRlg0PEqo9Sr/OQ13
 OE7T98FsyCbqtgo18dhg0bjsob89ro68uLaZb26GFEUj3xE1nOwuBZ129zkMuzb0FhZW
 nUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmugA3fzaeNvlM19J/fLc0olU36YpaC1a2NgOcFBtws=;
 b=k9/4k6X4gv9kX3uUcaeciFHGx2FGAd7yn2XBxKXU7ytl+KhY/APSDRFNzend2HPzt9
 e9Fa+InzCYk6M/77V9a7R7+DjPyfBUNDMj2Vall06ZteYP4FomMJPigK2k52NXNrr/mt
 ImOOpfES6p0jXLLV+HHa38CE3jhwo8m5fXNTOu9pQCpBzuWwLG/PRT+378Md/DbPLmZk
 tD4/I7IUWmAqdfVbmEUVGfPvRFEmtSoVl9tZ4j4RA9FXT1M/2+9KaLEUAxrxZgtuzavU
 6VPirZPI1VbvW3Ad9T7NbEj4DLkS0eqSvkwCPimFta57FmlDIRYizH8/FC65qzKXeCWu
 puSA==
X-Gm-Message-State: AO0yUKVim+Lx6ZccSw0hlnPtWEaaPurDkDxt3F+JRpDLaAaXuBIw0pNC
 TgxTjW+8z2QJXP+/P+E8eLxjC6e0ugw=
X-Google-Smtp-Source: AK7set/8hdYYu4q2u7Tb1s66dadkhjkrWkf+W10+PP5OOF815pon0TDNPpAGxrrTvE7S6q7q7ZdhgA==
X-Received: by 2002:a17:906:4cd9:b0:8aa:c155:9233 with SMTP id
 q25-20020a1709064cd900b008aac1559233mr11421376ejt.26.1677792136303; 
 Thu, 02 Mar 2023 13:22:16 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 06/23] hw/isa/piix3: Move ISA bus IRQ assignments into host
 device
Date: Thu,  2 Mar 2023 22:21:44 +0100
Message-Id: <20230302212201.224360-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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

Having the south bridge assign the ISA interrupts to the ISA bus itself
makes the south bridge more self contained. Furthermore, it allows ISA
interrupt wiring in pci_piix3_realize() which will be used in subsequent
patches.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 6 +++---
 hw/isa/piix3.c    | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0295336d80..50a64f0326 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -246,10 +246,10 @@ static void pc_init1(MachineState *machine,
         object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
                                  x86_machine_is_smm_enabled(x86ms),
                                  &error_abort);
-        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
-
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
+
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
@@ -260,6 +260,7 @@ static void pc_init1(MachineState *machine,
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_register_input_irqs(isa_bus, x86ms->gsi);
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
@@ -268,7 +269,6 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_register_input_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 27bd4dbf65..2e32a61647 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -302,6 +302,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
+    isa_bus_register_input_irqs(isa_bus, d->pic);
+
     i8257_dma_init(isa_bus, 0);
 
     /* RTC */
-- 
2.39.2


