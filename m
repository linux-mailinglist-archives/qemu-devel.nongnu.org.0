Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABE869237A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWQJ-000275-As; Fri, 10 Feb 2023 11:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWQE-0001qu-CB
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:50 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWQ8-0000L1-CZ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id h16so5596363wrz.12
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXmJ/9H6tejYaoSigJ9Gtxd/ZVq77Quhr/7jqB7U4d8=;
 b=ORGfwVBuN2tpiBwuF4seeFzozkDoKiLEWxteSiyfPa0CljkC8X6cItJvGgtged/P8E
 6wHX4Ga4eB/fyblOUP7WFwj18wlm60IaznFQOw2YTWzK+Hk8T/xsbdel1MMjOdEtkRNa
 eJMbpVe+DC7z2JTYlbjR0wsjt0/zIFYjH/f7luhxV97jvFfWxRVoBWX9yAfLWUA8HhnJ
 RoOPdtcsumhVMPeszrM9UKUVFPN0shipz8YPUIpvpNZTzxHHtfZDksoDB7ozqaD4UoVX
 e6MykytDueEusLv7qGaF8Qr4hM0P1A+pr0Lz8M05sz7cgvTeLnRmarVIQbvxiXyH4SO9
 AUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXmJ/9H6tejYaoSigJ9Gtxd/ZVq77Quhr/7jqB7U4d8=;
 b=wgFbykQ/d8+P+mu/vQOGU+RIRghXX2EIxRfVRfkybiWTdj84t5fkSgTY6HuDf6+oqt
 JNCBRYug3uZJY0KycWGAgh5bisZM4cf/MmVn17rEMjK8QMh14CcEN62KFovga7nX9W6R
 7zRrt9kaRFPpiQ49n1ggt55UQo1zhETb9dt0hFJzzYTxK6yS87zmlgXlIJhci4bMezX5
 kOi9pkp2QJWcVw+wYAvgzdj0Ggf90Bowwuy9I5TjwDOcSgw2m3tQeaDIrHrvB6EE8CZw
 Sw99J+YuIKDM1FH5R/WHGlDUyb4QciQzepxjpTinXEmkT7Jx3R7GtTOQfHvsaH6F4d0S
 0MfA==
X-Gm-Message-State: AO0yUKXOHICq3GZKxPCx54kVe6ZMFAP9cXbCUg8hktAy2XcYlur9O0LQ
 xxMBWAZnuGI7qQ/7AGghaAbMJBLzHUl9c0E+
X-Google-Smtp-Source: AK7set+SdIoHDPJrB1p64OHVUKhu6lPTaIQar6pWU6dXYoH0dEpk1Lpep72inR60UJnBwgy5RkOwVg==
X-Received: by 2002:a5d:674b:0:b0:2c4:98c:1c4b with SMTP id
 l11-20020a5d674b000000b002c4098c1c4bmr4723392wrw.18.1676047121363; 
 Fri, 10 Feb 2023 08:38:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c4c1a47adfsm4080952wrt.23.2023.02.10.08.38.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/11] hw/isa: Factor isa_bus_get_irq() out of isa_get_irq()
Date: Fri, 10 Feb 2023 17:37:44 +0100
Message-Id: <20230210163744.32182-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
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

isa_get_irq() was added in commit 3a38d437ca
("Add isa_reserve_irq()" Fri Aug 14 11:36:15 2009) as:

    a temporary interface to be used to allocate ISA IRQs for
    devices which have not yet been converted to qdev, and for
    special cases which are not suited for qdev conversions,
    such as the 'ferr'.

We still use it 14 years later, using the global 'isabus'
singleton. In order to get rid of such *temporary* interface,
extract isa_bus_get_irq() which can take any ISABus* object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 14 ++++++++++----
 include/hw/isa/isa.h |  8 ++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index d12973103f..4cf26510bf 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -72,6 +72,13 @@ void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in)
     bus->irqs_in = irqs_in;
 }
 
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum)
+{
+    assert(irqnum < ISA_NUM_IRQS);
+    assert(bus->irqs_in);
+    return bus->irqs_in[irqnum];
+}
+
 /*
  * isa_get_irq() returns the corresponding input qemu_irq entry for the i8259.
  *
@@ -81,14 +88,13 @@ void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in)
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
-    assert(isairq < ISA_NUM_IRQS);
-    return isabus->irqs_in[isairq];
+    return isa_bus_get_irq(isabus, isairq);
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
-    qemu_irq irq = isa_get_irq(isadev, isairq);
-    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
+    qemu_irq input_irq = isa_get_irq(isadev, isairq);
+    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, input_irq);
 }
 
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 0aa36d4115..ba62a2e6c8 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -76,6 +76,14 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
 void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
+/**
+ * isa_bus_get_irq: Return input IRQ on ISA bus.
+ * @bus: the #ISABus to plug ISA devices on.
+ * @irqnum: the ISA IRQ number.
+ *
+ * Return IRQ @irqnum from the PIC associated on ISA @bus.
+ */
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum);
 ISADevice *isa_new(const char *name);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
-- 
2.38.1


