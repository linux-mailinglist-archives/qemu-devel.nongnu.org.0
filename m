Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C382886E3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:28:51 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpdq-0005NA-S4
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVV-0005FQ-AB
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44509 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVS-0001n0-6Q
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wX3tPcz9sVx; Fri,  9 Oct 2020 21:19:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238796;
 bh=jYLGZktOinVgDUl+krzeyhCVcCQ603d/QSk/hmkhAlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CgFabBfxFyVgG/eQ97W0t9GVDfCepQVeZ1b5+c6cgsoqpfoMECRpmwjcGo+apRmqI
 Ubn7hQtr0x1SG6VaTkyAl2sPi0fC8/GaAu+2N5JC2Q9rzrP5VAPQA9eG/gicLAXElG
 1yae12ENI/liVUdEQ02GLwJ9NqqFUhZ6spHmXACA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 08/20] spapr: Simplify error handling in
 spapr_vio_busdev_realize()
Date: Fri,  9 Oct 2020 21:19:39 +1100
Message-Id: <20201009101951.1569252-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 06:19:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 dbarboza@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nonngu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Use the return value of spapr_irq_findone() and spapr_irq_claim()
to detect failures. This allows to reduce the error propagation
overhead.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-8-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_vio.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 731080d989..44fdd64b88 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -474,7 +474,6 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
     SpaprVioDevice *dev = (SpaprVioDevice *)qdev;
     SpaprVioDeviceClass *pc = VIO_SPAPR_DEVICE_GET_CLASS(dev);
     char *id;
-    Error *local_err = NULL;
 
     if (dev->reg != -1) {
         /*
@@ -510,16 +509,15 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
     dev->irq = spapr_vio_reg_to_irq(dev->reg);
 
     if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
-        dev->irq = spapr_irq_findone(spapr, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        int irq = spapr_irq_findone(spapr, errp);
+
+        if (irq < 0) {
             return;
         }
+        dev->irq = irq;
     }
 
-    spapr_irq_claim(spapr, dev->irq, false, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (spapr_irq_claim(spapr, dev->irq, false, errp) < 0) {
         return;
     }
 
-- 
2.26.2


