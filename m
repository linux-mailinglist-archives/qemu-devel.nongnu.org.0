Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F045EDA5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:12:08 +0100 (CET)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa5I-0006r0-2u
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:12:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZo2-0003Y3-Om
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:19 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:49195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnn-0007Us-5o
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:10 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DB30ACE26F23;
 Fri, 26 Nov 2021 12:54:01 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:54:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006136c9abb-f44a-47ee-b048-06691acb9c3a,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 16/18] xive2: Add a get_config() handler for the router
 configuration
Date: Fri, 26 Nov 2021 12:53:47 +0100
Message-ID: <20211126115349.2737605-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 76f10d7e-5478-4119-a60a-c4c2d84329d2
X-Ovh-Tracer-Id: 14616714067948243820
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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


