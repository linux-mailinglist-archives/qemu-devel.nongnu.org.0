Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995751C53C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:38:25 +0200 (CEST)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeUi-0007GB-Hs
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBK-0001r5-Iz; Thu, 05 May 2022 12:18:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBI-0005i6-UB; Thu, 05 May 2022 12:18:22 -0400
Received: by mail-ej1-x62a.google.com with SMTP id j6so9656119ejc.13;
 Thu, 05 May 2022 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/6+mxJShYSyNeMzfW/wdjGGv9Bb6vFzmsX6eoKrHRk=;
 b=miDSWfIkmiUY/gnVWh/Ljtfwn6XC6wPipfvuBfqYxYYoDwdPJFvAYZsrVI4ea10qzS
 AqXyTBbeYf292uKemAOWeoVLWOa2XybcL8DlWwwrhJ1jo+u23Qba7LdtKqhVOihgBto7
 MaPn+p1sCJhRGQkz3r60ut6/lzlN5y8y1YwNL+/awZXWmoIJz6glK72mJpSrRreqgYW+
 49EUzJE/rahFSEvTVWgGvZOFgfiD8p5r9ago3fT+EBaCXXAyVhCiCyUDAXS5ixgfFVgS
 xE5geH8DJ2xwvQOLTAXdJw3pcoIEfLSLVhUB6UvpKksg5hHH8IPmYc+dZxYHsK6Ismi7
 N2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/6+mxJShYSyNeMzfW/wdjGGv9Bb6vFzmsX6eoKrHRk=;
 b=PQY5cp3G1/ZXdXtJdIDbOINjjvetZTBT8P8pCI68zCgcAUef3667l+C1/z2gmsOBqL
 5wy8pU61RL2PNirkRH0l5SaWa0XKartBxtBTUfgn4McTcZjKecD5QiB8MtzYNPoiA1DO
 9M03EdKtTTtn9gZvn9aM/HajZG4KuzMwLenU6b4lHPgMABt8I8c8rvLzN8zob9PJd59N
 mb7EhCey0R+LP+ZKZrwmyfOa+5tHDr0h/gsBUkVe2xcZGaZuQRGuM/anmSYF5b8EoqPN
 /Z+tYDYByZnxYNgdQUoXSpJnuSP01z91nRX8+GbMVhV7W+gEEXDRKHKsAmTDbLi24idz
 a5+g==
X-Gm-Message-State: AOAM533vq0TvQ19YT8VBm/LUqs8Dlxtzs0NiCK47jVOUAsS03TuahD3u
 PW46ysv3K1lF/D2M2jz8Rp76l2Ijwqo=
X-Google-Smtp-Source: ABdhPJz8vVfU/hDV5dhc96hloRUT+iF27TJTwsopYOEQixwM+6EynORU5ouK4cePv59e7cB0REOeHw==
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr7536531ejb.177.1651767498935; 
 Thu, 05 May 2022 09:18:18 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/11] hw/rtc/mc146818rtc: Inline isa_connect_gpio_out() and
 remove it
Date: Thu,  5 May 2022 18:17:55 +0200
Message-Id: <20220505161805.11116-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

Commit 250263033c5343012b2cd6f01210ffb5b908a159 'isa: introduce wrapper
isa_connect_gpio_out' introduced it in 2016. Since then, its only user
remained mc146818rtc. Remove this one-off solution.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c     | 6 ------
 hw/rtc/mc146818rtc.c | 3 ++-
 include/hw/isa/isa.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 0ad1c5fd65..59eb1af9e3 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -85,12 +85,6 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
     return isabus->irqs[isairq];
 }
 
-void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
-{
-    qemu_irq irq = isa_get_irq(isadev, isairq);
-    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
-}
-
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
 {
     assert(bus && dma8 && dma16);
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index f235c2ddbe..79c43391cb 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -972,7 +972,8 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
     if (intercept_irq) {
         qdev_connect_gpio_out(dev, 0, intercept_irq);
     } else {
-        isa_connect_gpio_out(isadev, 0, s->isairq);
+        qemu_irq irq = isa_get_irq(isadev, s->isairq);
+        qdev_connect_gpio_out(dev, 0, irq);
     }
 
     object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isadev),
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 034d706ba1..1b758ae1ab 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
-void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
-- 
2.36.0


