Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B706AAAB9
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmy-0003Qd-9i; Sat, 04 Mar 2023 10:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmw-0003QG-1C
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:10 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmt-00089G-3S
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:09 -0500
Received: by mail-ed1-x52c.google.com with SMTP id j11so2098714edq.4
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/W+VUgC+caXUd610HoqXBs75wgT+eKX3O7KBVHfQnQ=;
 b=hrDCa6nU3EZ7HTzd5qVhjOiHj7qh8HrGPiYjLyY9a6q7K8+bTaIC0lQqUn3agc1ba/
 bQ4PeOhsqn3bHOm2Uy1paMnb2wamQ3zeCi9wQTsluHWzO4aCLGxRK7tOmHRChJCU0yCT
 RrAEbzrcRTTWZ4MDxbgYljYCiPfq4Idgv4Cx0NR3bPl2V2w3fRUAKFelfh+hgRFENqQT
 4IIpbYw4+6A2Rn5Sr2qiFGevepMybuOKOTtseKXdfkvaTa3+X/VW6AkVWCnXG7nY6pS+
 nUjlXH+ZG2aqarGuRfc+MZOaOAik6TDPYsyOv3i5b0h4HfxzkhPP8g1B2SXu5Vt819rM
 ITTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/W+VUgC+caXUd610HoqXBs75wgT+eKX3O7KBVHfQnQ=;
 b=E8WKLUf+URjwLKogWvFIuKFxWEL9MUj/MTpClZAAmoSjWqVukoG5gS/JklbepG6nKB
 Rxox8zBbUDhozfOtu085EymaqdysZI4gtZISKGbJeuwN/ekOwbQiaUa8Y+brhi9a78OP
 eMT60zoZ7ij/WHtkfjURigMI8w1Vta4qW+1Wjtlr3uuW07ND8JQ7zf+Z+aPS6GBxmK45
 FZqa8LZe2nkwYt0/UXH5hUX3Ttg509g7lq7DZHkBIeCSWbijYPYBt4cqPMO8IBrxKMob
 NCTwPkYZD3ay0wTfpECrw1w80UUnwDact1uVpdWuB9zw2b9odjUluyhS1mL+/1iWWANS
 GbTg==
X-Gm-Message-State: AO0yUKUK28zmydOwLbrzOIADVcmbouaX59fIBQ2i6vS/HKaj4gKOuuVg
 QG7c2amUtk9InzbKu9TLlZIRdXgkI4s=
X-Google-Smtp-Source: AK7set983FUWDjiAERr2vWEELDr9S+WZZXhDWuhBcs//nxRiz/I0L1P+5hvtqHJYFlxglT4YuJjriw==
X-Received: by 2002:a17:906:1846:b0:8b8:c06e:52d8 with SMTP id
 w6-20020a170906184600b008b8c06e52d8mr5079235eje.36.1677943626118; 
 Sat, 04 Mar 2023 07:27:06 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 10/13] hw/pci-host/q35: Rename local variable to more
 idiomatic "phb"
Date: Sat,  4 Mar 2023 16:26:45 +0100
Message-Id: <20230304152648.103749-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

Variables of type PCIHostState* are typically named "phb" in QEMU.
Follow this convention here as well for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index afd192cc2a..cf9fb35064 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -46,21 +46,21 @@
 
 static void q35_host_realize(DeviceState *dev, Error **errp)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
+    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memory_region_add_subregion(s->mch.address_space_io,
-                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
+                                MCH_HOST_BRIDGE_CONFIG_ADDR, &phb->conf_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
 
     memory_region_add_subregion(s->mch.address_space_io,
-                                MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
+                                MCH_HOST_BRIDGE_CONFIG_DATA, &phb->data_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
 
     /* register q35 0xcf8 port as coalesced pio */
-    memory_region_set_flush_coalesced(&pci->data_mem);
-    memory_region_add_coalescing(&pci->conf_mem, 0, 4);
+    memory_region_set_flush_coalesced(&phb->data_mem);
+    memory_region_add_coalescing(&phb->conf_mem, 0, 4);
 
     /*
      * pci hole goes from end-of-low-ram to io-apic.
@@ -69,12 +69,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     range_set_bounds(&s->pci_hole, s->mch.below_4g_mem_size,
                      IO_APIC_DEFAULT_ADDRESS - 1);
 
-    pci->bus = pci_root_bus_new(DEVICE(s), "pcie.0",
+    phb->bus = pci_root_bus_new(DEVICE(s), "pcie.0",
                                 s->mch.pci_address_space,
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
 
-    qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
+    qdev_realize(DEVICE(&s->mch), BUS(phb->bus), &error_fatal);
 }
 
 static const char *q35_host_root_bus_path(PCIHostState *host_bridge,
-- 
2.39.2


