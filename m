Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714F55BC56
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:37:28 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xMF-0005tX-62
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHR-0003Iv-CE
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:32:31 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:48618
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHD-0006Tp-Ss
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:32:27 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1eYo019490
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:32:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=pch8LtxW03R7yA9RyemSuA29oFXNQirTwRRavZtw/M8=;
 b=qKaZZE94sz4eJ0AlGZkza02gmS6+CCgh5mNrqYZrvk3C9j2801oVWtM/+Musb3v2RGMV
 V7veSZuqiSf1TCrYJJ0MN6ElYxzYUd3sAMIXnyR+beaDd7PtHrgLY7T3wQQ5MLRNh6bC
 dM6N5vL3ammLywEN2SR7Ph8mmNZhg9QGc+0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net (PPS) with ESMTPS id 3gwx1v64k3-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:32:14 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:32:13 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 4CE418D319E8; Mon, 27 Jun 2022 15:32:08 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH 14/14] aspeed: Add I2C new register DMA slave mode support
Date: Mon, 27 Jun 2022 15:27:37 -0700
Message-ID: <20220627222737.1011989-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627222737.1011989-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627222737.1011989-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1-sko-C9uOVn6rCmy2tZeGjTxcUp4nnB
X-Proofpoint-GUID: 1-sko-C9uOVn6rCmy2tZeGjTxcUp4nnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c         | 133 ++++++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h |   3 +
 2 files changed, 124 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8a8514586f..fc8b6b62cf 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -78,6 +78,18 @@ static inline void aspeed_i2c_bus_raise_interrupt(Aspe=
edI2CBus *bus)
     }
 }
=20
+static inline void aspeed_i2c_bus_raise_slave_interrupt(AspeedI2CBus *bu=
s)
+{
+    AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLASS(bus->controller);
+
+    if (!bus->regs[R_I2CS_INTR_STS]) {
+        return;
+    }
+
+    bus->controller->intr_status |=3D 1 << bus->id;
+    qemu_irq_raise(aic->bus_get_irq(bus));
+}
+
 static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset=
,
                                         unsigned size)
 {
@@ -140,8 +152,17 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus=
 *bus, hwaddr offset,
     case A_I2CM_DMA_LEN_STS:
     case A_I2CC_DMA_ADDR:
     case A_I2CC_DMA_LEN:
+
+    case A_I2CS_DEV_ADDR:
+    case A_I2CS_DMA_RX_ADDR:
+    case A_I2CS_DMA_LEN:
+    case A_I2CS_CMD:
+    case A_I2CS_INTR_CTRL:
+    case A_I2CS_DMA_LEN_STS:
         /* Value is already set, don't do anything. */
         break;
+    case A_I2CS_INTR_STS:
+        break;
     case A_I2CM_CMD:
         value =3D SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bu=
s->bus));
         break;
@@ -547,12 +568,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *b=
us, hwaddr offset,
=20
     switch (offset) {
     case A_I2CC_FUN_CTRL:
-        if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
-        }
-        bus->regs[R_I2CC_FUN_CTRL] =3D value & 0x007dc3ff;
+        bus->regs[R_I2CC_FUN_CTRL] =3D value;
         break;
     case A_I2CC_AC_TIMING:
         bus->regs[R_I2CC_AC_TIMING] =3D value & 0x1ffff0ff;
@@ -580,6 +596,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bu=
s, hwaddr offset,
                 bus->controller->intr_status &=3D ~(1 << bus->id);
                 qemu_irq_lower(aic->bus_get_irq(bus));
             }
+            aspeed_i2c_bus_raise_slave_interrupt(bus);
             break;
         }
         bus->regs[R_I2CM_INTR_STS] &=3D ~(value & 0xf007f07f);
@@ -668,15 +685,53 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *=
bus, hwaddr offset,
     case A_I2CC_DMA_LEN:
         /* RO */
         break;
-    case A_I2CS_DMA_LEN_STS:
-    case A_I2CS_DMA_TX_ADDR:
-    case A_I2CS_DMA_RX_ADDR:
     case A_I2CS_DEV_ADDR:
+        bus->regs[R_I2CS_DEV_ADDR] =3D value;
+        break;
+    case A_I2CS_DMA_RX_ADDR:
+        bus->regs[R_I2CS_DMA_RX_ADDR] =3D value;
+        break;
+    case A_I2CS_DMA_LEN:
+        assert(FIELD_EX32(value, I2CS_DMA_LEN, TX_BUF_LEN) =3D=3D 0);
+        if (FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN_W1T)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN,
+                             FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN)=
);
+        } else {
+            bus->regs[R_I2CS_DMA_LEN] =3D value;
+        }
+        break;
+    case A_I2CS_CMD:
+        if (FIELD_EX32(value, I2CS_CMD, W1_CTRL)) {
+            bus->regs[R_I2CS_CMD] |=3D value;
+        } else {
+            bus->regs[R_I2CS_CMD] =3D value;
+        }
+        i2c_slave_set_address(bus->slave, bus->regs[R_I2CS_DEV_ADDR]);
+        break;
     case A_I2CS_INTR_CTRL:
+        bus->regs[R_I2CS_INTR_CTRL] =3D value;
+        break;
+
     case A_I2CS_INTR_STS:
-    case A_I2CS_CMD:
-    case A_I2CS_DMA_LEN:
-        qemu_log_mask(LOG_UNIMP, "%s: Slave mode is not implemented\n",
+        if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_CTRL, PKT_CMD_DONE)) {
+            if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE)=
 &&
+                FIELD_EX32(value, I2CS_INTR_STS, PKT_CMD_DONE)) {
+                bus->regs[R_I2CS_INTR_STS] &=3D 0xfffc0000;
+            }
+        } else {
+            bus->regs[R_I2CS_INTR_STS] &=3D ~value;
+        }
+        if (!bus->regs[R_I2CS_INTR_STS]) {
+            bus->controller->intr_status &=3D ~(1 << bus->id);
+            qemu_irq_lower(aic->bus_get_irq(bus));
+        }
+        aspeed_i2c_bus_raise_interrupt(bus);
+        break;
+    case A_I2CS_DMA_LEN_STS:
+        bus->regs[R_I2CS_DMA_LEN_STS] =3D 0;
+        break;
+    case A_I2CS_DMA_TX_ADDR:
+        qemu_log_mask(LOG_UNIMP, "%s: Slave mode DMA TX is not implement=
ed\n",
                       __func__);
         break;
     default:
@@ -1037,6 +1092,39 @@ static const TypeInfo aspeed_i2c_info =3D {
     .abstract   =3D true,
 };
=20
+static int aspeed_i2c_bus_new_slave_event(AspeedI2CBus *bus,
+                                          enum i2c_event event)
+{
+    switch (event) {
+    case I2C_START_SEND_ASYNC:
+        if (!SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CS_CMD, RX_DMA_EN)) =
{
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Slave mode RX DMA is not enabled\n", __fu=
nc__);
+            return -1;
+        }
+        ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN, 0);
+        bus->regs[R_I2CC_DMA_ADDR] =3D
+            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_RX_ADDR, ADDR);
+        bus->regs[R_I2CC_DMA_LEN] =3D
+            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN) + 1;
+        i2c_ack(bus->bus);
+        break;
+    case I2C_FINISH:
+        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE, 1);
+        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, =
1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, NORMAL_STOP,=
 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, RX_DONE, 1);
+        aspeed_i2c_bus_raise_slave_interrupt(bus);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: i2c event %d unimplemented\n",
+                      __func__, event);
+        return -1;
+    }
+
+    return 0;
+}
+
 static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event ev=
ent)
 {
     BusState *qbus =3D qdev_get_parent_bus(DEVICE(slave));
@@ -1045,6 +1133,10 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *sl=
ave, enum i2c_event event)
     uint32_t reg_byte_buf =3D aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t value;
=20
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_slave_event(bus, event);
+    }
+
     switch (event) {
     case I2C_START_SEND_ASYNC:
         value =3D SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BU=
F);
@@ -1073,6 +1165,19 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *sl=
ave, enum i2c_event event)
     return 0;
 }
=20
+static void aspeed_i2c_bus_new_slave_send_async(AspeedI2CBus *bus, uint8=
_t data)
+{
+    assert(address_space_write(&bus->controller->dram_as,
+                               bus->regs[R_I2CC_DMA_ADDR],
+                               MEMTXATTRS_UNSPECIFIED, &data, 1) =3D=3D =
MEMTX_OK);
+
+    bus->regs[R_I2CC_DMA_ADDR]++;
+    bus->regs[R_I2CC_DMA_LEN]--;
+    ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN,
+                     ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN_STS, RX_LE=
N) + 1);
+    i2c_ack(bus->bus);
+}
+
 static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t dat=
a)
 {
     BusState *qbus =3D qdev_get_parent_bus(DEVICE(slave));
@@ -1080,6 +1185,10 @@ static void aspeed_i2c_bus_slave_send_async(I2CSla=
ve *slave, uint8_t data)
     uint32_t reg_intr_sts =3D aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_byte_buf =3D aspeed_i2c_bus_byte_buf_offset(bus);
=20
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_slave_send_async(bus, data);
+    }
+
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
=20
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index ba148b2f6d..300a89b343 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -174,6 +174,8 @@ REG32(I2CM_DMA_LEN, 0x1c)
     FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
     FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
 REG32(I2CS_INTR_CTRL, 0x20)
+    FIELD(I2CS_INTR_CTRL, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CS_INTR_CTRL, PKT_CMD_DONE, 16, 1)
 REG32(I2CS_INTR_STS, 0x24)
     /* 31:29 shared with I2CD_INTR_STS[31:29] */
     FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
@@ -184,6 +186,7 @@ REG32(I2CS_INTR_STS, 0x24)
     FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
     FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
     /* 14:0 shared with I2CD_INTR_STS[14:0] */
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)
 REG32(I2CS_CMD, 0x28)
     FIELD(I2CS_CMD, W1_CTRL, 31, 1)
     FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
--=20
2.30.2


