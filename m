Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771484CA450
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:58:03 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNcI-0006cm-GY
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:58:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrC-0001NN-Se; Wed, 02 Mar 2022 06:09:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61458
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001rx-HN; Wed, 02 Mar 2022 06:09:22 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228OSEi001237; 
 Wed, 2 Mar 2022 11:08:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb62s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:51 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222A1fU1017208;
 Wed, 2 Mar 2022 11:08:51 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb61r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3QkT030533;
 Wed, 2 Mar 2022 11:08:49 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu95247-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8l4W51446164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C6A11C054;
 Wed,  2 Mar 2022 11:08:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB6D611C050;
 Wed,  2 Mar 2022 11:08:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2D6ED220294;
 Wed,  2 Mar 2022 12:08:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 57/87] ppc/xive2: Introduce a presenter matching routine
Date: Wed,  2 Mar 2022 12:07:33 +0100
Message-Id: <20220302110803.849505-58-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6_cqlRx0b4tuBpzlAOk1vb9NVHF1F7fg
X-Proofpoint-ORIG-GUID: A6IxJMJsosf4olhIeTSTRAFGip0y_aUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VP space is larger in XIVE2 (P10), 24 bits instead of 19bits on
XIVE (P9), and the CAM line can use a 7bits or 8bits thread id.

For now, we only use 7bits thread ids, same as P9, but because of the
change of the size of the VP space, the CAM matching routine is
different between P9 and P10. It is easier to duplicate the whole
routine than to add extra handlers in xive_presenter_tctx_match() used
for P9.

We might come with a better solution later on, after we have added
some more support for the XIVE2 controller.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  9 +++++
 hw/intc/xive2.c        | 82 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 69b2117e65bd..0897ddbd4874 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -55,6 +55,15 @@ int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t =
nvp_blk, uint32_t nvp_idx,
=20
 void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
=20
+/*
+ * XIVE2 Presenter (POWER10)
+ */
+
+int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                               uint8_t format,
+                               uint8_t nvt_blk, uint32_t nvt_idx,
+                               bool cam_ignore, uint32_t logic_serv);
+
 /*
  * XIVE2 END ESBs  (POWER10)
  */
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 0248d43e37e4..8f278f3bf680 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -210,6 +210,88 @@ static int xive2_router_get_block_id(Xive2Router *xr=
tr)
    return xrc->get_block_id(xrtr);
 }
=20
+/*
+ * Encode the HW CAM line with 7bit or 8bit thread id. The thread id
+ * width and block id width is configurable at the IC level.
+ *
+ *    chipid << 24 | 0000 0000 0000 0000 1 threadid (7Bit)
+ *    chipid << 24 | 0000 0000 0000 0001 threadid   (8Bit)
+ */
+static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tc=
tx)
+{
+    Xive2Router *xrtr =3D XIVE2_ROUTER(xptr);
+    CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
+    uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
+    uint8_t blk =3D xive2_router_get_block_id(xrtr);
+    uint8_t tid_shift =3D 7;
+    uint8_t tid_mask =3D (1 << tid_shift) - 1;
+
+    return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
+}
+
+/*
+ * The thread context register words are in big-endian format.
+ */
+int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                               uint8_t format,
+                               uint8_t nvt_blk, uint32_t nvt_idx,
+                               bool cam_ignore, uint32_t logic_serv)
+{
+    uint32_t cam =3D   xive2_nvp_cam_line(nvt_blk, nvt_idx);
+    uint32_t qw3w2 =3D xive_tctx_word2(&tctx->regs[TM_QW3_HV_PHYS]);
+    uint32_t qw2w2 =3D xive_tctx_word2(&tctx->regs[TM_QW2_HV_POOL]);
+    uint32_t qw1w2 =3D xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
+    uint32_t qw0w2 =3D xive_tctx_word2(&tctx->regs[TM_QW0_USER]);
+
+    /*
+     * TODO (PowerNV): ignore mode. The low order bits of the NVT
+     * identifier are ignored in the "CAM" match.
+     */
+
+    if (format =3D=3D 0) {
+        if (cam_ignore =3D=3D true) {
+            /*
+             * F=3D0 & i=3D1: Logical server notification (bits ignored =
at
+             * the end of the NVT identifier)
+             */
+            qemu_log_mask(LOG_UNIMP, "XIVE: no support for LS NVT %x/%x\=
n",
+                          nvt_blk, nvt_idx);
+            return -1;
+        }
+
+        /* F=3D0 & i=3D0: Specific NVT notification */
+
+        /* PHYS ring */
+        if ((be32_to_cpu(qw3w2) & TM2_QW3W2_VT) &&
+            cam =3D=3D xive2_tctx_hw_cam_line(xptr, tctx)) {
+            return TM_QW3_HV_PHYS;
+        }
+
+        /* HV POOL ring */
+        if ((be32_to_cpu(qw2w2) & TM2_QW2W2_VP) &&
+            cam =3D=3D xive_get_field32(TM2_QW2W2_POOL_CAM, qw2w2)) {
+            return TM_QW2_HV_POOL;
+        }
+
+        /* OS ring */
+        if ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
+            cam =3D=3D xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) {
+            return TM_QW1_OS;
+        }
+    } else {
+        /* F=3D1 : User level Event-Based Branch (EBB) notification */
+
+        /* USER ring */
+        if  ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
+             (cam =3D=3D xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) &&
+             (be32_to_cpu(qw0w2) & TM2_QW0W2_VU) &&
+             (logic_serv =3D=3D xive_get_field32(TM2_QW0W2_LOGIC_SERV, q=
w0w2))) {
+            return TM_QW0_USER;
+        }
+    }
+    return -1;
+}
+
 static void xive2_router_realize(DeviceState *dev, Error **errp)
 {
     Xive2Router *xrtr =3D XIVE2_ROUTER(dev);
--=20
2.34.1


