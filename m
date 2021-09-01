Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F953FD738
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:51:22 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMtt-0008EE-Sb
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLMlQ-0002uJ-IO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:42:36 -0400
Received: from 10.mo52.mail-out.ovh.net ([87.98.187.244]:37336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLMlM-00014H-FJ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:42:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 4EFA828FAD6;
 Wed,  1 Sep 2021 11:42:22 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 11:41:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00576aa6fbe-acc7-4ba2-87b2-c87f6b2844ab,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 7/8] ppc/xive: Export xive_tctx_word2() helper
Date: Wed, 1 Sep 2021 11:41:52 +0200
Message-ID: <20210901094153.227671-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901094153.227671-1-clg@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a6cef100-2cf0-4926-aa8e-8006ec257864
X-Ovh-Tracer-Id: 5397001207434677155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/hw/ppc/xive.h | 5 +++++
 hw/intc/xive.c        | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 29b130eaea59..252c58a1d691 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -335,6 +335,11 @@ struct XiveTCTX {
     XivePresenter *xptr;
 };
 
+static inline uint32_t xive_tctx_word2(uint8_t *ring)
+{
+    return *((uint32_t *) &ring[TM_WORD2]);
+}
+
 /*
  * XIVE Router
  */
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b0c4f76b1d4b..6c82326ec768 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -141,11 +141,6 @@ void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb)
     xive_tctx_notify(tctx, ring);
 }
 
-static inline uint32_t xive_tctx_word2(uint8_t *ring)
-{
-    return *((uint32_t *) &ring[TM_WORD2]);
-}
-
 /*
  * XIVE Thread Interrupt Management Area (TIMA)
  */
-- 
2.31.1


