Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E3412F30
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:17:30 +0200 (CEST)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSa1x-0000Ny-9a
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSZiG-0002hz-ID; Tue, 21 Sep 2021 02:57:09 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSZiD-0005eR-Gr; Tue, 21 Sep 2021 02:57:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8163FBF0E14A;
 Tue, 21 Sep 2021 08:56:55 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 21 Sep
 2021 08:56:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003fbdfc5a2-c15a-4b1c-8d0e-957b48a95fea,
 B4F7D39287A9E568CDEC1795AF47B556CBF1DE58) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH] spapr/xive: Fix kvm_xive_source_reset trace event
Date: Tue, 21 Sep 2021 08:56:52 +0200
Message-ID: <20210921065652.1121406-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 521b67d8-3f13-4055-81b5-8d36deae7c8f
X-Ovh-Tracer-Id: 9382968350013492131
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/intc/spapr_xive_kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 53731d158625..7ac2502cc013 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -236,6 +236,8 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
     SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
     uint64_t state = 0;
 
+    trace_kvm_xive_source_reset(srcno);
+
     assert(xive->fd != -1);
 
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
@@ -323,8 +325,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
         return xive_esb_rw(xsrc, srcno, offset, data, 1);
     }
 
-    trace_kvm_xive_source_reset(srcno);
-
     /*
      * Special Load EOI handling for LSI sources. Q bit is never set
      * and the interrupt should be re-triggered if the level is still
-- 
2.31.1


