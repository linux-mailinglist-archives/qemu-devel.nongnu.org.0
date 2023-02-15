Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD736980A6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTP-0007Mj-6h; Wed, 15 Feb 2023 11:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTI-0007Ie-Tv
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTH-0008Fs-7b
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so1936919wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eT7ksvlpde91QYYwVbkpPCgkO0ujQKCgKvgofZh4Aq4=;
 b=lkvuG9tJZarHsGLOIK0ZpVka/xEWqAXIQs3/LUaVxFFISGzwXxqcUa2owhDwsua0lS
 3dUXMHdFk/yIew8jNZQDsuPTqkiPl6p9ATS2N4qOWLU+YmngA3jRokcUWe+PeEKoP+oa
 sdo+Eleisgvi4OVqoApnxNzqlQh4M145qyXENYanQ9+Atk6ahDI/N5j42f8B5RABa2eJ
 l1Y6EM/caxnVrJ6CMSWI3TND4lrJHA7n+8yyjHXCW/V0QlBYpNCaw41ZQxctmVnhNbgk
 icdyZTfpMldW+kkUCti9g/H4wFDy3qCGEUgsW+UkR3jnEO6O1FmUd2IWHh2xeVQ6MGF8
 sPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eT7ksvlpde91QYYwVbkpPCgkO0ujQKCgKvgofZh4Aq4=;
 b=4zi3nYH6ngCu6cKpsV4SN1M5LtNsV7huenoIvFUbmbzHJa1Zv5dOY3qlLwsL4fMJfC
 1IeyeM3I3i3oyHfd4ySpt5KWj3JcADRa87TTLDt827G6d36WEaQ/7fc1ns9dPYAqjCvF
 DrAXM1YOoH5pnYQT8y0hp0gMnY95HBlZaKq54w4GjlsyM1T6tqeWzF5jn52AwCwGDwes
 G8AkjX8/pXDl9ftAy9w6I7jlRvEID4oSCzhEh/HOMHqVCUnnhEPCGDJ/+pTup0PxmkLT
 1CY4BqPSxS1K3m5Lf3/3/kPeUkwsfS1OoIVt+Z+whgR5dc++2CVHtpY0+Bv76GeSKdAN
 V8hg==
X-Gm-Message-State: AO0yUKVHWO09Eqfg8fS/Wz7qCiESYmvMkRWU6bjU1LjbhGcTY5bj2UeU
 oH3cUcoxyVN32GQY1nb3iW9cJsNKpVmw7N1F
X-Google-Smtp-Source: AK7set/HT1NZpOyJ1xHzKIqKWkODypaLObLjElHO48XXwuo+8TThuz+fPLxsa2zUG/VEbL8S0MgA0w==
X-Received: by 2002:a05:600c:4e54:b0:3df:9858:c03c with SMTP id
 e20-20020a05600c4e5400b003df9858c03cmr3550017wmq.17.1676477846330; 
 Wed, 15 Feb 2023 08:17:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b002c4008f0daasm16061419wrv.107.2023.02.15.08.17.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 08/18] hw/isa: Deprecate isa_get_irq() in favor of
 isa_bus_get_irq()
Date: Wed, 15 Feb 2023 17:16:31 +0100
Message-Id: <20230215161641.32663-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Last commit removed the last use of isa_get_irq(NULL).
Add an assertion to ensure we won't use that hack again.
Deprecate in favor of the BUS API: isa_bus_get_irq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 6 +++---
 include/hw/isa/isa.h | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 96bfee9aa7..a9b94e6c8a 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -85,10 +85,10 @@ qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum)
  * This function is only for special cases such as the 'ferr', and
  * temporary use for normal devices until they are converted to qdev.
  */
-qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
+qemu_irq isa_get_irq(ISADevice *dev, unsigned irqnum)
 {
-    assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
-    return isa_bus_get_irq(isabus, isairq);
+    assert(dev);
+    return isa_bus_get_irq(ISA_BUS(qdev_get_parent_bus(DEVICE(dev))), irqnum);
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 42d36b21a3..1084d68ead 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -74,7 +74,6 @@ struct ISADevice {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
-qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_bus_get_dma(ISABus *bus, int nchan);
@@ -95,6 +94,9 @@ ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
 ISADevice *isa_vga_init(ISABus *bus);
 
+/*  isa_get_irq() is deprecated, please use isa_bus_get_irq() instead. */
+qemu_irq isa_get_irq(ISADevice *dev, unsigned irqnum);
+
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
  *
-- 
2.38.1


