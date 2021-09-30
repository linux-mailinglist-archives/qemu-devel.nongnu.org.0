Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426641D303
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:04:29 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpBD-0005Rr-SV
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosK-0001J7-DH; Thu, 30 Sep 2021 01:44:56 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:49315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos4-0003R3-Nz; Thu, 30 Sep 2021 01:44:56 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR0mSbz4xbZ; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=VFpJc4+zVi9K9aRZOF5fx13RPoQZuPp/V8j1IRlxkS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AzHFGLyTMf4NwTjKn204KvDFA15uBK3AOpRN62I2HJIiAYruV2BfIK71ONxDRkzGV
 dfHSqCrm+j62ttEnbIelcjDVErsh7wQ3N8ULnlCY4wm5kvvsela+K4GtESLV4oJmel
 2vXq77mtCUVXZX/4YL/+aNSrfMZTIJCZqa7Uw/zQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 08/44] ppc/xive: Export priority_to_ipb() helper
Date: Thu, 30 Sep 2021 15:43:50 +1000
Message-Id: <20210930054426.357344-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210901094153.227671-7-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c        | 21 ++++++---------------
 include/hw/ppc/xive.h | 11 +++++++++++
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b817ee8e37..b0c4f76b1d 100644
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
 
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index db76411654..29b130eaea 100644
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
-- 
2.31.1


