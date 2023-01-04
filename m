Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C040265D678
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:47:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD51W-0005H4-26; Wed, 04 Jan 2023 09:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51D-0005F3-77
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51B-0002oD-E2
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so33152183wrz.12
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwwBmjkQ+lNHH0kKiW9e0yfr8jRksndzOx0yQHLnF3U=;
 b=Wch2+6IG0obcLWirCwO0uN2viNNRWGwjqAFhW/ZYw1fchDlIbgWmuB3c8dlern5JGN
 4zUs9Y2GjuybCLMXzn2i3IB2HpMdnJ3HOfcR0Id/ZqbSM3D2zZU/HKa/camSQegFxTMw
 AHdCTPkE+aAGidOO551rDDq7D9WH+cxg/4sMPHQ+cM+9wzSWfesq1yH6xy47O9xTEoFd
 eZfdHHVnJEmwB7VwCBj9m9+mWDLchXhhkYcMqSmiWNviCG4U3NvQshROvXH0TUL+D83f
 7bjrqMxVbRF0Ka56hPzfPNov9BdR1GZ9Rp8kUFHu/C6dGAo3y08PsXTkRemZcP/M5Y9L
 Ojww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwwBmjkQ+lNHH0kKiW9e0yfr8jRksndzOx0yQHLnF3U=;
 b=3gCrnAxbos4W80hXKtPYkcqeEB/8wPuNh5GoBe+kRULvgAH6El+fQv7S15tiEuttow
 A3XIONDGy4oLgIJRMaW5S6ZigI5DJyrGOU3S9pK7UqpqvnXsozXSAoguyBbI1S4QSzH8
 xmatolhAI0KwtSQJWHaVzNchSXK6XiRA+HussC59nRuQdrZ71s+vxV9gJPdEIdAEyMOL
 DHq6Dp8m8vPZWeDpEtzNopfAuaqH6+4NUf+YcAkiX8sim6ZNRP8txlEi2lpJXCF4E4G9
 eiEcvhFFLljDMQ0ofY85NflX0Y0JF71zbU4Nn5HMTAzQzVNwILl3F9UX6hFtoDgQwkJK
 azYA==
X-Gm-Message-State: AFqh2komsqzjNuAOA3a0JGI9+b+h1J3Nnv03+WmCjqRnpq8EFqfvX4/i
 VA9XugfLL98yp2eM1vm5Viw3T2tuINWhyA==
X-Google-Smtp-Source: AMrXdXv1Bz9WYYfmdlxF76KLvJgFfsoIF1V0rIeHDad7Wu77HbMKWyWlh26v/oTTwkdlUrXJkWzplw==
X-Received: by 2002:a05:6000:1d84:b0:273:6845:68ef with SMTP id
 bk4-20020a0560001d8400b00273684568efmr24329892wrb.60.1672843523618; 
 Wed, 04 Jan 2023 06:45:23 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:23 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to
 xen_intx_set_irq()
Date: Wed,  4 Jan 2023 15:44:32 +0100
Message-Id: <20230104144437.27479-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
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

xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
while xen_piix3_set_irq() maps multiple PCI devices to their respective
IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
this.

Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
IOAPIC rather than PIIX has this many interrupt routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix.c         | 4 ++--
 include/hw/xen/xen.h  | 2 +-
 stubs/xen-hw-stub.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..558c43309e 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -142,7 +142,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
                            irq_num & 3, level);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ae8a27c53c..a7a4eec206 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -38,7 +38,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_PIIX_NUM_PIRQS      128ULL
+#define XEN_IOAPIC_NUM_PIRQS    128ULL
 
 static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
@@ -504,7 +504,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..7c83ecf6b9 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -22,7 +22,7 @@ extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_intx_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 34a22f2ad7..7d7ffe83a9 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -15,7 +15,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return -1;
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-- 
2.39.0


