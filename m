Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC606A7CAE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:31:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGe-0005SX-Tc; Thu, 02 Mar 2023 03:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGb-0005Ns-Je
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGZ-0002SA-8f
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0RNEULKHXUI4bnIXmBTi+duJG2GyoHPzvmFBse0xtU=;
 b=HYUyJfDWHgRcHI2aBb1Fb2x+DiJor5oQavG2PnAhB/qoFjWhRFZNNIMufjMrbKRIxwxpAA
 7VKVBSDt9ZhMZODP4CTgs9ylIy2S5iz6Zn3lo3Pgu15O6/MFbztGssHkQCEJZ3MjMWZ7ZM
 5CF1ClGE+72gt+m+dZZvE6TB53qF0Uw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-lhycS5JxNMKPt4tZ_TJolQ-1; Thu, 02 Mar 2023 03:26:17 -0500
X-MC-Unique: lhycS5JxNMKPt4tZ_TJolQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m10-20020adfe94a000000b002cdc5eac0d0so888534wrn.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745576;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w0RNEULKHXUI4bnIXmBTi+duJG2GyoHPzvmFBse0xtU=;
 b=RycXKkPOUR20b9Mko+6zjlqyn/Yj/R6OqPefG+/a4Kxi8mZ3gdPwcl0SctchaaYndk
 2fpgVGplsZndkZVMlIn/Ij9ev7JT24ToIV4m0YCcjyzqk7x6xx1A8XvjPpq7dthK1xnz
 DUQrEe4y59MDwcxXz4xgaAXZ/NxaES2v2EeLhthjnPR2okaFvKKO4utv6/8YUX1Gpj2s
 XpB9tOub/87daKLtUEr1+xekpbmQlWA7epNRyICptlD+CmcE1ytaRPLSS5nv0tQ1UQfs
 YuMUMyRtuezFQX+cv4Oxb9is+60fo24COxGRNhvggVQdvcI+GQ30iUoknrtwTEavfjYL
 HLtg==
X-Gm-Message-State: AO0yUKUsgERnmZGc6JhFqmUorCCztOVg+/HuPoOVTwr8PXLfndj6LnsK
 RKNVCeuLNZZ5YSHxQxn12y/goYGd+4JyQ/CVAzelga/QdpxQLKGZW7K8qLVaTOYU4YHQ+1wGryt
 Qtz0bm6Jc662Xo9qGqhwcnV2+iaK1GWyP+RcGhzw2FTtGys5CRbz7kk3vk9AbgkFXdg==
X-Received: by 2002:a05:600c:2e95:b0:3dc:4313:fd1e with SMTP id
 p21-20020a05600c2e9500b003dc4313fd1emr7056046wmn.34.1677745576030; 
 Thu, 02 Mar 2023 00:26:16 -0800 (PST)
X-Google-Smtp-Source: AK7set87QNAou5XaRu5HFmxdrnvf+jVQDXggD7yHK+b6eV8y+EY2YwpPaozM2FomMYMI4dNL6YvAkQ==
X-Received: by 2002:a05:600c:2e95:b0:3dc:4313:fd1e with SMTP id
 p21-20020a05600c2e9500b003dc4313fd1emr7056032wmn.34.1677745575799; 
 Thu, 02 Mar 2023 00:26:15 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003db0ad636d1sm2282185wms.28.2023.03.02.00.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:15 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 34/53] hw/pci: Trace IRQ routing on PCI topology
Message-ID: <20230302082343.560446-35-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Trace how IRQ are rooted from EP to RC.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230211152239.88106-3-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c        | 8 ++++++++
 hw/pci/trace-events | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index bad8e63db3..08060b3e88 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -279,9 +279,13 @@ static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
 {
     PCIBus *bus;
     for (;;) {
+        int dev_irq = irq_num;
         bus = pci_get_bus(pci_dev);
         assert(bus->map_irq);
         irq_num = bus->map_irq(pci_dev, irq_num);
+        trace_pci_route_irq(dev_irq, DEVICE(pci_dev)->canonical_path, irq_num,
+                            pci_bus_is_root(bus) ? "root-complex"
+                                    : DEVICE(bus->parent_dev)->canonical_path);
         if (bus->set_irq)
             break;
         pci_dev = bus->parent_dev;
@@ -1600,8 +1604,12 @@ PCIINTxRoute pci_device_route_intx_to_irq(PCIDevice *dev, int pin)
     PCIBus *bus;
 
     do {
+        int dev_irq = pin;
         bus = pci_get_bus(dev);
         pin = bus->map_irq(dev, pin);
+        trace_pci_route_irq(dev_irq, DEVICE(dev)->canonical_path, pin,
+                            pci_bus_is_root(bus) ? "root-complex"
+                                    : DEVICE(bus->parent_dev)->canonical_path);
         dev = bus->parent_dev;
     } while (dev);
 
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index aaf46bc92d..42430869ce 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -3,6 +3,7 @@
 # pci.c
 pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
 pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_route_irq(int dev_irq, const char *dev_path, int parent_irq, const char *parent_path) "IRQ %d @%s -> IRQ %d @%s"
 
 # pci_host.c
 pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
-- 
MST


