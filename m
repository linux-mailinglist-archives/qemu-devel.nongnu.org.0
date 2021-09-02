Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B23FEEBC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:35:43 +0200 (CEST)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmsY-00027e-No
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLmTT-00068g-NP; Thu, 02 Sep 2021 09:09:47 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLmTO-0001zD-NW; Thu, 02 Sep 2021 09:09:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 116FBBC1123C;
 Thu,  2 Sep 2021 15:09:40 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0047136812f-81ee-4511-9d66-101215374d2d,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 18/20] xive2: Add a get_config() handler for the router
 configuration
Date: Thu, 2 Sep 2021 15:09:26 +0200
Message-ID: <20210902130928.528803-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 22d315b4-cdb8-44a6-b5f2-ac953d84e4e6
X-Ovh-Tracer-Id: 14776873327838333859
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

Add GEN1 config even if we don't use it yet in the core framework.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++++++
 hw/intc/pnv_xive2.c    | 13 +++++++++++++
 hw/intc/xive2.c        |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index cf6211a0ecb9..b08600cbd5ee 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -25,6 +25,12 @@ typedef struct Xive2Router {
 #define TYPE_XIVE2_ROUTER "xive2-router"
 OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
 
+/*
+ * Configuration flags
+ */
+
+#define XIVE2_GEN1_TIMA_OS      0x00000001
+
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
 
@@ -44,6 +50,7 @@ typedef struct Xive2RouterClass {
     int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
                      Xive2Nvp *nvp, uint8_t word_number);
     uint8_t (*get_block_id)(Xive2Router *xrtr);
+    uint32_t (*get_config)(Xive2Router *xrtr);
 } Xive2RouterClass;
 
 int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
@@ -56,6 +63,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
                         Xive2Nvp *nvp);
 int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
                           Xive2Nvp *nvp, uint8_t word_number);
+uint32_t xive2_router_get_config(Xive2Router *xrtr);
 
 void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
 
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index b364ee3b306b..2b7d6ccbd097 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -425,6 +425,18 @@ static int pnv_xive2_get_eas(Xive2Router *xrtr, uint8_t blk, uint32_t idx,
     return pnv_xive2_vst_read(xive, VST_EAS, blk, idx, eas);
 }
 
+static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
+{
+    PnvXive2 *xive = PNV_XIVE2(xrtr);
+    uint32_t cfg = 0;
+
+    if (xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS) {
+        cfg |= XIVE2_GEN1_TIMA_OS;
+    }
+
+    return cfg;
+}
+
 static bool pnv_xive2_is_cpu_enabled(PnvXive2 *xive, PowerPCCPU *cpu)
 {
     int pir = ppc_cpu_pir(cpu);
@@ -1949,6 +1961,7 @@ static void pnv_xive2_class_init(ObjectClass *klass, void *data)
     xrc->write_end = pnv_xive2_write_end;
     xrc->get_nvp   = pnv_xive2_get_nvp;
     xrc->write_nvp = pnv_xive2_write_nvp;
+    xrc->get_config  = pnv_xive2_get_config;
     xrc->get_block_id = pnv_xive2_get_block_id;
 
     xnc->notify    = pnv_xive2_notify;
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index e31037e1f030..71086c7fbd01 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -20,6 +20,13 @@
 #include "hw/ppc/xive2.h"
 #include "hw/ppc/xive2_regs.h"
 
+uint32_t xive2_router_get_config(Xive2Router *xrtr)
+{
+    Xive2RouterClass *xrc = XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_config(xrtr);
+}
+
 void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon)
 {
     if (!xive2_eas_is_valid(eas)) {
-- 
2.31.1


