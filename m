Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9D65EC48
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPxr-0004B5-0n; Thu, 05 Jan 2023 08:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxo-0004Ax-LH
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxn-0004FG-3X
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1244453wms.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bzKDU+QhZIYaALyoUGzm3s2plmjJ1qhwx3qEViOyr0=;
 b=vPm5fUvXOnr8MOtRKHhoPAjhAAPxDrW0+y/SzrOad2NcDMSpG7YTh2Me4LVIkc6YMZ
 V8wx9VM2h0KM1eOp9QPC0k5jSQ5TkGJjgaf1s1tbEi4SWGYm8iOyQ8IUt3qksAAxe9qw
 Eox3jNTyFfP0FD60prTbeAfUIk8B1a/6vV+pz4fVEMfUxeiFmZNuOBI9lNQjq4VuCDRT
 WsdKvQuSy8gB/3tYiEJJUneivXZ9zD5Q9xMjHPld/+RPrdyEJayAt3ZLELewevAyjCr1
 AGUvQ/GbRO8lE2jcbYx1zmbnLZVgPqRfOw8hJC2Ka30qqQDPLFDy6Kdxauy6NdZuK365
 Segw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bzKDU+QhZIYaALyoUGzm3s2plmjJ1qhwx3qEViOyr0=;
 b=kOClj+dhxUQoHPek0hb6/gruk7HaX7SH++4l4F9h2oz3+FFuAvWJQazCyyo0Y6gIVi
 7Mu5Kc+3d5/NjENjeIcIecwip2D7UB52vfXLzAl4pJIAybaILk9kWv/nRgk1vflEIqzd
 GVc9K/ETCiupJFlBn2hBslUf7lMXUpsedo5uHEdqyHkKzJBYbdeZ/roUXTkJev//u0lZ
 ZhjeyjQcsB3DePjqqQn7lQNrI8C0BrXkbnBU7Tp5d9xBMlerBsxyTG237GECjN9UsFj1
 ExnmELCXQXveo+UaKVZP4bbtu4yxAQETWvWXrsbTicvs0r/XswVgpSTHUioaUiJZfEt7
 Z8Lg==
X-Gm-Message-State: AFqh2kqkmSq3ysRpwPaWmnY/a53WVkha9KF6iKINeLv7BhLdZDW356Xy
 vbfoYuj41pQ1PGb4ofVwOoL+LRKHPBtEIdEN
X-Google-Smtp-Source: AMrXdXunnNE+7HFY6+UufQovmenRYdzFpeg39ejVgFq/zCf5qH5BAYJQRAirCstIiZUw6KDvsQVJTA==
X-Received: by 2002:a05:600c:4e07:b0:3d3:5319:b6d3 with SMTP id
 b7-20020a05600c4e0700b003d35319b6d3mr36697329wmq.38.1672924037429; 
 Thu, 05 Jan 2023 05:07:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bj11-20020a0560001e0b00b002a6f329203esm3845012wrb.61.2023.01.05.05.07.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/8] hw/pci-host/bonito: Convert to 3-phase reset
Date: Thu,  5 Jan 2023 14:07:03 +0100
Message-Id: <20230105130710.49264-2-philmd@linaro.org>
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Convert the TYPE_PCI_BONITO class to use 3-phase reset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/bonito.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a57e81e3a9..b0d09c85d0 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -47,7 +47,6 @@
 #include "hw/mips/mips.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/misc/unimp.h"
 #include "hw/registerfields.h"
@@ -593,9 +592,9 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
     }
 }
 
-static void bonito_reset(void *opaque)
+static void bonito_reset_hold(Object *obj)
 {
-    PCIBonitoState *s = opaque;
+    PCIBonitoState *s = PCI_BONITO(obj);
     uint32_t val = 0;
 
     /* set the default value of north bridge registers */
@@ -739,8 +738,6 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
 
     pci_set_byte(dev->config + PCI_MIN_GNT, 0x3c);
     pci_set_byte(dev->config + PCI_MAX_LAT, 0x00);
-
-    qemu_register_reset(bonito_reset, s);
 }
 
 PCIBus *bonito_init(qemu_irq *pic)
@@ -770,7 +767,9 @@ static void bonito_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.hold = bonito_reset_hold;
     k->realize = bonito_realize;
     k->vendor_id = 0xdf53;
     k->device_id = 0x00d5;
-- 
2.38.1


