Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DB3FEEA7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:27:56 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLml1-0006VN-33
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTR-0005zW-0e
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:45 -0400
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:53405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTL-0001xe-QY
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 2A109295E7D;
 Thu,  2 Sep 2021 15:09:38 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048c719ff5-afb2-4b4f-a74f-e5f81a7b7081,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 11/20] ppc/xive2: Add support for notification injection on
 ESB pages
Date: Thu, 2 Sep 2021 15:09:19 +0200
Message-ID: <20210902130928.528803-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 65341003-1cc7-40d3-8903-9ccb1f97d701
X-Ovh-Tracer-Id: 14776028906517269411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
index 252c58a1d691..c270efd0e9a2 100644
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
index 6c82326ec768..0a9149284dad 100644
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


