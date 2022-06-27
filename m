Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A003355B82E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:27:07 +0200 (CEST)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j9G-0007k6-LC
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izS-0003gb-7H; Mon, 27 Jun 2022 03:16:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izO-0003tc-EU; Mon, 27 Jun 2022 03:16:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id e40so11647166eda.2;
 Mon, 27 Jun 2022 00:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCwZzAUgvUr9rmEVpXX+ZUgA//EEMyR5LEAQr/9gy9c=;
 b=j+eED5IKZ878Wev1wc0fHoW8ddR2x7B9LjXHFRrgxKLj8Exv3g4Hm+kLG3KQfnBm+S
 uz6t5cgB9eiFI4p6SKJnF9b3S3icyWyoyjwmzwBxmnretta/J9rX+B9BQnzILOUu3TxT
 X/P3IZvLFi/EHroYQcBI3DFDiJtmFGLi838DA27Sne7kS7CYJc/rrdyCy8SzhoH/2WEo
 5wX8LbVLqM70kof4fKO4o7g9nDEEnHAzTwbZn+ZV5eKLyFo5/8vq89XsPk4UnO0a1N2x
 DM7Qv0DNFsg+NGkB7jAaBhcwCWcw0TYfD8pjzulCMHbAmnb/lG9aN3ER69zInpxXHhI8
 YaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCwZzAUgvUr9rmEVpXX+ZUgA//EEMyR5LEAQr/9gy9c=;
 b=rN8xoM4hscNaEB56SglP5M8lpRzXVj7H+ic4yKsl3LNSMMtUzzMRPruHGlZfjtavUK
 h3xnS2W/S3PABtzh/CFYZy9yTMREmQ3HOVBi9VrHJ5v2n6pRZF2Xk7gWustx1GDIBY4Z
 vpB+GXr5l4cMctKPaSs0Dx6MCVjRDVXH93arve2ElDtqh470957tVXVDUyyu7tQT6SqB
 h99eZgzRr1+kmf+BgErtrqizCzZY5t5s2kT2JUpX9GNB/dfqCL8vni0GaC6z4zMzaOBO
 HZK1lLMBBTH8gWcBCmak400sKRigIEe9AHJTtV21XE+iVzMDDmDgXPosv2PIGu4tYVlq
 zO2Q==
X-Gm-Message-State: AJIora/RYPny4L8uGtyIuAKz3uauuIjVGyv3DeptNm4u7cqElt0pxcMB
 Im6/zyAHR4SNW2RcHNp1DbF40B/IeZkj0g==
X-Google-Smtp-Source: AGRyM1uZET3tawJEoBFjqw8Ol+MO3Ofe2kWtKCZPkpH0qMm18ME6qbV4XqSatVA/HGgLZzo7RLT++w==
X-Received: by 2002:a05:6402:403:b0:434:eb49:218f with SMTP id
 q3-20020a056402040300b00434eb49218fmr14926944edv.426.1656314208547; 
 Mon, 27 Jun 2022 00:16:48 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:48 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 05/10] hw/isa/isa-bus: assert() if isa_get_irq() gets
 passed a NULL ISADevice
Date: Mon, 27 Jun 2022 09:16:06 +0200
Message-Id: <20220627071611.8793-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all call-sites have been fixed to pass non-NULL ISADevices, we can
assert() on NULL ISADevices to catch regressions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 0537a9f2c1..9e8b5da027 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -81,9 +81,10 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
  */
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
-    assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
+    assert(dev);
     assert(isairq < ISA_NUM_IRQS);
-    return isabus->irqs[isairq];
+
+    return isa_bus_from_device(dev)->irqs[isairq];
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
-- 
2.36.1


