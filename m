Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3E4CA4BA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:22:22 +0100 (CET)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNzp-0006oO-F5
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrJ-0001Pr-8H; Wed, 02 Mar 2022 06:09:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001tY-49; Wed, 02 Mar 2022 06:09:29 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228sISD001912; 
 Wed, 2 Mar 2022 11:09:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5esu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:00 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222Al3pd008910;
 Wed, 2 Mar 2022 11:08:59 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5er4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:59 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bMS027230;
 Wed, 2 Mar 2022 11:08:57 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8s8s51970514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C86BF42042;
 Wed,  2 Mar 2022 11:08:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CC2842041;
 Wed,  2 Mar 2022 11:08:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E0D9F2201C1;
 Wed,  2 Mar 2022 12:08:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 70/87] pnv/xive2: Add support XIVE2 P9-compat mode (or Gen1)
Date: Wed,  2 Mar 2022 12:07:46 +0100
Message-Id: <20220302110803.849505-71-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mo8vYwr6guuatgVRJDC1OW59SMVRn8d2
X-Proofpoint-GUID: AQXrfBHh1iNJMj_UmXfA46XmmlsmI7-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The thread interrupt management area (TIMA) is a set of pages mapped
in the Hypervisor and in the guest OS address space giving access to
the interrupt thread context registers for interrupt management, ACK,
EOI, CPPR, etc.

XIVE2 changes slightly the TIMA layout with extra bits for the new
features, larger CAM lines and the controller provides configuration
switches for backward compatibility. This is called the XIVE2
P9-compat mode, of Gen1 TIMA. It impacts the layout of the TIMA and
the availability of the internal features associated with it,
Automatic Save & Restore for instance. Using a P9 layout also means
setting the controller in such a mode at init time.

As the OPAL driver initializes the XIVE2 controller with a XIVE2/P10
TIMA directly, the XIVE2 model only has a simple support for the
compat mode in the OS TIMA.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive2_regs.h |  6 ++++++
 hw/intc/pnv_xive2.c      | 22 +++++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
index a46e5133b560..d261766cf5fb 100644
--- a/hw/intc/pnv_xive2_regs.h
+++ b/hw/intc/pnv_xive2_regs.h
@@ -60,6 +60,12 @@
 #define    CQ_XIVE_CFG_HYP_HARD_BLKID_OVERRIDE  PPC_BIT(16)
 #define    CQ_XIVE_CFG_HYP_HARD_BLOCK_ID        PPC_BITMASK(17, 23)
=20
+#define    CQ_XIVE_CFG_GEN1_TIMA_OS             PPC_BIT(24)
+#define    CQ_XIVE_CFG_GEN1_TIMA_HYP            PPC_BIT(25)
+#define    CQ_XIVE_CFG_GEN1_TIMA_HYP_BLK0       PPC_BIT(26) /* 0 if bit[=
25]=3D0 */
+#define    CQ_XIVE_CFG_GEN1_TIMA_CROWD_DIS      PPC_BIT(27) /* 0 if bit[=
25]=3D0 */
+#define    CQ_XIVE_CFG_GEN1_END_ESX             PPC_BIT(28)
+
 /* Interrupt Controller Base Address Register - 512 pages (32M) */
 #define X_CQ_IC_BAR                             0x08
 #define CQ_IC_BAR                               0x040
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 012b238fd037..5df378dde4b6 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -445,6 +445,8 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, u=
int8_t format,
     PnvChip *chip =3D xive->chip;
     int count =3D 0;
     int i, j;
+    bool gen1_tima_os =3D
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
=20
     for (i =3D 0; i < chip->nr_cores; i++) {
         PnvCore *pc =3D chip->cores[i];
@@ -461,9 +463,15 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, =
uint8_t format,
=20
             tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
=20
-            ring =3D xive2_presenter_tctx_match(xptr, tctx, format, nvt_=
blk,
-                                              nvt_idx, cam_ignore,
-                                              logic_serv);
+            if (gen1_tima_os) {
+                ring =3D xive_presenter_tctx_match(xptr, tctx, format, n=
vt_blk,
+                                                 nvt_idx, cam_ignore,
+                                                 logic_serv);
+            } else {
+                ring =3D xive2_presenter_tctx_match(xptr, tctx, format, =
nvt_blk,
+                                                   nvt_idx, cam_ignore,
+                                                   logic_serv);
+            }
=20
             /*
              * Save the context and follow on to catch duplicates,
@@ -1628,9 +1636,11 @@ static void pnv_xive2_tm_write(void *opaque, hwadd=
r offset,
     PnvXive2 *xive =3D pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
     XivePresenter *xptr =3D XIVE_PRESENTER(xive);
+    bool gen1_tima_os =3D
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
=20
     /* TODO: should we switch the TM ops table instead ? */
-    if (offset =3D=3D HV_PUSH_OS_CTX_OFFSET) {
+    if (!gen1_tima_os && offset =3D=3D HV_PUSH_OS_CTX_OFFSET) {
         xive2_tm_push_os_ctx(xptr, tctx, offset, value, size);
         return;
     }
@@ -1645,9 +1655,11 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hw=
addr offset, unsigned size)
     PnvXive2 *xive =3D pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
     XivePresenter *xptr =3D XIVE_PRESENTER(xive);
+    bool gen1_tima_os =3D
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
=20
     /* TODO: should we switch the TM ops table instead ? */
-    if (offset =3D=3D HV_PULL_OS_CTX_OFFSET) {
+    if (!gen1_tima_os && offset =3D=3D HV_PULL_OS_CTX_OFFSET) {
         return xive2_tm_pull_os_ctx(xptr, tctx, offset, size);
     }
=20
--=20
2.34.1


