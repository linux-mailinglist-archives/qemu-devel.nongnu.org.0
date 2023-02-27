Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81646A445E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFZ-0003dG-66; Mon, 27 Feb 2023 09:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF2-0000Y7-Ol
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:36 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEc-0001CS-KX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id j2so6355919wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uyj2N1V5KX2b0ID+h6AUIAfOe3fyRF4wROR42WY2Q44=;
 b=AsNa9WX/16QecpF96hurnU10OuXV4myfnh9bWP44tyseaErE6ppuW0Dh59PBJO5cp2
 SlnCf8bpcJfCD6ugO+PkxBTbksTDDvtP7VOy8k7QuHt8ClVukfC4h5txuXr5HqT07dCK
 2TCsizl9Q4kF8Z9y7m0QdzeYBEsWuwsGR1UoTv49ji7SEvjBH44oReztAGmnX/izC4+d
 2PG2Aj7M86Fa7xiaNcpxeVbHKmWtCKrdUB3tNjrlvNyFo6qhTPG9pD4StoQcRMnJzz81
 ix2PrPL2FG3VH5kgUovp+fFxHLLkpDox6+m1bVc7dW04hIKvsIV5hB+0Iukzo7Cmwfb2
 dfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyj2N1V5KX2b0ID+h6AUIAfOe3fyRF4wROR42WY2Q44=;
 b=M4LD0qImeNBePZJ8hjPeAfH3Acg+EmRo7NPpXZn+VwCb8MDvw1XyvCjmFpw7PJDA3f
 OvXF9KvNLOo0/T7gcz7sNLnpT5PNrF3eEBITcs84USrn6tok2DfToN81dFSaL6u0yVYJ
 YuWYsXyDZn8n/SMP90dKZH/K4xK+Vf9T0G9TEYRX3PM7K4FgU9SMHYg0sCxg7dOzNl1B
 Huq1+Rdx9E/XNK+uYt2pIPp4GWcyo0Kayr674M2o1V+0ZP7o0omTRYfippr7u34mZKyV
 AF1GI+I9N4WxoRMLInV1fCDQlet+bJKcPTCSBu+4bFi4GEC4iG2qMgeEKFZUXiC50j1d
 3AYg==
X-Gm-Message-State: AO0yUKVnWbIdmZ2AtembPtvTYRW+rL6BxLaE7nBE95eqgrWoQrmofr9e
 AePBf/+YS27otqko3xm2uwoTbN47cVCN9Ul5
X-Google-Smtp-Source: AK7set/j+lzIYfMt5quryXVR/2alNoR2d3GcBUizWNUMcu5ZbM5fk3Ur+Wsz+0QSuzozAbb5oGKdvg==
X-Received: by 2002:a5d:5e8c:0:b0:2c3:d707:7339 with SMTP id
 ck12-20020a5d5e8c000000b002c3d7077339mr6942335wrb.6.1677507129727; 
 Mon, 27 Feb 2023 06:12:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4c47000000b002c5534db60bsm7088284wrt.71.2023.02.27.06.12.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 119/126] hw/ide/via: Replace magic 2 value by ARRAY_SIZE /
 MAX_IDE_DEVS
Date: Mon, 27 Feb 2023 15:02:06 +0100
Message-Id: <20230227140213.35084-110-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: John Snow <jsnow@redhat.com>
Message-Id: <20210511041848.2743312-5-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/via.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index ab9e43e244..177baea9a7 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -90,7 +90,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
     int i;
 
     memory_region_init(&d->bmdma_bar, OBJECT(d), "via-bmdma-container", 16);
-    for(i = 0;i < 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
         BMDMAState *bm = &d->bmdma[i];
 
         memory_region_init_io(&bm->extra_io, OBJECT(d), &via_bmdma_ops, bm,
@@ -122,7 +122,7 @@ static void via_ide_reset(DeviceState *dev)
     uint8_t *pci_conf = pd->config;
     int i;
 
-    for (i = 0; i < 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
         ide_bus_reset(&d->bus[i]);
     }
 
@@ -188,9 +188,9 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
-    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
-    for (i = 0; i < 2; i++) {
-        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+    qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
+    for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
+        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, MAX_IDE_DEVS);
         ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
@@ -204,7 +204,7 @@ static void via_ide_exitfn(PCIDevice *dev)
     PCIIDEState *d = PCI_IDE(dev);
     unsigned i;
 
-    for (i = 0; i < 2; ++i) {
+    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
         memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
         memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
     }
-- 
2.38.1


