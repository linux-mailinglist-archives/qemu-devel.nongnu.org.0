Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182468AADF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKBy-0002Oa-PX; Sat, 04 Feb 2023 10:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBw-0002NZ-4J; Sat, 04 Feb 2023 10:11:00 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBu-0006a3-Cu; Sat, 04 Feb 2023 10:10:59 -0500
Received: by mail-ej1-x634.google.com with SMTP id m2so22876227ejb.8;
 Sat, 04 Feb 2023 07:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iycG/CYzi5qr7Pya6NhclvK6Ts8hrm+dv8CLlGtddE=;
 b=IL6I6keXxU5QiwlRSgq7W9jNNPgXuQ+RbXsuVIon+EsEhFk2Pz7ZetpZl5Py9AzYWO
 EbGSd+Op3hWJvy9nNbOTaGwb7xAjfRFTVutXM9RH49Ryc0hrr2LYNhTi85DL9fWvl+JL
 iymufPr/sGw39TNTaNoATAA1F48Sr0hJlZOQWY/Ui2471xJz8LF96f0Lr8yKOVE4DOBy
 uFm0ajU5i0CxXyncHv3ux45llDNPNsBfUAeqpyVXx7ej+HXxaFF93RcljYyG8rqn9BP6
 rvEOv9nZCFEITBr/FigYg1oGLHAfXT3QjuShjJEU60owV3DtXu7ipCjZzfgpYe3lNs9c
 OYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iycG/CYzi5qr7Pya6NhclvK6Ts8hrm+dv8CLlGtddE=;
 b=NSnCGtqQ6sAgSdvpNfeu9ZSKIR4k/3MJaf8jmnMEc4VtTFSP2JeKtPueJvSWbpSzyL
 3ZFKrDpREA7z4Zx38PE9s0hw24ndOHRFBN+qJZ4EGzxOzZ9JL+TAKrywTzkx0SavF61v
 DidBbQ6qZ8T1fosRI2qOgCDKCibBDp0Wf7DN5I12nNSHoB0sTDwI303ZKtgTYfSQqLlQ
 wxzJ5yccq8jSZwixRvdqwRd8GRaDdbhiKD3wtXu5k76JAWdsHix9VK6WCNjemUm4iviI
 kXNSjzePcJSKkOeOhhOhoGgokI5mefriBFktON4HJZqVCAAhwaQRaAwgKc6f0S0oRkEf
 RDXg==
X-Gm-Message-State: AO0yUKXa7vUbuJ78iwJxwoA68GdO/DqwBPOIFS4DcXHvOz9qJUMS4GVk
 1U4FLWVLPYPxON5f5jX9hd4O04NzXvc=
X-Google-Smtp-Source: AK7set+HvxgNr+CeLGIYEV8hD5SgMiQsb06bB125tFisVIP6N+RrReltkNmig0jZ+FVVL+4xs/vKTQ==
X-Received: by 2002:a17:907:8d16:b0:812:d53e:1222 with SMTP id
 tc22-20020a1709078d1600b00812d53e1222mr14342456ejc.31.1675523456421; 
 Sat, 04 Feb 2023 07:10:56 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:10:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 1/9] hw/pci-host/i440fx: Inline sysbus_add_io()
Date: Sat,  4 Feb 2023 16:10:19 +0100
Message-Id: <20230204151027.39007-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

sysbus_add_io() just wraps memory_region_add_subregion() while also
obscuring where the memory is attached. So use
memory_region_add_subregion() directly and attach it to the existing
memory region s->bus->address_space_io which is set as an alias to
get_system_io() by the pc machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci-host/i440fx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 262f82c303..9c6882d3fc 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -27,6 +27,7 @@
 #include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/i440fx.h"
 #include "hw/qdev-properties.h"
@@ -217,10 +218,10 @@ static void i440fx_pcihost_realize(DeviceState *dev, Error **errp)
     PCIHostState *s = PCI_HOST_BRIDGE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    sysbus_add_io(sbd, 0xcf8, &s->conf_mem);
+    memory_region_add_subregion(s->bus->address_space_io, 0xcf8, &s->conf_mem);
     sysbus_init_ioports(sbd, 0xcf8, 4);
 
-    sysbus_add_io(sbd, 0xcfc, &s->data_mem);
+    memory_region_add_subregion(s->bus->address_space_io, 0xcfc, &s->data_mem);
     sysbus_init_ioports(sbd, 0xcfc, 4);
 
     /* register i440fx 0xcf8 port as coalesced pio */
-- 
2.39.1


