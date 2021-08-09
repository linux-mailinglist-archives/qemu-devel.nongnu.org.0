Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF23E46FE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:58:58 +0200 (CEST)
Received: from localhost ([::1]:37646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5nt-0001mC-0g
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bz-00013F-2o; Mon, 09 Aug 2021 09:46:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bw-00015H-T8; Mon, 09 Aug 2021 09:46:38 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYRf6168870; Mon, 9 Aug 2021 09:46:10 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aaa1qxe3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:10 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179D0G8I032308;
 Mon, 9 Aug 2021 13:46:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht8v2tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Dk6uj9306462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:46:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31CD5A406D;
 Mon,  9 Aug 2021 13:46:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0F1AA4051;
 Mon,  9 Aug 2021 13:46:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 26FAF220032;
 Mon,  9 Aug 2021 15:46:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 24/26] xive2: Add a get_config() handler for the router
 configuration
Date: Mon,  9 Aug 2021 15:45:45 +0200
Message-Id: <20210809134547.689560-25-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HXe6bbMwbamvmtdjWTfF_GsZwu9tDBBi
X-Proofpoint-ORIG-GUID: HXe6bbMwbamvmtdjWTfF_GsZwu9tDBBi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1034 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add GEN1 config even if we don't use it yet in the core framework.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++++++
 hw/intc/pnv_xive2.c    | 13 +++++++++++++
 hw/intc/xive2.c        |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index f9c02e568e43..94387dcdb105 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -30,6 +30,12 @@ typedef struct Xive2Router {
 #define XIVE2_ROUTER_GET_CLASS(obj)                              \
     OBJECT_GET_CLASS(Xive2RouterClass, (obj), TYPE_XIVE2_ROUTER)
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
@@ -49,6 +55,7 @@ typedef struct Xive2RouterClass {
     int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_id=
x,
                      Xive2Nvp *nvp, uint8_t word_number);
     uint8_t (*get_block_id)(Xive2Router *xrtr);
+    uint32_t (*get_config)(Xive2Router *xrtr);
 } Xive2RouterClass;
=20
 int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t ea=
s_idx,
@@ -61,6 +68,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp=
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
index b364ee3b306b..2b7d6ccbd097 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -425,6 +425,18 @@ static int pnv_xive2_get_eas(Xive2Router *xrtr, uint=
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
@@ -1949,6 +1961,7 @@ static void pnv_xive2_class_init(ObjectClass *klass=
, void *data)
     xrc->write_end =3D pnv_xive2_write_end;
     xrc->get_nvp   =3D pnv_xive2_get_nvp;
     xrc->write_nvp =3D pnv_xive2_write_nvp;
+    xrc->get_config  =3D pnv_xive2_get_config;
     xrc->get_block_id =3D pnv_xive2_get_block_id;
=20
     xnc->notify    =3D pnv_xive2_notify;
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index dd01e8d05ba1..7f95eec987ce 100644
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
 static inline uint32_t xive_tctx_word2(uint8_t *ring)
 {
     return *((uint32_t *) &ring[TM_WORD2]);
--=20
2.31.1


