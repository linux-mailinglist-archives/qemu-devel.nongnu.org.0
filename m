Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76B3FEEB7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:31:45 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmoi-0004Ew-4L
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLmTT-00068f-Gx; Thu, 02 Sep 2021 09:09:47 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLmTO-0001z4-Mi; Thu, 02 Sep 2021 09:09:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AB07CBC1123A;
 Thu,  2 Sep 2021 15:09:39 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004ffd7f8bf-d307-4b2d-84a6-979533aae3dc,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 17/20] pnv/xive2: Add support XIVE2 P9-compat mode (or Gen1)
Date: Thu, 2 Sep 2021 15:09:25 +0200
Message-ID: <20210902130928.528803-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 11ce4bc0-07c9-4bd3-a0f7-c1dd86c16e6b
X-Ovh-Tracer-Id: 14776873331081907107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
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
 
+#define    CQ_XIVE_CFG_GEN1_TIMA_OS             PPC_BIT(24)
+#define    CQ_XIVE_CFG_GEN1_TIMA_HYP            PPC_BIT(25)
+#define    CQ_XIVE_CFG_GEN1_TIMA_HYP_BLK0       PPC_BIT(26) /* 0 if bit[25]=0 */
+#define    CQ_XIVE_CFG_GEN1_TIMA_CROWD_DIS      PPC_BIT(27) /* 0 if bit[25]=0 */
+#define    CQ_XIVE_CFG_GEN1_END_ESX             PPC_BIT(28)
+
 /* Interrupt Controller Base Address Register - 512 pages (32M) */
 #define X_CQ_IC_BAR                             0x08
 #define CQ_IC_BAR                               0x040
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 4a2649893232..b364ee3b306b 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -444,6 +444,8 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, uint8_t format,
     PnvChip *chip = xive->chip;
     int count = 0;
     int i, j;
+    bool gen1_tima_os =
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
 
     for (i = 0; i < chip->nr_cores; i++) {
         PnvCore *pc = chip->cores[i];
@@ -460,9 +462,15 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, uint8_t format,
 
             tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
 
-            ring = xive2_presenter_tctx_match(xptr, tctx, format, nvt_blk,
-                                              nvt_idx, cam_ignore,
-                                              logic_serv);
+            if (gen1_tima_os) {
+                ring = xive_presenter_tctx_match(xptr, tctx, format, nvt_blk,
+                                                 nvt_idx, cam_ignore,
+                                                 logic_serv);
+            } else {
+                ring = xive2_presenter_tctx_match(xptr, tctx, format, nvt_blk,
+                                                   nvt_idx, cam_ignore,
+                                                   logic_serv);
+            }
 
             /*
              * Save the context and follow on to catch duplicates,
@@ -1627,9 +1635,11 @@ static void pnv_xive2_tm_write(void *opaque, hwaddr offset,
     PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
     XivePresenter *xptr = XIVE_PRESENTER(xive);
+    bool gen1_tima_os =
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
 
     /* TODO: should we switch the TM ops table instead ? */
-    if (offset == HV_PUSH_OS_CTX_OFFSET) {
+    if (!gen1_tima_os && offset == HV_PUSH_OS_CTX_OFFSET) {
         xive2_tm_push_os_ctx(xptr, tctx, offset, value, size);
         return;
     }
@@ -1644,9 +1654,11 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned size)
     PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
     XivePresenter *xptr = XIVE_PRESENTER(xive);
+    bool gen1_tima_os =
+        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
 
     /* TODO: should we switch the TM ops table instead ? */
-    if (offset == HV_PULL_OS_CTX_OFFSET) {
+    if (!gen1_tima_os && offset == HV_PULL_OS_CTX_OFFSET) {
         return xive2_tm_pull_os_ctx(xptr, tctx, offset, size);
     }
 
-- 
2.31.1


