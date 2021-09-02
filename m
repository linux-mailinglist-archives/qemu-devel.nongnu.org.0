Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B123FEE8C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:19:14 +0200 (CEST)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmcb-0005PC-IA
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTS-00066G-He
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:46 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:55530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTM-0001yq-JO
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id D6D26295F08;
 Thu,  2 Sep 2021 15:09:38 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043a635ede-e772-4d82-a654-313dba913a54,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 15/20] pnv/xive2: Introduce new capability bits
Date: Thu, 2 Sep 2021 15:09:23 +0200
Message-ID: <20210902130928.528803-16-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7541207f-e8b9-4b57-96c3-8073e42a3e02
X-Ovh-Tracer-Id: 14776591855852096419
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


