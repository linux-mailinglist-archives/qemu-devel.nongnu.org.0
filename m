Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0504C713B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:03:31 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiUk-0000YM-OH
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKL-0006hv-A5; Mon, 28 Feb 2022 10:52:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKJ-00013j-Ft; Mon, 28 Feb 2022 10:52:45 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SEhsUC021309; 
 Mon, 28 Feb 2022 15:52:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh0dra17g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:40 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SEjO78032322;
 Mon, 28 Feb 2022 15:52:40 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh0dra16x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlPex016579;
 Mon, 28 Feb 2022 15:52:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu98tnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21SFqakx46858536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F4CBA4055;
 Mon, 28 Feb 2022 15:52:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11C15A404D;
 Mon, 28 Feb 2022 15:52:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 52F8C2203EC;
 Mon, 28 Feb 2022 16:52:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 17/18] pnv/xive2: Add support for automatic save&restore
Date: Mon, 28 Feb 2022 16:52:21 +0100
Message-Id: <20220228155222.643974-18-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -wYwsQY3gIFwyGnqqz9Nwhjck-0yj1VA
X-Proofpoint-ORIG-GUID: 9xq2bK0-8ejlxxgiSscXU99YU6CvOSWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1034
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280083
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XIVE interrupt controller on P10 can automatically save and
restore the state of the interrupt registers under the internal NVP
structure representing the VCPU. This saves a costly store/load in
guest entries and exits.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive2_regs.h    |   3 +
 include/hw/ppc/xive2.h      |   1 +
 include/hw/ppc/xive2_regs.h |  12 ++++
 hw/intc/pnv_xive2.c         |  18 +++++-
 hw/intc/xive2.c             | 126 ++++++++++++++++++++++++++++++++++--
 5 files changed, 154 insertions(+), 6 deletions(-)

diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
index d261766cf5fb..0c096e4adb62 100644
--- a/hw/intc/pnv_xive2_regs.h
+++ b/hw/intc/pnv_xive2_regs.h
@@ -30,6 +30,7 @@
 #define       CQ_XIVE_CAP_VP_INT_PRIO_4_8       2
 #define       CQ_XIVE_CAP_VP_INT_PRIO_8         3
 #define    CQ_XIVE_CAP_BLOCK_ID_WIDTH           PPC_BITMASK(12, 13)
+#define    CQ_XIVE_CAP_VP_SAVE_RESTORE          PPC_BIT(38)
=20
 #define    CQ_XIVE_CAP_PHB_PQ_DISABLE           PPC_BIT(56)
 #define    CQ_XIVE_CAP_PHB_ABT                  PPC_BIT(57)
@@ -65,6 +66,8 @@
 #define    CQ_XIVE_CFG_GEN1_TIMA_HYP_BLK0       PPC_BIT(26) /* 0 if bit[=
25]=3D0 */
 #define    CQ_XIVE_CFG_GEN1_TIMA_CROWD_DIS      PPC_BIT(27) /* 0 if bit[=
25]=3D0 */
 #define    CQ_XIVE_CFG_GEN1_END_ESX             PPC_BIT(28)
+#define    CQ_XIVE_CFG_EN_VP_SAVE_RESTORE       PPC_BIT(38) /* 0 if bit[=
25]=3D1 */
+#define    CQ_XIVE_CFG_EN_VP_SAVE_REST_STRICT   PPC_BIT(39) /* 0 if bit[=
25]=3D1 */
=20
 /* Interrupt Controller Base Address Register - 512 pages (32M) */
 #define X_CQ_IC_BAR                             0x08
diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index a598393b65dc..296a2d949498 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE=
2_ROUTER);
  */
=20
 #define XIVE2_GEN1_TIMA_OS      0x00000001
+#define XIVE2_VP_SAVE_RESTORE   0x00000002
=20
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
index b6d36204e6b9..14605bd458f8 100644
--- a/include/hw/ppc/xive2_regs.h
+++ b/include/hw/ppc/xive2_regs.h
@@ -20,10 +20,13 @@
 #define   TM2_QW0W2_VU           PPC_BIT32(0)
 #define   TM2_QW0W2_LOGIC_SERV   PPC_BITMASK32(4, 31)
 #define   TM2_QW1W2_VO           PPC_BIT32(0)
+#define   TM2_QW1W2_HO           PPC_BIT32(1)
 #define   TM2_QW1W2_OS_CAM       PPC_BITMASK32(4, 31)
 #define   TM2_QW2W2_VP           PPC_BIT32(0)
+#define   TM2_QW2W2_HP           PPC_BIT32(1)
 #define   TM2_QW2W2_POOL_CAM     PPC_BITMASK32(4, 31)
 #define   TM2_QW3W2_VT           PPC_BIT32(0)
+#define   TM2_QW3W2_HT           PPC_BIT32(1)
 #define   TM2_QW3W2_LP           PPC_BIT32(6)
 #define   TM2_QW3W2_LE           PPC_BIT32(7)
=20
@@ -137,10 +140,17 @@ void xive2_end_eas_pic_print_info(Xive2End *end, ui=
nt32_t end_idx,
 typedef struct Xive2Nvp {
         uint32_t       w0;
 #define NVP2_W0_VALID              PPC_BIT32(0)
+#define NVP2_W0_HW                 PPC_BIT32(7)
 #define NVP2_W0_ESC_END            PPC_BIT32(25) /* 'N' bit 0:ESB  1:END=
 */
         uint32_t       w1;
+#define NVP2_W1_CO                 PPC_BIT32(13)
+#define NVP2_W1_CO_PRIV            PPC_BITMASK32(14, 15)
+#define NVP2_W1_CO_THRID_VALID     PPC_BIT32(16)
+#define NVP2_W1_CO_THRID           PPC_BITMASK32(17, 31)
         uint32_t       w2;
+#define NVP2_W2_CPPR               PPC_BITMASK32(0, 7)
 #define NVP2_W2_IPB                PPC_BITMASK32(8, 15)
+#define NVP2_W2_LSMFB              PPC_BITMASK32(16, 23)
         uint32_t       w3;
         uint32_t       w4;
 #define NVP2_W4_ESC_ESB_BLOCK      PPC_BITMASK32(0, 3)  /* N:0 */
@@ -156,6 +166,8 @@ typedef struct Xive2Nvp {
 } Xive2Nvp;
=20
 #define xive2_nvp_is_valid(nvp)    (be32_to_cpu((nvp)->w0) & NVP2_W0_VAL=
ID)
+#define xive2_nvp_is_hw(nvp)       (be32_to_cpu((nvp)->w0) & NVP2_W0_HW)
+#define xive2_nvp_is_co(nvp)       (be32_to_cpu((nvp)->w1) & NVP2_W1_CO)
=20
 /*
  * The VP number space in a block is defined by the END2_W6_VP_OFFSET
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 963f6ad2da8e..b51571c6034f 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -435,6 +435,10 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xr=
tr)
         cfg |=3D XIVE2_GEN1_TIMA_OS;
     }
=20
+    if (xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_EN_VP_SAVE_RESTORE=
) {
+        cfg |=3D XIVE2_VP_SAVE_RESTORE;
+    }
+
     return cfg;
 }
=20
@@ -2000,9 +2004,21 @@ static void xive2_nvp_pic_print_info(Xive2Nvp *nvp=
, uint32_t nvp_idx,
         return;
     }
=20
-    monitor_printf(mon, "  %08x end:%02x/%04x IPB:%02x\n",
+    monitor_printf(mon, "  %08x end:%02x/%04x IPB:%02x",
                    nvp_idx, eq_blk, eq_idx,
                    xive_get_field32(NVP2_W2_IPB, nvp->w2));
+    /*
+     * When the NVP is HW controlled, more fields are updated
+     */
+    if (xive2_nvp_is_hw(nvp)) {
+        monitor_printf(mon, " CPPR:%02x",
+                       xive_get_field32(NVP2_W2_CPPR, nvp->w2));
+        if (xive2_nvp_is_co(nvp)) {
+            monitor_printf(mon, " CO:%04x",
+                           xive_get_field32(NVP2_W1_CO_THRID, nvp->w1));
+        }
+    }
+    monitor_printf(mon, "\n");
 }
=20
 /*
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index c45422542459..fd9cfebd782d 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -169,27 +169,92 @@ static void xive2_end_enqueue(Xive2End *end, uint32=
_t data)
=20
 /*
  * XIVE Thread Interrupt Management Area (TIMA) - Gen2 mode
+ *
+ * TIMA Gen2 VP =E2=80=9Csave & restore=E2=80=9D (S&R) indicated by H bi=
t next to V bit
+ *
+ *   - if a context is enabled with the H bit set, the VP context
+ *     information is retrieved from the NVP structure (=E2=80=9Ccheck o=
ut=E2=80=9D)
+ *     and stored back on a context pull (=E2=80=9Ccheck in=E2=80=9D), t=
he SW receives
+ *     the same context pull information as on P9
+ *
+ *   - the H bit cannot be changed while the V bit is set, i.e. a
+ *     context cannot be set up in the TIMA and then be =E2=80=9Cpushed=E2=
=80=9D into
+ *     the NVP by changing the H bit while the context is enabled
  */
=20
+static void xive2_tctx_save_os_ctx(Xive2Router *xrtr, XiveTCTX *tctx,
+                                   uint8_t nvp_blk, uint32_t nvp_idx)
+{
+    CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
+    uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
+    Xive2Nvp nvp;
+    uint8_t *regs =3D &tctx->regs[TM_QW1_OS];
+
+    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No NVP %x/%x\n",
+                          nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_valid(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid NVP %x/%x\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_hw(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is not HW owned\=
n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_co(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is not checkout\=
n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (xive_get_field32(NVP2_W1_CO_THRID_VALID, nvp.w1) &&
+        xive_get_field32(NVP2_W1_CO_THRID, nvp.w1) !=3D pir) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "XIVE: NVP %x/%x invalid checkout Thread %x\n",
+                      nvp_blk, nvp_idx, pir);
+        return;
+    }
+
+    nvp.w2 =3D xive_set_field32(NVP2_W2_IPB, nvp.w2, regs[TM_IPB]);
+    nvp.w2 =3D xive_set_field32(NVP2_W2_CPPR, nvp.w2, regs[TM_CPPR]);
+    nvp.w2 =3D xive_set_field32(NVP2_W2_LSMFB, nvp.w2, regs[TM_LSMFB]);
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
+
+    nvp.w1 =3D xive_set_field32(NVP2_W1_CO, nvp.w1, 0);
+    /* NVP2_W1_CO_THRID_VALID only set once */
+    nvp.w1 =3D xive_set_field32(NVP2_W1_CO_THRID, nvp.w1, 0xFFFF);
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 1);
+}
+
 static void xive2_os_cam_decode(uint32_t cam, uint8_t *nvp_blk,
-                                uint32_t *nvp_idx, bool *vo)
+                                uint32_t *nvp_idx, bool *vo, bool *ho)
 {
     *nvp_blk =3D xive2_nvp_blk(cam);
     *nvp_idx =3D xive2_nvp_idx(cam);
     *vo =3D !!(cam & TM2_QW1W2_VO);
+    *ho =3D !!(cam & TM2_QW1W2_HO);
 }
=20
 uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
                               hwaddr offset, unsigned size)
 {
+    Xive2Router *xrtr =3D XIVE2_ROUTER(xptr);
     uint32_t qw1w2 =3D xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
     uint32_t qw1w2_new;
     uint32_t cam =3D be32_to_cpu(qw1w2);
     uint8_t nvp_blk;
     uint32_t nvp_idx;
     bool vo;
+    bool do_save;
=20
-    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo, &do_save);
=20
     if (!vo) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVP %x/%x =
!?\n",
@@ -200,11 +265,54 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, =
XiveTCTX *tctx,
     qw1w2_new =3D xive_set_field32(TM2_QW1W2_VO, qw1w2, 0);
     memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2_new, 4);
=20
+    if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE && do_save=
) {
+        xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
+    }
+
     return qw1w2;
 }
=20
+static uint8_t xive2_tctx_restore_os_ctx(Xive2Router *xrtr, XiveTCTX *tc=
tx,
+                                        uint8_t nvp_blk, uint32_t nvp_id=
x,
+                                        Xive2Nvp *nvp)
+{
+    CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
+    uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
+    uint8_t cppr;
+
+    if (!xive2_nvp_is_hw(nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is not HW owned\=
n",
+                      nvp_blk, nvp_idx);
+        return 0;
+    }
+
+    cppr =3D xive_get_field32(NVP2_W2_CPPR, nvp->w2);
+    nvp->w2 =3D xive_set_field32(NVP2_W2_CPPR, nvp->w2, 0);
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, nvp, 2);
+
+    tctx->regs[TM_QW1_OS + TM_CPPR] =3D cppr;
+    /* we don't model LSMFB */
+
+    nvp->w1 =3D xive_set_field32(NVP2_W1_CO, nvp->w1, 1);
+    nvp->w1 =3D xive_set_field32(NVP2_W1_CO_THRID_VALID, nvp->w1, 1);
+    nvp->w1 =3D xive_set_field32(NVP2_W1_CO_THRID, nvp->w1, pir);
+
+    /*
+     * Checkout privilege: 0:OS, 1:Pool, 2:Hard
+     *
+     * TODO: we only support OS push/pull
+     */
+    nvp->w1 =3D xive_set_field32(NVP2_W1_CO_PRIV, nvp->w1, 0);
+
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, nvp, 1);
+
+    /* return restored CPPR to generate a CPU exception if needed */
+    return cppr;
+}
+
 static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
-                                   uint8_t nvp_blk, uint32_t nvp_idx)
+                                   uint8_t nvp_blk, uint32_t nvp_idx,
+                                   bool do_restore)
 {
     Xive2Nvp nvp;
     uint8_t ipb;
@@ -226,6 +334,12 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr=
, XiveTCTX *tctx,
         return;
     }
=20
+    /* Automatically restore thread context registers */
+    if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
+        do_restore) {
+        cppr =3D xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx,=
 &nvp);
+    }
+
     ipb =3D xive_get_field32(NVP2_W2_IPB, nvp.w2);
     if (ipb) {
         nvp.w2 =3D xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
@@ -249,15 +363,17 @@ void xive2_tm_push_os_ctx(XivePresenter *xptr, Xive=
TCTX *tctx,
     uint8_t nvp_blk;
     uint32_t nvp_idx;
     bool vo;
+    bool do_restore;
=20
-    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo, &do_restore);
=20
     /* First update the thead context */
     memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
=20
     /* Check the interrupt pending bits */
     if (vo) {
-        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_id=
x);
+        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_id=
x,
+                               do_restore);
     }
 }
=20
--=20
2.34.1


