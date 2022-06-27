Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A04C55B826
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:20:21 +0200 (CEST)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j2i-0007Tv-Dh
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izQ-0003fu-A7; Mon, 27 Jun 2022 03:16:56 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izN-0003tm-7n; Mon, 27 Jun 2022 03:16:55 -0400
Received: by mail-ed1-x536.google.com with SMTP id z19so11571026edb.11;
 Mon, 27 Jun 2022 00:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o52L6RrnUDqK3SXfYbgJj8ZZPWiN199qyUgLPkMswD4=;
 b=dH6kcn37vLGmjZ9WONTRNbv/u5UGzZB95B6TKToUsieK8So7rw/kGsjzqINksUZd+m
 Vf43U4UnI+JJM4s82ARZT8ArjkmtgFir5sYnWg7B9ec+YsmrIMqoI8Sjtc0Sg9V5EfX0
 0qHagT8cG0zXRHwDOJb+5FzSCex37O0BN6jtH3Mu56pt7FLCcpEqO7t/rkTC1fQCKsuZ
 TWahoCT9Zo9gSQ0cEg1tCALGWncrdWFMFatsnTS9CneEuLRTRPxiUjVaZ96Ao+7HkVvz
 8Ho/7+zFkBbj2Sx4MNkGNA4vejFtWaDLLC9GvGdj+LqpFR5Px7Pc7CDMIiljS/v0XDP7
 pvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o52L6RrnUDqK3SXfYbgJj8ZZPWiN199qyUgLPkMswD4=;
 b=7wxougw61S2gnAIZD3uwWGUVWc3i5OvwClcqs5lJd94OGpvn/1HkHmvWzDXLUU5UP9
 NDqKPGAgurH9AYKERM5eYTDdIPf5C0Fw/gI3bw8VJlTFzGRFxv2ipxxHAFtzqikaR4In
 MBIyP18vFHUFu+rPYR32S2s5fjWTMIb42JRQXj4EMzWUhdC+7nDEQcc7Fwy5C2ujM3h1
 hHs3Y+VYljROuyEnwge8Kgz4QomJGd2je/mpJE8I2mqLf43byc+zn7Tm4SAkGa1hO7lK
 z4srhyhntjAEj7RxpNPnWVgRspQOgMtlhIVYwFf9ZtYPOJ4h6bmruHmi3bSkt6HWwiGV
 Rl5w==
X-Gm-Message-State: AJIora8HVZ5QdgkeB0sFmvIpLcFEzhlZiiea8pmpnhw9UD1zrzGLCzOw
 gKhCURwTSLTXB5WahLY6w6cL1pWb7Kq2kA==
X-Google-Smtp-Source: AGRyM1s8pZBrMtrYtjKYDyu8ysrrb5P6yz1bIXQGs3VkEF5n5zZfr+UGEdtOs/YXIMnFS+3B5NBKxw==
X-Received: by 2002:a05:6402:34c2:b0:436:7edf:ba with SMTP id
 w2-20020a05640234c200b004367edf00bamr15196652edc.67.1656314209658; 
 Mon, 27 Jun 2022 00:16:49 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:49 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 06/10] hw/ide/ioport: Rename ide_init_ioport() to
 isa_ide_init_ioport()
Date: Mon, 27 Jun 2022 09:16:07 +0200
Message-Id: <20220627071611.8793-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ide_init_ioport() takes an ISADevice* parameter which eventually gets passed
to isa_address_space_io(). Unfortunately, there is no ISADevice in hw/ide/
piix, so NULL gets passed instead. This causes isa_address_space_io() to
resort to using the isabus global - which we want to get rid of.

To resolve this, observe that hw/isa/piix* models pass PCI's IO address
space to ISA which can be used instead. The next patch therefore introduces
pci_ide_init_ioport() which takes a PCIDevice* parameter instead and is
available in hw/ide/piix.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/ioport.c           | 2 +-
 hw/ide/isa.c              | 2 +-
 hw/ide/piix.c             | 4 ++--
 include/hw/ide/internal.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index b613ff3bba..ed1f34f573 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,7 +50,7 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+void isa_ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
     /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
        bridge has been setup properly to always register with ISA.  */
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 8bedbd13f1..79ed33aefa 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -74,7 +74,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISAIDEState *s = ISA_IDE(dev);
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    isa_ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
     s->irq = isa_get_irq(isadev, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index fbf2756b47..312611c61f 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -161,8 +161,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), dev, i, 2);
-        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                        port_info[i].iobase2);
+        isa_ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+                            port_info[i].iobase2);
         ide_init2(&d->bus[i], qdev_get_gpio_in(dev, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 348e7f2510..86ecc04ce4 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -624,7 +624,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void isa_ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
-- 
2.36.1


