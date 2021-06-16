Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869493AA64A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:48:23 +0200 (CEST)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdOY-0000nz-It
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJT-0000B0-Pq; Wed, 16 Jun 2021 17:43:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJR-00068z-4N; Wed, 16 Jun 2021 17:43:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so423602wmb.3; 
 Wed, 16 Jun 2021 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVPBTnPyrwKkWmxUGbbjqq6/7nF/87IireIxXO+4BKk=;
 b=a6HLvyeOUy+kdQJDm54TvJdrTKORiDn1Vgjl/okbW+FMU0F4ryh79m4t9uM02NYW9D
 Hw0Ib8djFZ36BUMaEZPK6PR0T++uVa2l01ogpeuNqPrLIrizgVnZh/Vw8CF2OipK6xtk
 xeFgd0oxFQTnVCLcDx4aNdv0lIx2D9bjK14pRZKmucOltdA7Sp5mqma+QVGxbgG++Vfe
 7EXYk0KeQYLZYIStcGY3hloSd7qHoCBoFfQqXf3hG7u6YBzyrXGz6BzQH1za2PnUtfXE
 ojMNL3/h3wjnKcCm0DBmdEPllRHaeJO9j5rHsByvlt5w2FHcedZCqf12ymhQxfNAogDM
 zfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZVPBTnPyrwKkWmxUGbbjqq6/7nF/87IireIxXO+4BKk=;
 b=YGXNY5osw+0uRSNtD+sc7NPnvmKPUIQoykOlAJlOJ50wVXdXWUaO+P8tSZfI+u6mgK
 UFdJMlPPDTQx2h6ds8Q9D0zJ7dbnR1E4jk1MQi+g+cLAlnN6Ky1zg4u20GsDydq+B/rU
 7G6ZEFPjA3/sYp0ZxzG87Rtut8Eq7DVzcjCvg0DFoczOaZYzSx26kK6hDN/s2LJPpGQx
 saE5qnAr1dVWppMG/9MsMT4bTaG4wSG67iXli5jDMMVeApbVO2R4FYo3SmYrZS41prlk
 NeQ9K1cl+whqMEK5M46fJ+l+pN9fO4rBofCEvQ0YwHl0TyJ1THKf/wu/RA+II6Krkp8U
 e0dA==
X-Gm-Message-State: AOAM53112sw3MiugclbxGpLPvs2I+YK0b4TWmErJHkR/IRbnwOa2dWuj
 Oz4APT29Oyafk+/1M7ZrpI7RDw0hdw2Dlg==
X-Google-Smtp-Source: ABdhPJxDm1dB+Ts5oJwgx63IQ/f09wKmyQ8DWgjVVYEAgV31pVUY4vyLW7cqfztS27Hx0XK8De4WVw==
X-Received: by 2002:a05:600c:4a29:: with SMTP id
 c41mr1118056wmp.17.1623879782815; 
 Wed, 16 Jun 2021 14:43:02 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm4428892wrh.72.2021.06.16.14.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/15] hw/input/lm832x: Move lm832x_key_event() declaration
 to "lm832x.h"
Date: Wed, 16 Jun 2021 23:42:40 +0200
Message-Id: <20210616214254.2647796-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lm832x_key_event() is specific go LM832x devices, not to the
I2C bus API. Move it out of "i2c.h" to a new header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h      |  3 ---
 include/hw/input/lm832x.h | 26 ++++++++++++++++++++++++++
 hw/arm/nseries.c          |  1 +
 hw/input/lm832x.c         |  1 +
 MAINTAINERS               |  1 +
 5 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/input/lm832x.h

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index ff4129ea704..850815e707c 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -142,9 +142,6 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
  */
 bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
 
-/* lm832x.c */
-void lm832x_key_event(DeviceState *dev, int key, int state);
-
 extern const VMStateDescription vmstate_i2c_slave;
 
 #define VMSTATE_I2C_SLAVE(_field, _state) {                          \
diff --git a/include/hw/input/lm832x.h b/include/hw/input/lm832x.h
new file mode 100644
index 00000000000..f47e579ff90
--- /dev/null
+++ b/include/hw/input/lm832x.h
@@ -0,0 +1,26 @@
+/*
+ * National Semiconductor LM8322/8323 GPIO keyboard & PWM chips.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_INPUT_LM832X
+#define HW_INPUT_LM832X
+
+void lm832x_key_event(DeviceState *dev, int key, int state);
+
+#endif
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 0aefa5d0f3e..7b82b8682e8 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -34,6 +34,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/blizzard.h"
+#include "hw/input/lm832x.h"
 #include "hw/input/tsc2xxx.h"
 #include "hw/misc/cbus.h"
 #include "hw/misc/tmp105.h"
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index 4cb1e9de01f..d2b92b457e3 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/input/lm832x.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f5365..c56bc112ccf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -792,6 +792,7 @@ F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/rtc/twl92230.c
 F: include/hw/display/blizzard.h
+F: include/hw/input/lm832x.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
 F: tests/acceptance/machine_arm_n8x0.py
-- 
2.31.1


