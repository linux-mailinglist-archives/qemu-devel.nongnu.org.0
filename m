Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA302BAFCA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:19:12 +0100 (CET)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg97v-0006Pk-3h
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg954-0002z4-DY; Fri, 20 Nov 2020 11:16:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kg952-0004kk-Kj; Fri, 20 Nov 2020 11:16:14 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKG2HiP158477; Fri, 20 Nov 2020 11:15:55 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xdrvyvtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 11:15:55 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKGChl4011716;
 Fri, 20 Nov 2020 16:15:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 34t6v8cv7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 16:15:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKGFoHO62849344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 16:15:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC03E52054;
 Fri, 20 Nov 2020 16:15:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 951435204E;
 Fri, 20 Nov 2020 16:15:50 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-178-186.de.ibm.com [9.145.178.186])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D395C2201CF;
 Fri, 20 Nov 2020 17:15:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] aspeed/smc: Add support for address lane
 disablement
Date: Fri, 20 Nov 2020 17:15:46 +0100
Message-Id: <20201120161547.740806-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120161547.740806-1-clg@kaod.org>
References: <20201120161547.740806-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_08:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=623 clxscore=1034 priorityscore=1501
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200106
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The controller can be configured to disable or enable address and data
byte lanes when issuing commands. This is useful in read command mode
to send SPI NOR commands that don't have an address space, such as
RDID. It's a good way to have a unified read operation for registers
and flash contents accesses.

A new SPI driver proposed by Aspeed makes use of this feature. Add
support for address lanes to start with. We will do the same for the
data lanes if they are controlled one day.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 795784e5f364..e3d5e26058c0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -71,6 +71,16 @@
 #define   INTR_CTRL_CMD_ABORT_EN          (1 << 2)
 #define   INTR_CTRL_WRITE_PROTECT_EN      (1 << 1)
=20
+/* Command Control Register */
+#define R_CE_CMD_CTRL      (0x0C / 4)
+#define   CTRL_ADDR_BYTE0_DISABLE_SHIFT       4
+#define   CTRL_DATA_BYTE0_DISABLE_SHIFT       0
+
+#define aspeed_smc_addr_byte_enabled(s, i)                              =
 \
+    (!((s)->regs[R_CE_CMD_CTRL] & (1 << (CTRL_ADDR_BYTE0_DISABLE_SHIFT +=
 (i)))))
+#define aspeed_smc_data_byte_enabled(s, i)                              =
 \
+    (!((s)->regs[R_CE_CMD_CTRL] & (1 << (CTRL_DATA_BYTE0_DISABLE_SHIFT +=
 (i)))))
+
 /* CEx Control Register */
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_IO_QPI              (1 << 31)
@@ -702,19 +712,17 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *=
fl, uint32_t addr)
 {
     const AspeedSMCState *s =3D fl->controller;
     uint8_t cmd =3D aspeed_smc_flash_cmd(fl);
-    int i;
+    int i =3D aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
=20
     /* Flash access can not exceed CS segment */
     addr =3D aspeed_smc_check_segment_addr(fl, addr);
=20
     ssi_transfer(s->spi, cmd);
-
-    if (aspeed_smc_flash_is_4byte(fl)) {
-        ssi_transfer(s->spi, (addr >> 24) & 0xff);
+    while (i--) {
+        if (aspeed_smc_addr_byte_enabled(s, i)) {
+            ssi_transfer(s->spi, (addr >> (i * 8)) & 0xff);
+        }
     }
-    ssi_transfer(s->spi, (addr >> 16) & 0xff);
-    ssi_transfer(s->spi, (addr >> 8) & 0xff);
-    ssi_transfer(s->spi, (addr & 0xff));
=20
     /*
      * Use fake transfers to model dummy bytes. The value should
@@ -988,6 +996,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         (addr >=3D s->r_timings &&
          addr < s->r_timings + s->ctrl->nregs_timings) ||
         addr =3D=3D s->r_ce_ctrl ||
+        addr =3D=3D R_CE_CMD_CTRL ||
         addr =3D=3D R_INTR_CTRL ||
         addr =3D=3D R_DUMMY_DATA ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
@@ -1276,6 +1285,8 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
         if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
             aspeed_smc_flash_set_segment(s, cs, value);
         }
+    } else if (addr =3D=3D R_CE_CMD_CTRL) {
+        s->regs[addr] =3D value & 0xff;
     } else if (addr =3D=3D R_DUMMY_DATA) {
         s->regs[addr] =3D value & 0xff;
     } else if (addr =3D=3D R_INTR_CTRL) {
--=20
2.26.2


