Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D634DDAEE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:51:22 +0100 (CET)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD0j-0001zb-Vx
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:51:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCew-00081c-Uu; Fri, 18 Mar 2022 09:28:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCeu-00031H-UT; Fri, 18 Mar 2022 09:28:50 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnsKL031817; 
 Fri, 18 Mar 2022 13:28:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev074q8qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ICnwhr032531;
 Fri, 18 Mar 2022 13:28:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev074q8qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDPOsa005806;
 Fri, 18 Mar 2022 13:28:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3et95x0wgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IDSXuW26345882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:28:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53CA252050;
 Fri, 18 Mar 2022 13:28:33 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 04CB05204F;
 Fri, 18 Mar 2022 13:28:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2FD5D2201E8;
 Fri, 18 Mar 2022 14:28:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 02/17] hw/sd: Move proto_name to SDProto structure
Date: Fri, 18 Mar 2022 14:28:09 +0100
Message-Id: <20220318132824.1134400-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BP6vPXHHbStmWkS2jUfevtjd716yNg59
X-Proofpoint-ORIG-GUID: 7pvTbNN3PSTdrveXNedCiD7GxQdlaFfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1034 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Introduce a new structure to hold the bus protocol specific
fields: SDProto. The first field is the protocol name.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-4-f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e7fbb937c277..45aa6a77de5e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -88,6 +88,10 @@ enum SDCardStates {
     sd_disconnect_state,
 };
=20
+typedef struct SDProto {
+    const char *name;
+} SDProto;
+
 struct SDState {
     DeviceState parent_obj;
=20
@@ -112,6 +116,7 @@ struct SDState {
=20
     /* Runtime changeables */
=20
+    const SDProto *proto;   /* Bus protocol */
     uint32_t mode;    /* current card mode, one of SDCardModes */
     int32_t state;    /* current card state, one of SDCardStates */
     uint32_t vhs;
@@ -138,7 +143,6 @@ struct SDState {
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
-    const char *proto_name;
     bool enable;
     uint8_t dat_lines;
     bool cmd_line;
@@ -969,8 +973,8 @@ static bool address_in_range(SDState *sd, const char =
*desc,
=20
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req=
)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
-                  req.cmd, sd_state_name(sd->state));
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: CMD%i in a wrong state: %s\n",
+                  sd->proto->name, req.cmd, sd_state_name(sd->state));
=20
     return sd_illegal;
 }
@@ -984,7 +988,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, S=
DRequest req)
      * However there is no ACMD55, so we want to trace this particular c=
ase.
      */
     if (req.cmd !=3D 55 || sd->expecting_acmd) {
-        trace_sdcard_normal_command(sd->proto_name,
+        trace_sdcard_normal_command(sd->proto->name,
                                     sd_cmd_name(req.cmd), req.cmd,
                                     req.arg, sd_state_name(sd->state));
     }
@@ -1549,7 +1553,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
 static sd_rsp_type_t sd_app_command(SDState *sd,
                                     SDRequest req)
 {
-    trace_sdcard_app_command(sd->proto_name, sd_acmd_name(req.cmd),
+    trace_sdcard_app_command(sd->proto->name, sd_acmd_name(req.cmd),
                              req.cmd, req.arg, sd_state_name(sd->state))=
;
     sd->card_status |=3D APP_CMD;
     switch (req.cmd) {
@@ -1843,7 +1847,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
     if (sd->card_status & (ADDRESS_ERROR | WP_VIOLATION))
         return;
=20
-    trace_sdcard_write_data(sd->proto_name,
+    trace_sdcard_write_data(sd->proto->name,
                             sd_acmd_name(sd->current_cmd),
                             sd->current_cmd, value);
     switch (sd->current_cmd) {
@@ -1999,7 +2003,7 @@ uint8_t sd_read_byte(SDState *sd)
=20
     io_len =3D (sd->ocr & (1 << 30)) ? 512 : sd->blk_len;
=20
-    trace_sdcard_read_data(sd->proto_name,
+    trace_sdcard_read_data(sd->proto->name,
                            sd_acmd_name(sd->current_cmd),
                            sd->current_cmd, io_len);
     switch (sd->current_cmd) {
@@ -2118,6 +2122,14 @@ void sd_enable(SDState *sd, bool enable)
     sd->enable =3D enable;
 }
=20
+static const SDProto sd_proto_spi =3D {
+    .name =3D "SPI",
+};
+
+static const SDProto sd_proto_sd =3D {
+    .name =3D "SD",
+};
+
 static void sd_instance_init(Object *obj)
 {
     SDState *sd =3D SD_CARD(obj);
@@ -2138,7 +2150,7 @@ static void sd_realize(DeviceState *dev, Error **er=
rp)
     SDState *sd =3D SD_CARD(dev);
     int ret;
=20
-    sd->proto_name =3D sd->spi ? "SPI" : "SD";
+    sd->proto =3D sd->spi ? &sd_proto_spi : &sd_proto_sd;
=20
     switch (sd->spec_version) {
     case SD_PHY_SPECv1_10_VERS
--=20
2.34.1


