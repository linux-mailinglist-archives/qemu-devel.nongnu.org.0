Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031CE4DDB05
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:55:56 +0100 (CET)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD59-0001PN-2z
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:55:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf2-0008DV-Vk; Fri, 18 Mar 2022 09:28:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32514
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf1-00033P-4Q; Fri, 18 Mar 2022 09:28:56 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnr8o011569; 
 Fri, 18 Mar 2022 13:28:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euxtr8jpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:39 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ID7bCR027584;
 Fri, 18 Mar 2022 13:28:39 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euxtr8jp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:39 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDPA5u014817;
 Fri, 18 Mar 2022 13:28:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3erk58ukj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IDSYhC28443030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:28:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFB995204E;
 Fri, 18 Mar 2022 13:28:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 902AE5204F;
 Fri, 18 Mar 2022 13:28:34 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BE2B92201E8;
 Fri, 18 Mar 2022 14:28:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 04/17] hw/sd: Add sd_cmd_illegal() handler
Date: Fri, 18 Mar 2022 14:28:11 +0100
Message-Id: <20220318132824.1134400-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DNalkDq5HIp8iPKLXY0j2Kxy8CoU_hDo
X-Proofpoint-ORIG-GUID: FSw3S6uH8ufhWwuqCBCqRgIFD95aDLiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 mlxlogscore=851 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Log illegal commands as GUEST_ERROR.

Note: we are logging back the SDIO commands (CMD5, CMD52-54).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-6-f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 57 ++++++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a7c51913df82..6c677de4aadb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -983,6 +983,14 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDStat=
e *sd, SDRequest req)
     return sd_illegal;
 }
=20
+static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i\n",
+                  sd->proto->name, req.cmd);
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca =3D 0x0000;
@@ -1035,15 +1043,10 @@ static sd_rsp_type_t sd_normal_command(SDState *s=
d, SDRequest req)
         break;
=20
     case 1:	/* CMD1:   SEND_OP_CMD */
-        if (!sd->spi)
-            goto bad_cmd;
-
         sd->state =3D sd_transfer_state;
         return sd_r1;
=20
     case 2:	/* CMD2:   ALL_SEND_CID */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_ready_state:
             sd->state =3D sd_identification_state;
@@ -1055,8 +1058,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
         break;
=20
     case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_identification_state:
         case sd_standby_state:
@@ -1070,8 +1071,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
         break;
=20
     case 4:	/* CMD4:   SEND_DSR */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_standby_state:
             break;
@@ -1081,9 +1080,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
         }
         break;
=20
-    case 5: /* CMD5: reserved for SDIO cards */
-        return sd_illegal;
-
     case 6:	/* CMD6:   SWITCH_FUNCTION */
         switch (sd->mode) {
         case sd_data_transfer_mode:
@@ -1099,8 +1095,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
         break;
=20
     case 7:	/* CMD7:   SELECT/DESELECT_CARD */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca !=3D rca)
@@ -1230,8 +1224,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
         break;
=20
     case 15:	/* CMD15:  GO_INACTIVE_STATE */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->mode) {
         case sd_data_transfer_mode:
             if (sd->rca !=3D rca)
@@ -1338,8 +1330,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
         break;
=20
     case 26:	/* CMD26:  PROGRAM_CID */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_transfer_state:
             sd->state =3D sd_receivingdata_state;
@@ -1489,15 +1479,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd=
, SDRequest req)
         }
         break;
=20
-    case 52 ... 54:
-        /* CMD52, CMD53, CMD54: reserved for SDIO cards
-         * (see the SDIO Simplified Specification V2.0)
-         * Handle as illegal command but do not complain
-         * on stderr, as some OSes may use these in their
-         * probing for presence of an SDIO card.
-         */
-        return sd_illegal;
-
     /* Application specific commands (Class 8) */
     case 55:	/* CMD55:  APP_CMD */
         switch (sd->state) {
@@ -1538,19 +1519,12 @@ static sd_rsp_type_t sd_normal_command(SDState *s=
d, SDRequest req)
         break;
=20
     case 58:    /* CMD58:   READ_OCR (SPI) */
-        if (!sd->spi) {
-            goto bad_cmd;
-        }
         return sd_r3;
=20
     case 59:    /* CMD59:   CRC_ON_OFF (SPI) */
-        if (!sd->spi) {
-            goto bad_cmd;
-        }
         return sd_r1;
=20
     default:
-    bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
     }
@@ -2137,10 +2111,25 @@ void sd_enable(SDState *sd, bool enable)
=20
 static const SDProto sd_proto_spi =3D {
     .name =3D "SPI",
+    .cmd =3D {
+        [2 ... 4]   =3D sd_cmd_illegal,
+        [5]         =3D sd_cmd_illegal,
+        [7]         =3D sd_cmd_illegal,
+        [15]        =3D sd_cmd_illegal,
+        [26]        =3D sd_cmd_illegal,
+        [52 ... 54] =3D sd_cmd_illegal,
+    },
 };
=20
 static const SDProto sd_proto_sd =3D {
     .name =3D "SD",
+    .cmd =3D {
+        [1]         =3D sd_cmd_illegal,
+        [5]         =3D sd_cmd_illegal,
+        [52 ... 54] =3D sd_cmd_illegal,
+        [58]        =3D sd_cmd_illegal,
+        [59]        =3D sd_cmd_illegal,
+    },
 };
=20
 static void sd_instance_init(Object *obj)
--=20
2.34.1


