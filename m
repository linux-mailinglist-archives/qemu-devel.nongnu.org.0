Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8894B83E1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:24:20 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGXr-0006yc-Li
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGVC-0003Wj-Vd; Wed, 16 Feb 2022 04:21:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34618
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGVA-0000CH-Oy; Wed, 16 Feb 2022 04:21:34 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G8fLUJ026688; 
 Wed, 16 Feb 2022 09:21:21 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8w64sj1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:21 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9IflR024585;
 Wed, 16 Feb 2022 09:21:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64ha6hfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21G9LHeV36045166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:21:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31673A405F;
 Wed, 16 Feb 2022 09:21:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECB03A4040;
 Wed, 16 Feb 2022 09:21:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Feb 2022 09:21:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.91.22])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3E8F82201E5;
 Wed, 16 Feb 2022 10:21:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 5/6] aspeed/smc: Add an address mask on segment registers
Date: Wed, 16 Feb 2022 10:21:10 +0100
Message-Id: <20220216092111.237896-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216092111.237896-1-clg@kaod.org>
References: <20220216092111.237896-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E0JdiRYKphSWU1phHmAWRdAEmy5ilk0l
X-Proofpoint-GUID: E0JdiRYKphSWU1phHmAWRdAEmy5ilk0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1034
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.186,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only a limited set of bits are used for decoding the Start and End
addresses of the mapping window of a flash device.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index e26555581996..cad73ddc13f2 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -99,6 +99,7 @@ struct AspeedSMCClass {
     uint8_t max_peripherals;
     const uint32_t *resets;
     const AspeedSegments *segments;
+    uint32_t segment_addr_mask;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
     uint32_t features;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index ff154eb84f85..d899be17fd71 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -259,6 +259,10 @@ static void aspeed_smc_flash_set_segment_region(Aspe=
edSMCState *s, int cs,
     memory_region_set_enabled(&fl->mmio, !!seg.size);
     memory_region_transaction_commit();
=20
+    if (asc->segment_addr_mask) {
+        regval &=3D asc->segment_addr_mask;
+    }
+
     s->regs[R_SEG_ADDR0 + cs] =3D regval;
 }
=20
@@ -1364,6 +1368,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 5;
     asc->segments          =3D aspeed_2400_fmc_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->resets            =3D aspeed_2400_fmc_resets;
     asc->flash_window_base =3D 0x20000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1446,6 +1451,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 3;
     asc->segments          =3D aspeed_2500_fmc_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->resets            =3D aspeed_2500_fmc_resets;
     asc->flash_window_base =3D 0x20000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1483,6 +1489,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 2;
     asc->segments          =3D aspeed_2500_spi1_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->flash_window_base =3D 0x30000000;
     asc->flash_window_size =3D 0x8000000;
     asc->features          =3D 0x0;
@@ -1517,6 +1524,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 2;
     asc->segments          =3D aspeed_2500_spi2_segments;
+    asc->segment_addr_mask =3D 0xffff0000;
     asc->flash_window_base =3D 0x38000000;
     asc->flash_window_size =3D 0x8000000;
     asc->features          =3D 0x0;
@@ -1598,6 +1606,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 3;
     asc->segments          =3D aspeed_2600_fmc_segments;
+    asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->resets            =3D aspeed_2600_fmc_resets;
     asc->flash_window_base =3D 0x20000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1636,6 +1645,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 2;
     asc->segments          =3D aspeed_2600_spi1_segments;
+    asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->flash_window_base =3D 0x30000000;
     asc->flash_window_size =3D 0x10000000;
     asc->features          =3D ASPEED_SMC_FEATURE_DMA |
@@ -1674,6 +1684,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass=
 *klass, void *data)
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
     asc->max_peripherals   =3D 3;
     asc->segments          =3D aspeed_2600_spi2_segments;
+    asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->flash_window_base =3D 0x50000000;
     asc->flash_window_size =3D 0x10000000;
     asc->features          =3D ASPEED_SMC_FEATURE_DMA |
--=20
2.34.1


