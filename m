Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682755F43B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:44:04 +0200 (CEST)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6OcV-00018q-8N
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVP-0007Za-QS; Tue, 28 Jun 2022 23:36:43 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVN-0006na-R8; Tue, 28 Jun 2022 23:36:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id r1so12855363plo.10;
 Tue, 28 Jun 2022 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tiUOgVtzpiwLKug/bkj+5+Wfrcbxl9syNls8Ol46q4=;
 b=fFCPYTDCfnQVDeZvYxuwhbOzOdBCLphx+XCl/anQQD7jkiOBmFoTdPWd8ljNItSLPA
 qVOCFUhy1a+sTLXktgxxWcusa+A4nru3s3QWfLUQLkdOcnN+HOIHq32qAlGYWCuDDGke
 /P2axmNRlI+EU4HehpMaSnH8I/UHzMQ+HuKXiJDlU89D/98aCDLtZVrIDuoRtQRT751w
 blA9QfGS3SSt2acE27cJTQ4bHC9gxWaSVXho1FGAfqn0gycqw7NXk1eH38r8qEFuBeRY
 Nmqper7NvDZAU8c18VSMEHlfz72FMRR2RKKHos6U72X86lA0/9qucTnec/Q4UaF8akqU
 tgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/tiUOgVtzpiwLKug/bkj+5+Wfrcbxl9syNls8Ol46q4=;
 b=41YsncZw8hoGlO+jbzgMB6b6vGiCZ6U/RgJo7+WPM/74g6oGlNUZi/Dm+IwPM0DA7T
 I2Vyzc8vrKawILgcq9IonWV1oZB76AK2oB0Q7zwHg/ac6XetJgX4INmRpjSfJJ8mdOU4
 nxmW46V3Be1mPmIwZkGUFL5NYz++VR9/9BnRlL4Vx1HW2w1WnLbcqTA6qRMxmhC4Tj25
 ZCAFV0ldgreNJFbs8h7rc1xSp7xA6BmH0YLJngPOmb1iNdyVoR3WTvBoTDEQP6fAy6DA
 ds/pqLLk3GfIk7bFV4mp2apJyp88KyepONZBe3ZqdbNcnZLAhrq+Fd39AnRjDmXS3qP9
 BCzA==
X-Gm-Message-State: AJIora+WfcoQUTOhBNeP3BbtrrwUeJ48AGnKyHu1U7bjij/a2eEijoDv
 6iJisPVK/KIi1R41BtDl1qo=
X-Google-Smtp-Source: AGRyM1sBxOKsucy/2D8li1KRr4Y4G1jsU22BR+KrOe9TnjWo0CXaR6jggGV3at6e0Hp59SRBvBGG+A==
X-Received: by 2002:a17:903:22c9:b0:16a:749b:16d6 with SMTP id
 y9-20020a17090322c900b0016a749b16d6mr7029887plg.32.1656473800142; 
 Tue, 28 Jun 2022 20:36:40 -0700 (PDT)
Received: from localhost (fwdproxy-prn-017.fbsv.net.
 [2a03:2880:ff:11::face:b00c]) by smtp.gmail.com with ESMTPSA id
 h15-20020a170902680f00b00161e50e2245sm10029592plk.178.2022.06.28.20.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:39 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 05/13] hw/i2c: add asynchronous send
Date: Tue, 28 Jun 2022 20:36:26 -0700
Message-Id: <20220629033634.3850922-6-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pl1-x62c.google.com
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

From: Klaus Jensen <k.jensen@samsung.com>

Add an asynchronous version of i2c_send() that requires the slave to
explicitly acknowledge on the bus with i2c_ack().

The current master must use the new i2c_start_send_async() to indicate
that it wants to do an asynchronous transfer. This allows the i2c core
to check if the target slave supports this or not. This approach relies
on adding a new enum i2c_event member, which is why a bunch of other
devices needs changes in their event handling switches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20220601210831.67259-5-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/pxa2xx.c            |  2 ++
 hw/display/sii9022.c       |  2 ++
 hw/display/ssd0303.c       |  2 ++
 hw/i2c/core.c              | 36 +++++++++++++++++++++++++++++++++++-
 hw/i2c/smbus_slave.c       |  4 ++++
 hw/i2c/trace-events        |  2 ++
 hw/nvram/eeprom_at24c.c    |  2 ++
 hw/sensor/lsm303dlhc_mag.c |  2 ++
 include/hw/i2c/i2c.h       | 16 ++++++++++++++++
 9 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f4f687df68..93dda83d7a 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1305,6 +1305,8 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_NACK:
         s->status |= 1 << 1;				/* set ACKNAK */
         break;
+    default:
+        return -1;
     }
     pxa2xx_i2c_update(s);
 
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index b591a58789..664fd4046d 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -76,6 +76,8 @@ static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index aeae22da9c..d67b0ad7b5 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -196,6 +196,8 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_NACK:
         /* Nothing to do.  */
         break;
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 145dce6078..d4ba8146bf 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
            start condition.  */
 
         if (sc->event) {
-            trace_i2c_event("start", s->address);
+            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
+                            s->address);
             rv = sc->event(s, event);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
@@ -212,6 +213,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address)
     return i2c_do_start_transfer(bus, address, I2C_START_SEND);
 }
 
+int i2c_start_send_async(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_SEND_ASYNC);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
@@ -261,6 +267,23 @@ int i2c_send(I2CBus *bus, uint8_t data)
     return ret ? -1 : 0;
 }
 
+int i2c_send_async(I2CBus *bus, uint8_t data)
+{
+    I2CNode *node = QLIST_FIRST(&bus->current_devs);
+    I2CSlave *slave = node->elt;
+    I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(slave);
+
+    if (!sc->send_async) {
+        return -1;
+    }
+
+    trace_i2c_send_async(slave->address, data);
+
+    sc->send_async(slave, data);
+
+    return 0;
+}
+
 uint8_t i2c_recv(I2CBus *bus)
 {
     uint8_t data = 0xff;
@@ -297,6 +320,17 @@ void i2c_nack(I2CBus *bus)
     }
 }
 
+void i2c_ack(I2CBus *bus)
+{
+    if (!bus->bh) {
+        return;
+    }
+
+    trace_i2c_ack();
+
+    qemu_bh_schedule(bus->bh);
+}
+
 static int i2c_slave_post_load(void *opaque, int version_id)
 {
     I2CSlave *dev = opaque;
diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
index 5d10e27664..feb3ec6333 100644
--- a/hw/i2c/smbus_slave.c
+++ b/hw/i2c/smbus_slave.c
@@ -143,6 +143,10 @@ static int smbus_i2c_event(I2CSlave *s, enum i2c_event event)
             dev->mode = SMBUS_CONFUSED;
             break;
         }
+        break;
+
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 209275ed2d..af181d43ee 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -4,7 +4,9 @@
 
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
+i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
+i2c_ack(void) ""
 
 # aspeed_i2c.c
 
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 01a3093600..d695f6ae89 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -75,6 +75,8 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
     return 0;
 }
diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
index 4c98ddbf20..bb8d48b2fd 100644
--- a/hw/sensor/lsm303dlhc_mag.c
+++ b/hw/sensor/lsm303dlhc_mag.c
@@ -427,6 +427,8 @@ static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
 
     s->len = 0;
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index be8bb8b78a..9b9581d230 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -12,6 +12,7 @@
 enum i2c_event {
     I2C_START_RECV,
     I2C_START_SEND,
+    I2C_START_SEND_ASYNC,
     I2C_FINISH,
     I2C_NACK /* Masker NACKed a receive byte.  */
 };
@@ -28,6 +29,9 @@ struct I2CSlaveClass {
     /* Master to slave. Returns non-zero for a NAK, 0 for success. */
     int (*send)(I2CSlave *s, uint8_t data);
 
+    /* Master to slave (asynchronous). Receiving slave must call i2c_ack(). */
+    void (*send_async)(I2CSlave *s, uint8_t data);
+
     /*
      * Slave to master.  This cannot fail, the device should always
      * return something here.
@@ -127,11 +131,23 @@ int i2c_start_recv(I2CBus *bus, uint8_t address);
  */
 int i2c_start_send(I2CBus *bus, uint8_t address);
 
+/**
+ * i2c_start_send_async: start an asynchronous 'send' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Return: 0 on success, -1 on error
+ */
+int i2c_start_send_async(I2CBus *bus, uint8_t address);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_ack(I2CBus *bus);
 void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
 void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
+int i2c_send_async(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
                   I2CNodeList *current_devs);
-- 
2.30.2


