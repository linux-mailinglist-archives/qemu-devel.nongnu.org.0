Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7B65EC73
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPyO-0004g5-VD; Thu, 05 Jan 2023 08:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPyD-0004UY-F9
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPyA-0004FG-O8
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:44 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1245233wms.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGzLuFXxs66myFiViWu8pKjRIb3GrnDWVImC+7rq5TU=;
 b=wEnakYLUZ0LfXT6ixrHVyg3p1hiUtefBqTcnU+Z3uTcaGU8ab/crLYlEvUg3x8oacx
 CIDJmzJOU5mCsDsXTGcsmHaE8Cp6t9K9m8HoxDJiX71ROXTJQC9havAWHZsppQbWZ6pS
 g4565JYhImT2KqmVPMTHVPhQxLF+e1Q/wmEvWXi5mW3Vaf0nTrlVoDyBi7QCqvsVTXlr
 y77ZaKYAdKFQ7l7F3+ClA9qj25A27bhLNGN5yqqfoLW5//usTKYKKSmIWqEBkNgJ7mCn
 n1jcbGV1spR0bRBYz+Y5iXQQzLO1m9UT3yOuJLNvAdqyo4GZR0m5g3aJv5tpdflLrcSM
 HliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGzLuFXxs66myFiViWu8pKjRIb3GrnDWVImC+7rq5TU=;
 b=zJtK4tVFRWcPRbmdANxWxHvGpxXOVYSJ3Ps4EfnzsDJtCG8MBARVp1nKIXytRBN3Rk
 p7dXKWS/Is1VgVr8aGcHhgrVQuuqt9+7vAq78nFPV6AekgoXxr4fY/Eyh8tRRZLNOw3K
 WtAKoYsKDTvM6as0/8Gxn/sp++FwS9G7yRdJR7WHdIiBMpIOlXSsZcVqp/WiuVJ9i0Bi
 HaP0noyQe1looM9IOmM+OZh73iYtYxu0CNv/AJWu8FQK6PQu3L8W1Wc0JZ+3/+1doOor
 BUBhxI5V4d4cW3sj56kYuYWgoetS8OzcVHc8f2+wyyQHCHBjMLyUK9x4cZHUVBM1b69S
 x/Mw==
X-Gm-Message-State: AFqh2kqprk2asgpNUjNXELqRmwqLJKIV3SWxKkvfoU6gj0ojdt147D5w
 2lnb9HCYUBwoG5VMhcSsyB3nQBALzcGHgO3f
X-Google-Smtp-Source: AMrXdXsrA3Iy/FTkJpdRkTCdza9l0ipJZBqGpvPB14l/lJWMPQBzEFGLrUYAnY4P84ipWlUkHZdK+g==
X-Received: by 2002:a05:600c:4d94:b0:3d5:3ab1:d630 with SMTP id
 v20-20020a05600c4d9400b003d53ab1d630mr36021102wmp.8.1672924061291; 
 Thu, 05 Jan 2023 05:07:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003d99da8d30asm2228622wmh.46.2023.01.05.05.07.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/8] hw/pci-host/bonito: Sysbus'ify outgoing IRQ
Date: Thu,  5 Jan 2023 14:07:08 +0100
Message-Id: <20230105130710.49264-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
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

Since TYPE_BONITO_PCI_HOST_BRIDGE inherits the TYPE_SYSBUS
interface, use its API the manage the outgoing IRQ.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/bonito.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 7722636e9e..5f777f95bd 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -233,7 +233,7 @@ typedef struct PCIBonitoState PCIBonitoState;
 
 struct BonitoState {
     PCIHostState parent_obj;
-    qemu_irq *pic;
+    qemu_irq irq;
     PCIBonitoState *pci_dev;
     MemoryRegion pci_mem;
 };
@@ -556,17 +556,16 @@ static const MemoryRegionOps bonito_spciconf_ops = {
 static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
 {
     BonitoState *s = opaque;
-    qemu_irq *pic = s->pic;
     PCIBonitoState *bonito_state = s->pci_dev;
     int internal_irq = irq_num - BONITO_IRQ_BASE;
 
     if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
-        qemu_irq_pulse(*pic);
+        qemu_irq_pulse(s->irq);
     } else {   /* level triggered */
         if (bonito_state->regs[BONITO_INTPOL] & (1 << internal_irq)) {
-            qemu_irq_raise(*pic);
+            qemu_irq_raise(s->irq);
         } else {
-            qemu_irq_lower(*pic);
+            qemu_irq_lower(s->irq);
         }
     }
 }
@@ -633,6 +632,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
     MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
 
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &bs->irq);
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
                                      pci_bonito_set_irq, pci_bonito_map_irq,
@@ -755,15 +755,14 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
 PCIBus *bonito_init(qemu_irq *pic)
 {
     DeviceState *dev;
-    BonitoState *pcihost;
     PCIHostState *phb;
 
     dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
     phb = PCI_HOST_BRIDGE(dev);
-    pcihost = BONITO_PCI_HOST_BRIDGE(dev);
-    pcihost->pic = pic;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, *pic);
+
     return phb->bus;
 }
 
-- 
2.38.1


