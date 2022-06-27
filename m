Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893355B82A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:24:21 +0200 (CEST)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j6a-0003h2-MP
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izN-0003ev-48; Mon, 27 Jun 2022 03:16:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izH-0003sv-D8; Mon, 27 Jun 2022 03:16:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id o10so11653449edi.1;
 Mon, 27 Jun 2022 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Owsck5Aw6Urq8fF1sfCFdLXNiN0ri19YPUA3MBR7xfA=;
 b=nVjfnpAXbD/IT7+jmfqopuIO6OmTo7ARqGTNXmo/Z5xpMAt8kyhGD6T6skRHBrDEp5
 lHHTRYYHy+77RGxVbZhNVL+M3VV4anBiQaoTwjqG6fnDjMqEHKpnpEcLfeJhwxY9+prc
 faHAfFI0byPPkVaaDBHSUPQOvwo5+rJfWtTTCVOXuQV2XbAepGSv6P94wu5JmPNRlK6m
 O0p4dRqib2Smar680WMbh/CvyL6fVe13TuI4FC2YRVHrgEOGw9NapS1tm41Pz/3F/SPw
 /0wfxodGcnS87kJ1fos5aFcYsdxta2wiAt3vJ7it49wcS0awfADzJyX/W696pJR7TKMm
 WEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Owsck5Aw6Urq8fF1sfCFdLXNiN0ri19YPUA3MBR7xfA=;
 b=6pLxDVM+z3kXYrhoTMbaEF9ucbbCr58Ejuw1eFw3N6ZGmJD5L8EYnXaAb9h0kcjRtH
 q4eTUsELnbAnBKqnXeEmqNY/kVvYXU2AncNBNtXrhOfTIHrIQunBLcbDGHiLfgCvEmWg
 6b008WsvSTBOgoa6L9uI7oNC1andmkENI+lhHGaJ41eF0M5n0mW24NtPtfGcSobXZ2RG
 FlWEOPZeiYltzHQa332FwIDsyuAkWamJK1mSVcUGtuDsN/v80hiYTWxE2WGNPfffVq5Z
 37S8ZptxBQAX6u4GslugFQeBWIK+2PvSWL6pGcgfKHmzSR/KTn75F4vBlDFUFFC8JKI1
 G28A==
X-Gm-Message-State: AJIora8jdkpGI7lh9BWcjbMOWShRQmJF6tQLnIxRPfAEL+/44hMRH9zw
 vFm/i2HijXUy/D37ZExjZEVgnQSKNKUN3w==
X-Google-Smtp-Source: AGRyM1uPJEZ6Bmo98wpFZHjeRQapFXL+ghqR4Lq7pgnxZm2JFcKUt0st3q9YKwVtsSyPKhit//hjaA==
X-Received: by 2002:a05:6402:d6b:b0:435:7170:cf15 with SMTP id
 ec43-20020a0564020d6b00b004357170cf15mr14595161edb.314.1656314205256; 
 Mon, 27 Jun 2022 00:16:45 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:45 -0700 (PDT)
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
Subject: [RFC PATCH 02/10] Revert "hw/ide: Fix crash when plugging a piix3-ide
 device into the x-remote machine"
Date: Mon, 27 Jun 2022 09:16:03 +0200
Message-Id: <20220627071611.8793-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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

Now that the PIIX IDE device models check for presence of an ISABus before
using it, this fix isn't needed any longer.

This reverts commit 9405d87be25db6dff4d7b5ab48a81bbf6d083e47.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/ioport.c           | 16 ++++++----------
 hw/ide/piix.c             |  9 +++------
 hw/isa/isa-bus.c          | 14 ++++----------
 include/hw/ide/internal.h |  2 +-
 include/hw/isa/isa.h      | 13 +++++--------
 5 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..b613ff3bba 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,19 +50,15 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
-    int ret;
-
     /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
        bridge has been setup properly to always register with ISA.  */
-    ret = isa_register_portio_list(dev, &bus->portio_list,
-                                   iobase, ide_portio_list, bus, "ide");
+    isa_register_portio_list(dev, &bus->portio_list,
+                             iobase, ide_portio_list, bus, "ide");
 
-    if (ret == 0 && iobase2) {
-        ret = isa_register_portio_list(dev, &bus->portio2_list,
-                                       iobase2, ide_portio2_list, bus, "ide");
+    if (iobase2) {
+        isa_register_portio_list(dev, &bus->portio2_list,
+                                 iobase2, ide_portio2_list, bus, "ide");
     }
-
-    return ret;
 }
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index e8f3abc4b5..21777ecc8b 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -134,7 +134,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int i;
 
     {
         ISABus *isa_bus;
@@ -149,11 +149,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
-        if (ret) {
-            return ret;
-        }
+        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
+                        port_info[i].iobase2);
         ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1bee1a47f1..0537a9f2c1 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -119,17 +119,13 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
     isa_init_ioport(dev, start);
 }
 
-int isa_register_portio_list(ISADevice *dev,
-                             PortioList *piolist, uint16_t start,
-                             const MemoryRegionPortio *pio_start,
-                             void *opaque, const char *name)
+void isa_register_portio_list(ISADevice *dev,
+                              PortioList *piolist, uint16_t start,
+                              const MemoryRegionPortio *pio_start,
+                              void *opaque, const char *name)
 {
     assert(piolist && !piolist->owner);
 
-    if (!isabus) {
-        return -ENODEV;
-    }
-
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
@@ -137,8 +133,6 @@ int isa_register_portio_list(ISADevice *dev,
 
     portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
     portio_list_add(piolist, isabus->address_space_io, start);
-
-    return 0;
 }
 
 ISADevice *isa_new(const char *name)
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 97e7e59dc5..348e7f2510 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -624,7 +624,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 6c8a8a92cb..8dd2953211 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -114,15 +114,12 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start);
  * @portio: the ports, sorted by offset.
  * @opaque: passed into the portio callbacks.
  * @name: passed into memory_region_init_io.
- *
- * Returns: 0 on success, negative error code otherwise (e.g. if the
- *          ISA bus is not available)
  */
-int isa_register_portio_list(ISADevice *dev,
-                             PortioList *piolist,
-                             uint16_t start,
-                             const MemoryRegionPortio *portio,
-                             void *opaque, const char *name);
+void isa_register_portio_list(ISADevice *dev,
+                              PortioList *piolist,
+                              uint16_t start,
+                              const MemoryRegionPortio *portio,
+                              void *opaque, const char *name);
 
 static inline ISABus *isa_bus_from_device(ISADevice *d)
 {
-- 
2.36.1


