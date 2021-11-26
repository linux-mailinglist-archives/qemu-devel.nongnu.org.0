Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BF45ED5D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:06:23 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZzi-00059I-No
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnq-0003Rp-Q6
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:08 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:60791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZni-0007T8-Jo
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C6F8ACE26F07;
 Fri, 26 Nov 2021 12:53:56 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00672324542-314b-4d07-a91e-ab5f5cf809f4,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 09/18] ppc/xive2: Add support for notification injection on
 ESB pages
Date: Fri, 26 Nov 2021 12:53:40 +0100
Message-ID: <20211126115349.2737605-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6a290eef-d4e2-47ea-91ff-be0ac7c28132
X-Ovh-Tracer-Id: 14615306691671264108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is an internal offset used to inject triggers when the PQ state
bits are not controlled locally. Such as for LSIs when the PHB5 are
using the Address-Based Interrupt Trigger mode and on the END.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h |  1 +
 hw/intc/xive.c        |  9 +++++++++
 hw/intc/xive2.c       | 10 ++++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index b8ab0bf7490f..875c7f639689 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -278,6 +278,7 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
 #define XIVE_ESB_STORE_EOI      0x400 /* Store */
 #define XIVE_ESB_LOAD_EOI       0x000 /* Load */
 #define XIVE_ESB_GET            0x800 /* Load */
+#define XIVE_ESB_INJECT         0x800 /* Store */
 #define XIVE_ESB_SET_PQ_00      0xc00 /* Load */
 #define XIVE_ESB_SET_PQ_01      0xd00 /* Load */
 #define XIVE_ESB_SET_PQ_10      0xe00 /* Load */
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 190194d27f84..2c73ab5ca9d6 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1061,6 +1061,15 @@ static void xive_source_esb_write(void *opaque, hwaddr addr,
         notify = xive_source_esb_eoi(xsrc, srcno);
         break;
 
+    /*
+     * This is an internal offset used to inject triggers when the PQ
+     * state bits are not controlled locally. Such as for LSIs when
+     * under ABT mode.
+     */
+    case XIVE_ESB_INJECT ... XIVE_ESB_INJECT + 0x3FF:
+        notify = true;
+        break;
+
     case XIVE_ESB_SET_PQ_00 ... XIVE_ESB_SET_PQ_00 + 0x0FF:
     case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
     case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 9e186bbb6cd9..d474476b5a55 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -658,6 +658,16 @@ static void xive2_end_source_write(void *opaque, hwaddr addr,
         notify = xive_esb_eoi(&pq);
         break;
 
+    case XIVE_ESB_INJECT ... XIVE_ESB_INJECT + 0x3FF:
+        if (end_esmask == END2_W1_ESe) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "XIVE: END %x/%x can not EQ inject on ESe\n",
+                           end_blk, end_idx);
+            return;
+        }
+        notify = true;
+        break;
+
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB write addr %d\n",
                       offset);
-- 
2.31.1


