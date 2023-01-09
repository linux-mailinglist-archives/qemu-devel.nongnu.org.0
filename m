Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517C6625B0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:34:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqyH-0000Gq-BF; Mon, 09 Jan 2023 07:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyF-0000Gh-IU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:43 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyD-00066t-RW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id o15so6089442wmr.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfePbK//n9RdGQ4Q7SWyXOJeAcbh03cN6S/LGxgtM7E=;
 b=GuWCr1AVAkll0FU0H+0+RQK9YBa3mtI3dd2d2cJUHABbzUhYVVlM3ELh8alCDy/i1h
 MkMT8WVkR8QTlXJYuYqCq11zRjpCc6szT+EnmzkUWp+IK6CA9U/FYp5gyUNF7gtvC94+
 qCCtd8ginIsOk+Rw4wPdviThNO5MUK+XLekFiRUrvTQ9661wllZJoPldx3y9006JdH6Q
 Umj38ca8nAbm4JF8PaHhBhy5oQuqGy61qqUD/vbN/n5hhDzbhYiPCg8WTfBq9wRgN39M
 9I2D01jiwJ6a/zGWRqS+WaNFi2ikj/sVVqwsgDNwf4b/4mEG6vSkTUwcdFc/0V2H0tdl
 yhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WfePbK//n9RdGQ4Q7SWyXOJeAcbh03cN6S/LGxgtM7E=;
 b=o5fXXPJ/jB7YkWbQpaRwkGdWtQcsyV/sTZEpoeejUIF6K4K18fWIso7smu5Qk+yV3a
 EORakL+eADbZlbbB82nVOqUOnV8Lh4sD1NKlvAHtQao+R9PJ9kCqBrG2zpAivPJcrms/
 lEq/Uzex+IwMCvaY6mvtDHRo167DoOnX1rSx7jtEw79LCECtJNjBvsaWdzNZK9FVu6wh
 BWkFJPIH0TTDlmSjg+s33I+pxLREsOVLHEdSTZdWVf2YUYJQERBnUvhLjq61uQlBQ0Fg
 xvFsdALEUYhk4nC0E8mOMHr7PNfQ3F/WJg0FHrWXJkMngfK1Sr2D6+BXSyjUXjRUQFPQ
 1vDQ==
X-Gm-Message-State: AFqh2kpAYpaKTxr22Wbh4QMN0NRgv5h/Yg2R0HkmOKA/XDCbDCBeKQAA
 Ty0+XUPFmnsCZEqAGC+RsUUDDoFyfxAC9Eug
X-Google-Smtp-Source: AMrXdXsCVdqxLcikP0aFwEpZvqXIl9P8LRGIxUxIo51Pv25icbRkLP1gRWbRHkPQZf7o79i1f9hynw==
X-Received: by 2002:a05:600c:358e:b0:3d9:9755:d659 with SMTP id
 p14-20020a05600c358e00b003d99755d659mr28658708wmq.22.1673266176842; 
 Mon, 09 Jan 2023 04:09:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b4a699ce8esm14905808wmg.6.2023.01.09.04.09.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/21] hw/arm/xilinx_zynq: Open-code pflash_cfi02_register()
Date: Mon,  9 Jan 2023 13:08:25 +0100
Message-Id: <20230109120833.3330-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

pflash_cfi02_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove pflash_cfi02_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..201ca697ec 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -218,11 +218,21 @@ static void zynq_init(MachineState *machine)
     DriveInfo *dinfo = drive_get(IF_PFLASH, 0, 0);
 
     /* AMD */
-    pflash_cfi02_register(0xe2000000, "zynq.pflash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 1,
-                          1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
-                          0);
+    dev = qdev_new(TYPE_PFLASH_CFI02);
+    qdev_prop_set_string(dev, "name", "zynq.pflash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "device-width", 1);
+    qdev_prop_set_uint8(dev, "mappings", 1);
+    qdev_prop_set_uint8(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x0066);
+    qdev_prop_set_uint16(dev, "id1", 0x0022);
+    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
+    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xe2000000);
 
     /* Create the main clock source, and feed slcr with it */
     zynq_machine->ps_clk = CLOCK(object_new(TYPE_CLOCK));
-- 
2.38.1


