Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2656677CC4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:42:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx01-0006DM-Ai; Mon, 23 Jan 2023 08:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzU-0005vj-KU
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzQ-0002Lw-DR
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so10639881wmb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IIgxyXSUr0bntZmMjT7iADRhtvV5tpYANa73KzeI1HU=;
 b=Wipqwz5NeTk00+eJZWzcr0HtL7TnYmoeHgZKTwYw5SgAgsOs3RM+FJfbRRxcezsKye
 UnK98NXl8ri6RM1UGhMsfaD2oWtiD7oUvZfVfnFUFOW7rsEjgFKoj2mXwBcLjZ8fZHp3
 AoxzmVbVv6e38rSPiOyHETsKzaz6NPYdQ567diI22pz+ncMhWYCwZkSUl5KDsDUi/+To
 zJcyt8HwHSHQM4MXNi1gmm1s/eIjCc2CTOX1AxOGbi7tmUZkw65Gl8b0aZfCU5zUYj0r
 bXfSskDn7/nt9AZVPQdpiUTArlO6/Nc5BaM3VXfAFCLSB4DBGQ5Zwx4is/dHpKOz59hd
 9Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IIgxyXSUr0bntZmMjT7iADRhtvV5tpYANa73KzeI1HU=;
 b=PwfdKnGPtwBbtqpqxJEDe/vJ1kiwJrMhSldyPUnFR1rz4nexcHQV6GSH5Kfn5uo0YN
 QYoeHEw8+h/HYV+SGPQ/+SUcIJL+B+gMmf03j75a1diYX+db1lA9DiTljuq8sLVGO11K
 QBMxmEY48hXl/W0duMyFWmmI2Vl/sP2max5+G0GVAFOevu/fx1ZriAHf1MBT2a9GLsI1
 P2xn6qPPSScFki5uUstQdOMt2j6bXZTBbhRtPklWIDNT7S7Rq36+nRgkvZhsXw5HJ+W8
 CwD3ixUG7PifIUU4420hPsr7t7luJZiLpcftNI3KWfIu1E5YFfqP8+4TdamiMULi9kuY
 kvnA==
X-Gm-Message-State: AFqh2kqOTpaPIhtSB/uprPU9OvtGgTuldcBK36SBfPlfbq30ibI6tKOJ
 fj34elARlaL9ksQoPQtaPRCKSpQHTDC8dHls
X-Google-Smtp-Source: AMrXdXuof8zoX3VAI7znaoA0j2GgqgDgneFAqXnYNLTRAzzD4hcoN6NlCfVPp6mz4R+yIxDt0qF45g==
X-Received: by 2002:a05:600c:5409:b0:3da:f66a:e866 with SMTP id
 he9-20020a05600c540900b003daf66ae866mr23992383wmb.10.1674480959023; 
 Mon, 23 Jan 2023 05:35:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.35.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:35:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
Date: Mon, 23 Jan 2023 13:35:30 +0000
Message-Id: <20230123133553.2171158-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
header and use it in hw/arm/musicpal.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-id: 20230111085016.44551-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/i2c/bitbang_i2c.h | 2 ++
 hw/arm/musicpal.c            | 3 ++-
 hw/i2c/bitbang_i2c.c         | 1 -
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
index 92334e9016a..a079e6d70f9 100644
--- a/include/hw/i2c/bitbang_i2c.h
+++ b/include/hw/i2c/bitbang_i2c.h
@@ -3,6 +3,8 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_GPIO_I2C "gpio_i2c"
+
 typedef struct bitbang_i2c_interface bitbang_i2c_interface;
 
 #define BITBANG_I2C_SDA 0
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 73e2b7e4cef..89b66606c32 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -26,6 +26,7 @@
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
+#include "hw/i2c/bitbang_i2c.h"
 #include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
@@ -1303,7 +1304,7 @@ static void musicpal_init(MachineState *machine)
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
                                qdev_get_gpio_in(pic, MP_GPIO_IRQ));
-    i2c_dev = sysbus_create_simple("gpio_i2c", -1, NULL);
+    i2c_dev = sysbus_create_simple(TYPE_GPIO_I2C, -1, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e9a0612a043..ac84bf02624 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -162,7 +162,6 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 
 /* GPIO interface.  */
 
-#define TYPE_GPIO_I2C "gpio_i2c"
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
-- 
2.34.1


