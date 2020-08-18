Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6297E247D92
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:35:13 +0200 (CEST)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tL6-0000lj-Bx
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6k-0000Mh-Lm; Tue, 18 Aug 2020 00:20:22 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53753 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6i-0006TM-SP; Tue, 18 Aug 2020 00:20:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNj4SVjz9sW7; Tue, 18 Aug 2020 14:19:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724373;
 bh=62YQZOe8wkxWTVe1lI9MQqNSqkHNZnzB9/AdI04ywnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e3iFborshtksfAqaB0iJcAjKx1QfbCx6bAjAsO8YMw2ASYr9ZOEUlKqleSbAcA8DE
 1jiQthsil5S8IIp/Qz1Mmw9kY8eAdzdtpyX+Dc4zQ3w/UUfSQR4zQDhQIQdv5ZP+/4
 3LKewZyszSrjccH7rspoab9gRQro9yuqhsCF7XyQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 37/40] ppc/xive: Simplify error handling in xive_tctx_realize()
Date: Tue, 18 Aug 2020 14:19:19 +1000
Message-Id: <20200818041922.251708-38-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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

From: Greg Kurz <groug@kaod.org>

Now that kvmppc_xive_cpu_connect() returns a negative errno on failure,
use that and get rid of the local_err boilerplate.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159707852234.1489912.16410314514265848075.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 17ca5a1916..489e6256ef 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -662,7 +662,6 @@ static void xive_tctx_realize(DeviceState *dev, Error **errp)
     XiveTCTX *tctx = XIVE_TCTX(dev);
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    Error *local_err = NULL;
 
     assert(tctx->cs);
     assert(tctx->xptr);
@@ -683,9 +682,7 @@ static void xive_tctx_realize(DeviceState *dev, Error **errp)
 
     /* Connect the presenter to the VCPU (required for CPU hotplug) */
     if (xive_in_kernel(tctx->xptr)) {
-        kvmppc_xive_cpu_connect(tctx, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (kvmppc_xive_cpu_connect(tctx, errp) < 0) {
             return;
         }
     }
-- 
2.26.2


