Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152063FEE96
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:23:00 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmgF-00039S-4M
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLmTT-000691-Ru; Thu, 02 Sep 2021 09:09:48 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLmTO-0001zS-Nh; Thu, 02 Sep 2021 09:09:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4A33FBC11240;
 Thu,  2 Sep 2021 15:09:40 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a8223cf2-5d74-4671-a5c8-dedbc68350c1,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 20/20] pnv/xive2: Add support for 8bits thread id
Date: Thu, 2 Sep 2021 15:09:28 +0200
Message-ID: <20210902130928.528803-21-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 22344b89-c22b-40e6-9776-3c86e5aadea7
X-Ovh-Tracer-Id: 14777154804900072355
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


