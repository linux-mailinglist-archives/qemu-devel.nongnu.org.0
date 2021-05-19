Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C24388391
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 02:09:11 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj9lu-0000Jr-IB
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 20:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gj-0002tO-00; Tue, 18 May 2021 20:03:49 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gg-0000OM-LP; Tue, 18 May 2021 20:03:48 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so10215703otp.11; 
 Tue, 18 May 2021 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFac46k6fWx/dZttIiXR5ZeGKeQBto4t86AuZxEHLC4=;
 b=Eygen7hwAY7NcNJWLVOOQiPvBOwdjhHXTD/XhVZqcc3oKrkt372+veZvkUKVHaKBm/
 Phbl7djIpo7WB83n/kBv5wdQJW/bGeCZK3YYBnZXXR+dTyh60wMN5l77qx7z6vMUj6DH
 Zhe90RRw93vPH0GBfZC2iiud83dfwr0G08wkA+FiK7lZdc9jt7PhmxsG+MDBDqt5Io6w
 w9wVZvORw6Py8PNbtEJlZPn6x1IcC8e0N1Mykou4c4DinyClyb4omJokLZnvuU+j/CZk
 KYF0WiYBX2BWo10J1Rop2saopeRn+4ilXtKG1ociReZPkcWm16GQv36gVR3btRnpUb0u
 ph/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fFac46k6fWx/dZttIiXR5ZeGKeQBto4t86AuZxEHLC4=;
 b=TmBzCdchK92qkbYMt6iiWmhzmDLTP/wIZs05oy1NdzuNMoYpNaFeSg6MXKtpu9HWj0
 LeKtgCcoeSQz+6fCiFzUX8TyBTcwXCzhA9sSfvd9uMPOKmDHH7zREyBPJxhv/qVx1OrB
 5GF0jaFl8eEb2Sxn0QAsiF6dTuGmrY++KjK6phmbhUh5rPkT1IBVUImgj5luzIGEuc+0
 8RXI1TQg1fgSSEIYTvvFevovVnY0d3JaOW6FnqspEsFiukSdGMooSMg00L8thDzFnmi9
 ployIo+ahB/A4Nzxmo0G3tqwJ0Yg/KPTswkNc+HLcSr0AdYnp9XO3pspKsc+ptXD4thS
 xKTg==
X-Gm-Message-State: AOAM5339Mj8UmBDOmZpf8mzlzRN5+pX3Wk8BF1Zt6ScNNI1WEMP3/khH
 uK20bFULCV5j77SwunDFHA==
X-Google-Smtp-Source: ABdhPJz9a3cJKJdhTAc2cxCkdW+dkB3t5w/fLshvovMjcHiSzFwUNff9SKDmQrYN+neZokoHZDiXQA==
X-Received: by 2002:a05:6830:3115:: with SMTP id
 b21mr5994567ots.291.1621382625240; 
 Tue, 18 May 2021 17:03:45 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id p21sm4147147ota.26.2021.05.18.17.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 17:03:44 -0700 (PDT)
Received: from t560.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by serve.minyard.net (Postfix) with ESMTPA id 58DFB1800EB;
 Wed, 19 May 2021 00:03:42 +0000 (UTC)
From: minyard@acm.org
To: qemu-devel@nongnu.org,
	Titus Rwantare <titusr@google.com>
Subject: [PATCH 3/3] sensor: Move hardware sensors from misc to a sensor
 directory
Date: Tue, 18 May 2021 19:03:31 -0500
Message-Id: <20210519000331.3690536-4-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519000331.3690536-1-minyard@acm.org>
References: <20210519000331.3690536-1-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Corey Minyard <cminyard@mvista.com>

Lots of this are expected to be coming in, create a directory for them.

Also move the tmp105.h file into the include directory where it
should be.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 hw/Kconfig                                 |  1 +
 hw/arm/aspeed.c                            |  2 +-
 hw/arm/nseries.c                           |  2 +-
 hw/meson.build                             |  1 +
 hw/misc/Kconfig                            | 12 ------------
 hw/misc/meson.build                        |  3 ---
 hw/sensor/Kconfig                          | 11 +++++++++++
 hw/{misc => sensor}/emc141x.c              |  2 +-
 hw/sensor/meson.build                      |  3 +++
 hw/{misc => sensor}/tmp105.c               |  2 +-
 hw/{misc => sensor}/tmp421.c               |  0
 include/hw/{misc => sensor}/emc141x_regs.h |  0
 {hw/misc => include/hw/sensor}/tmp105.h    |  2 +-
 include/hw/{misc => sensor}/tmp105_regs.h  |  0
 tests/qtest/emc141x-test.c                 |  2 +-
 tests/qtest/npcm7xx_smbus-test.c           |  2 +-
 tests/qtest/tmp105-test.c                  |  2 +-
 17 files changed, 24 insertions(+), 23 deletions(-)
 create mode 100644 hw/sensor/Kconfig
 rename hw/{misc => sensor}/emc141x.c (99%)
 create mode 100644 hw/sensor/meson.build
 rename hw/{misc => sensor}/tmp105.c (99%)
 rename hw/{misc => sensor}/tmp421.c (100%)
 rename include/hw/{misc => sensor}/emc141x_regs.h (100%)
 rename {hw/misc => include/hw/sensor}/tmp105.h (97%)
 rename include/hw/{misc => sensor}/tmp105_regs.h (100%)

diff --git a/hw/Kconfig b/hw/Kconfig
index 805860f564..8cb7664d70 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -32,6 +32,7 @@ source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
+source sensor/Kconfig
 source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3fe6c55744..272b17f999 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -16,7 +16,7 @@
 #include "hw/arm/aspeed_soc.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
-#include "hw/misc/tmp105.h"
+#include "hw/sensor/tmp105.h"
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 0aefa5d0f3..a10d8f53b5 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -36,7 +36,7 @@
 #include "hw/display/blizzard.h"
 #include "hw/input/tsc2xxx.h"
 #include "hw/misc/cbus.h"
-#include "hw/misc/tmp105.h"
+#include "hw/sensor/tmp105.h"
 #include "hw/qdev-properties.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
diff --git a/hw/meson.build b/hw/meson.build
index ba0601e36e..b3366c888e 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -31,6 +31,7 @@ subdir('rdma')
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
+subdir('sensor')
 subdir('smbios')
 subdir('ssi')
 subdir('timer')
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 996d45aff5..507058d8bf 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -11,18 +11,6 @@ config ARMSSE_MHU
 config ARMSSE_CPU_PWRCTRL
     bool
 
-config TMP105
-    bool
-    depends on I2C
-
-config TMP421
-    bool
-    depends on I2C
-
-config EMC141X
-    bool
-    depends on I2C
-
 config ISA_DEBUG
     bool
     depends on ISA_BUS
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index b0a8ee8994..046c7e0c72 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -6,9 +6,6 @@ softmmu_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
 softmmu_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
 softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
-softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
-softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
-softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
new file mode 100644
index 0000000000..097cb8f11e
--- /dev/null
+++ b/hw/sensor/Kconfig
@@ -0,0 +1,11 @@
+config TMP105
+    bool
+    depends on I2C
+
+config TMP421
+    bool
+    depends on I2C
+
+config EMC141X
+    bool
+    depends on I2C
diff --git a/hw/misc/emc141x.c b/hw/sensor/emc141x.c
similarity index 99%
rename from hw/misc/emc141x.c
rename to hw/sensor/emc141x.c
index f7c53d48a4..7ce8f4e979 100644
--- a/hw/misc/emc141x.c
+++ b/hw/sensor/emc141x.c
@@ -25,7 +25,7 @@
 #include "qapi/visitor.h"
 #include "qemu/module.h"
 #include "qom/object.h"
-#include "hw/misc/emc141x_regs.h"
+#include "hw/sensor/emc141x_regs.h"
 
 #define SENSORS_COUNT_MAX    4
 
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
new file mode 100644
index 0000000000..9e0f3ab1fd
--- /dev/null
+++ b/hw/sensor/meson.build
@@ -0,0 +1,3 @@
+softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
+softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
+softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
diff --git a/hw/misc/tmp105.c b/hw/sensor/tmp105.c
similarity index 99%
rename from hw/misc/tmp105.c
rename to hw/sensor/tmp105.c
index d299d9b21b..2056449489 100644
--- a/hw/misc/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -22,7 +22,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
-#include "tmp105.h"
+#include "hw/sensor/tmp105.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
diff --git a/hw/misc/tmp421.c b/hw/sensor/tmp421.c
similarity index 100%
rename from hw/misc/tmp421.c
rename to hw/sensor/tmp421.c
diff --git a/include/hw/misc/emc141x_regs.h b/include/hw/sensor/emc141x_regs.h
similarity index 100%
rename from include/hw/misc/emc141x_regs.h
rename to include/hw/sensor/emc141x_regs.h
diff --git a/hw/misc/tmp105.h b/include/hw/sensor/tmp105.h
similarity index 97%
rename from hw/misc/tmp105.h
rename to include/hw/sensor/tmp105.h
index 7c97071ad7..244e2989fe 100644
--- a/hw/misc/tmp105.h
+++ b/include/hw/sensor/tmp105.h
@@ -15,7 +15,7 @@
 #define QEMU_TMP105_H
 
 #include "hw/i2c/i2c.h"
-#include "hw/misc/tmp105_regs.h"
+#include "hw/sensor/tmp105_regs.h"
 #include "qom/object.h"
 
 #define TYPE_TMP105 "tmp105"
diff --git a/include/hw/misc/tmp105_regs.h b/include/hw/sensor/tmp105_regs.h
similarity index 100%
rename from include/hw/misc/tmp105_regs.h
rename to include/hw/sensor/tmp105_regs.h
diff --git a/tests/qtest/emc141x-test.c b/tests/qtest/emc141x-test.c
index 714058806a..8c86694091 100644
--- a/tests/qtest/emc141x-test.c
+++ b/tests/qtest/emc141x-test.c
@@ -11,7 +11,7 @@
 #include "libqos/qgraph.h"
 #include "libqos/i2c.h"
 #include "qapi/qmp/qdict.h"
-#include "hw/misc/emc141x_regs.h"
+#include "hw/sensor/emc141x_regs.h"
 
 #define EMC1414_TEST_ID   "emc1414-test"
 
diff --git a/tests/qtest/npcm7xx_smbus-test.c b/tests/qtest/npcm7xx_smbus-test.c
index 4f9f493872..6b3038ac59 100644
--- a/tests/qtest/npcm7xx_smbus-test.c
+++ b/tests/qtest/npcm7xx_smbus-test.c
@@ -18,7 +18,7 @@
 #include "qemu/bitops.h"
 #include "libqos/i2c.h"
 #include "libqos/libqtest.h"
-#include "hw/misc/tmp105_regs.h"
+#include "hw/sensor/tmp105_regs.h"
 
 #define NR_SMBUS_DEVICES    16
 #define SMBUS_ADDR(x)       (0xf0080000 + 0x1000 * (x))
diff --git a/tests/qtest/tmp105-test.c b/tests/qtest/tmp105-test.c
index f930a96b83..3678646df5 100644
--- a/tests/qtest/tmp105-test.c
+++ b/tests/qtest/tmp105-test.c
@@ -13,7 +13,7 @@
 #include "libqos/qgraph.h"
 #include "libqos/i2c.h"
 #include "qapi/qmp/qdict.h"
-#include "hw/misc/tmp105_regs.h"
+#include "hw/sensor/tmp105_regs.h"
 
 #define TMP105_TEST_ID   "tmp105-test"
 #define TMP105_TEST_ADDR 0x49
-- 
2.25.1


