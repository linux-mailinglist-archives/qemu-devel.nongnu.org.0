Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA06A43AA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5B-0002H6-4l; Mon, 27 Feb 2023 09:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4L-0000lW-Or
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4I-0007at-Vy
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so7244343wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vzsUur0Aw/LlsgsbO3t88OL+32rrRcXjZlMZhRcStSQ=;
 b=bCdhMYzmUz1147AEbgy2qrIzzG28Smey6nbuTnIM30alPqs1VHkp0TrrP43F4Kw45+
 aEEfOeuez71v7ZsOMzpR/5z+m/BpfsJewWLKTyFEvisIjJu+uaNuFs3OsisYqz/IQMyU
 Im9gkw7XgB3o7zWvcgBXGaTb75au6cY9O6K9w1bpmZaQand5T27C51TfmYJlv2k90EPi
 s6rK0Gv6Lo2hkQe8+G98yhblmHtZixFO6BAgUfSRLFLb8rvRqrjIDjGs+AaWyE5wQWt9
 ij0yY/LEua5TfTkvpyxRi7QJp0MkB/KmUcdbgmebPKsZx+wF48H1No3Qdh1DuaN4w9+p
 K1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vzsUur0Aw/LlsgsbO3t88OL+32rrRcXjZlMZhRcStSQ=;
 b=mRYaXa67JFO0s9BEPsV1n7vhH4LQimATD9i2nikb2qRrQPBv2nm4zs8XRHhGfuZniH
 8Q1JHiclDMoO4hz4BqtG2ofGVDnQkhLgKUe6TazKGSkawMWsMVeedLRpSlQsXXm3mB+t
 8Yp22jK2i+XocExDSo7F+8VZD+wTWDzGsAgC0Ly9+TGXsc8Cca1nO0d7ed6gnubW1tXd
 k/qR5IvNWJ+qZtrnLOhITKUV8D0H+n8y6UbFS/1RQrIf+qnr2fa4/3mPFv79IwPSUvhi
 2Iq7F5R2jateeTeYUyVM6t5ZqcDHFiRevHQ6onAfIm70EGxs7xfcEZmjwACpCnX3uxjZ
 xT4A==
X-Gm-Message-State: AO0yUKU9LjbfbfhiUQvW0LlkvrKdO6RLTau3rolqmZbHNv9ECxZ+F6r3
 MnG1EFDV1UdDZXDT8iiQpkWzzecocUGM3UL4
X-Google-Smtp-Source: AK7set/0zSOW0nMh9LHDjyZRxmw7TcDsB+z1UCz/o7Xj245nlmZE8tG/vqd/Trk/S04qu94mDAt73w==
X-Received: by 2002:a05:600c:44d4:b0:3eb:2de9:8aed with SMTP id
 f20-20020a05600c44d400b003eb2de98aedmr7407506wmo.41.1677506488560; 
 Mon, 27 Feb 2023 06:01:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/25] hw/char/xilinx_uartlite: Open-code
 xilinx_uartlite_create()
Date: Mon, 27 Feb 2023 14:00:54 +0000
Message-Id: <20230227140102.3712344-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Open-code the single use of xilinx_uartlite_create().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230220115114.25237-6-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/xilinx_uartlite.h        | 20 --------------------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 +++++--
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
index 753d3a453ec..36d4e8444da 100644
--- a/include/hw/char/xilinx_uartlite.h
+++ b/include/hw/char/xilinx_uartlite.h
@@ -15,29 +15,9 @@
 #ifndef XILINX_UARTLITE_H
 #define XILINX_UARTLITE_H
 
-#include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
-#include "qapi/error.h"
 #include "qom/object.h"
 
 #define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
 OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
 
-static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
-                                        qemu_irq irq,
-                                        Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_XILINX_UARTLITE);
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
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad80..505639c2980 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -100,8 +100,11 @@ petalogix_s3adsp1800_init(MachineState *machine)
         irq[i] = qdev_get_gpio_in(dev, i);
     }
 
-    xilinx_uartlite_create(UARTLITE_BASEADDR, irq[UARTLITE_IRQ],
-                           serial_hd(0));
+    dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[UARTLITE_IRQ]);
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
-- 
2.34.1


