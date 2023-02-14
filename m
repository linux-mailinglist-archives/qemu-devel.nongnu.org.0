Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DF5696461
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9g-0007cB-Jw; Tue, 14 Feb 2023 08:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9a-0007XX-Fe
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9X-0003uP-2y
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:26 -0500
Received: by mail-ej1-x633.google.com with SMTP id qb15so37860181ejc.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOSLUYZkq7ElDzuyPaht3pB2svrDQry43zdBkhas124=;
 b=f8i95OsymyNFWBVlGGqR+eG+jGgAjWrNAwSBToVYOKM5rHS/K7EH7OFtNhAdJ47Rn2
 Y28v53n3sr6gWHTQbS9Z9jRBpnQrEEcmv6E9EGlY9BkyvzMUQGOP8P/pdhc4cCz+vGU/
 6YQDBLrZ23UlcOLSzyILkQcna+zoeyo33soFWmqIj/TOENvkR2rNaJt6pu0uozi8g65E
 SL3sekAjX9/mr9QJFus17YM8bQlIkSToBQTrTZs5POoiLUAsGqA94d8CRTw+piovN65h
 5ya3LvdkZ5kevyiFxKvRjS8/Ryqd75Y76riteDZBR8fWHXeTTnV8To8Tn2klzlkaOyNa
 6R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XOSLUYZkq7ElDzuyPaht3pB2svrDQry43zdBkhas124=;
 b=YntH5BEKgJRrbE3UONT60m+nXM2gnKTDYZN6yGZly2FXe4/3EU3PHunynVgMy29LHx
 GEyYSIxQyVOcqUheEQ32rNpfpi3OAkCQ3sPXmH7NwVWjE8B7LisGOiUpDvpcOUmshu6O
 MbqQJs8b26Lr8WhRCjKcJ1C1cLZ5p1EAmMRBcL9TsabPoEB4Pi2b++V/rAQpZ77l4K4X
 DoqkRVXd9djBNKK4yZNhh9zkXfuhUvxViPWJs5Sd88A4UrRqOYYrlTgO39eNeJ6xUOn1
 DDLvUKhliqapRRknidGGnAGnJvZ6YySaaLF9kPkG7nZcTW3eF9nSeQSpefzaLGzhoX8A
 rLKQ==
X-Gm-Message-State: AO0yUKUieSTvDJzlDQ9e45qBnV4NWOY8vddGKUAYvT8eiF700xqjH36s
 8mOX8dkRbGE+/8rL/2DiXOCyzYgcTys=
X-Google-Smtp-Source: AK7set9Jyxa1HW2VuQx2WPCagu87sGbVfB+hl3t0mM1zIqY4gYZkvXp2cUdqZTKSiG2FWkT7ngxnfQ==
X-Received: by 2002:a17:906:bc9:b0:88c:3a48:715b with SMTP id
 y9-20020a1709060bc900b0088c3a48715bmr2778591ejg.30.1676380520650; 
 Tue, 14 Feb 2023 05:15:20 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:20 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 09/12] hw/pci-host/q35: Rename local variable to more
 idiomatic "phb"
Date: Tue, 14 Feb 2023 14:14:38 +0100
Message-Id: <20230214131441.101760-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
index 2fc047a9c6..8f81debfa5 100644
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
2.39.1


