Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F03C6AFA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:07:44 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3CW7-0003AG-7p
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNr-0006mC-2Y; Tue, 13 Jul 2021 02:59:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNp-0001xl-J2; Tue, 13 Jul 2021 02:59:10 -0400
Received: by mail-pf1-x435.google.com with SMTP id p36so8965544pfw.11;
 Mon, 12 Jul 2021 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FOpxG9RrKHY0yrQ3ismxAW7bzM0rSsenlPHhQrZoPm4=;
 b=S3ZwygLOpxOYJWkF5sRTV9OG8AchIIsoWjSFOHbRHj/PzULXL+a7zNka7j3gsDfCHk
 NmhtOAk1cRlR8EnORAg9LqjHdDOgQc13kEK13jSx44g8LtHvLD6aY3XNkCPjOMMYe792
 qIvXoyZWjUbWUYl0Iee+vDEmfAfrK3VskZtg281INFus3VgX9b9flF/UjVUdu4uSLz9r
 rhtJx0TwK0zJH7WP01sZZOT1OkjaLlsHgbOW2amlen5MYhBp90fgWak1mVo9WljHusFF
 VEgK7jp71MSyCwIdffAmM6FyuxHVy7L/aLC4AvMpXWUAkWvGPVPbHsOhdIFsMFOFPs1G
 N2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FOpxG9RrKHY0yrQ3ismxAW7bzM0rSsenlPHhQrZoPm4=;
 b=R0A495GiCQwiv6aqsE0vT4A8pG5gwr0IL7dIX3cIjqsVXs9tgo7UkioaC98nrmpdtq
 E4MVXSvaf7Pb0JSv3heX1L3ScoMBzwsMaN719kkmhNd3gZ0zsa91FzEFh1yad8qUT+SR
 9k8CKUoIlNHaYUCcKaUcvgQc/o2XLpt5cgMa97JoI7pMmtdpAwy8+2oucYYHIyqHozYA
 Zg44iju7CtHDLKIP+V/WFYtoN2Nwz6KOPazB3QnO4KGlHlcrJiiyTiBBWMBUNhHTy0Xy
 GyFN/CAfPujojYjk0g8XdKp2fwM72dVbsuCRCG7EhJB9dJY7RjuSpSGi+l/XV+W3u5S1
 aPDg==
X-Gm-Message-State: AOAM5337HJhD+yu4Ugp5svxEMjVgzE4gBz3eerVYTpndbavZgwXYjDym
 OL1ZmKvvQ7mMOdxL0EVTUAo=
X-Google-Smtp-Source: ABdhPJy6oL+XSqqO095CeSn2mJxShVBnsWVgjCUX4gLchcdYSQ03w6YHpPIg+ud+jMiFE6oDPDgvHA==
X-Received: by 2002:a63:171e:: with SMTP id x30mr3035285pgl.368.1626159547939; 
 Mon, 12 Jul 2021 23:59:07 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id o184sm20334846pga.18.2021.07.12.23.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:59:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/3] hw: aspeed_gpio: Fix memory size
Date: Tue, 13 Jul 2021 16:28:52 +0930
Message-Id: <20210713065854.134634-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713065854.134634-1-joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro used to calculate the maximum memory size of the MMIO region
had a mistake, causing all GPIO models to create a mapping of 0x9D8.
The intent was to have it be 0x9D8 - 0x800.

This extra size doesn't matter on ast2400 and ast2500, which have a 4KB
region set aside for the GPIO controller.

On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so the
regions would overlap. Worse was the 1.8V controller would map over the
top of the following perianal, which happens to be the RTC.

The mmio region used by each device is a maximum of 2KB, so avoid the
calculations and hard code this as the maximum.

Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific implementation")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/gpio/aspeed_gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 6ae0116be70b..b3dec4448009 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -207,7 +207,6 @@
 #define GPIO_1_8V_MEM_SIZE            0x9D8
 #define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
                                       GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_MAX_MEM_SIZE           MAX(GPIO_3_6V_MEM_SIZE, GPIO_1_8V_MEM_SIZE)
 
 static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
 {
@@ -849,7 +848,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
     }
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
-            TYPE_ASPEED_GPIO, GPIO_MAX_MEM_SIZE);
+            TYPE_ASPEED_GPIO, 0x800);
 
     sysbus_init_mmio(sbd, &s->iomem);
 }
-- 
2.32.0


