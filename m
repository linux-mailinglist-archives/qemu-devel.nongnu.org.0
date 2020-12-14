Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C02D9256
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:00:03 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kofxp-0006za-AN
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwL-00058R-6r; Sun, 13 Dec 2020 23:58:30 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:36091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwI-0004pG-OU; Sun, 13 Dec 2020 23:58:28 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfp6ZqJz9sSC; Mon, 14 Dec 2020 15:58:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921890;
 bh=gfeNh3a0FmYAZk7sxGaHo1IQu2z3E9m3i+0g+ViVWlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iHfn8/EXTPygIWvg6AjAvZcvghS57BCu9H0MQNFKivpMXDiZPZ5bmWovCndtwPqCQ
 c6VAdhQ5QLy9+2Hrn7SyjhRSL9KOfg6qjZD7t9bqmkDrsGLH6QqA4MmEufxaZbK2Pb
 b/bnA1lYN5f+3/fcYrfSXdePAU5eEjvpFTofLOSw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/30] spapr/xive: Turn some sanity checks into assertions
Date: Mon, 14 Dec 2020 15:57:38 +1100
Message-Id: <20201214045807.41003-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


