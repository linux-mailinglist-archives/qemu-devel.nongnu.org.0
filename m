Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AEA65EC75
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPyN-0004cf-Rc; Thu, 05 Jan 2023 08:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPy7-0004Qw-Rv
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPy6-0004Hz-5i
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id d4so28085762wrw.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0b6s6o5206pTndNparQo6CPOMKbDBezGjOtaupQnzDA=;
 b=o8uMe4XO74xL6WJIEnzxIkPbS9rW9JejOJURNPhLukbAv2XNcePRMqI67WpwStRYKU
 q7nsublbLRICfRuVCpjNFbpn1bDZdj+rBQS4TOLGX/umkOpYaH1fF8MXAG4m2Jz9KWAD
 mzTGNuYs4B0MNoCV75klOxoIDca64JAIuJ15/BdOij+qMlaxrf9Qj9bRbv/9iYv9w7jj
 IwsGjTe6kvIhOxRhVkdb2cVKGS7/RJA5p6UbLxFRn7GuXatRPaMzxLnjYoNogKih03YN
 zVC8ctDHr0v3cqyGChFD5WKcIy+yqY4lgK7hbRvppYhdkjK9bzZCTLfTQCX3svNVp+eX
 rLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0b6s6o5206pTndNparQo6CPOMKbDBezGjOtaupQnzDA=;
 b=GFvW/goaQGKwG9TSEJ0gbciS9Mv4OY5ATbh/Z/bOroppNIIoyCVi3fLXLRa2NnGQrj
 aWkzhWWoogofuQSGLZlnVkVcc811rrRYx3tVIUn8AOIrlJeGR7axpFBuPUSA7ZPDRcfS
 3G8WmK/kURC+Mm7nljS1GEZ8cM211SzBxw8ntW50GCFL12+mXOWxcoXqqJl0s2bJT0X3
 i8XnUtkQXOfB9j3hPIHGOWt/huo/+4jmHftgjqXeDZSkTIjHHidEn9TgSJwq6cGXQQ4h
 igjKr66nshS69jd0rbEq7o/qBDhYjCZ+ZKps9sZPx1nsQf9WvGaB0NiO68O5UkNEMXy5
 VKPA==
X-Gm-Message-State: AFqh2kpTtYQqsPDb3VEIbbFaz6WinP/ZD1/RbYMMv0Bl8G9t65MdezeZ
 kUsVl3fMeNCYDd22KxeDJOwsOLfCUx3KpR03
X-Google-Smtp-Source: AMrXdXvPYAlUrUKKaXDmXe8zgK71LiCYXtu5r89KBBrYJCCTnKnYAEqVj1rl4LvUMoTHMoTUp75LvQ==
X-Received: by 2002:adf:e703:0:b0:242:48df:b4da with SMTP id
 c3-20020adfe703000000b0024248dfb4damr29241943wrm.42.1672924056585; 
 Thu, 05 Jan 2023 05:07:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c502900b003cf6a55d8e8sm2430200wmr.7.2023.01.05.05.07.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/8] hw/pci-host/bonito: Create PCI function #0 in bridge
 realize() handler
Date: Thu,  5 Jan 2023 14:07:07 +0100
Message-Id: <20230105130710.49264-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

The PCI function #0 is an integral part of the PCI bridge,
instantiate it internally during the bridge creation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/bonito.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index d881c85509..7722636e9e 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -651,6 +651,11 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     }
 
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
+
+    bs->pci_dev = PCI_BONITO(pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO));
+    object_property_add_const_link(OBJECT(bs->pci_dev), "host-bridge",
+                                   OBJECT(bs));
+    pci_realize_and_unref(PCI_DEVICE(bs->pci_dev), phb->bus, &error_fatal);
 }
 
 static void bonito_pci_realize(PCIDevice *dev, Error **errp)
@@ -752,7 +757,6 @@ PCIBus *bonito_init(qemu_irq *pic)
     DeviceState *dev;
     BonitoState *pcihost;
     PCIHostState *phb;
-    PCIDevice *d;
 
     dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
     phb = PCI_HOST_BRIDGE(dev);
@@ -760,11 +764,6 @@ PCIBus *bonito_init(qemu_irq *pic)
     pcihost->pic = pic;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    d = pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
-    object_property_add_const_link(OBJECT(d), "host-bridge", OBJECT(dev));
-    pci_realize_and_unref(d, phb->bus, &error_fatal);
-    pcihost->pci_dev = PCI_BONITO(d);
-
     return phb->bus;
 }
 
-- 
2.38.1


