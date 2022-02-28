Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371F4C7142
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:06:38 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiXl-0002qA-Ig
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKl-0007b6-Oj; Mon, 28 Feb 2022 10:53:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKj-0001CR-4g; Mon, 28 Feb 2022 10:53:11 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SFkaJC022281; 
 Mon, 28 Feb 2022 15:52:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh1b6g54q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:39 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SFkx5o022994;
 Mon, 28 Feb 2022 15:52:39 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh1b6g53x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:38 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlXRi006150;
 Mon, 28 Feb 2022 15:52:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu983g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21SFqYQb34341176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B6584C046;
 Mon, 28 Feb 2022 15:52:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 186024C04A;
 Mon, 28 Feb 2022 15:52:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:34 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 57E662201B4;
 Mon, 28 Feb 2022 16:52:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 14/18] ppc/pnv: add XIVE Gen2 TIMA support
Date: Mon, 28 Feb 2022 16:52:18 +0100
Message-Id: <20220228155222.643974-15-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m8JaTQZpy-sqUZq1QdLj7jQvTR-6yUgV
X-Proofpoint-ORIG-GUID: HmACEVQg3kB7umb4J_I_QhWZpUC_3IEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1034
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280083
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

Only the CAM line updates done by the hypervisor are specific to
POWER10. Instead of duplicating the TM ops table, we handle these
commands locally under the PowerNV XIVE2 model.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++
 hw/intc/pnv_xive2.c    | 27 +++++++++++-
 hw/intc/xive2.c        | 95 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index eb255b6dd8f3..c8c4505b51e0 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -87,5 +87,13 @@ typedef struct Xive2EndSource {
     Xive2Router     *xrtr;
 } Xive2EndSource;
=20
+/*
+ * XIVE2 Thread Interrupt Management Area (POWER10)
+ */
+
+void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx, hwaddr of=
fset,
+                           uint64_t value, unsigned size);
+uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                               hwaddr offset, unsigned size);
=20
 #endif /* PPC_XIVE2_H */
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index e22049424f37..012b238fd037 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1611,15 +1611,32 @@ static const MemoryRegionOps pnv_xive2_ic_tm_indi=
rect_ops =3D {
  * TIMA ops
  */
=20
+/*
+ * Special TIMA offsets to handle accesses in a POWER10 way.
+ *
+ * Only the CAM line updates done by the hypervisor should be handled
+ * specifically.
+ */
+#define HV_PAGE_OFFSET         (XIVE_TM_HV_PAGE << TM_SHIFT)
+#define HV_PUSH_OS_CTX_OFFSET  (HV_PAGE_OFFSET | (TM_QW1_OS + TM_WORD2))
+#define HV_PULL_OS_CTX_OFFSET  (HV_PAGE_OFFSET | TM_SPC_PULL_OS_CTX)
+
 static void pnv_xive2_tm_write(void *opaque, hwaddr offset,
                                uint64_t value, unsigned size)
 {
     PowerPCCPU *cpu =3D POWERPC_CPU(current_cpu);
     PnvXive2 *xive =3D pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+    XivePresenter *xptr =3D XIVE_PRESENTER(xive);
+
+    /* TODO: should we switch the TM ops table instead ? */
+    if (offset =3D=3D HV_PUSH_OS_CTX_OFFSET) {
+        xive2_tm_push_os_ctx(xptr, tctx, offset, value, size);
+        return;
+    }
=20
     /* Other TM ops are the same as XIVE1 */
-    xive_tctx_tm_write(XIVE_PRESENTER(xive), tctx, offset, value, size);
+    xive_tctx_tm_write(xptr, tctx, offset, value, size);
 }
=20
 static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned =
size)
@@ -1627,9 +1644,15 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hw=
addr offset, unsigned size)
     PowerPCCPU *cpu =3D POWERPC_CPU(current_cpu);
     PnvXive2 *xive =3D pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+    XivePresenter *xptr =3D XIVE_PRESENTER(xive);
+
+    /* TODO: should we switch the TM ops table instead ? */
+    if (offset =3D=3D HV_PULL_OS_CTX_OFFSET) {
+        return xive2_tm_pull_os_ctx(xptr, tctx, offset, size);
+    }
=20
     /* Other TM ops are the same as XIVE1 */
-    return xive_tctx_tm_read(XIVE_PRESENTER(xive), tctx, offset, size);
+    return xive_tctx_tm_read(xptr, tctx, offset, size);
 }
=20
 static const MemoryRegionOps pnv_xive2_tm_ops =3D {
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 3720e704227d..048b98dbbe90 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -159,6 +159,101 @@ static void xive2_end_enqueue(Xive2End *end, uint32=
_t data)
     }
     end->w1 =3D xive_set_field32(END2_W1_PAGE_OFF, end->w1, qindex);
 }
+
+/*
+ * XIVE Thread Interrupt Management Area (TIMA) - Gen2 mode
+ */
+
+static void xive2_os_cam_decode(uint32_t cam, uint8_t *nvp_blk,
+                                uint32_t *nvp_idx, bool *vo)
+{
+    *nvp_blk =3D xive2_nvp_blk(cam);
+    *nvp_idx =3D xive2_nvp_idx(cam);
+    *vo =3D !!(cam & TM2_QW1W2_VO);
+}
+
+uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                              hwaddr offset, unsigned size)
+{
+    uint32_t qw1w2 =3D xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
+    uint32_t qw1w2_new;
+    uint32_t cam =3D be32_to_cpu(qw1w2);
+    uint8_t nvp_blk;
+    uint32_t nvp_idx;
+    bool vo;
+
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+
+    if (!vo) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVP %x/%x =
!?\n",
+                      nvp_blk, nvp_idx);
+    }
+
+    /* Invalidate CAM line */
+    qw1w2_new =3D xive_set_field32(TM2_QW1W2_VO, qw1w2, 0);
+    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2_new, 4);
+
+    return qw1w2;
+}
+
+static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
+                                   uint8_t nvp_blk, uint32_t nvp_idx)
+{
+    Xive2Nvp nvp;
+    uint8_t ipb;
+    uint8_t cppr =3D 0;
+
+    /*
+     * Grab the associated thread interrupt context registers in the
+     * associated NVP
+     */
+    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No NVP %x/%x\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_valid(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid NVP %x/%x\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    ipb =3D xive_get_field32(NVP2_W2_IPB, nvp.w2);
+    if (ipb) {
+        nvp.w2 =3D xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
+        xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
+    }
+
+    /* An IPB or CPPR change can trigger a resend */
+    if (ipb || cppr) {
+        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
+    }
+}
+
+/*
+ * Updating the OS CAM line can trigger a resend of interrupt
+ */
+void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                          hwaddr offset, uint64_t value, unsigned size)
+{
+    uint32_t cam =3D value;
+    uint32_t qw1w2 =3D cpu_to_be32(cam);
+    uint8_t nvp_blk;
+    uint32_t nvp_idx;
+    bool vo;
+
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+
+    /* First update the thead context */
+    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
+
+    /* Check the interrupt pending bits */
+    if (vo) {
+        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_id=
x);
+    }
+}
+
 /*
  * XIVE Router (aka. Virtualization Controller or IVRE)
  */
--=20
2.34.1


