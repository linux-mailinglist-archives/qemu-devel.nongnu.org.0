Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4964C63C2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:23:51 +0100 (CET)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOaNq-0008VP-9A
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDZ-0004Nr-69; Mon, 28 Feb 2022 02:13:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5054
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDX-0004Hm-JI; Mon, 28 Feb 2022 02:13:12 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S4DWYJ022604; 
 Mon, 28 Feb 2022 07:12:53 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egq5ybvbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:53 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S77HR3023231;
 Mon, 28 Feb 2022 07:12:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu95yhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7CmVl53019060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:12:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E9F84C044;
 Mon, 28 Feb 2022 07:12:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C6704C040;
 Mon, 28 Feb 2022 07:12:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 07:12:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 804C02201B4;
 Mon, 28 Feb 2022 08:12:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 6/7] aspeed/smc: Add an address mask on segment registers
Date: Mon, 28 Feb 2022 08:12:38 +0100
Message-Id: <20220228071239.404171-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228071239.404171-1-clg@kaod.org>
References: <20220228071239.404171-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vDUQrwH4OWdnZuG3aQTl_0c-47n6EbH-
X-Proofpoint-GUID: vDUQrwH4OWdnZuG3aQTl_0c-47n6EbH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1034 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202280040
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
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


