Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370D3F94F9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:19:36 +0200 (CEST)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW9H-0003rF-1L
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW08-00012n-SN; Fri, 27 Aug 2021 03:10:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52479 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW06-0007Vs-9R; Fri, 27 Aug 2021 03:10:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ5fjWz9t0T; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=7P/sBElL80z3oJauXgiZrDIdIXtbiRtKVxOhL7XdaQ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fNN32zOJdQJOMRzs3gqxsdSWPCYftzuObUI6Qpuc0azNYhR6FkkDtxjjsMc7Dl06z
 rskD+W6FCpbu0HHznxlNywVhHrUgiMwtEPEk4279BW01bCQMarfdDPns7as6TAWH5Q
 a2zJp36YhsPrkOhKAjtTS8IYzpdz906bQO4jFmhs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/18] ppc/xive: Export PQ get/set routines
Date: Fri, 27 Aug 2021 17:09:41 +1000
Message-Id: <20210827070946.219970-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

These will be shared with the XIVE2 router.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-8-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 8 ++++----
 hw/intc/xive.c           | 6 +++---
 include/hw/ppc/xive.h    | 4 ++++
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index c008331160..3e534b9685 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -297,7 +297,7 @@ static uint8_t xive_esb_read(XiveSource *xsrc, int srcno, uint32_t offset)
     return xive_esb_rw(xsrc, srcno, offset, 0, 0) & 0x3;
 }
 
-static void xive_esb_trigger(XiveSource *xsrc, int srcno)
+static void kvmppc_xive_esb_trigger(XiveSource *xsrc, int srcno)
 {
     uint64_t *addr = xsrc->esb_mmap + xive_source_esb_page(xsrc, srcno);
 
@@ -322,7 +322,7 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
         offset == XIVE_ESB_LOAD_EOI) {
         xive_esb_read(xsrc, srcno, XIVE_ESB_SET_PQ_00);
         if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
-            xive_esb_trigger(xsrc, srcno);
+            kvmppc_xive_esb_trigger(xsrc, srcno);
         }
         return 0;
     } else {
@@ -366,7 +366,7 @@ void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val)
         }
     }
 
-    xive_esb_trigger(xsrc, srcno);
+    kvmppc_xive_esb_trigger(xsrc, srcno);
 }
 
 /*
@@ -533,7 +533,7 @@ static void kvmppc_xive_change_state_handler(void *opaque, bool running,
              * generate a trigger.
              */
             if (pq == XIVE_ESB_RESET && old_pq == XIVE_ESB_QUEUED) {
-                xive_esb_trigger(xsrc, i);
+                kvmppc_xive_esb_trigger(xsrc, i);
             }
         }
 
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index eeb4e62ba9..5ec61ec14e 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -816,7 +816,7 @@ void xive_tctx_destroy(XiveTCTX *tctx)
  * XIVE ESB helpers
  */
 
-static uint8_t xive_esb_set(uint8_t *pq, uint8_t value)
+uint8_t xive_esb_set(uint8_t *pq, uint8_t value)
 {
     uint8_t old_pq = *pq & 0x3;
 
@@ -826,7 +826,7 @@ static uint8_t xive_esb_set(uint8_t *pq, uint8_t value)
     return old_pq;
 }
 
-static bool xive_esb_trigger(uint8_t *pq)
+bool xive_esb_trigger(uint8_t *pq)
 {
     uint8_t old_pq = *pq & 0x3;
 
@@ -846,7 +846,7 @@ static bool xive_esb_trigger(uint8_t *pq)
     }
 }
 
-static bool xive_esb_eoi(uint8_t *pq)
+bool xive_esb_eoi(uint8_t *pq)
 {
     uint8_t old_pq = *pq & 0x3;
 
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 445eccfe6b..7e25c25bfd 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -261,6 +261,10 @@ static inline hwaddr xive_source_esb_mgmt(XiveSource *xsrc, int srcno)
 #define XIVE_ESB_QUEUED       (XIVE_ESB_VAL_P | XIVE_ESB_VAL_Q)
 #define XIVE_ESB_OFF          XIVE_ESB_VAL_Q
 
+bool xive_esb_trigger(uint8_t *pq);
+bool xive_esb_eoi(uint8_t *pq);
+uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
+
 /*
  * "magic" Event State Buffer (ESB) MMIO offsets.
  *
-- 
2.31.1


