Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B09D4359FD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:26:59 +0200 (CEST)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPfO-0002p3-Oe
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZQ-0005UD-5X; Thu, 21 Oct 2021 00:20:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZL-0006tJ-11; Thu, 21 Oct 2021 00:20:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p2fKbz4xbc; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=OMRwIqs7zkKLFjmv4D4NnKrNSIIPHmw8nhDr6bPTNN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hcsaL0+4LyqWXkIv7EIIwWeWDJGtplLn5t1AcrRQlrDkfkacIimiaxddL/C1I393W
 lbt2jauk55fmzYJL2FOy5WyhChfTntpTL/GaJ6FxW76xUZSzXo7odOZB25ErPZlgzN
 RIW6OSXsWWzHvF2QOhcLDQXt5UaD39T1RBX+KZdg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/25] spapr/xive: Add source status helpers
Date: Thu, 21 Oct 2021 15:20:03 +1100
Message-Id: <20211021042027.345405-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

and use them to set and test the ASSERTED bit of LSI sources.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20211004212141.432954-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c     |  2 +-
 hw/intc/spapr_xive_kvm.c | 10 +++-------
 hw/intc/xive.c           |  8 ++++----
 include/hw/ppc/xive.h    | 24 ++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 89cfa018f5..4ec659b93e 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -185,7 +185,7 @@ static void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
                        xive_source_irq_is_lsi(xsrc, i) ? "LSI" : "MSI",
                        pq & XIVE_ESB_VAL_P ? 'P' : '-',
                        pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
-                       xsrc->status[i] & XIVE_STATUS_ASSERTED ? 'A' : ' ',
+                       xive_source_is_asserted(xsrc, i) ? 'A' : ' ',
                        xive_eas_is_masked(eas) ? "M" : " ",
                        (int) xive_get_field64(EAS_END_DATA, eas->w));
 
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 6d4909d0a8..be94cff148 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -242,7 +242,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
 
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
         state |= KVM_XIVE_LEVEL_SENSITIVE;
-        if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
+        if (xive_source_is_asserted(xsrc, srcno)) {
             state |= KVM_XIVE_LEVEL_ASSERTED;
         }
     }
@@ -321,7 +321,7 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
     if (xive_source_irq_is_lsi(xsrc, srcno) &&
         offset == XIVE_ESB_LOAD_EOI) {
         xive_esb_read(xsrc, srcno, XIVE_ESB_SET_PQ_00);
-        if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
+        if (xive_source_is_asserted(xsrc, srcno)) {
             kvmppc_xive_esb_trigger(xsrc, srcno);
         }
         return 0;
@@ -359,11 +359,7 @@ void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val)
             return;
         }
     } else {
-        if (val) {
-            xsrc->status[srcno] |= XIVE_STATUS_ASSERTED;
-        } else {
-            xsrc->status[srcno] &= ~XIVE_STATUS_ASSERTED;
-        }
+        xive_source_set_asserted(xsrc, srcno, val);
     }
 
     kvmppc_xive_esb_trigger(xsrc, srcno);
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 6c82326ec7..190194d27f 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -875,7 +875,7 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc, uint32_t srcno)
 {
     uint8_t old_pq = xive_source_esb_get(xsrc, srcno);
 
-    xsrc->status[srcno] |= XIVE_STATUS_ASSERTED;
+    xive_source_set_asserted(xsrc, srcno, true);
 
     switch (old_pq) {
     case XIVE_ESB_RESET:
@@ -923,7 +923,7 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, uint32_t srcno)
      * notification
      */
     if (xive_source_irq_is_lsi(xsrc, srcno) &&
-        xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
+        xive_source_is_asserted(xsrc, srcno)) {
         ret = xive_source_lsi_trigger(xsrc, srcno);
     }
 
@@ -1104,7 +1104,7 @@ void xive_source_set_irq(void *opaque, int srcno, int val)
         if (val) {
             notify = xive_source_lsi_trigger(xsrc, srcno);
         } else {
-            xsrc->status[srcno] &= ~XIVE_STATUS_ASSERTED;
+            xive_source_set_asserted(xsrc, srcno, false);
         }
     } else {
         if (val) {
@@ -1133,7 +1133,7 @@ void xive_source_pic_print_info(XiveSource *xsrc, uint32_t offset, Monitor *mon)
                        xive_source_irq_is_lsi(xsrc, i) ? "LSI" : "MSI",
                        pq & XIVE_ESB_VAL_P ? 'P' : '-',
                        pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
-                       xsrc->status[i] & XIVE_STATUS_ASSERTED ? 'A' : ' ');
+                       xive_source_is_asserted(xsrc, i) ? 'A' : ' ');
     }
 }
 
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 252c58a1d6..b8ab0bf749 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -286,6 +286,30 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
 uint8_t xive_source_esb_get(XiveSource *xsrc, uint32_t srcno);
 uint8_t xive_source_esb_set(XiveSource *xsrc, uint32_t srcno, uint8_t pq);
 
+/*
+ * Source status helpers
+ */
+static inline void xive_source_set_status(XiveSource *xsrc, uint32_t srcno,
+                                          uint8_t status, bool enable)
+{
+    if (enable) {
+        xsrc->status[srcno] |= status;
+    } else {
+        xsrc->status[srcno] &= ~status;
+    }
+}
+
+static inline void xive_source_set_asserted(XiveSource *xsrc, uint32_t srcno,
+                                            bool enable)
+{
+    xive_source_set_status(xsrc, srcno, XIVE_STATUS_ASSERTED, enable);
+}
+
+static inline bool xive_source_is_asserted(XiveSource *xsrc, uint32_t srcno)
+{
+    return xsrc->status[srcno] & XIVE_STATUS_ASSERTED;
+}
+
 void xive_source_pic_print_info(XiveSource *xsrc, uint32_t offset,
                                 Monitor *mon);
 
-- 
2.31.1


