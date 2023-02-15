Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55796980C0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKSs-0006iU-0Z; Wed, 15 Feb 2023 11:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSn-0006hJ-UV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:16:59 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSl-0008DV-RP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:16:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id a2so19721095wrd.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpaucak1aQmulfVfVCcPQMicTcUylx2TFk7k+IDFyYk=;
 b=vzNxJgeAW5TWKiCbx91NPPVbBzqTSMDdaTRSluzwnietRBwS+3uoms4M2jQxjcZ60t
 76okLr1vs3BVQhkFi11Jk7PcUjLTJ9BbLaAH/tPtKDxMlcYnwUyjGvY5BneMf4J/uXHl
 Ai7w9a9hjNTpwn97ivb+eW8KhUycVTzDG7K0pwWQ8I7efhsfUfleh5kAbiYHOnJIPYkv
 SaPFsHDOj2BKNb/g1h5dvUVxBW9FDYX9sAokG6mooSHl2TuEKYMIChT31VE2CcSyp1I1
 JET4OmXb+LBv+EoBiS6rCfe7pGMGme5pymFfhjQ2MJknRj0J+gUHoG/2a3ABfOm6zwPR
 MafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpaucak1aQmulfVfVCcPQMicTcUylx2TFk7k+IDFyYk=;
 b=RKJg2ur9AnZGyZK7+bwLEYE6Ea9+0JX7Kxp57Wam1GAFZlAJkbTHAAkThNsF8zlWCx
 S/iX7Qwa+QpI0XOmrqLSF+4PMot3DJAHFQCcOEzHYwsbjUAoJFvfLOZC26Gl52+Is9jf
 cyyJKYPpFv2ItLyJYjd61hfVsFvhmhJiKpv8Xp/7GwPP8mGem2j3QSWQupyq42pItP0A
 XJmOIsbrLJ5+VxNnBBJBr7pu/ANZY8Pi9TiXddY9hxVS2CzKHxW6A8ZAdX2GehJQETGE
 uipUgcNu2n0zgn6YITqUitKFrL26/LCoZl9jVJzssTgCkaW8ep9KPLdkdkqih9K9vrkR
 bPQA==
X-Gm-Message-State: AO0yUKVuB0G6m7v5i8SI1q79/ebG1LPNE/fbvzIkKbQDshZNn+EctBAF
 OY56fl5v/XJukyGLLbJ/u9ZFQAdlRIHpaYbo
X-Google-Smtp-Source: AK7set9cXqaWC/iP32pQ5QwiVoy2lKudnAkjw42b0mboY++dNIgJx66JOwgL4jw+Flj4kB2nButxyA==
X-Received: by 2002:a5d:6aca:0:b0:2c5:588f:84a0 with SMTP id
 u10-20020a5d6aca000000b002c5588f84a0mr2220724wrw.3.1676477814254; 
 Wed, 15 Feb 2023 08:16:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d4041000000b002c546d169ddsm14286036wrp.11.2023.02.15.08.16.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:16:53 -0800 (PST)
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
Subject: [PATCH v2 02/18] hw/isa: Factor isa_bus_get_irq() out of isa_get_irq()
Date: Wed, 15 Feb 2023 17:16:25 +0100
Message-Id: <20230215161641.32663-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 14 ++++++++++----
 include/hw/isa/isa.h |  8 ++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 39111f74cc..96bfee9aa7 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -72,6 +72,13 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
     bus->irqs = irqs;
 }
 
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum)
+{
+    assert(irqnum < ISA_NUM_IRQS);
+    assert(bus && bus->irqs);
+    return bus->irqs[irqnum];
+}
+
 /*
  * isa_get_irq() returns the corresponding qemu_irq entry for the i8259.
  *
@@ -81,14 +88,13 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
-    assert(isairq < ISA_NUM_IRQS);
-    return isabus->irqs[isairq];
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
index 029d6e90bf..42d36b21a3 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -80,6 +80,14 @@ void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_bus_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
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


