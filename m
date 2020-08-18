Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FD247D8C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:33:31 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tJS-0005Pj-G6
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6c-0008VB-HV; Tue, 18 Aug 2020 00:20:14 -0400
Received: from ozlabs.org ([203.11.71.1]:59991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6a-0006Om-Ey; Tue, 18 Aug 2020 00:20:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNf4KJ3z9sVp; Tue, 18 Aug 2020 14:19:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724370;
 bh=cMm5ZqsqrOpRfOgYgXr4ByVdM5itxdkaAqK1NHTzmhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZG9SKkqh/0/QV+52MjIa4dXsWbeVhy/eAUNz+EBUlJ9tZ8r9skbCIFAzbwtmnD4b/
 tUOydeJa75SMh5bADtVvWRbYn5VzUxgTeqx91tjwZ8ENIqpXdYeIvW+wP3XYNp39UH
 fGffcAxzx0N9LLWtgdlwz+Q6rJ01fcVxSmRtSMPE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 27/40] spapr/xive: Rework error handling of
 kvmppc_xive_source_reset()
Date: Tue, 18 Aug 2020 14:19:09 +1000
Message-Id: <20200818041922.251708-28-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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

Since kvmppc_xive_source_reset_one() has a return value, convert
kvmppc_xive_source_reset() to use it for error checking. This
allows to get rid of the local_err boiler plate.

Propagate the return value so that callers may use it as well to check
failures.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159707845245.1489912.9151822670764690034.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index aa1a2f9153..d801bf5cd1 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -248,24 +248,25 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
                              true, errp);
 }
 
-static void kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
+static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
 {
     SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
     int i;
 
     for (i = 0; i < xsrc->nr_irqs; i++) {
-        Error *local_err = NULL;
+        int ret;
 
         if (!xive_eas_is_valid(&xive->eat[i])) {
             continue;
         }
 
-        kvmppc_xive_source_reset_one(xsrc, i, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
+        ret = kvmppc_xive_source_reset_one(xsrc, i, errp);
+        if (ret < 0) {
+            return ret;
         }
     }
+
+    return 0;
 }
 
 /*
-- 
2.26.2


