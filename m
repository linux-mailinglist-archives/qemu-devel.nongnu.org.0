Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2476AC579
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrb-0004IU-4O; Mon, 06 Mar 2023 10:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrY-0004Fi-93
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:56 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrW-0002Cr-CL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso8471109wmi.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qP31mD2ZS9cywB36oY9I1cHer7hGLsKWqOnGtaEqcws=;
 b=KY8Jxcs3UI0Nm+W1ZrckE00wI8UrOmssOijRD/rDNJi6UukE6VY6aYr/3D0qemNh44
 R/Tfqio2nFd9bJicIkloKYVYX3fmsFZdJ4at5VKzhr070OOfxnOQUctCYPKWo2f0yaF3
 HEh+InizFxQS+yJk+3tglKVoPZDwVtFMMV+0ASDhYUoBrHxiXvTsT5olhN/ZVIFj1vbK
 5YPoF2+k7nvaExv1ud16mr47Rj2mK86kKCdVv2rBSjvo9Q2+GHyeaz5tjcs86Ml19Dqe
 5PnwDSeTRp/xyToe6oJQw2fDhAOmKz53TNqx7q3GpdWIbA1gwbhdbonMPhI3O4WBLjRz
 s2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qP31mD2ZS9cywB36oY9I1cHer7hGLsKWqOnGtaEqcws=;
 b=ZDWDDi7pnJOSJox3WjQ58HdY1obdt4iB9joCz3aY86gWbX0voQa2ioWqzyQnICATef
 LofMp+PGqmSbK65B8sD/1wZLGMnbk6xJskCQBDH/oCN8P1y2uONesiy1UEZmwbDKob6J
 Ej+4WD9JK8bOp5yvz0av9qJ5bQJTQCfGYfIklvNN+N5mFjGZvp64prhsukHVJOLz2wFm
 7AfaXgsRgnOfezTWA2z36343rXcypzODSUq/igRhoyZK/pVD1cA7tnsoYXn//KU1cGtB
 xOb8b28DWkUMFEXIOyxXP2rCrItOVuJ+XLYGxJMjKdVcxIo20wqhvBqIVzJIshnLs3Li
 MhRw==
X-Gm-Message-State: AO0yUKUxNCXt3O6A/RCc/vUW1NMhPYTvcnDEJtWDaBoMe43HUfB1fT3q
 93mS7LHtW99K9vHunIq2mvI7JrRoUQLWHPit/bE=
X-Google-Smtp-Source: AK7set+o86oKnYHiiP6uJAFFrg2nwrB3uNakmqdBUuYWRUs7bcxJuAHoOxJQk1oSjhQ7Ur/gTgqPzg==
X-Received: by 2002:a05:600c:4f15:b0:3eb:3998:36fa with SMTP id
 l21-20020a05600c4f1500b003eb399836famr9643198wmq.29.1678116892965; 
 Mon, 06 Mar 2023 07:34:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
Date: Mon,  6 Mar 2023 15:34:34 +0000
Message-Id: <20230306153435.490894-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: qianfan Zhao <qianfanguijin@163.com>

TWI_CNTR_INT_FLAG is W1C(write 1 to clear and write 0 has non-effect)
register on SUN6i based SoCs, we should lower interrupt when the guest
set this bit.

The linux kernel will hang in irq handler(mv64xxx_i2c_intr) if no
device connected on the i2c bus, next is the trace log:

allwinner_i2c_write write   CNTR(0x0c): 0xc4 A_ACK BUS_EN INT_EN
allwinner_i2c_write write   CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
allwinner_i2c_read  read    STAT(0x10): 0x20 STAT_M_ADDR_WR_NACK
allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
...

Fix it.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Tested-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/i2c/allwinner-i2c.h |  6 ++++++
 hw/i2c/allwinner-i2c.c         | 26 ++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/allwinner-i2c.h b/include/hw/i2c/allwinner-i2c.h
index 4f378b86ba1..0e325d265ee 100644
--- a/include/hw/i2c/allwinner-i2c.h
+++ b/include/hw/i2c/allwinner-i2c.h
@@ -28,6 +28,10 @@
 #include "qom/object.h"
 
 #define TYPE_AW_I2C "allwinner.i2c"
+
+/** Allwinner I2C sun6i family and newer (A31, H2+, H3, etc) */
+#define TYPE_AW_I2C_SUN6I    TYPE_AW_I2C "-sun6i"
+
 OBJECT_DECLARE_SIMPLE_TYPE(AWI2CState, AW_I2C)
 
 #define AW_I2C_MEM_SIZE         0x24
@@ -50,6 +54,8 @@ struct AWI2CState {
     uint8_t srst;
     uint8_t efr;
     uint8_t lcr;
+
+    bool irq_clear_inverted;
 };
 
 #endif /* ALLWINNER_I2C_H */
diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index a4359658362..f24c3ac6f0c 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -357,10 +357,16 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
                 s->stat = STAT_FROM_STA(STAT_IDLE);
                 s->cntr &= ~TWI_CNTR_M_STP;
             }
-            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
-                /* Interrupt flag cleared */
+
+            if (!s->irq_clear_inverted && !(s->cntr & TWI_CNTR_INT_FLAG)) {
+                /* Write 0 to clear this flag */
+                qemu_irq_lower(s->irq);
+            } else if (s->irq_clear_inverted && (s->cntr & TWI_CNTR_INT_FLAG)) {
+                /* Write 1 to clear this flag */
+                s->cntr &= ~TWI_CNTR_INT_FLAG;
                 qemu_irq_lower(s->irq);
             }
+
             if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
                 if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_ACK) {
                     s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
@@ -451,9 +457,25 @@ static const TypeInfo allwinner_i2c_type_info = {
     .class_init = allwinner_i2c_class_init,
 };
 
+static void allwinner_i2c_sun6i_init(Object *obj)
+{
+    AWI2CState *s = AW_I2C(obj);
+
+    s->irq_clear_inverted = true;
+}
+
+static const TypeInfo allwinner_i2c_sun6i_type_info = {
+    .name = TYPE_AW_I2C_SUN6I,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AWI2CState),
+    .instance_init = allwinner_i2c_sun6i_init,
+    .class_init = allwinner_i2c_class_init,
+};
+
 static void allwinner_i2c_register_types(void)
 {
     type_register_static(&allwinner_i2c_type_info);
+    type_register_static(&allwinner_i2c_sun6i_type_info);
 }
 
 type_init(allwinner_i2c_register_types)
-- 
2.34.1


