Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9333E473B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:09:28 +0200 (CEST)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5y3-0002cB-R7
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bz-00013G-5G; Mon, 09 Aug 2021 09:46:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60078
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bw-00014W-8Y; Mon, 09 Aug 2021 09:46:38 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DckBa021749; Mon, 9 Aug 2021 09:46:10 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7g9pwh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:09 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DhIG1025013;
 Mon, 9 Aug 2021 13:46:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3a9hehc334-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179DguAX59769252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:42:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87C1E4C058;
 Mon,  9 Aug 2021 13:46:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43D8C4C040;
 Mon,  9 Aug 2021 13:46:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7944022016C;
 Mon,  9 Aug 2021 15:46:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 23/26] pnv/xive2: Add support XIVE2 P9-compat mode (or Gen1)
Date: Mon,  9 Aug 2021 15:45:44 +0200
Message-Id: <20210809134547.689560-24-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 761RKvSp3mazA2PU1oOlQ4pN9M33pAQt
X-Proofpoint-ORIG-GUID: 761RKvSp3mazA2PU1oOlQ4pN9M33pAQt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090101
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

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive2_regs.h |  6 ++++++
 hw/intc/pnv_xive2.c      | 22 +++++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
index 46d4fb378135..902220e6be69 100644
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
index 4a2649893232..b364ee3b306b 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -444,6 +444,8 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, u=
int8_t format,
     PnvChip *chip =3D xive->chip;
     int count =3D 0;
     int i, j;
+    bool gen1_tima_os =3D
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
=20
     for (i =3D 0; i < chip->nr_cores; i++) {
         PnvCore *pc =3D chip->cores[i];
@@ -460,9 +462,15 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, =
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
@@ -1627,9 +1635,11 @@ static void pnv_xive2_tm_write(void *opaque, hwadd=
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
@@ -1644,9 +1654,11 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hw=
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
2.31.1


