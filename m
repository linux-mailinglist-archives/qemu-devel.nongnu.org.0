Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE856A8C12
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcc-0007St-K1; Thu, 02 Mar 2023 17:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcb-0007R5-EA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:57 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcZ-0008VE-Rv
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:57 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so2650160wms.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WBH0OC00WXelyQU0Dru5HltuKOYgUwSjsFr5h9b93CI=;
 b=rZvVoTx7mcGvLx5x4cGyfQyxRwvVXY/carR2VREyOo3wVQgHk27crXiiT/wIPyRrYU
 Y3pZRYeGvFcRQcLyAVgIek6tGqjydvyRrlLwM+rXzGhQm3eo+7ssqhJyHv3TDsWpaeVL
 6SuGNnFgQjT+kH3nANQN7QBLq0wfWNCgrevj8nogbRUNBMZLUN8Sn/bvnbT0mAyvEBIz
 0EpNWeLktE5hKDFT0MQcDILMTagM0bHgb77+ZmQWC4C4yQi6NU1BUYeH39MdnNs4phMI
 59iH7DZILzpx3CjPifQ/QSgU+G+xGEHY4nxum2qV3wsKfRZN3KhzYtZf8D/iGLFI4xgu
 jWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WBH0OC00WXelyQU0Dru5HltuKOYgUwSjsFr5h9b93CI=;
 b=fqdUBaArJFV3buzf6IErOicJI4tzHjJ9TFq3ogM73r270N1U7JJFBcG+L11gr4vkeb
 /11tpBZoOrnqx1az4EfwDy4Nls3Vu8gtr64JQ4USpPG+x0YB3Eqmv+V/IeRV3YUsVapV
 IwnhfV2+9sBgbUpGWy1PBpCYw6qPcbz7lbOw9/U7KRpqtEhiM0rY6l26BKeT0ZPJb/tI
 1Trdt1fU0MgiEup6qossZIysSudcYjZhlbR0WDNuBXcfcgUVaWT+gXqSts8lGnc9mx2Y
 qdkbgImnUekLif4+QuAHWXxZ5NfKim7hR0LLfDCFJO495VX5llcBc1lb5c88901U0dE8
 mxLQ==
X-Gm-Message-State: AO0yUKVTIeKzwv44fCwAkwR1T0loihf0IDGtukX5gSOd4wc+v6En8LZL
 mLgjB5krGwAltGcf8YTLIvQzOoPz2TN1/RwU
X-Google-Smtp-Source: AK7set94qLUEx9Gbp86qYgJQCmMrt2N3vWoo7zk8lwHQ77DHP9x2SEq+jr1UuNIZgrB7nwuUjUMXHQ==
X-Received: by 2002:a05:600c:1c8e:b0:3e0:98c:dd93 with SMTP id
 k14-20020a05600c1c8e00b003e0098cdd93mr8804092wms.29.1677796914201; 
 Thu, 02 Mar 2023 14:41:54 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003daf7721bb3sm4397190wmb.12.2023.03.02.14.41.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/18] hw/isa: Deprecate isa_get_irq() in favor of
 isa_bus_get_irq()
Date: Thu,  2 Mar 2023 23:40:47 +0100
Message-Id: <20230302224058.43315-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Last commit removed the last use of isa_get_irq(NULL).
Add an assertion to ensure we won't use that hack again.
Deprecate in favor of the BUS API: isa_bus_get_irq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 6 +++---
 include/hw/isa/isa.h | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index a289eccfb1..081bac18ee 100644
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
index 40d6224a4e..75fb620782 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -87,7 +87,8 @@ ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
 ISADevice *isa_vga_init(ISABus *bus);
 
-qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
+/*  isa_get_irq() is deprecated, please use isa_bus_get_irq() instead. */
+qemu_irq isa_get_irq(ISADevice *dev, unsigned irqnum);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
-- 
2.38.1


