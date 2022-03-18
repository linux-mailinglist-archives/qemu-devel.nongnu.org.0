Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA24DDB07
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:56:53 +0100 (CET)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD64-0004ah-M6
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:56:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf1-00089C-Om; Fri, 18 Mar 2022 09:28:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCez-00032v-Cn; Fri, 18 Mar 2022 09:28:55 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnwZ9001061; 
 Fri, 18 Mar 2022 13:28:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev1w15rfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ICoMjB006803;
 Fri, 18 Mar 2022 13:28:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev1w15req-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDOmxw012603;
 Fri, 18 Mar 2022 13:28:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3erk58ukv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22IDSd9G47186246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:28:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72D4EA4053;
 Fri, 18 Mar 2022 13:28:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21654A4040;
 Fri, 18 Mar 2022 13:28:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Mar 2022 13:28:36 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4304F2201E8;
 Fri, 18 Mar 2022 14:28:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 06/17] hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
Date: Fri, 18 Mar 2022 14:28:13 +0100
Message-Id: <20220318132824.1134400-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y-eSXqj3FSVSZsSXoc_BtNGHWy0RzieT
X-Proofpoint-ORIG-GUID: EArVnGSgmKwTYK7pnxhaQIsCWYyxuP1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1034 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=913 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-8-f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index fd32aeb7fe82..30429e8954d3 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1000,6 +1000,16 @@ static sd_rsp_type_t sd_cmd_unimplemented(SDState =
*sd, SDRequest req)
     return sd_illegal;
 }
=20
+static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
+{
+    if (sd->state !=3D sd_inactive_state) {
+        sd->state =3D sd_idle_state;
+        sd_reset(DEVICE(sd));
+    }
+
+    return sd->spi ? sd_r1 : sd_r0;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca =3D 0x0000;
@@ -1039,18 +1049,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd=
, SDRequest req)
=20
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 0:	/* CMD0:   GO_IDLE_STATE */
-        switch (sd->state) {
-        case sd_inactive_state:
-            return sd->spi ? sd_r1 : sd_r0;
-
-        default:
-            sd->state =3D sd_idle_state;
-            sd_reset(DEVICE(sd));
-            return sd->spi ? sd_r1 : sd_r0;
-        }
-        break;
-
     case 1:	/* CMD1:   SEND_OP_CMD */
         sd->state =3D sd_transfer_state;
         return sd_r1;
@@ -2112,6 +2110,7 @@ void sd_enable(SDState *sd, bool enable)
 static const SDProto sd_proto_spi =3D {
     .name =3D "SPI",
     .cmd =3D {
+        [0]         =3D sd_cmd_GO_IDLE_STATE,
         [2 ... 4]   =3D sd_cmd_illegal,
         [5]         =3D sd_cmd_illegal,
         [7]         =3D sd_cmd_illegal,
@@ -2127,6 +2126,7 @@ static const SDProto sd_proto_spi =3D {
 static const SDProto sd_proto_sd =3D {
     .name =3D "SD",
     .cmd =3D {
+        [0]         =3D sd_cmd_GO_IDLE_STATE,
         [1]         =3D sd_cmd_illegal,
         [5]         =3D sd_cmd_illegal,
         [52 ... 54] =3D sd_cmd_illegal,
--=20
2.34.1


