Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4153455E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:54:12 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nty1D-0003jZ-Qp
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6144085ad1=pdel@fb.com>)
 id 1ntxy7-0000m0-FE
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:50:59 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:64448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6144085ad1=pdel@fb.com>)
 id 1ntxy5-0007jt-F0
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:50:59 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PGtc9m017420
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:50:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=fabR/SupSLte16elj0BuyT31+eBPj42k7Udd3gKWjB4=;
 b=Hw7PLVfoVChb8x9V/qMSTUUoQibB3OJIgk2ffnv5DMn1q9Kt7zRngRz/FuoDbouorQ60
 hU0rFfuiCSlc/6l5ORSxkP8/hoPNRE1e1w8rlL4AzTbOrZF1IcE79TTGC/7np+UgvMrw
 LAzrbuBH2NqbULQfnGvxFRJ1TnKTnU7Wb3Y= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g93vs8uqv-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:50:56 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 25 May 2022 13:50:50 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 3B0D66E38181; Wed, 25 May 2022 13:50:40 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zhdaniel@fb.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 <k.jensen@samsung.com>
Subject: [RFC 1/1] i2c/aspeed: Add slave device handling in new register mode
Date: Wed, 25 May 2022 13:50:24 -0700
Message-ID: <20220525205024.1158075-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220525205024.1158075-1-pdel@fb.com>
References: <20220525205024.1158075-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RmEHNCmMWFEHjWOEdffsKhg19Y-JyxVt
X-Proofpoint-GUID: RmEHNCmMWFEHjWOEdffsKhg19Y-JyxVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_06,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6144085ad1=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 hw/i2c/aspeed_i2c.c         | 118 ++++++++++++++++++++++++++++++++++--
 include/hw/i2c/aspeed_i2c.h |  14 +++--
 2 files changed, 124 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 3f2dbe46df..01af647e0c 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -221,6 +221,10 @@
 #define I2CM_DMA_LEN          0x1c
 #define I2CS_INT_CTRL_REG     0x20
 #define I2CS_INT_STS_REG      0x24
+#define   I2CS_PKT_DONE       BIT(16)
+#define   I2CS_SLAVE_MATCH    BIT(7)
+#define   I2CS_STOP           BIT(4)
+#define   I2CS_RX_DONE        BIT(2)
 #define I2CS_CMD_STS_REG      0x28
 #define I2CS_DMA_LEN          0x2c
 #define I2CM_DMA_TX_BUF       0x30
@@ -334,16 +338,38 @@ static uint64_t aspeed_i2c_bus_read_new(void *opaqu=
e, hwaddr offset,
         value =3D (i2c_bus_busy(bus->bus) << 16);
         break;
     case I2CC_M_X_POOL_BUF_CTRL_REG:
+        break;
     case I2CS_INT_CTRL_REG:
+        value =3D bus->slave_intr_ctrl;
+        break;
     case I2CS_INT_STS_REG:
+        value =3D bus->slave_intr_status;
+        break;
     case I2CS_CMD_STS_REG:
+        value =3D bus->slave_cmd;
+        break;
     case I2CS_DMA_LEN:
+        value =3D bus->slave_dma_len;
+        break;
     case I2CS_DMA_TX_BUF:
+        /* FIXME: Not sure if we should return same value as RX buf */
+        value =3D bus->slave_dma_addr;
+        break;
     case I2CS_DMA_RX_BUF:
+        value =3D bus->slave_dma_addr;
+        break;
     case I2CS_SA_REG:
+        value =3D bus->dev_addr;
+        break;
     case I2CS_DMA_LEN_STS_REG:
+        value =3D bus->slave_dma_len_tx | (bus->slave_dma_len_rx << 16);
+        break;
     case I2CC_DMA_OP_ADDR_REG:
+        value =3D bus->slave_dma_addr;
+        break;
     case I2CC_DMA_OP_LEN_REG:
+        value =3D bus->slave_dma_len;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, o=
ffset);
@@ -870,9 +896,7 @@ static void aspeed_i2c_bus_write_new(void *opaque, hw=
addr offset,
     switch (offset) {
     case I2CC_M_S_FUNC_CTRL_REG:
         if (value & I2CD_SLAVE_EN) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
+            i2c_slave_set_address(&bus->slave->i2c, bus->dev_addr);
         }
         bus->ctrl =3D value & 0x007FFFFF;
         break;
@@ -934,16 +958,44 @@ static void aspeed_i2c_bus_write_new(void *opaque, =
hwaddr offset,
         bus->dma_len_rx =3D 0;
         break;
     case I2CC_M_X_POOL_BUF_CTRL_REG:
+        break;
     case I2CS_INT_CTRL_REG:
+        bus->slave_intr_ctrl =3D value;
+        break;
     case I2CS_INT_STS_REG:
+        if (value & I2CM_PKT_DONE) {
+            value |=3D 0x280b5;
+        }
+        bus->slave_intr_status &=3D ~value;
+        /* FIXME: Maybe need to check master interrupt status too. */
+        if (!bus->slave_intr_status) {
+            bus->controller->intr_status &=3D ~(1 << bus->id);
+            qemu_irq_lower(aic->bus_get_irq(bus));
+        }
+        break;
     case I2CS_CMD_STS_REG:
+        assert(!(bus->slave_cmd >> 31));
+        bus->slave_cmd =3D value;
+        break;
+    case I2CS_SA_REG:
+        bus->dev_addr =3D value;
+        break;
     case I2CS_DMA_LEN:
+        assert(value);
+        bus->slave_dma_len =3D value;
+        break;
     case I2CS_DMA_TX_BUF:
     case I2CS_DMA_RX_BUF:
-    case I2CS_SA_REG:
+        bus->slave_dma_addr =3D value;
+        break;
     case I2CS_DMA_LEN_STS_REG:
+        bus->slave_dma_len_tx =3D 0;
+        bus->slave_dma_len_rx =3D 0;
+        break;
     case I2CC_DMA_OP_ADDR_REG:
     case I2CC_DMA_OP_LEN_REG:
+        /* Invalid to write to DMA operating status registers */
+        break;
     default:
         break;
     }
@@ -1298,11 +1350,42 @@ static const TypeInfo aspeed_i2c_info =3D {
     .abstract   =3D true,
 };
=20
+static int aspeed_i2c_slave_event_new(AspeedI2CBus *bus, enum i2c_event =
event)
+{
+    AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLASS(bus->controller);
+
+    switch (event) {
+    case I2C_START_SEND:
+        bus->slave_dma_len_rx =3D 0;
+        assert(bus->slave_dma_len_tx =3D=3D 0);
+        assert(bus->slave_dma_len);
+        assert(bus->slave_dma_addr);
+        i2c_ack(bus->bus);
+        break;
+    case I2C_FINISH:
+        bus->slave_intr_status |=3D I2CS_PKT_DONE;
+        bus->slave_intr_status |=3D I2CS_SLAVE_MATCH;
+        bus->slave_intr_status |=3D I2CS_RX_DONE;
+        bus->slave_intr_status |=3D I2CS_STOP;
+        bus->controller->intr_status |=3D 1 << bus->id;
+        qemu_irq_raise(aic->bus_get_irq(bus));
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
 static int aspeed_i2c_slave_event(I2CSlave *slave, enum i2c_event event)
 {
     AspeedI2CSlave *s =3D ASPEED_I2C_SLAVE(slave);
     AspeedI2CBus *bus =3D s->bus;
=20
+    if (aspeed_i2c_bus_is_new_mode(bus)) {
+        return aspeed_i2c_slave_event_new(bus, event);
+    }
+
     switch (event) {
     case I2C_START_SEND:
         bus->buf =3D bus->dev_addr << 1;
@@ -1330,11 +1413,29 @@ static int aspeed_i2c_slave_event(I2CSlave *slave=
, enum i2c_event event)
     return 0;
 }
=20
+static void aspeed_i2c_slave_send_async_new(AspeedI2CBus *bus, uint8_t d=
ata)
+{
+    MemTxResult result =3D address_space_write(&bus->controller->dram_as=
,
+                                             bus->slave_dma_addr,
+                                             MEMTXATTRS_UNSPECIFIED, &da=
ta, 1);
+    assert(result =3D=3D MEMTX_OK);
+
+    bus->slave_dma_addr++;
+    bus->slave_dma_len--;
+    bus->slave_dma_len_rx++;
+
+    i2c_ack(bus->bus);
+}
+
 static void aspeed_i2c_slave_send_async(I2CSlave *slave, uint8_t data)
 {
     AspeedI2CSlave *s =3D ASPEED_I2C_SLAVE(slave);
     AspeedI2CBus *bus =3D s->bus;
=20
+    if (aspeed_i2c_bus_is_new_mode(bus)) {
+        return aspeed_i2c_slave_send_async_new(bus, data);
+    }
+
     bus->buf =3D (data & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIF=
T;
     bus->intr_status |=3D I2CD_INTR_RX_DONE;
=20
@@ -1370,6 +1471,15 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
     s->buf =3D 0;
     s->dma_addr =3D 0;
     s->dma_len =3D 0;
+    s->slave_cmd =3D 0;
+    s->tx_state_machine =3D 0;
+    s->slave_dma_addr =3D 0;
+    s->slave_dma_len =3D 0;
+    s->slave_dma_len_tx =3D 0;
+    s->slave_dma_len_rx =3D 0;
+    s->slave_intr_ctrl =3D 0;
+    s->slave_intr_status =3D 0;
+
     i2c_end_transfer(s->bus);
 }
=20
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 8e0671f60b..615bcb105b 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -61,12 +61,18 @@ struct AspeedI2CBus {
     uint32_t pool_ctrl;
     uint32_t dma_addr;
     uint32_t dma_len;
-
-    uint8_t tx_state_machine;
-    uint32_t intr_ctrl_slave;
-    uint32_t intr_status_slave;
     uint32_t dma_len_tx;
     uint32_t dma_len_rx;
+
+    uint8_t tx_state_machine;
+
+    uint32_t slave_cmd;
+    uint32_t slave_dma_addr;
+    uint32_t slave_dma_len;
+    uint32_t slave_dma_len_tx;
+    uint32_t slave_dma_len_rx;
+    uint32_t slave_intr_ctrl;
+    uint32_t slave_intr_status;
 };
=20
 struct AspeedI2CState {
--=20
2.30.2


