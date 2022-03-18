Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382844DDB1A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:59:03 +0100 (CET)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD8A-0000K5-Ab
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:59:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf7-0008VO-08; Fri, 18 Mar 2022 09:29:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf5-00035b-9F; Fri, 18 Mar 2022 09:29:00 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnw2H017448; 
 Fri, 18 Mar 2022 13:28:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3evqgxc5ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:48 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ICtr50024151;
 Fri, 18 Mar 2022 13:28:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3evqgxc5tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDP3MV015319;
 Fri, 18 Mar 2022 13:28:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3euc6r544r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22IDHBEp39322106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:17:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5561552051;
 Fri, 18 Mar 2022 13:28:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 06CC552050;
 Fri, 18 Mar 2022 13:28:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 31BF8220338;
 Fri, 18 Mar 2022 14:28:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 15/17] hw/sd: Add mmc switch function support
Date: Fri, 18 Mar 2022 14:28:22 +0100
Message-Id: <20220318132824.1134400-16-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N_YwZgfd5Hhnd3_m1XkRbf59k7yH-McY
X-Proofpoint-GUID: lx74fxvxnSGAzXZX0CrVWbk30VPk6G8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=782 suspectscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1034 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180074
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

switch operation in mmc cards, updated the ext_csd register to
request changes in card operations. Here we implement similar
sequence but requests are mostly dummy and make no change.

Implement SWITCH_ERROR if the write operation offset goes beyond length
of ext_csd.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
[ clg: - ported on aspeed-7.0 patchset ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 3a3b9d62e1ba..d3bda6c2aa6b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -538,6 +538,7 @@ static void sd_set_rca(SDState *sd)
 FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
 FIELD(CSR, APP_CMD,                     5,  1)
 FIELD(CSR, FX_EVENT,                    6,  1)
+FIELD(CSR, SWITCH_ERROR,                7,  1)
 FIELD(CSR, READY_FOR_DATA,              8,  1)
 FIELD(CSR, CURRENT_STATE,               9,  4)
 FIELD(CSR, ERASE_RESET,                13,  1)
@@ -935,6 +936,43 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr=
)
     return ret;
 }
=20
+enum {
+    MMC_CMD6_ACCESS_COMMAND_SET =3D 0,
+    MMC_CMD6_ACCESS_SET_BITS,
+    MMC_CMD6_ACCESS_CLEAR_BITS,
+    MMC_CMD6_ACCESS_WRITE_BYTE,
+};
+
+static void mmc_function_switch(SDState *sd, uint32_t arg)
+{
+    uint32_t access =3D extract32(arg, 24, 2);
+    uint32_t index =3D extract32(arg, 16, 8);
+    uint32_t value =3D extract32(arg, 8, 8);
+    uint8_t b =3D sd->ext_csd[index];
+
+    switch (access) {
+    case MMC_CMD6_ACCESS_COMMAND_SET:
+        qemu_log_mask(LOG_UNIMP, "MMC Command set switching not supporte=
d\n");
+        return;
+    case MMC_CMD6_ACCESS_SET_BITS:
+        b |=3D value;
+        break;
+    case MMC_CMD6_ACCESS_CLEAR_BITS:
+        b &=3D ~value;
+        break;
+    case MMC_CMD6_ACCESS_WRITE_BYTE:
+        b =3D value;
+        break;
+    }
+
+    if (index >=3D 192) {
+        sd->card_status |=3D R_CSR_SWITCH_ERROR_MASK;
+        return;
+    }
+
+    sd->ext_csd[index] =3D b;
+}
+
 static void sd_function_switch(SDState *sd, uint32_t arg)
 {
     int i, mode, new_func;
@@ -2340,6 +2378,19 @@ static sd_rsp_type_t sd_emmc_cmd_SEND_TUNING_BLOCK=
(SDState *sd, SDRequest req)
     return sd_r1;
 }
=20
+static sd_rsp_type_t sd_emmc_cmd_SWITCH_FUNCTION(SDState *sd, SDRequest =
req)
+{
+    switch (sd->state) {
+    case sd_transfer_state:
+        sd->state =3D sd_programming_state;
+        mmc_function_switch(sd, req.arg);
+        sd->state =3D sd_transfer_state;
+        return sd_r1b;
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 static const SDProto sd_proto_emmc =3D {
     .name =3D "eMMC",
     .cmd =3D {
@@ -2348,6 +2399,7 @@ static const SDProto sd_proto_emmc =3D {
         [2]         =3D sd_emmc_cmd_ALL_SEND_CID,
         [3]         =3D sd_emmc_cmd_SEND_RELATIVE_ADDR,
         [5]         =3D sd_cmd_illegal,
+        [6]         =3D sd_emmc_cmd_SWITCH_FUNCTION,
         [8]         =3D sd_emmc_cmd_SEND_EXT_CSD,
         [19]        =3D sd_cmd_SEND_TUNING_BLOCK,
         [21]        =3D sd_emmc_cmd_SEND_TUNING_BLOCK,
--=20
2.34.1


