Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7B55F456
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:51:50 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ok0-00031F-TL
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVV-0007t5-Kh; Tue, 28 Jun 2022 23:36:49 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVT-0006sb-Ju; Tue, 28 Jun 2022 23:36:49 -0400
Received: by mail-pf1-x434.google.com with SMTP id 65so13803578pfw.11;
 Tue, 28 Jun 2022 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORuh6V682i3Tt38y6TVhgXBFwXWiboHy9vQ1EQI2xMg=;
 b=b0HP8aE16JLDd4d6imHEstX3rs+X4ICC0Vlm9io91SEzmoUVLsXddiSDGNvyzsVuFX
 bfb7eZfjqWLgledvA8WvMMSbJdAyXa3qEQqzYbJBePPyztqs9yIccUfBUSJBRuZEftWw
 9/KdFgsQSRlQNKDe+PRBX8JyKTu/w1Glbj8b/v4CYY910BVge0GPZvUoYofycXxX+3gU
 BDwbQoITesUrEJe8CAPqo8I5YkFxv7SBbPNNhvyYHUmfOXqOVWyu3k848JMEfYe7M3y/
 p+coZBV6IoQXY1P9lUBPwEtSIHReSKSUVXn1pfFkfyUKW6pi37XI5hjhDAwNKrscuiru
 Txhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORuh6V682i3Tt38y6TVhgXBFwXWiboHy9vQ1EQI2xMg=;
 b=PPiqRGf9wElwu3MxhduDRNjr4svSoiw8bTCu1yI7aJz08aFuxJlJ4BtSr2C/0Alj0/
 tRQ+NT0Z7xZDHllkIsKExahWEeFEkgZ3WMgi/+e8X9XL7WFApkDn0FmO3469s3tM1LSa
 y9eM/Wcgp+TBSfZ6XZagRLTiLIej/ZoojBguYW48SzeisHzK8/5J8gULs31lx8gUwdvZ
 IVm0FCjPSlnOqo1nMtfo/kH3IkZlef/4M3ULQuam/7TrcILQonl+IajO4u4i39kavdhg
 Rty4R58n0RLdcWyCUps3kgjiZjJBUKTaXlZ1BdKqcw1b7x34XqA5TQ9O1p16OPEkYdOd
 bZHg==
X-Gm-Message-State: AJIora/cwWpWXy88zDVhH7t3M3dN7IwK5tNHeY/xUvce4nRdZjN9wtgA
 elFFoGRTZqlGzCKPiqcC0/8=
X-Google-Smtp-Source: AGRyM1tovU2A1neyrphv1XHKhOvbpeZ0tMSY4HDzGWyFQDAtUGBnS44du60bD8E5Xrtl5hHVEuiRMA==
X-Received: by 2002:a63:cf18:0:b0:40d:5506:df97 with SMTP id
 j24-20020a63cf18000000b0040d5506df97mr1142894pgg.43.1656473805412; 
 Tue, 28 Jun 2022 20:36:45 -0700 (PDT)
Received: from localhost (fwdproxy-prn-019.fbsv.net.
 [2a03:2880:ff:13::face:b00c]) by smtp.gmail.com with ESMTPSA id
 t16-20020aa79390000000b0052521fd273fsm10217347pfe.218.2022.06.28.20.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:45 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 11/13] hw/misc/aspeed: Add fby35-sb-cpld
Date: Tue, 28 Jun 2022 20:36:32 -0700
Message-Id: <20220629033634.3850922-12-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fby35 machines have 1 BMC on a baseboard and 2-4 server boards with BIC's.
There are also CPLD's on each of the boards, one type of CPLD on the
baseboard and another type on each of the server boards. This commit adds an
implementation of some of the logic performed by the server board CPLD,
which is connected to the server board BIC.

fby35 machines have 1 baseboard with a BMC (AST2600) and 4 server boards
with bridge interconnects (BIC's, AST1030's). Each server board has a CPLD
on it which provides FRU information and some synchronization functionality
with the BMC. The baseboard also has one CPLD, but it does other stuff.

This commit just adds some of the FRU functionality to allow the BIC to
startup without any errors.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 MAINTAINERS             |   1 +
 hw/misc/fby35_sb_cpld.c | 128 ++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build     |   3 +-
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/fby35_sb_cpld.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 05cf84b58c..3ffd473db1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
+F: hw/misc/fby35_sb_cpld.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/misc/fby35_sb_cpld.c b/hw/misc/fby35_sb_cpld.c
new file mode 100644
index 0000000000..f170a6c781
--- /dev/null
+++ b/hw/misc/fby35_sb_cpld.c
@@ -0,0 +1,128 @@
+/*
+ * fby35 Server Board CPLD
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/i2c/i2c.h"
+#include "hw/registerfields.h"
+
+#define BOARD_ID_CLASS1 0b0000
+#define BOARD_ID_CLASS2 0b0001
+
+#define TYPE_FBY35_SB_CPLD "fby35-sb-cpld"
+OBJECT_DECLARE_SIMPLE_TYPE(Fby35SbCpldState, FBY35_SB_CPLD);
+
+REG8(CLASS_TYPE, 0x5);
+    FIELD(CLASS_TYPE, RESERVED, 0, 2);
+    FIELD(CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 2, 1);
+    FIELD(CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 3, 1);
+    FIELD(CLASS_TYPE, BOARD_ID, 4, 4);
+REG8(BOARD_REVISION, 0x8);
+    FIELD(BOARD_REVISION, VALUE, 0, 4);
+    FIELD(BOARD_REVISION, RESERVED, 4, 4);
+
+struct Fby35SbCpldState {
+    I2CSlave parent_obj;
+
+    uint8_t target_reg;
+    uint32_t regs[10];
+};
+
+static void fby35_sb_cpld_realize(DeviceState *dev, Error **errp)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->target_reg = 0;
+
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, BOARD_ID, 0b0000);
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 1);
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 1);
+    ARRAY_FIELD_DP32(s->regs, BOARD_REVISION, VALUE, 0x1);
+}
+
+static int fby35_sb_cpld_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        break;
+    case I2C_START_SEND:
+        s->target_reg = 0;
+        break;
+    case I2C_START_SEND_ASYNC:
+    case I2C_FINISH:
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t fby35_sb_cpld_i2c_recv(I2CSlave *i2c)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
+
+    switch (s->target_reg) {
+    case R_CLASS_TYPE:
+    case R_BOARD_REVISION:
+        return s->regs[s->target_reg];
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Register read unimplemented: 0x%02x\n",
+                      __func__, s->target_reg);
+        return 0xff;
+    }
+}
+
+static int fby35_sb_cpld_i2c_send(I2CSlave *i2c, uint8_t data)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
+
+    if (s->target_reg == 0) {
+        s->target_reg = data;
+        return 0;
+    }
+
+    switch (s->target_reg) {
+    case R_CLASS_TYPE:
+    case R_BOARD_REVISION:
+        s->regs[s->target_reg] = data;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Register write unimplemented: 0x%02x 0x%02x\n",
+                      __func__, s->target_reg, data);
+        break;
+    }
+
+    return 0;
+}
+
+static void fby35_sb_cpld_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
+
+    dc->realize = fby35_sb_cpld_realize;
+    i2c->event = fby35_sb_cpld_i2c_event;
+    i2c->recv = fby35_sb_cpld_i2c_recv;
+    i2c->send = fby35_sb_cpld_i2c_send;
+}
+
+static const TypeInfo types[] = {
+    {
+        .name = TYPE_FBY35_SB_CPLD,
+        .parent = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(Fby35SbCpldState),
+        .class_init = fby35_sb_cpld_class_init,
+    },
+};
+
+DEFINE_TYPES(types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..948e25c440 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -117,7 +117,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
-  'aspeed_peci.c'))
+  'aspeed_peci.c',
+  'fby35_sb_cpld.c'))
 
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
-- 
2.30.2


