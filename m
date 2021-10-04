Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A086421954
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:33:59 +0200 (CEST)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVaw-0006Nv-4D
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXVPD-0003y5-MJ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:21:53 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:60397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXVP9-0006bm-AM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:21:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EB8CB202D5;
 Mon,  4 Oct 2021 21:21:44 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 23:21:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002693f802b-27cd-4eb4-b5c5-4aae9dceb83c,
 6052322A053A64D32F912485F446DEADD4740C2E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH] spapr/xive: Add source status helpers
Date: Mon, 4 Oct 2021 23:21:41 +0200
Message-ID: <20211004212141.432954-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f41f4685-9ff4-4d3a-8393-8b36f832ea71
X-Ovh-Tracer-Id: 8099723932010580899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

and use them to set and test the ASSERTED bit of LSI sources.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h    | 24 ++++++++++++++++++++++++
 hw/intc/spapr_xive.c     |  2 +-
 hw/intc/spapr_xive_kvm.c | 10 +++-------
 hw/intc/xive.c           |  8 ++++----
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 252c58a1d691..b8ab0bf7490f 100644
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
 
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 89cfa018f598..4ec659b93e13 100644
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
index 6d4909d0a856..be94cff14837 100644
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
index 6c82326ec768..190194d27f84 100644
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
 
-- 
2.31.1


