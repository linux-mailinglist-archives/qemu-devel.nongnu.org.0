Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E929C3F016D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 12:18:14 +0200 (CEST)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGIeD-000171-H8
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 06:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1mGIdN-0000EQ-LF; Wed, 18 Aug 2021 06:17:21 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:38681
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1mGIdK-0003gV-Ay; Wed, 18 Aug 2021 06:17:21 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629281822; h=from:subject:to:date:message-id;
 bh=II84cgnFyR2+0tUn4WXFPeMG63ntBcPxWbWKpExN8s8=;
 b=EioZd/ldnRra7PA2V++0zlycbbsfQH4De6ZZvY7BQAvAMW3sIO4yoA6Qrg8r3REy/syhM0WF2Lx
 Rt/G0P34+Q6p13CJlh5sj6ayM1r5Kpx0TieBN5gnfgtdf2BRawOmA6orHzuMt4WyogzqGc5HDJSGp
 og6+FSB1YDuWD04HsXo=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Wed, 18 Aug 2021 18:17:00 +0800
From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "alistair@alistair23.me" <alistair@alistair23.me>
Subject: [PATCH v5] hw/dma/pl330: Add memory region to replace default
Thread-Topic: [PATCH v5] hw/dma/pl330: Add memory region to replace default
Thread-Index: AdeUGi5e/tTfHVLLRNOJikIHWQLmWA==
Date: Wed, 18 Aug 2021 10:17:00 +0000
Message-ID: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.204]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--6.194600-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Jianxian.Wen@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add property memory region which can connect with IOMMU region to support S=
MMU translate.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
---
v5 (after review of Philippe Mathieu-Daud=E9):
 - Refine code and use memory_region_name() to get MR name.
v4 (after review of Philippe Mathieu-Daud=E9):
 - Avoid creating new AS for system memory, add AS if we connect with IOMMU=
 region.
v3 (after review of Philippe Mathieu-Daud=E9):
 - Refine code to comply with code style, update error message if memory li=
nk is not set.
v2 (after review of Peter Maydell):
 - Use dma_memory_read/write functions to do data access, update function A=
ddressSpace* parameter.

 hw/arm/exynos4210.c  |  3 +++
 hw/arm/xilinx_zynq.c |  3 +++
 hw/dma/pl330.c       | 26 ++++++++++++++++++++++----
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 5c7a51b..0299e81 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -173,6 +173,9 @@ static DeviceState *pl330_create(uint32_t base, qemu_or=
_irq *orgate,
     int i;
=20
     dev =3D qdev_new("pl330");
+    object_property_set_link(OBJECT(dev), "memory",
+                             OBJECT(get_system_memory()),
+                             &error_fatal);
     qdev_prop_set_uint8(dev, "num_events", nevents);
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 245af81..69c333e 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -312,6 +312,9 @@ static void zynq_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
=20
     dev =3D qdev_new("pl330");
+    object_property_set_link(OBJECT(dev), "memory",
+                             OBJECT(address_space_mem),
+                             &error_fatal);
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  4);
     qdev_prop_set_uint8(dev, "num_events",  16);
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 944ba29..0cb4619 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -269,6 +269,9 @@ struct PL330State {
     uint8_t num_faulting;
     uint8_t periph_busy[PL330_PERIPH_NUM];
=20
+    /* Memory region that DMA operation access */
+    MemoryRegion *mem_mr;
+    AddressSpace *mem_as;
 };
=20
 #define TYPE_PL330 "pl330"
@@ -1108,7 +1111,7 @@ static inline const PL330InsnDesc *pl330_fetch_insn(P=
L330Chan *ch)
     uint8_t opcode;
     int i;
=20
-    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
+    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1);
     for (i =3D 0; insn_desc[i].size; i++) {
         if ((opcode & insn_desc[i].opmask) =3D=3D insn_desc[i].opcode) {
             return &insn_desc[i];
@@ -1122,7 +1125,7 @@ static inline void pl330_exec_insn(PL330Chan *ch, con=
st PL330InsnDesc *insn)
     uint8_t buf[PL330_INSN_MAXSIZE];
=20
     assert(insn->size <=3D PL330_INSN_MAXSIZE);
-    dma_memory_read(&address_space_memory, ch->pc, buf, insn->size);
+    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size);
     insn->exec(ch, buf[0], &buf[1], insn->size - 1);
 }
=20
@@ -1186,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
     if (q !=3D NULL && q->len <=3D pl330_fifo_num_free(&s->fifo)) {
         int len =3D q->len - (q->addr & (q->len - 1));
=20
-        dma_memory_read(&address_space_memory, q->addr, buf, len);
+        dma_memory_read(s->mem_as, q->addr, buf, len);
         trace_pl330_exec_cycle(q->addr, len);
         if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
             pl330_hexdump(buf, len);
@@ -1217,7 +1220,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
             fifo_res =3D pl330_fifo_get(&s->fifo, buf, len, q->tag);
         }
         if (fifo_res =3D=3D PL330_FIFO_OK || q->z) {
-            dma_memory_write(&address_space_memory, q->addr, buf, len);
+            dma_memory_write(s->mem_as, q->addr, buf, len);
             trace_pl330_exec_cycle(q->addr, len);
             if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
                 pl330_hexdump(buf, len);
@@ -1562,6 +1565,18 @@ static void pl330_realize(DeviceState *dev, Error **=
errp)
                           "dma", PL330_IOMEM_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
=20
+    if (!s->mem_mr) {
+        error_setg(errp, "'memory' link is not set");
+        return;
+    } else if (s->mem_mr =3D=3D get_system_memory()) {
+        /* Avoid creating new AS for system memory. */
+        s->mem_as =3D &address_space_memory;
+    } else {
+        s->mem_as =3D g_new0(AddressSpace, 1);
+        address_space_init(s->mem_as, s->mem_mr,
+                           memory_region_name(s->mem_mr));
+    }
+
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, =
s);
=20
     s->cfg[0] =3D (s->mgr_ns_at_rst ? 0x4 : 0) |
@@ -1656,6 +1671,9 @@ static Property pl330_properties[] =3D {
     DEFINE_PROP_UINT8("rd_q_dep", PL330State, rd_q_dep, 16),
     DEFINE_PROP_UINT16("data_buffer_dep", PL330State, data_buffer_dep, 256=
),
=20
+    DEFINE_PROP_LINK("memory", PL330State, mem_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.7.4

