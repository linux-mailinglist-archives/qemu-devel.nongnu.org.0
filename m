Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A715A6621B1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQg-0003xW-TM; Mon, 09 Jan 2023 04:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQQ-0003vu-3i
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:39 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQO-0005SV-G1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id z5so6426977wrt.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEosG62QqV+HBGOoLpBswQWoIE4x1xnJ0kp5ZqQ3kHc=;
 b=GM4rptv/Zy5qFueRB3X5lfufJMT/hHb4Zs9FBJNt3ChugeM4YqTBv2Y2TAxKdFKpjs
 xMO9PHH96w4K7YvCTwBiV/C9ECXXurCmNbz1Y6qg/Q/4lpgswoZX028K7k1LVf+ucUj8
 HBfgEldTbeJCYjmeBVizGjQyRq8OSLlLcvvJLlsFd1wABaGtol1ZU0TVbTE0YSElkd2m
 PrhfVtW99WA+Vgr1D0XiH+CkSyNdrP+sZv4MKRU7BfKUh/0yO2IuLivf7y2xhPopmKb5
 LQpwg8p+EAVu9IWvkebZiEeqTmhligv6qnnIkmj8/BlpElbeApFIippWhgQOAXwcHTOp
 BRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEosG62QqV+HBGOoLpBswQWoIE4x1xnJ0kp5ZqQ3kHc=;
 b=AMnt3YQP3FwZBjlfNMuHzhA91MzwU/2JU6yOhWXFv3KqqNHtVzfSMY8fJ7zgddBCrG
 1CUyMDnpHrXiT1K/YNvHrbLSdc6We6i/o2Ai+NCkmWzp6K9WY6eaVCAhq+6ujQck1x5b
 zgVpsyk9aviL0IHb+BRByjy5jb0LhiHvRGa12wwuRMdShTjmSMDgYd+vq0mWb1fDYcYG
 k3sWDKyyB09+edqXUCVvgn0YHumTd4l63xCeio/tnjUKnHufClPqDqqnnmM/obrW+OML
 9B9HsrXv/TEG0VNR/gaFHr6HZMBajGHr3Th2RAK/+xfRfxjxKjDFAWEbwqp3A1mxclDT
 GTvQ==
X-Gm-Message-State: AFqh2krX2HwqwvHozLvFGPXLV8cw9NMqlbs3E/XoTAwmhzsGk6cKEVt3
 pAyeVUHfakBwJ6Cn7oEFxYk9IfGgK7pW8m4a
X-Google-Smtp-Source: AMrXdXuJMQgfBddXdqzUaA2NzHNtHB+DloHYX7WSv4CWPEIXLuKJN76sQibdj93qQh62yfKHr6gDUA==
X-Received: by 2002:adf:f285:0:b0:270:57d:d1c9 with SMTP id
 k5-20020adff285000000b00270057dd1c9mr37988708wro.39.1673256394935; 
 Mon, 09 Jan 2023 01:26:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adff30a000000b0024228b0b932sm9622766wro.27.2023.01.09.01.26.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/9] hw/i2c/bitbang_i2c: Convert TYPE_GPIO_I2C from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:11 +0100
Message-Id: <20230109092617.80224-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Nothing in TYPE_GPIO_I2C access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c    | 2 +-
 hw/i2c/bitbang_i2c.c | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 23359a6ac3..13f4dbdbc3 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1297,7 +1297,7 @@ static void musicpal_init(MachineState *machine)
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
                                qdev_get_gpio_in(pic, MP_GPIO_IRQ));
-    i2c_dev = sysbus_create_simple(TYPE_GPIO_I2C, -1, NULL);
+    i2c_dev = qdev_create_simple(TYPE_GPIO_I2C, &error_fatal);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index ffc5b95410..58503f2b27 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "hw/irq.h"
 #include "hw/i2c/bitbang_i2c.h"
-#include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "trace.h"
@@ -191,7 +190,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    DeviceState parent_obj;
     /*< public >*/
 
     bitbang_i2c_interface bitbang;
@@ -233,7 +232,7 @@ static void gpio_i2c_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo gpio_i2c_info = {
     .name          = TYPE_GPIO_I2C,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(GPIOI2CState),
     .instance_init = gpio_i2c_init,
     .class_init    = gpio_i2c_class_init,
-- 
2.38.1


