Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D66A4395
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe4r-000141-RC; Mon, 27 Feb 2023 09:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4G-0000iD-E6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:33 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4E-0007WC-Qq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q16so6349603wrw.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VDLsCaYW69zOK5yA/VohVYicyAoFr83OJm2v2NkJmG4=;
 b=Z8RRajFTajjarHPlSLuYjskv0irQqL1MoEiJs/ZhS8CCRuMQ8SJIKJXcCTDTfrmCu/
 7yVK44jYkAVA67Dyfco5afdfoCJNfePneuKcklv4hUroRyG4kCa29sXZ1g7Jcm5g+XDo
 3djoRlFwW6XPf9nvfd48BLR69E73WF9+KIVzZaLB+jMsqvOIpT6opEmrzUei/rjN84za
 Ru+tLL9JFdTThfJqNUQBFsQW6dR8WJu/gkh4z7HXNaCCiLBhNMYlwQyYAldK++3cEgli
 6J0Rl3rrR54tksVdHYsRczsYcMkxtGHZu0KtvDdC1auGEL753oGMv/CPwtKaACgzAi11
 +tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDLsCaYW69zOK5yA/VohVYicyAoFr83OJm2v2NkJmG4=;
 b=ZVYTLdh+p2cPp2Xt1mVm4Lxj+qf2hfc6H/5VIWS8/jtMoSXddH1+IIibUq6qIcI9ii
 t107sKgSYAdzW5MuV6kd1zD5koD6avGTZPxLD2jk8mCJ5JdQbAQa53p9TC6ZB2qmozuA
 MPvt+hA2RPuDqFSqUXfz9v9vw7ptXXJn3+S9mEHh+V2Z3iinCslW1tP/R70xyh0ju8Ym
 kaK/oWW1GQFburnzcwuyDipt922oFkWlFj5lCDPhEzbj3EJtQfBzXFjNOhY+YDp1B2sA
 oGdYuBdDPmRP0dt6bAxl8KdtjJFhp6l67nkT6jW8kKvE51Vc0meVAczoEu4dirB2DBly
 BzPg==
X-Gm-Message-State: AO0yUKWY3A3SpOMWNGe/LUUA374mj2iORbFnapVfBkXQC+fBROG7uWhk
 G9rJ01xncEIsrR5PPoBI+HGZ9pjRSxK5V/tf
X-Google-Smtp-Source: AK7set8Y5yOcOI7cqY8zofkt0ZLFNhTn6DZ7qCOEMTBOfXv7EF4th0WjeYaT5Nya4Mw/qmHX5UD80A==
X-Received: by 2002:adf:e887:0:b0:2c7:1c36:3c67 with SMTP id
 d7-20020adfe887000000b002c71c363c67mr9889631wrm.23.1677506486138; 
 Mon, 27 Feb 2023 06:01:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/25] hw/char/pl011: Open-code pl011_luminary_create()
Date: Mon, 27 Feb 2023 14:00:52 +0000
Message-Id: <20230227140102.3712344-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

pl011_luminary_create() is only used for the Stellaris board,
open-code it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230220115114.25237-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h | 17 -----------------
 hw/arm/stellaris.c      | 11 ++++++++---
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index d82870c0069..d8538021323 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -57,21 +57,4 @@ struct PL011State {
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
 
-static inline DeviceState *pl011_luminary_create(hwaddr addr,
-                                                 qemu_irq irq,
-                                                 Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new("pl011_luminary");
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
-
 #endif
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 67a2293d35f..f7e99baf623 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1146,9 +1146,14 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
     for (i = 0; i < 4; i++) {
         if (board->dc2 & (1 << i)) {
-            pl011_luminary_create(0x4000c000 + i * 0x1000,
-                                  qdev_get_gpio_in(nvic, uart_irq[i]),
-                                  serial_hd(i));
+            SysBusDevice *sbd;
+
+            dev = qdev_new("pl011_luminary");
+            sbd = SYS_BUS_DEVICE(dev);
+            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+            sysbus_realize_and_unref(sbd, &error_fatal);
+            sysbus_mmio_map(sbd, 0, 0x4000c000 + i * 0x1000);
+            sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(nvic, uart_irq[i]));
         }
     }
     if (board->dc2 & (1 << 4)) {
-- 
2.34.1


