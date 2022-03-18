Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7C4DDAEB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:51:16 +0100 (CET)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD0d-0001XO-S0
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:51:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCez-00084e-2R; Fri, 18 Mar 2022 09:28:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCex-00031s-3L; Fri, 18 Mar 2022 09:28:52 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnsU3017995; 
 Fri, 18 Mar 2022 13:28:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3euwuj9w7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:41 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IDL7UC025363;
 Fri, 18 Mar 2022 13:28:41 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3euwuj9w7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:41 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDP6wi014913;
 Fri, 18 Mar 2022 13:28:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk595m1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22IDH5qh46006730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:17:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 245E8AE04D;
 Fri, 18 Mar 2022 13:28:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0CB8AE051;
 Fri, 18 Mar 2022 13:28:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Mar 2022 13:28:36 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0E0BE220338;
 Fri, 18 Mar 2022 14:28:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 07/17] hw/sd: Add sd_cmd_SEND_OP_CMD() handler
Date: Fri, 18 Mar 2022 14:28:14 +0100
Message-Id: <20220318132824.1134400-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FaU8vfziLy101fEjXtklKiJv3ePO6z_5
X-Proofpoint-GUID: ZlrORYDD9FYOUBBbGrzx7A_BXUt3uuNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1034 mlxlogscore=799 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180074
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20210624142209.1193073-9-f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 30429e8954d3..a6ce54433388 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1010,6 +1010,13 @@ static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState =
*sd, SDRequest req)
     return sd->spi ? sd_r1 : sd_r0;
 }
=20
+static sd_rsp_type_t sd_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
+{
+    sd->state =3D sd_transfer_state;
+
+    return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca =3D 0x0000;
@@ -1049,10 +1056,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd=
, SDRequest req)
=20
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 1:	/* CMD1:   SEND_OP_CMD */
-        sd->state =3D sd_transfer_state;
-        return sd_r1;
-
     case 2:	/* CMD2:   ALL_SEND_CID */
         switch (sd->state) {
         case sd_ready_state:
@@ -1602,11 +1605,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         break;
=20
     case 41:	/* ACMD41: SD_APP_OP_COND */
-        if (sd->spi) {
-            /* SEND_OP_CMD */
-            sd->state =3D sd_transfer_state;
-            return sd_r1;
-        }
         if (sd->state !=3D sd_idle_state) {
             break;
         }
@@ -2111,6 +2109,7 @@ static const SDProto sd_proto_spi =3D {
     .name =3D "SPI",
     .cmd =3D {
         [0]         =3D sd_cmd_GO_IDLE_STATE,
+        [1]         =3D sd_cmd_SEND_OP_CMD,
         [2 ... 4]   =3D sd_cmd_illegal,
         [5]         =3D sd_cmd_illegal,
         [7]         =3D sd_cmd_illegal,
@@ -2120,6 +2119,7 @@ static const SDProto sd_proto_spi =3D {
     },
     .cmd =3D {
         [6]         =3D sd_cmd_unimplemented,
+        [41]        =3D sd_cmd_SEND_OP_CMD,
     },
 };
=20
--=20
2.34.1


