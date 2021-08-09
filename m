Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38A3E473F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:11:02 +0200 (CEST)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5zZ-0005hN-HW
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5c0-00016u-KU; Mon, 09 Aug 2021 09:46:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5by-00017N-L7; Mon, 09 Aug 2021 09:46:40 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYS3s168890; Mon, 9 Aug 2021 09:46:12 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aaa1qxe4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:12 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179Cw6AX015968;
 Mon, 9 Aug 2021 13:46:10 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3a9ht8km84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Dk7D454854080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:46:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84D71A4067;
 Mon,  9 Aug 2021 13:46:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35D37A4064;
 Mon,  9 Aug 2021 13:46:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6E8D4220032;
 Mon,  9 Aug 2021 15:46:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 26/26] pnv/xive2: Add support for 8bits thread id
Date: Mon,  9 Aug 2021 15:45:47 +0200
Message-Id: <20210809134547.689560-27-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Grna0xtuC1akKj9_Em-M_81twMAQUmX6
X-Proofpoint-ORIG-GUID: Grna0xtuC1akKj9_Em-M_81twMAQUmX6
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
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) RCVD_IN_MSPIKE_H4=0.001,
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

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h | 1 +
 hw/intc/pnv_xive2.c    | 5 +++++
 hw/intc/xive2.c        | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 6d8764724d6d..7281c1d10223 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -36,6 +36,7 @@ typedef struct Xive2Router {
=20
 #define XIVE2_GEN1_TIMA_OS      0x00000001
 #define XIVE2_VP_SAVE_RESTORE   0x00000002
+#define XIVE2_THREADID_8BITS    0x00000004
=20
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 6f0a63cd3d2f..5aaccaf78934 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -438,6 +438,11 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xr=
tr)
         cfg |=3D XIVE2_VP_SAVE_RESTORE;
     }
=20
+    if (GETFIELD(CQ_XIVE_CFG_HYP_HARD_RANGE,
+              xive->cq_regs[CQ_XIVE_CFG >> 3]) =3D=3D CQ_XIVE_CFG_THREAD=
ID_8BITS) {
+        cfg |=3D XIVE2_THREADID_8BITS;
+    }
+
     return cfg;
 }
=20
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 532e832422a3..c599ee67ec97 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -469,7 +469,8 @@ static uint32_t xive2_tctx_hw_cam_line(XivePresenter =
*xptr, XiveTCTX *tctx)
     CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
     uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
     uint8_t blk =3D xive2_router_get_block_id(xrtr);
-    uint8_t tid_shift =3D 7;
+    uint8_t tid_shift =3D
+        xive2_router_get_config(xrtr) & XIVE2_THREADID_8BITS ? 8 : 7;
     uint8_t tid_mask =3D (1 << tid_shift) - 1;
=20
     return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
--=20
2.31.1


