Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7333FD735
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:49:08 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMri-0003u9-SL
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLMlG-0002nn-Vg
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:42:27 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:34366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLMlE-0000y4-8a
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:42:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A127C28DEFA;
 Wed,  1 Sep 2021 11:42:11 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 11:41:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059830b93d-434b-4125-bc6f-b6ff9dbb915f,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 6/8] ppc/xive: Export priority_to_ipb() helper
Date: Wed, 1 Sep 2021 11:41:51 +0200
Message-ID: <20210901094153.227671-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901094153.227671-1-clg@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb30a290-4dfa-4553-a0f3-c9e493eb0a6e
X-Ovh-Tracer-Id: 5397001203532991395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/hw/ppc/xive.h | 11 +++++++++++
 hw/intc/xive.c        | 21 ++++++---------------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index db7641165484..29b130eaea59 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -458,6 +458,17 @@ struct XiveENDSource {
  */
 #define XIVE_PRIORITY_MAX  7
 
+/*
+ * Convert a priority number to an Interrupt Pending Buffer (IPB)
+ * register, which indicates a pending interrupt at the priority
+ * corresponding to the bit number
+ */
+static inline uint8_t xive_priority_to_ipb(uint8_t priority)
+{
+    return priority > XIVE_PRIORITY_MAX ?
+        0 : 1 << (XIVE_PRIORITY_MAX - priority);
+}
+
 /*
  * XIVE Thread Interrupt Management Aera (TIMA)
  *
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b817ee8e3704..b0c4f76b1d4b 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -27,17 +27,6 @@
  * XIVE Thread Interrupt Management context
  */
 
-/*
- * Convert a priority number to an Interrupt Pending Buffer (IPB)
- * register, which indicates a pending interrupt at the priority
- * corresponding to the bit number
- */
-static uint8_t priority_to_ipb(uint8_t priority)
-{
-    return priority > XIVE_PRIORITY_MAX ?
-        0 : 1 << (XIVE_PRIORITY_MAX - priority);
-}
-
 /*
  * Convert an Interrupt Pending Buffer (IPB) register to a Pending
  * Interrupt Priority Register (PIPR), which contains the priority of
@@ -89,7 +78,7 @@ static uint64_t xive_tctx_accept(XiveTCTX *tctx, uint8_t ring)
         regs[TM_CPPR] = cppr;
 
         /* Reset the pending buffer bit */
-        regs[TM_IPB] &= ~priority_to_ipb(cppr);
+        regs[TM_IPB] &= ~xive_priority_to_ipb(cppr);
         regs[TM_PIPR] = ipb_to_pipr(regs[TM_IPB]);
 
         /* Drop Exception bit */
@@ -353,7 +342,7 @@ static void xive_tm_set_os_cppr(XivePresenter *xptr, XiveTCTX *tctx,
 static void xive_tm_set_os_pending(XivePresenter *xptr, XiveTCTX *tctx,
                                    hwaddr offset, uint64_t value, unsigned size)
 {
-    xive_tctx_ipb_update(tctx, TM_QW1_OS, priority_to_ipb(value & 0xff));
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, xive_priority_to_ipb(value & 0xff));
 }
 
 static void xive_os_cam_decode(uint32_t cam, uint8_t *nvt_blk,
@@ -1535,7 +1524,8 @@ bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
     /* handle CPU exception delivery */
     if (count) {
         trace_xive_presenter_notify(nvt_blk, nvt_idx, match.ring);
-        xive_tctx_ipb_update(match.tctx, match.ring, priority_to_ipb(priority));
+        xive_tctx_ipb_update(match.tctx, match.ring,
+                             xive_priority_to_ipb(priority));
     }
 
     return !!count;
@@ -1682,7 +1672,8 @@ static void xive_router_end_notify(XiveRouter *xrtr, uint8_t end_blk,
          * use. The presenter will resend the interrupt when the vCPU
          * is dispatched again on a HW thread.
          */
-        ipb = xive_get_field32(NVT_W4_IPB, nvt.w4) | priority_to_ipb(priority);
+        ipb = xive_get_field32(NVT_W4_IPB, nvt.w4) |
+            xive_priority_to_ipb(priority);
         nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, ipb);
         xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
 
-- 
2.31.1


