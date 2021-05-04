Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1C3725F1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:49:27 +0200 (CEST)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldos2-0004sB-CA
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1N-00076i-Hx; Tue, 04 May 2021 01:55:01 -0400
Received: from ozlabs.org ([203.11.71.1]:39687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1L-0005OH-Hw; Tue, 04 May 2021 01:55:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CQ5sbFz9t1r; Tue,  4 May 2021 15:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107602;
 bh=fCKZKsqp44tDGeu7z15Q40LoupLPDQzipln+K2O5gIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VbVsBSo45rI2WhDWrQ/aMmiiPXZUrcJovC6mcbgBGR2btWBNhm/bB4TUYvfF/kXEQ
 +2jKTxVHFn/+nKzojZWaJ9yzgju8uXplVpUpxTrSq7TS0AlWLiGPhTpb4TiA8fExVv
 MkIzinG08UGtuQSHO6CaUdZYkjLw5/NgBJUc4NX4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 45/46] hw/ppc/spapr_vio: Reset TCE table object with
 device_cold_reset()
Date: Tue,  4 May 2021 15:53:11 +1000
Message-Id: <20210504055312.306823-46-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The spapr_vio_quiesce_one() function resets the TCE table object
(TYPE_SPAPR_TCE_TABLE) via device_legacy_reset().  We know that
objects of that type do not have a qbus of their own, so the new
device_cold_reset() function (which resets both the device and its
child buses) is equivalent here to device_legacy_reset() and we can
just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210503151849.8766-3-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index ef06e0362c..b59452bcd6 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -310,7 +310,7 @@ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq)
 static void spapr_vio_quiesce_one(SpaprVioDevice *dev)
 {
     if (dev->tcet) {
-        device_legacy_reset(DEVICE(dev->tcet));
+        device_cold_reset(DEVICE(dev->tcet));
     }
     free_crq(dev);
 }
-- 
2.31.1


