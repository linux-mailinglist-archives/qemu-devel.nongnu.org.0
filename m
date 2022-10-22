Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53342609604
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 22:09:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgoX-0002Wr-7b
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4a-00072K-No; Sat, 22 Oct 2022 11:06:04 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4Z-00022R-6f; Sat, 22 Oct 2022 11:06:04 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so16067643ede.8;
 Sat, 22 Oct 2022 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jA1SDPeK2ToD4+n7uN+7fLnNFWowNdP73qPzh6JImnI=;
 b=P4FNIyYoO6zLOLiLJgn+UP70kMfg7xJDAW2c53DZEo/7Ipcy5esMJL1mjeWZtHW2Tw
 8Ot1yW+jeJUoXsdh4SBZJ1hqP+h5EZ8nqVabbnVpaP0wfDHjw3GJNVHUk9en1AxOPTjV
 OcKcoHwLSHWAj2q2qxAO6T/CK0q8vwuOyb7CkHuZcwk55kkBsekTSYG6hOqI931EzUv6
 qmwNaXGqbmpjQIONpiGGMRzKMusOvcQ8d1ebgsM6GjOnCPFqy1jjJZ8EkRWoZbMg1pO3
 OG/U0hqRPl4qiQ1mEt3/nUP5Nc8xof9Zx+xUUzFJxTsCpFWg4oeRFJR7lIKUj8kdqMgL
 ac3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jA1SDPeK2ToD4+n7uN+7fLnNFWowNdP73qPzh6JImnI=;
 b=3KK5jRAoYDCGkH+q7BCPLwnUbJClxoEO3133IaS9Yg5LKXx5+zD45Vcwt7hmNXD5yN
 rPDT7cv5yInoxfJQkCbg8G7spNR4TvP5zv41cNfgBY7YzCvp0l8/Vvn47TmJLRQRin4H
 vrzQ4E4xLONZ0nt4UoSoR4AbHHigyRxjdabjke5j4MfEWT6gDAo4iIopd4bktx1G6/ZA
 PrKVH1jyrVdj1oArQ6uPtYs2C/KKxNgLRIwvKX//WbIzmaUorg8IcM/bUrD0C+NWp9dn
 zfFroQJ61kVpHabmPqefn4UXPzCJagKisTEuSzYiE2RGdrg8LMg2VDHJZU3ZnTqMetVU
 QP3Q==
X-Gm-Message-State: ACrzQf0ex+nP3FryKZQu2aufDtI5pJTs5XIMs6h9iLV/71+nm46bz5wz
 L3jp+syBIY25NtdxFEUkSM3mOni8SEzpLQ==
X-Google-Smtp-Source: AMsMyM5QGJ4AQYzVd/VymUA8lyKvM09RGq3PvIadpMhfdA7JMBMp2YMhnjRG6zVYULxzohn3DgvN1A==
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr20556686ejb.426.1666451161453; 
 Sat, 22 Oct 2022 08:06:01 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 05/43] hw/isa/piix3: Modernize reset handling
Date: Sat, 22 Oct 2022 17:04:30 +0200
Message-Id: <20221022150508.26830-6-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than registering the reset handler via a function which
appends the handler to a global list, prefer to implement it as
a virtual method - PIIX4 does the same already.

Note that this means that piix3_reset can now also be called writing to
the relevant configuration space register on a PCI bridge.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 72dbf688d9..723ad0a896 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -31,7 +31,6 @@
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/xen.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
@@ -156,9 +155,9 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(void *opaque)
+static void piix3_reset(DeviceState *dev)
 {
-    PIIX3State *d = opaque;
+    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; /* master, memory and I/O */
@@ -313,8 +312,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
-    qemu_register_reset(piix3_reset, d);
-
     i8257_dma_init(isa_bus, 0);
 }
 
@@ -337,6 +334,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    dc->reset       = piix3_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.38.1


