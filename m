Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1567D793
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dT-00089s-9m; Thu, 26 Jan 2023 16:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dE-0007zc-8t; Thu, 26 Jan 2023 16:18:04 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dB-0007ix-31; Thu, 26 Jan 2023 16:18:03 -0500
Received: by mail-ej1-x629.google.com with SMTP id vw16so8544489ejc.12;
 Thu, 26 Jan 2023 13:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/UI99wcQaKxLqnv3FygvPHxyrVoR4RWF0FVKnuVN2k=;
 b=TvcMYYZLCD+RVmzMnALsgJ7ihRAQEoFSEkWgw8RmM5wSN+Xr+Fe1iUyLrBdkKuVrEu
 2YNlivrN17ydh2WSANAo1MJ10eCU9Hf3ZoSZCBDGKaBJxppG+rukef6sJMFuVkP/szwT
 G5+MNJdsv5f3qeT2hooJhlrGkp8OWJxdzWHy+2CsT1K2c7QVGL7YtJhcRCaJrIEjhOuM
 VVa2toRLjXfEU3xRHuUlAAwR5IsdqamYScDDMFBuslvy1KsbteAnm/my3F+dccQ4STnW
 /VnBJ7nIWKCmJRcRAofImZBOAWehQu4nO9S70EmiHxmpEuBl2oWRGDq1no7JsHV/NKJ3
 B1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/UI99wcQaKxLqnv3FygvPHxyrVoR4RWF0FVKnuVN2k=;
 b=FONNq+ndukJsNhOln9PCaQG47DbdM08vw6SnZvHNsM85yD5pUhOnfT6GRWD0rdkNA3
 Trtgnz+3mx+PEtVpb3yiOVQBCYC7Pv5qA2qhWje5aes1rn+PrKpRxmSFmHidUkIlDDPf
 B6ZNUlZP+6GjR/zIUkFNKLlUVhvKtIsl9SCb6tGS0+QfGUoK9J/YdDLWhDvNlzag7giL
 x3vRWY65tV7HuyJWe076Qv93u+7ZMTttr2OX7JVbCzcEZj7e/XJYjIXeeznWqMDxxJSu
 qCmTUW1OV5s5GJuElJpoVUo8GGjHqHfs8nGW6hwGIpTekm5E+tLzy0hVgdl8U4uVrrgL
 JJHQ==
X-Gm-Message-State: AFqh2kpA2n1+2WQa1nmUhXKK6cYmVAR2pAzhGbwV1F4V7BIiEYoyASxU
 pzmDTcMtZEN0iRvESGJb4O9gEt6SlqtqUA==
X-Google-Smtp-Source: AMrXdXviEZb3DYfFPs5FmA7wminCPZdCFeTG94lGHgzZK9V4Od3/OA1XdrD6RTO9B+jFlcTkpu9H6Q==
X-Received: by 2002:a17:907:8b8a:b0:82e:a57b:cc9b with SMTP id
 tb10-20020a1709078b8a00b0082ea57bcc9bmr59117127ejc.24.1674767879596; 
 Thu, 26 Jan 2023 13:17:59 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 09/10] hw/isa: Remove use of global isa bus
Date: Thu, 26 Jan 2023 22:17:39 +0100
Message-Id: <20230126211740.66874-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In the previous commits we removed all calls to these functions
passing a NULL ISADevice argument. We can simplify and remove
the use of the global isabus object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518215545.1793947-11-philmd@redhat.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/isa/isa.h |  2 +-
 hw/isa/isa-bus.c     | 30 +++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 8dd2953211..486851e7cb 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -108,7 +108,7 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start);
  * function makes it easy to create multiple MemoryRegions for a single
  * device and use the legacy portio routines.
  *
- * @dev: the ISADevice against which these are registered; may be NULL.
+ * @dev: the ISADevice against which these are registered
  * @piolist: the PortioList associated with the io ports
  * @start: the base I/O port against which the portio->offset is applied.
  * @portio: the ports, sorted by offset.
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index d3e2d9de35..8bae5cc473 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -81,8 +81,12 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
  */
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
-    assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
+    ISABus *isabus;
+
+    assert(dev);
     assert(isairq < ISA_NUM_IRQS);
+    isabus = isa_bus_from_device(dev);
+
     return isabus->irqs[isairq];
 }
 
@@ -115,6 +119,11 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
+
     memory_region_add_subregion(isabus->address_space_io, start, io);
     isa_init_ioport(dev, start);
 }
@@ -124,6 +133,11 @@ void isa_register_portio_list(ISADevice *dev,
                               const MemoryRegionPortio *pio_start,
                               void *opaque, const char *name)
 {
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
+
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
@@ -243,18 +257,20 @@ static char *isabus_get_fw_dev_path(DeviceState *dev)
 
 MemoryRegion *isa_address_space(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space;
-    }
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
 
     return isabus->address_space;
 }
 
 MemoryRegion *isa_address_space_io(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space_io;
-    }
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
 
     return isabus->address_space_io;
 }
-- 
2.39.1


