Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883836980BD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUH-0000Bm-81; Wed, 15 Feb 2023 11:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTl-0007vy-3C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTe-0008Oe-G8
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so1944713wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8g1fN9ZadBbCVgP43lfSxFkkzaM8dsC3CGvZpofDcyw=;
 b=VSdcpfTHjUzd+NmSrrRpIjIvw6xD/kTm03egoZZ2rfaMbFm5L2P+SW4RgTZRVBwi8F
 gsDC2bNoPbm/xxq2M9Q8vuwpJWoXtUjbCP9HmzmvUfd4v/c90NBHO1pHMNYk53fV3N6N
 HYPXP18/Np8+RFhhNf23tMXo/4lpTF40E3Y9g1ziJ7jDfCGjkyYph4C15bL36PKsG4ar
 ZxaBqivjDTtBsk1XqGgtTnadRTBg6BntNpO7+7PacjzKDYefBnTPkEsuZGbINqBPfYeO
 8Bde3ATH87oc1REwzdHtAg8vfROUrT9wWxG4a9F5h1xkIQtBsW1pT+XtZgFMGBhUf20P
 0Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8g1fN9ZadBbCVgP43lfSxFkkzaM8dsC3CGvZpofDcyw=;
 b=o4GXWAR6btf0vfI9/xNPe1KJ6glKKoO7aWQhubN6NIZwEhj3Yu+3h0k3Q94X44oehm
 A6m/bCoLo5N621MlFqyEmdrUObgdwtW7vD9kXiTXGI0q0c8EQA/cJeUPyn7Fk01qKodb
 p0qO65x5XBi85Dw8UVGXl+saH/Ihu2euXN5C2LgxanjUAw9ahzBb/rmk41dU6g9IX+d9
 eWXrA9km7e/EjgXjbtzzqUL6RGEKKIUMYwyzsR5nAmZgvUxkPay+VhGMaVLmfHQ3Ukyd
 8k9oeB6+nwQ8O7GePD5XKDA3VoAjvLCNFaJ4JHGTom7QoopxRGxmkbV/Rf18MTmPvoRE
 EDOA==
X-Gm-Message-State: AO0yUKXTQkq5uqmv2BM7QBW/ybGn/paw2d+LLI45CiZe1QqUvjow7IJm
 v5u+eLGGwOZ/JKRZNqkxtL1+0ym0M/Ll84Ke
X-Google-Smtp-Source: AK7set8R41ceOalsejfIlOAAeicgkaogANwDnp7yT5O6Lo0WJJEbR3cNfRIx2KEmHiLjq5hX4lxnQw==
X-Received: by 2002:a05:600c:997:b0:3dc:5b88:e6dd with SMTP id
 w23-20020a05600c099700b003dc5b88e6ddmr2388542wmp.10.1676477869102; 
 Wed, 15 Feb 2023 08:17:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c1c0200b003e204fdb160sm2290594wms.3.2023.02.15.08.17.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 12/18] hw/ide: Rename ISA specific ide_init_ioport ->
 ide_bus_init_ioport_isa
Date: Wed, 15 Feb 2023 17:16:35 +0100
Message-Id: <20230215161641.32663-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
index e2ecc6230c..d869f8018a 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "trace.h"
 
@@ -40,7 +41,8 @@ static const MemoryRegionPortio ide_portio2_list[] = {
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
index b75a4ddcca..9b886fc0d2 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -33,6 +33,7 @@
 #include "hw/pci/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
+#include "hw/ide/isa.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
@@ -145,8 +146,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     }
 
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                          port_info[i].iobase2);
+    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL,
+                                  port_info[i].iobase, port_info[i].iobase2);
     if (ret) {
         error_setg_errno(errp, -ret, "Failed to realize %s port %u",
                          object_get_typename(OBJECT(d)), i);
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


