Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054ED25CFF7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:50:46 +0200 (CEST)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2kO-0007ho-Ro
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hX-0002Xx-Do; Thu, 03 Sep 2020 23:47:47 -0400
Received: from ozlabs.org ([203.11.71.1]:59619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hU-0004uu-AO; Thu, 03 Sep 2020 23:47:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsp3b8dz9sVg; Fri,  4 Sep 2020 13:47:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191246;
 bh=+i8c6x+g1I/0BlMD1P5giE77/kh1mmlq1iXBC8Cnpfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GoaRwCq06m0DSv1loMN+nwJtqt4gRrXkGu97JahZyYxUw6lPg16d6X41BQq4OSOqO
 mTGVB1N+0T5v6RhK6FY6uGZRpUmwFNMKByNwULxeDLzmF2S4d+7iXM+NqdBoTlU5nc
 J77+sa0rnjdcF/xwmS3swkeYp2NApBfPSa7YarVE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/30] spapr/xive: Use kvmppc_xive_source_reset() in post_load
Date: Fri,  4 Sep 2020 13:46:58 +1000
Message-Id: <20200904034719.673626-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 23:47:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

This is doing an extra loop but should be equivalent.

It also differentiate the reset of the sources from the restore of the
sources configuration. This will help in allocating the vCPU IPIs
independently.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200820134547.2355743-3-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 0e834b4b71..3e80ea0ce9 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -646,22 +646,22 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
         }
     }
 
+    /*
+     * We can only restore the source config if the source has been
+     * previously set in KVM. Since we don't do that at reset time
+     * when restoring a VM, let's do it now.
+     */
+    ret = kvmppc_xive_source_reset(&xive->source, &local_err);
+    if (ret < 0) {
+        goto fail;
+    }
+
     /* Restore the EAT */
     for (i = 0; i < xive->nr_irqs; i++) {
         if (!xive_eas_is_valid(&xive->eat[i])) {
             continue;
         }
 
-        /*
-         * We can only restore the source config if the source has been
-         * previously set in KVM. Since we don't do that for all interrupts
-         * at reset time anymore, let's do it now.
-         */
-        ret = kvmppc_xive_source_reset_one(&xive->source, i, &local_err);
-        if (ret < 0) {
-            goto fail;
-        }
-
         ret = kvmppc_xive_set_source_config(xive, i, &xive->eat[i], &local_err);
         if (ret < 0) {
             goto fail;
-- 
2.26.2


