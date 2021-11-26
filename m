Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5645ED8B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:09:17 +0100 (CET)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa2V-0001Kd-Rz
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mqZo5-0003Zx-K5; Fri, 26 Nov 2021 06:54:24 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:60315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mqZo2-0007Vj-8j; Fri, 26 Nov 2021 06:54:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2F81CCE26F27;
 Fri, 26 Nov 2021 12:54:03 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:54:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006b80186b6-156c-4333-83db-3e84a95164a6,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 18/18] pnv/xive2: Add support for 8bits thread id
Date: Fri, 26 Nov 2021 12:53:49 +0100
Message-ID: <20211126115349.2737605-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 561174e0-8e95-41ee-aca3-70fe650d06c4
X-Ovh-Tracer-Id: 14617277017717443436
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h | 1 +
 hw/intc/pnv_xive2.c    | 5 +++++
 hw/intc/xive2.c        | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 88c3e393162d..001388ccea7a 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
 
 #define XIVE2_GEN1_TIMA_OS      0x00000001
 #define XIVE2_VP_SAVE_RESTORE   0x00000002
+#define XIVE2_THREADID_8BITS    0x00000004
 
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 6f0a63cd3d2f..5aaccaf78934 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -438,6 +438,11 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
         cfg |= XIVE2_VP_SAVE_RESTORE;
     }
 
+    if (GETFIELD(CQ_XIVE_CFG_HYP_HARD_RANGE,
+              xive->cq_regs[CQ_XIVE_CFG >> 3]) == CQ_XIVE_CFG_THREADID_8BITS) {
+        cfg |= XIVE2_THREADID_8BITS;
+    }
+
     return cfg;
 }
 
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 978a0e3972e1..6b46f7021b46 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -458,7 +458,8 @@ static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tctx)
     CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
     uint32_t pir = env->spr_cb[SPR_PIR].default_value;
     uint8_t blk = xive2_router_get_block_id(xrtr);
-    uint8_t tid_shift = 7;
+    uint8_t tid_shift =
+        xive2_router_get_config(xrtr) & XIVE2_THREADID_8BITS ? 8 : 7;
     uint8_t tid_mask = (1 << tid_shift) - 1;
 
     return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
-- 
2.31.1


