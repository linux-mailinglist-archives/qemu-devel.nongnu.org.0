Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4AD4DDB08
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:56:58 +0100 (CET)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD69-0004yl-HL
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:56:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCey-00083j-5V; Fri, 18 Mar 2022 09:28:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60622
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCew-00031h-DC; Fri, 18 Mar 2022 09:28:51 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnrSv007066; 
 Fri, 18 Mar 2022 13:28:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euy5wrguj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:47 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IDIqKG013885;
 Fri, 18 Mar 2022 13:28:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euy5wrgu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDP3kf015317;
 Fri, 18 Mar 2022 13:28:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3euc6r544p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22IDHADW45482268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:17:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95668A405C;
 Fri, 18 Mar 2022 13:28:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43421A405B;
 Fri, 18 Mar 2022 13:28:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Mar 2022 13:28:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6641E2201E8;
 Fri, 18 Mar 2022 14:28:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 14/17] hw/sd: Add CMD21 tuning sequence
Date: Fri, 18 Mar 2022 14:28:21 +0100
Message-Id: <20220318132824.1134400-15-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0fNwd-m3zGxNQQYw_ZztkOdXclQBloov
X-Proofpoint-ORIG-GUID: 4mO9RwKQcFYVItYrscb2M1fEBsAYCw6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1034
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=590 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180074
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

MMC cards support different tuning sequence for entering HS200 mode.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[ clg: - ported on aspeed-7.0 patchset ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 289764a38bf3..3a3b9d62e1ba 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2071,6 +2071,30 @@ static const uint8_t sd_tuning_block_pattern[SD_TU=
NING_BLOCK_SIZE] =3D {
     0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
 };
=20
+#define EXCSD_BUS_WIDTH_OFFSET 183
+#define BUS_WIDTH_8_MASK    0x4
+#define BUS_WIDTH_4_MASK    0x2
+#define MMC_TUNING_BLOCK_SIZE   128
+
+static const uint8_t mmc_tuning_block_pattern[128] =3D {
+       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
+       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
+       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
+       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
+       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
+       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
+       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
+       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
+       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
+       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
+       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
+       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
+       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
+       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
+       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
+       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,
+};
+
 uint8_t sd_read_byte(SDState *sd)
 {
     /* TODO: Append CRCs */
@@ -2165,6 +2189,21 @@ uint8_t sd_read_byte(SDState *sd)
         ret =3D sd_tuning_block_pattern[sd->data_offset++];
         break;
=20
+    case 21:    /* CMD21: SEND_TUNING_BLOCK (MMC) */
+        if (sd->data_offset >=3D MMC_TUNING_BLOCK_SIZE - 1) {
+            sd->state =3D sd_transfer_state;
+        }
+        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
+            ret =3D mmc_tuning_block_pattern[sd->data_offset++];
+        } else {
+            /* Return LSB Nibbles of two byte from the 8bit tuning block
+             * for 4bit mode
+             */
+            ret =3D mmc_tuning_block_pattern[sd->data_offset++] & 0x0F;
+            ret |=3D (mmc_tuning_block_pattern[sd->data_offset++] & 0x0F=
) << 4;
+        }
+        break;
+
     case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
         ret =3D sd->data[sd->data_offset ++];
=20
--=20
2.34.1


