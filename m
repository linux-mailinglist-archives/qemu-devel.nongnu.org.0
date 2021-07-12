Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FB3C5D1E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:20:53 +0200 (CEST)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vrf-0005Nw-Uy
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m2vY0-0006S4-PF; Mon, 12 Jul 2021 09:00:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m2vXx-00048N-0w; Mon, 12 Jul 2021 09:00:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id k20so11164511pgg.7;
 Mon, 12 Jul 2021 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOpxG9RrKHY0yrQ3ismxAW7bzM0rSsenlPHhQrZoPm4=;
 b=i8yN9Y7wvpMgRhuBx3/oHLx02FJ72aDcHM6J1aX+UFGfc0H4XPnibrCZBlDUufa1GK
 fQFhZp4ZNynHntJI/ea3mwAx4vdx4k2PGE/1wd35+G93u/D00Dy2MkxEMq5CJFZljBAC
 VSWX9hp3kIoH5t/lEnB9PhSorVPl8qQRdeI1QrIJYy3OxXnhG2Hl9Q+dY1pwj4WwiV0X
 4OOaqVOBfy3rDjhXtsIPfrZLf1wMfNl9eRo9f3Ge91X5TzOOFghoG53eop2h6oqQJEne
 gNMfXhkrEfpxn+lx6phRVQUSIpL+O0aC+yN4DXKdO+KJWCUjNUJu0a7f+mZZ1SC908dl
 KXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FOpxG9RrKHY0yrQ3ismxAW7bzM0rSsenlPHhQrZoPm4=;
 b=XWXz45gzJD5i1wWDDpHJAcltPxXzPR2I8HDInTkcOERRrCG64apunvzmXZHVKp/i+H
 daQmNJ2kxAWzq7jrMBLyHeLoxOIFwsAPVScjdvx4MYyAHtsNiNElml/Ayi3Dih1BynRQ
 TJSzheGCdZlfvzOhONupFvGpU5jdGo+7+w8C7Yu0jDKB6kJT519dn5aLMcm+7LjQpa9Y
 FbVHBtBTO6CxHTo9XE2gGe5h2KHRw7jnuWZfUHh5EbVCUwW3STRZeCLTPTkopw8NV7lq
 G3ogLowvwkzD0g9b53UUNwRW0hUdGyO8GcbX5zBFLByw/+g+rkKTrs4R7FcEUqD1Ru/a
 2u3A==
X-Gm-Message-State: AOAM532mJXV1nTau+unGyPIHcOcZRjRk39FBXZVK3NjrKIWFqU5B5KHZ
 9WJtzqJ8vxL4XHSy9zCjC5E=
X-Google-Smtp-Source: ABdhPJw6gaOqfXLJrEg68adOLuMq1wjCrit4sR1iv+mJOS0UxjcxjtqK6NvrCW6z7f19SU6+0rGFSg==
X-Received: by 2002:a65:508d:: with SMTP id r13mr54119690pgp.36.1626094824265; 
 Mon, 12 Jul 2021 06:00:24 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id o3sm4440644pjr.49.2021.07.12.06.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 06:00:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] hw: aspeed_gpio: Fix memory size
Date: Mon, 12 Jul 2021 22:30:12 +0930
Message-Id: <20210712130012.115017-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x534.google.com
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


