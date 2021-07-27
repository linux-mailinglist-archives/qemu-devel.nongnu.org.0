Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EDA3D73DB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:57:00 +0200 (CEST)
Received: from localhost ([::1]:59772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Klf-0002gT-S1
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdE-00024n-BF
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdC-0004yn-Fu
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id p5so9537554wro.7
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3q55tMM2Xqr2fvd+2DUApFOx8D8GLF7wjXJ77OHrT0g=;
 b=KLs2kTtaKCme3poOO93nWd2Ho/oxXjhGwcNnT775m9DgECbHLH+2s6b3//+8dhE6uf
 zSMUHz2v9C03Xd1CWABTUt6NY7C1tgC0kKph0weDl0MJlKvbskg6rfMFh+cM717drCZU
 6HXvmZuLbH0FnbfxJUZdMZl7YsCsP/DeeVlECiSJx5Xn+/ZNqOcar5oy6Yx2MMHW9Vf1
 nz7UYXA75rFA8gxYWonvRa9duEGm6sOBB2E78TW6N5n0lXiheOjacxj/nwFT/cqyr9eE
 hY0Mr5Nk9+d+zNx+FYU1xeazM9CRGbh6yOxdWQvjOGmOsnSZqypCm3aUnVhHASm5b3We
 2hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3q55tMM2Xqr2fvd+2DUApFOx8D8GLF7wjXJ77OHrT0g=;
 b=Cv4jbQvJA14FP0Jogq71e6xQYIF+EMEQ3M4iiM80Pu4udLxA9Ms+aB/XEAMwF+J5t3
 o+MOxj3wdKVxs8bcIXUjjrmd2nktOZrpjd2XoNV9JxmWk5NKCNJEmFmI/V4hzKpfD3ED
 IPnwCDD9nPrOmmCIi4JDtA8BCu23CcE8KS+ZALUg7RGfqmYhXmuoPGcv2Y0vqr36K/o6
 xI9AVm2xmpbiDlTJaNf8WuU64m0QawLaxlZ7DJ/FUbPD4xa2WzaS+cOuxib0b/zW3tBS
 m9hsVzVGrbxuHN3n3zUSsgAftbsprKv4aXqIDs3ri+wvxzQqE18zl2MBoWfLG1J6+SW5
 VpPQ==
X-Gm-Message-State: AOAM5337eXDB2mAioyIib0ZNe3rHVZgx0Gv7ijxwvdmDQts6CsExkMuV
 cNEnqRc56GgB5Zx6lWpFyAJNAgtjcY8kHQ==
X-Google-Smtp-Source: ABdhPJxisH8Z+rfzYzFH+eJ4vL2HWcROpJ80MwW/lxVC4T08mANyHvR41wEYT/FtpzpaeDIJ3AhrpA==
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr5533473wro.210.1627382893181; 
 Tue, 27 Jul 2021 03:48:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] hw: aspeed_gpio: Fix memory size
Date: Tue, 27 Jul 2021 11:48:01 +0100
Message-Id: <20210727104801.29728-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

The macro used to calculate the maximum memory size of the MMIO region
had a mistake, causing all GPIO models to create a mapping of 0x9D8.
The intent was to have it be 0x9D8 - 0x800.

This extra size doesn't matter on ast2400 and ast2500, which have a 4KB
region set aside for the GPIO controller.

On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so the
regions would overlap. Worse was the 1.8V controller would map over the
top of the following peripheral, which happens to be the RTC.

The mmio region used by each device is a maximum of 2KB, so avoid the
calculations and hard code this as the maximum.

Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific implementation")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20210713065854.134634-2-joel@jms.id.au
[PMM: fix autocorrect error in commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/aspeed_gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 6ae0116be70..b3dec444800 100644
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
2.20.1


