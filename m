Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C54C63BE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:21:25 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOaLU-00056s-Sf
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDc-0004Pc-ID; Mon, 28 Feb 2022 02:13:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDa-0004Hs-Pm; Mon, 28 Feb 2022 02:13:16 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6IiZn004453; 
 Mon, 28 Feb 2022 07:12:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egrgjj5cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S77Lu2017406;
 Mon, 28 Feb 2022 07:12:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjejw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7Clc144695942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:12:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8B804C040;
 Mon, 28 Feb 2022 07:12:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EE764C04E;
 Mon, 28 Feb 2022 07:12:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 07:12:47 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C66AA2203EC;
 Mon, 28 Feb 2022 08:12:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 5/7] aspeed: Introduce a create_pca9552() helper
Date: Mon, 28 Feb 2022 08:12:37 +0100
Message-Id: <20220228071239.404171-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228071239.404171-1-clg@kaod.org>
References: <20220228071239.404171-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MKfj4M9FmlFZnd9A9trMGTJxBlU5Re3N
X-Proofpoint-ORIG-GUID: MKfj4M9FmlFZnd9A9trMGTJxBlU5Re3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1034 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=772 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280040
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This unifies the way we create the pca9552 devices on the different board=
s.

Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index f71a5d87473f..11558b327bc9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -533,6 +533,12 @@ static void romulus_bmc_i2c_init(AspeedMachineState =
*bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338",=
 0x32);
 }
=20
+static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
+{
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, bus_id),
+                            TYPE_PCA9552, addr);
+}
+
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -549,9 +555,9 @@ static void sonorapass_bmc_i2c_init(AspeedMachineStat=
e *bmc)
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54,
                           eeprom4_54);
     /* PCA9539 @ 0x76, but PCA9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552",=
 0x76);
+    create_pca9552(soc, 4, 0x76);
     /* PCA9539 @ 0x77, but PCA9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552",=
 0x77);
+    create_pca9552(soc, 4, 0x77);
=20
     /* bus 6 : */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", =
0x48);
@@ -562,8 +568,8 @@ static void sonorapass_bmc_i2c_init(AspeedMachineStat=
e *bmc)
     uint8_t *eeprom8_56 =3D g_malloc0(8 * 1024);
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x56,
                           eeprom8_56);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x60);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x61);
+    create_pca9552(soc, 8, 0x60);
+    create_pca9552(soc, 8, 0x61);
     /* bus 8 : adc128d818 @ 0x1d */
     /* bus 8 : adc128d818 @ 0x1f */
=20
@@ -701,8 +707,7 @@ static void fp5280g2_bmc_i2c_init(AspeedMachineState =
*bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "ds1338", =
0x68);
=20
     /* It expects a pca9555 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_PCA95=
52,
-                     0x20);
+    create_pca9552(soc, 8, 0x30);
 }
=20
 static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
@@ -712,7 +717,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB)=
;
=20
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552",=
 0x61);
+    create_pca9552(soc, 3, 0x61);
=20
     /* The rainier expects a TMP275 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
@@ -726,14 +731,14 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552",=
 0x60);
+    create_pca9552(soc, 4, 0x60);
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
                      0x49);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "pca9552",=
 0x60);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "pca9552",=
 0x61);
+    create_pca9552(soc, 5, 0x60);
+    create_pca9552(soc, 5, 0x61);
     i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5)=
,
                                       "pca9546", 0x70);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
@@ -752,13 +757,13 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
=20
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x30);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x31);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x32);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x33);
+    create_pca9552(soc, 7, 0x30);
+    create_pca9552(soc, 7, 0x31);
+    create_pca9552(soc, 7, 0x32);
+    create_pca9552(soc, 7, 0x33);
     /* Bus 7: TODO max31785@52 */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x60);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x61);
+    create_pca9552(soc, 7, 0x60);
+    create_pca9552(soc, 7, 0x61);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", =
0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP10=
5,
@@ -772,8 +777,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
                      0x4a);
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB)=
;
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB)=
;
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x60);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x61);
+    create_pca9552(soc, 8, 0x60);
+    create_pca9552(soc, 8, 0x61);
     /* Bus 8: ucd90320@11 */
     /* Bus 8: ucd90320@b */
     /* Bus 8: ucd90320@c */
@@ -794,17 +799,17 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
                                       "pca9546", 0x70);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "pca9552"=
, 0x60);
+    create_pca9552(soc, 11, 0x60);
=20
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB=
);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13), "pca9552"=
, 0x60);
+    create_pca9552(soc, 13, 0x60);
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB=
);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 14), "pca9552"=
, 0x60);
+    create_pca9552(soc, 14, 0x60);
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB=
);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "pca9552"=
, 0x60);
+    create_pca9552(soc, 15, 0x60);
 }
=20
 static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
--=20
2.34.1


