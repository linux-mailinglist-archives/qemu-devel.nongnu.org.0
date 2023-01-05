Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863F65EC77
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:09:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPyL-0004RF-Kx; Thu, 05 Jan 2023 08:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPy3-0004Pk-Ii
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPy1-0004H3-O7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id az7so11665637wrb.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9+vx6ckYIqNiK6kSQbDp2C/LOtZEZcv8fwDtklzB2Y=;
 b=rprm4epUEkcHvL4o606+D421l9uZnnvEFbB4F6MCEEkfRgK7/ChG0xHcg7i9uJ4whz
 S+EEUp9xo/tGKlzjaHbha1FrGlXIvhguBJNDEtEFl6HPAUHQV4DAG15UtlnXbNECT1LG
 ZfnK0TANI+NP0cj75ByXOoi8oqzv2NtaF2gqMCwcwHJMh1Bvfl9G95voOPsCkTj6b0fg
 9IgYC8fETYx+ZaSskh/mqzvIVHNrRfmQrk32+JDKQ2ZEngD6Mc3Fa2H5uM/jUcfB7cFB
 6lR3uJl+BVfl2dEd1e+UJiQTEvmb/rDxz/e0B0OXy2hNggW4D2ac+xNZ5NVovg+z4qVj
 hbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9+vx6ckYIqNiK6kSQbDp2C/LOtZEZcv8fwDtklzB2Y=;
 b=JZF91zyWy9QSeDLr3NGQizTcTAHv1ehtVupMv9K4J1ztpkl3W8tqH2T7WYzGsDH2Vd
 bzh3NoQh2c+7cpD75Hat20D3WZn02yt8cugp49ppEFOQcaznY/IchTZNIWVGjBvSCtB5
 GftMfD3iYFW89lqbLlT7zpky7VpXJe+fkNh8qaAnTTwKUC+W2erD2NB90TA5bJBDhDhE
 7AQ6pr5C4oQTKD3xK+DGHz7J4ZOvt6j7TGq2vWZR6NbRH6LcDCJ6lN7HyK/qLnflshRr
 Rk/zfpv4sQRoH3oS4G+OxwFfQfUC0704V3Uq5QVgLP9NwXm5Mby9dWcOuIHrk37e6W8g
 mVFA==
X-Gm-Message-State: AFqh2krJx38t6r9bF+M9HSLhQW3vTi3eL6U023RMkdfHxJ0XE6rF7vaw
 DOx5wLvyAQzAESlhI2plXhIRRB7roj3jzrv3
X-Google-Smtp-Source: AMrXdXuAOFzH05Pn1iUQ6WjKIEE/1k1fdE+mBnvn+5axhhskfiWraCWM2HVCR2wyjZhNYid6YK0K7w==
X-Received: by 2002:a5d:6dc1:0:b0:242:3353:26ed with SMTP id
 d1-20020a5d6dc1000000b00242335326edmr28423582wrz.62.1672924051802; 
 Thu, 05 Jan 2023 05:07:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ba13-20020a0560001c0d00b002a91572638csm3427875wrb.75.2023.01.05.05.07.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/8] hw/pci-host/bonito: Set reference using
 object_property_add_const_link()
Date: Thu,  5 Jan 2023 14:07:06 +0100
Message-Id: <20230105130710.49264-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

A QOM object shouldn't poke at another object internals.

Here the PCI host bridge instantiates its PCI function #0
and sets a reference to itself (so the function can access
the bridge fields).

Pass this reference with object_property_add_const_link(),
since the reference won't change during the object lifetime.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/bonito.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 80ec424f86..d881c85509 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -656,10 +656,17 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
 static void bonito_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCIBonitoState *s = PCI_BONITO(dev);
-    SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
-    PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
-    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
     MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
+    SysBusDevice *sysbus;
+    PCIHostState *phb;
+    BonitoState *bs;
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "host-bridge", &error_abort);
+    s->pcihost = BONITO_PCI_HOST_BRIDGE(obj);
+    sysbus = SYS_BUS_DEVICE(obj);
+    phb = PCI_HOST_BRIDGE(obj);
+    bs = BONITO_PCI_HOST_BRIDGE(obj);
 
     /*
      * Bonito North Bridge, built on FPGA,
@@ -745,7 +752,6 @@ PCIBus *bonito_init(qemu_irq *pic)
     DeviceState *dev;
     BonitoState *pcihost;
     PCIHostState *phb;
-    PCIBonitoState *s;
     PCIDevice *d;
 
     dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
@@ -755,10 +761,9 @@ PCIBus *bonito_init(qemu_irq *pic)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     d = pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
-    s = PCI_BONITO(d);
-    s->pcihost = pcihost;
-    pcihost->pci_dev = s;
+    object_property_add_const_link(OBJECT(d), "host-bridge", OBJECT(dev));
     pci_realize_and_unref(d, phb->bus, &error_fatal);
+    pcihost->pci_dev = PCI_BONITO(d);
 
     return phb->bus;
 }
-- 
2.38.1


