Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA904C7172
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:13:40 +0100 (CET)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOieZ-0006rY-KF
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKl-0007b7-Qo; Mon, 28 Feb 2022 10:53:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKk-0001Cg-7Y; Mon, 28 Feb 2022 10:53:11 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SFhSav001182; 
 Mon, 28 Feb 2022 15:52:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh19qg7aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:40 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SFhgBO001860;
 Mon, 28 Feb 2022 15:52:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh19qg79y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlU2i008937;
 Mon, 28 Feb 2022 15:52:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjguwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21SFfikN47579392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:41:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BFF75204E;
 Mon, 28 Feb 2022 15:52:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 5AB9F52050;
 Mon, 28 Feb 2022 15:52:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A60DC2201B4;
 Mon, 28 Feb 2022 16:52:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 16/18] xive2: Add a get_config() handler for the router
 configuration
Date: Mon, 28 Feb 2022 16:52:20 +0100
Message-Id: <20220228155222.643974-17-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yB0RRaXCbhbv4QZvlxrC9enFjbXo43MM
X-Proofpoint-ORIG-GUID: gAr3rdCoXuPQMNogq3PdpFuFnuyzkQSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxlogscore=951 clxscore=1034 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202280083
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add GEN1 config even if we don't use it yet in the core framework.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++++++
 hw/intc/pnv_xive2.c    | 13 +++++++++++++
 hw/intc/xive2.c        |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index c8c4505b51e0..a598393b65dc 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -25,6 +25,12 @@ typedef struct Xive2Router {
 #define TYPE_XIVE2_ROUTER "xive2-router"
 OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
=20
+/*
+ * Configuration flags
+ */
+
+#define XIVE2_GEN1_TIMA_OS      0x00000001
+
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
=20
@@ -44,6 +50,7 @@ typedef struct Xive2RouterClass {
     int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_id=
x,
                      Xive2Nvp *nvp, uint8_t word_number);
     uint8_t (*get_block_id)(Xive2Router *xrtr);
+    uint32_t (*get_config)(Xive2Router *xrtr);
 } Xive2RouterClass;
=20
 int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t ea=
s_idx,
@@ -56,6 +63,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp=
_blk, uint32_t nvp_idx,
                         Xive2Nvp *nvp);
 int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t =
nvp_idx,
                           Xive2Nvp *nvp, uint8_t word_number);
+uint32_t xive2_router_get_config(Xive2Router *xrtr);
=20
 void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checke=
d);
=20
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 5df378dde4b6..963f6ad2da8e 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -426,6 +426,18 @@ static int pnv_xive2_get_eas(Xive2Router *xrtr, uint=
8_t blk, uint32_t idx,
     return pnv_xive2_vst_read(xive, VST_EAS, blk, idx, eas);
 }
=20
+static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xrtr);
+    uint32_t cfg =3D 0;
+
+    if (xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS) {
+        cfg |=3D XIVE2_GEN1_TIMA_OS;
+    }
+
+    return cfg;
+}
+
 static bool pnv_xive2_is_cpu_enabled(PnvXive2 *xive, PowerPCCPU *cpu)
 {
     int pir =3D ppc_cpu_pir(cpu);
@@ -1950,6 +1962,7 @@ static void pnv_xive2_class_init(ObjectClass *klass=
, void *data)
     xrc->write_end =3D pnv_xive2_write_end;
     xrc->get_nvp   =3D pnv_xive2_get_nvp;
     xrc->write_nvp =3D pnv_xive2_write_nvp;
+    xrc->get_config  =3D pnv_xive2_get_config;
     xrc->get_block_id =3D pnv_xive2_get_block_id;
=20
     xnc->notify    =3D pnv_xive2_notify;
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 048b98dbbe90..c45422542459 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -20,6 +20,13 @@
 #include "hw/ppc/xive2.h"
 #include "hw/ppc/xive2_regs.h"
=20
+uint32_t xive2_router_get_config(Xive2Router *xrtr)
+{
+    Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_config(xrtr);
+}
+
 void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon=
)
 {
     if (!xive2_eas_is_valid(eas)) {
--=20
2.34.1


