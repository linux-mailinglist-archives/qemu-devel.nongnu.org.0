Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C94BB455
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:34:45 +0100 (CET)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyiy-0006Vh-KJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTd-0007CY-0K; Fri, 18 Feb 2022 03:18:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTZ-0000aX-KG; Fri, 18 Feb 2022 03:18:52 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I7b8J6016605; 
 Fri, 18 Feb 2022 08:18:27 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea6dq9s4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:26 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8Dr4P020136;
 Fri, 18 Feb 2022 08:18:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3e64hadx5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21I8ILGc44106208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:18:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E2D34C04E;
 Fri, 18 Feb 2022 08:18:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DA9C4C04A;
 Fri, 18 Feb 2022 08:18:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:18:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 83A3D2201E5;
 Fri, 18 Feb 2022 09:18:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] aspeed: Introduce a create_pca9552() helper
Date: Fri, 18 Feb 2022 09:18:13 +0100
Message-Id: <20220218081815.641169-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BHFrB0_RhHW7lSZjQIegxFaCI72Ltmsd
X-Proofpoint-GUID: BHFrB0_RhHW7lSZjQIegxFaCI72Ltmsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=752 clxscore=1034 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
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


