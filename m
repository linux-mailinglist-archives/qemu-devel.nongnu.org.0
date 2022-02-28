Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518914C718B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:15:40 +0100 (CET)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOigU-0000PE-QW
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:15:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKo-0007dZ-Ti; Mon, 28 Feb 2022 10:53:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKn-0001DH-CJ; Mon, 28 Feb 2022 10:53:14 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SFRQGF007858; 
 Mon, 28 Feb 2022 15:52:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egygq3r81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:42 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SEMvhO018520;
 Mon, 28 Feb 2022 15:52:42 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egygq3r76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlW4j002364;
 Mon, 28 Feb 2022 15:52:39 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu982tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21SFqbrs51577176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F394FAE053;
 Mon, 28 Feb 2022 15:52:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B23CEAE04D;
 Mon, 28 Feb 2022 15:52:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:36 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F2B782201B4;
 Mon, 28 Feb 2022 16:52:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 18/18] pnv/xive2: Add support for 8bits thread id
Date: Mon, 28 Feb 2022 16:52:22 +0100
Message-Id: <20220228155222.643974-19-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: adNrVLSJdcdPR8sSthqruU-uqYcThea1
X-Proofpoint-GUID: bKzkWGuGefthEYCfaMEYPp66sqtdyH5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1034
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280083
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h | 1 +
 hw/intc/pnv_xive2.c    | 5 +++++
 hw/intc/xive2.c        | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 296a2d949498..e9e3ea135ea6 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE=
2_ROUTER);
=20
 #define XIVE2_GEN1_TIMA_OS      0x00000001
 #define XIVE2_VP_SAVE_RESTORE   0x00000002
+#define XIVE2_THREADID_8BITS    0x00000004
=20
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index b51571c6034f..87303b40641b 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -439,6 +439,11 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xr=
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
index fd9cfebd782d..b6452f14784b 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -459,7 +459,8 @@ static uint32_t xive2_tctx_hw_cam_line(XivePresenter =
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
2.34.1


