Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7172D5B4C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:09:56 +0100 (CET)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLhj-00087L-7i
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ9-0001nj-LG; Thu, 10 Dec 2020 07:51:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ7-0001UU-DH; Thu, 10 Dec 2020 07:51:45 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAC48Ea001075; Thu, 10 Dec 2020 07:51:25 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bj9m37uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:51:25 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACVQ4f003655;
 Thu, 10 Dec 2020 12:51:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u85sxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:51:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BACpLMY17170912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:51:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42DF811C04A;
 Thu, 10 Dec 2020 12:51:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00B4011C054;
 Thu, 10 Dec 2020 12:51:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 12:51:20 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 34995220156;
 Thu, 10 Dec 2020 13:51:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/5] aspeed/smc: Add support for address lane disablement
Date: Thu, 10 Dec 2020 13:51:14 +0100
Message-Id: <20201210125115.1812083-5-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
References: <20201210125115.1812083-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=652
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1034 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100080
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
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
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20201120161547.740806-2-clg@kaod.org>
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


