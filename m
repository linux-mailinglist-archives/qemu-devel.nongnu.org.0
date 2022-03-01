Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE904C986C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:37:40 +0100 (CET)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB7j-0004Ci-5l
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAYB-000296-Le
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:59 -0500
Received: from [2a00:1450:4864:20::634] (port=46606
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY9-0005D2-AX
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:54 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx21so34212798ejb.13
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlP9T1mK2I5fRBtiH7xTlDH5I9+xSh3L2bt71qh1bZc=;
 b=gdf+hU/VKOg6C8KHn9/6sIZSWMbNWFthg6hnhYiAZsq8ykdEnSvwmtObrwf3A7mosV
 RwtmXgX+KfIZT3lRpKv1pOZlGAEDKFNHvVELCYp03IcVozPl+U9pO2ulwVbyWO2zZYAw
 gjJ9JAFnof/1a75DMOecO8bDeact2MdikXctvjkIDogLJf0vkYFrmVqUF0CLfpi5/9IC
 UXPGaH7N+05HSknwTL1AXalWUp0e4BBICLho6QWIgotruJ514XLfQxXPAg6BS/WZUVU9
 YkdwXBR50g4gb90BmVKQzWYOBakQv20viE4Pjg9oYQ265g3+RvSJu6Hg01F/hXuNqa7s
 VVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlP9T1mK2I5fRBtiH7xTlDH5I9+xSh3L2bt71qh1bZc=;
 b=TTDtEfH7ghl3SkX286jvOJjV8eH9Eh0UcjWPSgiaWQJ/uw+45+ng7U8nyhsekFJ7af
 v8+HmorEBudcm3rEgpPphs8yOnX/cAqbR70bvvAg5PxXHfYkKYcmCmOGe9M93IV465Ig
 eogSSW2xBe2EWBErKDXSW/s1HuGEc/VLfck/IYwunHTGbUym2Z2/LfNFl7CLTq/mMFIQ
 XkNBozHeMBtbXqTHZPlXIwNnxKq+eBKUj7sf9jL+JMEdu+gKKUdWaTQ9sp+JDcXDk3zD
 L5pvUvhRUYxA0hioKykuEtvaIyxPiAX22fhOFWhkL2V41C/XYdsRFZFQ39TExw0ttX5k
 nmeQ==
X-Gm-Message-State: AOAM531SSueC5/9mgQceSNcoU64wEXMgkKP1u9i8PIue6O/26C+RkvQ3
 JByVxFcCe4yC1A5XMX3kKfNqUOm9/Jk=
X-Google-Smtp-Source: ABdhPJyXDFZ25MQuZoDbmUcyczes+LnLr4acQIVIJwoIMwtm7GcEN7WFO8fm+xfrcWvsD8RT1v05Mw==
X-Received: by 2002:a17:907:9719:b0:6d1:8c46:678d with SMTP id
 jg25-20020a170907971900b006d18c46678dmr20560611ejc.168.1646172051244; 
 Tue, 01 Mar 2022 14:00:51 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] isa: Drop unused attributes from ISADevice
Date: Tue,  1 Mar 2022 23:00:36 +0100
Message-Id: <20220301220037.76555-7-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the last users of ISADevice::isairq[] have been resolved during the
previous commits, it can be removed for good.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/isa-bus.c     | 13 -------------
 include/hw/isa/isa.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index af5add6a26..c64a14120b 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -87,11 +87,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 
 void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
 {
-    assert(dev->nirqs < ARRAY_SIZE(dev->isairq));
-    assert(isairq < ISA_NUM_IRQS);
-    dev->isairq[dev->nirqs] = isairq;
     *p = isa_get_irq(dev, isairq);
-    dev->nirqs++;
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
@@ -150,14 +146,6 @@ int isa_register_portio_list(ISADevice *dev,
     return 0;
 }
 
-static void isa_device_init(Object *obj)
-{
-    ISADevice *dev = ISA_DEVICE(obj);
-
-    dev->isairq[0] = -1;
-    dev->isairq[1] = -1;
-}
-
 ISADevice *isa_new(const char *name)
 {
     return ISA_DEVICE(qdev_new(name));
@@ -244,7 +232,6 @@ static const TypeInfo isa_device_type_info = {
     .name = TYPE_ISA_DEVICE,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(ISADevice),
-    .instance_init = isa_device_init,
     .abstract = true,
     .class_size = sizeof(ISADeviceClass),
     .class_init = isa_device_class_init,
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d4417b34b6..d80cab5b79 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -83,8 +83,6 @@ struct ISADevice {
     DeviceState parent_obj;
     /*< public >*/
 
-    int8_t isairq[2];      /* -1 = unassigned */
-    int nirqs;
     int ioport_id;
 };
 
-- 
2.35.1


