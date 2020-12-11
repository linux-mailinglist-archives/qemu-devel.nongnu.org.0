Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15122D6F0B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:18:12 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZsh-0007Yc-0i
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq3-0005Wf-Cq; Thu, 10 Dec 2020 23:15:27 -0500
Received: from ozlabs.org ([203.11.71.1]:38175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq0-0000Vr-0l; Thu, 10 Dec 2020 23:15:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CscrZ3Pjgz9sVY; Fri, 11 Dec 2020 15:15:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660110;
 bh=gfeNh3a0FmYAZk7sxGaHo1IQu2z3E9m3i+0g+ViVWlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZzfcGidja2chQ8kpJWJxsyRM4E4tXtSkMOsakB0BVogHINpHn4frfsiOkKIBY1SnW
 1e2svEM0r7cZ+0zcoeiAq02jO1k42RNdCtmat0Eu/pvc5wPVSoZ9SVMgu3J7cIoGVn
 A40CdUAEcUB1ytdvJ56+UV+kd1hYx+En79DdJDOQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/30] spapr/xive: Turn some sanity checks into assertions
Date: Fri, 11 Dec 2020 15:14:38 +1100
Message-Id: <20201211041507.425378-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The sPAPR XIVE device is created by the machine in spapr_irq_init().
The latter overrides any value provided by the user with -global for
the "nr-irqs" and "nr-ends" properties with strictly positive values.

It seems reasonable to assume these properties should never be 0,
which wouldn't make much sense by the way.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201120174646.619395-2-groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 1fa09f287a..60e0d5769d 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -296,22 +296,16 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     XiveENDSource *end_xsrc = &xive->end_source;
     Error *local_err = NULL;
 
+    /* Set by spapr_irq_init() */
+    g_assert(xive->nr_irqs);
+    g_assert(xive->nr_ends);
+
     sxc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
 
-    if (!xive->nr_irqs) {
-        error_setg(errp, "Number of interrupt needs to be greater 0");
-        return;
-    }
-
-    if (!xive->nr_ends) {
-        error_setg(errp, "Number of interrupt needs to be greater 0");
-        return;
-    }
-
     /*
      * Initialize the internal sources, for IPIs and virtual devices.
      */
-- 
2.29.2


