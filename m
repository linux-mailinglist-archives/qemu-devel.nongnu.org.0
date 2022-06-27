Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229F55BBE8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:07:54 +0200 (CEST)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5v1V-0005ZQ-1R
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upR-0004In-E0
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:25 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upN-0000Xl-PG
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:25 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1SX3017564
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=F2M+/W7OcKmbHr/gmbp9s2sKL3xBRP/zawDGlUMf3D8=;
 b=HmmmHrlsPwNv46a+D+taYNblzUYomXs8nObzmnO6IKCFOnrnwBsdntFxUPP2xPKWe/qs
 r+OsEeeCuYAtEegOKMVOBcrXXUWLtqqEcQZ8N03+sDVfnI8Sk0zkIS2K9eKdd45NtK7Z
 kMUrMIkdPwpxokzoU20sOUIBNNTGR2P2I6g= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gx1p54uwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:18 -0700
Received: from twshared13579.04.prn5.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:18 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id B68D28D206E3; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 02/14] hw/i2c: add asynchronous send
Date: Mon, 27 Jun 2022 12:54:54 -0700
Message-ID: <20220627195506.403715-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-FB-Internal: Safe
X-Proofpoint-ORIG-GUID: yVlyrKHYCw2tafPZnT62Y_Gld5jX1KJq
X-Proofpoint-GUID: yVlyrKHYCw2tafPZnT62Y_Gld5jX1KJq
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <pdel@fb.com>
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
@@ -1305,6 +1305,8 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_e=
vent event)
     case I2C_NACK:
         s->status |=3D 1 << 1;				/* set ACKNAK */
         break;
+    default:
+        return -1;
     }
     pxa2xx_i2c_update(s);
=20
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index b591a58789..664fd4046d 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -76,6 +76,8 @@ static int sii9022_event(I2CSlave *i2c, enum i2c_event ev=
ent)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
=20
     return 0;
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index aeae22da9c..d67b0ad7b5 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -196,6 +196,8 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event =
event)
     case I2C_NACK:
         /* Nothing to do.  */
         break;
+    default:
+        return -1;
     }
=20
     return 0;
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 145dce6078..d4ba8146bf 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t a=
ddress,
            start condition.  */
=20
         if (sc->event) {
-            trace_i2c_event("start", s->address);
+            trace_i2c_event(event =3D=3D I2C_START_SEND ? "start" : "start=
_async",
+                            s->address);
             rv =3D sc->event(s, event);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
@@ -212,6 +213,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address)
     return i2c_do_start_transfer(bus, address, I2C_START_SEND);
 }
=20
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
=20
+int i2c_send_async(I2CBus *bus, uint8_t data)
+{
+    I2CNode *node =3D QLIST_FIRST(&bus->current_devs);
+    I2CSlave *slave =3D node->elt;
+    I2CSlaveClass *sc =3D I2C_SLAVE_GET_CLASS(slave);
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
     uint8_t data =3D 0xff;
@@ -297,6 +320,17 @@ void i2c_nack(I2CBus *bus)
     }
 }
=20
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
     I2CSlave *dev =3D opaque;
diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
index 5d10e27664..feb3ec6333 100644
--- a/hw/i2c/smbus_slave.c
+++ b/hw/i2c/smbus_slave.c
@@ -143,6 +143,10 @@ static int smbus_i2c_event(I2CSlave *s, enum i2c_event=
 event)
             dev->mode =3D SMBUS_CONFUSED;
             break;
         }
+        break;
+
+    default:
+        return -1;
     }
=20
     return 0;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 209275ed2d..af181d43ee 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -4,7 +4,9 @@
=20
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
+i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) dat=
a:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
+i2c_ack(void) ""
=20
 # aspeed_i2c.c
=20
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
@@ -427,6 +427,8 @@ static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c=
_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
=20
     s->len =3D 0;
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
=20
+    /* Master to slave (asynchronous). Receiving slave must call i2c_ack()=
. */
+    void (*send_async)(I2CSlave *s, uint8_t data);
+
     /*
      * Slave to master.  This cannot fail, the device should always
      * return something here.
@@ -127,11 +131,23 @@ int i2c_start_recv(I2CBus *bus, uint8_t address);
  */
 int i2c_start_send(I2CBus *bus, uint8_t address);
=20
+/**
+ * i2c_start_send_async: start an asynchronous 'send' transfer on an I2C b=
us.
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
--=20
2.30.2


