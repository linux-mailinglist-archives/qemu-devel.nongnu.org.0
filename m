Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B02BB164
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:26:50 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgABN-0006Vw-Sa
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgA80-0003gd-Q8
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:23:20 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgA7y-0000st-SV
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:23:20 -0500
Received: by mail-wr1-x441.google.com with SMTP id k2so10856452wrx.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1F5ZH6WuobRGGuCXdtS5090y/HmuM6DEfjHjwF8EdX4=;
 b=qu8+Mc346JS8NFKg+nZ61zBQ1QEBmB33IRUj8vrEwKVeEzzy/WPJZKf8h11lEttXbM
 2pF54MpeXBz83dKavrMjha/iy7pXec4Ond3IX+S/5nA3i7l8BafD5O1hs/5yGZ2ayKJ9
 wp3iJyeY1fYmukTDbHq4xO/jYWcnL4wfZ4ixCOPSeCyCao/E2fXSik2gN3agePQcPjfP
 5tYy5XopKCbjNigUz67fmjWFdZKTqWZL9fHWNZnrb3cjaGUuZF4z8kxcnvC4wzEsAvB9
 0Vqi3xXU/XwA3SvHAy9WiyVXLu+5pe+SVBBrWz3yer5QBkznYufgzx+vw6+RsEj1bFYQ
 TfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1F5ZH6WuobRGGuCXdtS5090y/HmuM6DEfjHjwF8EdX4=;
 b=b8YYjaJoDJKm0H/JtM+0AOEU3yOmUPfv2hTrMqD+SC0N5UVE9MZs0omUqh0diHVEUO
 LEuSDoPX4SQibfeGf5GldoSY8iRDlxdGvyPgnn/5sGiwIBWEdnqxmk3B5ID1z9FJhfx0
 6TNVX1k7ivEqJHYo9kIL7o6cCWZO6gZfpgp9Mg9Ml4pAeHWwnOs41aleQk1LdKfL8O+w
 4KJt1vvy6/mT9x5UOBRn0a0Osr4cYZGCGbsVZACPIVc6mpbWc7lXCUsWCoOOCV07G+5j
 l1mPzBUWFDOpU3QNYScof5scpCpFxmVoBfyCU8hUs8XehGJqxiNkRH++XLCDmN9BWHpx
 Ggdg==
X-Gm-Message-State: AOAM530t/FdfqgSxR7pKBkUWz/FKkdPkJ3hx6AD05lHx2uQavDBr4FIh
 7/Dcq/4X4HWUs6sDA4DI78xHjBQu+raSoA==
X-Google-Smtp-Source: ABdhPJz5fLN/eUWu+ja/3ZNYWomkHPTh2+wTTKLzFDZeoxkSCETAEk+gaqWIyU9f6kxorp1U6WgWGA==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr18293412wrn.73.1605892996948; 
 Fri, 20 Nov 2020 09:23:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p4sm5614394wmc.46.2020.11.20.09.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 09:23:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/m68k/mcf5206: Don't leak IRQs in mcf5206_mbar_realize()
Date: Fri, 20 Nov 2020 17:23:14 +0000
Message-Id: <20201120172314.14725-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that the realize function for the TYPE_MCF5206_MBAR
device leaks the IRQ array it allocates with qemu_allocate_irqs().
Keep a pointer to it in the device state struct to avoid the leak.
(Since it needs to stay around for the life of the simulation there
is no need to actually free it, and the leak was harmless.)

Fixes: Coverity CID 1432412
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---

We don't need to put this in 5.2, I'm just slowly working through
some of the Coverity issues that are various kinds of harmless leak
involving qemu_allocate_irqs().

A more thorough overhaul of this code would probably split the
current MBAR device into multiple individual devices:
 * timers
 * uarts
 * interrupt controller proper
 * a container device that wires up all the above
In that design instead of using qemu_allocate_irqs(), the
interrupt-controller device would create gpio_in lines and the
container would wire them up to the timers and uarts.
---
 hw/m68k/mcf5206.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 51d2e0da1c9..92a194dbc46 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -164,6 +164,7 @@ typedef struct {
 
     M68kCPU *cpu;
     MemoryRegion iomem;
+    qemu_irq *pic;
     m5206_timer_state *timer[2];
     void *uart[2];
     uint8_t scr;
@@ -588,17 +589,16 @@ static const MemoryRegionOps m5206_mbar_ops = {
 static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
 {
     m5206_mbar_state *s = MCF5206_MBAR(dev);
-    qemu_irq *pic;
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
                           "mbar", 0x00001000);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 
-    pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
-    s->timer[0] = m5206_timer_init(pic[9]);
-    s->timer[1] = m5206_timer_init(pic[10]);
-    s->uart[0] = mcf_uart_init(pic[12], serial_hd(0));
-    s->uart[1] = mcf_uart_init(pic[13], serial_hd(1));
+    s->pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
+    s->timer[0] = m5206_timer_init(s->pic[9]);
+    s->timer[1] = m5206_timer_init(s->pic[10]);
+    s->uart[0] = mcf_uart_init(s->pic[12], serial_hd(0));
+    s->uart[1] = mcf_uart_init(s->pic[13], serial_hd(1));
     s->cpu = M68K_CPU(qemu_get_cpu(0));
 }
 
-- 
2.20.1


