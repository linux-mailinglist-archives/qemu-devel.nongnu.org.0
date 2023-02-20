Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633369C797
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2HJ-0007dG-36; Mon, 20 Feb 2023 04:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gl-00072t-Ke
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:40 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gi-0004Ge-TV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so313774wmc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3d3dAgvSU7y0t40ls900hD5+K9cJXXT4fSGii8WVS2E=;
 b=kkMjx7GgkkZi3BsfS4ITbV34M7i21b/ozd5L/2r+vsRBOg25IxsFkW5K52pdeGhDbE
 CzbL6pdQSOaJiRYvMEJsSieuuCB8qPjHjya7Wbz82+ZEezhYEY5ToCmD02ZfeaeC8uXy
 R4uOg9UzGgutypzYE23m5pGzkw9+l5AmNBFScFKI2K49VQfGzGtJVgf9AlT31UyiUhno
 ufUmwNSkL2C5NIQqMSVdSsG80TMNBFFpbXNLt2Oemyq/5Dxi45SJ4Urb0pVD+bRaBR2t
 VonQzmL8X12rCmjt9wdIEE8ClwQsfCa87HVBEbdxJ+WdWXl+2sL+RI5sU1B7j9BpTWmc
 yJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3d3dAgvSU7y0t40ls900hD5+K9cJXXT4fSGii8WVS2E=;
 b=wOy+uSQ48FNb84L0BAaEksET2wLfScqM3UPFUDEUOKDJ8NekA9vQtO4n/z5QCZX1fI
 8w/h67wCyw9MxBgon5uIygorqZlswOrnpYpZzbrkkY462THxJ/TShPz/WPpYnZQ/aY7l
 IOT+35ZaBhi6jH7VaJVar/YLPEDclx9dVJkZhwz2mT+7O2FdMYCdoa5SJPuw6Eerdjsc
 NIIQYyET7SVC5KhFYU/lfyfDKGHtIU8zNZVHt8wCm6tJ1EMGRDWWWfdiAyj2WhPLLKrq
 spgMKc2gOE7HlBNquU+NChNOGPGGYWOnfPXHQrv0BUycTW1NWsQOEQAhN7vvxiVnT3tI
 tOjw==
X-Gm-Message-State: AO0yUKXHxDGa0u0n6tib8T9g4PKUtIDs0xZIDpHG86i2GBSresPFvVnO
 tiZzUzYPsUhTzT3vibg+fMjDPr9XCYCs3Qlf
X-Google-Smtp-Source: AK7set8jmAK1WUVHcqSvF+p5H+miBbAUXqM+ngXfqZzbMnr+cO0+hJc13XZUbyOhLkF2x+d29D40Nw==
X-Received: by 2002:a05:600c:3316:b0:3dc:42e7:f626 with SMTP id
 q22-20020a05600c331600b003dc42e7f626mr6301754wmp.26.1676884531368; 
 Mon, 20 Feb 2023 01:15:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003dd8feea827sm10216609wmq.4.2023.02.20.01.15.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 18/24] hw/ide: Rename ISA specific ide_init_ioport ->
 ide_bus_init_ioport_isa
Date: Mon, 20 Feb 2023 10:13:52 +0100
Message-Id: <20230220091358.17038-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Rename ide_init_ioport() as ide_bus_init_ioport_isa() to make
explicit it expects an ISA device. Move the declaration to
"hw/ide/isa.h" where it belongs.

Message-Id: <20230215161641.32663-13-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 4 +++-
 hw/ide/isa.c              | 2 +-
 hw/ide/piix.c             | 5 +++--
 include/hw/ide/internal.h | 1 -
 include/hw/ide/isa.h      | 3 +++
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..7156c465da 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -35,6 +35,7 @@
 #include "qemu/cutils.h"
 #include "sysemu/replay.h"
 
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "trace.h"
 
@@ -50,7 +51,8 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
+                            int iobase, int iobase2)
 {
     int ret;
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 95053e026f..6eed16bf87 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -71,7 +71,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISAIDEState *s = ISA_IDE(dev);
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    ide_bus_init_ioport_isa(&s->bus, isadev, s->iobase, s->iobase2);
     ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_bus_register_restart_cb(&s->bus);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2f71376b93..fc44c261cc 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -38,6 +38,7 @@
 
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
+#include "hw/ide/isa.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
@@ -140,8 +141,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
+        ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
+                                      port_info[i].iobase2);
         if (ret) {
             return ret;
         }
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index d9f1f77dd5..d3b7fdc504 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -618,7 +618,6 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_exit(IDEState *s);
 void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
-int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
 
diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
index 1cd0ff1fa6..7f7a850265 100644
--- a/include/hw/ide/isa.h
+++ b/include/hw/ide/isa.h
@@ -10,11 +10,14 @@
 #define HW_IDE_ISA_H
 
 #include "qom/object.h"
+#include "hw/ide/internal.h"
 
 #define TYPE_ISA_IDE "isa-ide"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
 
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1);
+int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *isa,
+                            int iobase, int iobase2);
 
 #endif
-- 
2.38.1


