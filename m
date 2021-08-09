Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6B3E46FF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5o5-0002bd-2N
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bd-0000m2-VJ; Mon, 09 Aug 2021 09:46:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18268
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bb-000148-C7; Mon, 09 Aug 2021 09:46:17 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DWc5n183688; Mon, 9 Aug 2021 09:46:09 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aax404bjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:09 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DLHa6002070;
 Mon, 9 Aug 2021 13:46:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3a9ht8umcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179DgwdG61866296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:42:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8A28A4066;
 Mon,  9 Aug 2021 13:46:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93CECA4068;
 Mon,  9 Aug 2021 13:46:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:04 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CC27E220032;
 Mon,  9 Aug 2021 15:46:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 22/26] ppc/pnv: add XIVE Gen2 TIMA support
Date: Mon,  9 Aug 2021 15:45:43 +0200
Message-Id: <20210809134547.689560-23-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CJbKYaoRDvyW-2DbmqQHnPi0HfoheY_P
X-Proofpoint-GUID: CJbKYaoRDvyW-2DbmqQHnPi0HfoheY_P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1034 mlxlogscore=999 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Only the CAM line updates done by the hypervisor are specific to
POWER10. Instead of duplicating the TM ops table, we handle these
commands locally under the PowerNV XIVE2 model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++
 hw/intc/pnv_xive2.c    | 27 +++++++++++-
 hw/intc/xive2.c        | 95 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 082222d978bb..f9c02e568e43 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -93,5 +93,13 @@ typedef struct Xive2EndSource {
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
index cb12cea14fc6..4a2649893232 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1610,15 +1610,32 @@ static const MemoryRegionOps pnv_xive2_ic_tm_indi=
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
@@ -1626,9 +1643,15 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hw=
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
index 8243391e8c09..dd01e8d05ba1 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -169,6 +169,101 @@ static void xive2_end_enqueue(Xive2End *end, uint32=
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
2.31.1


