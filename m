Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D345EDB5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:13:50 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa6w-00024z-2l
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZo2-0003Xw-Nz
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:19 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:53195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnl-0007U5-IX
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7326D1FE11;
 Fri, 26 Nov 2021 11:54:00 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00622a85c7c-26d3-461b-88b8-608ee2d2ed12,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 13/18] pnv/xive2: Introduce new capability bits
Date: Fri, 26 Nov 2021 12:53:44 +0100
Message-ID: <20211126115349.2737605-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6015495d-9b84-49cc-ad62-df7a67c9aa61
X-Ovh-Tracer-Id: 14616432591780416364
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These bits control the availability of interrupt features : StoreEOI,
PHB PQ_disable, PHB Address-Based Trigger and the overall XIVE
exploitation mode. These bits can be set at early boot time of the
system to activate/deactivate a feature for testing purposes. The
default value should be '1'.

The 'XIVE exploitation mode' bit is a software bit that skiboot could
use to disable the XIVE OS interface and propose a P8 style XICS
interface instead. There are no plans for that for the moment.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive2_regs.h | 5 +++++
 hw/intc/pnv_xive2.c      | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
index 084fccc8d3e9..46d4fb378135 100644
--- a/hw/intc/pnv_xive2_regs.h
+++ b/hw/intc/pnv_xive2_regs.h
@@ -31,6 +31,11 @@
 #define       CQ_XIVE_CAP_VP_INT_PRIO_8         3
 #define    CQ_XIVE_CAP_BLOCK_ID_WIDTH           PPC_BITMASK(12, 13)
 
+#define    CQ_XIVE_CAP_PHB_PQ_DISABLE           PPC_BIT(56)
+#define    CQ_XIVE_CAP_PHB_ABT                  PPC_BIT(57)
+#define    CQ_XIVE_CAP_EXPLOITATION_MODE        PPC_BIT(58)
+#define    CQ_XIVE_CAP_STORE_EOI                PPC_BIT(59)
+
 /* XIVE2 Configuration */
 #define X_CQ_XIVE_CFG                           0x03
 #define CQ_XIVE_CFG                             0x018
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 186ab66e105d..cb12cea14fc6 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1708,9 +1708,9 @@ static const MemoryRegionOps pnv_xive2_nvpg_ops = {
 };
 
 /*
- * POWER10 default capabilities: 0x2000120076f00000
+ * POWER10 default capabilities: 0x2000120076f000FC
  */
-#define PNV_XIVE2_CAPABILITIES  0x2000120076f00000
+#define PNV_XIVE2_CAPABILITIES  0x2000120076f000FC
 
 /*
  * POWER10 default configuration: 0x0030000033000000
-- 
2.31.1


