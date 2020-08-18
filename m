Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB3247D9B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:37:44 +0200 (CEST)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tNY-0006h4-06
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7i-0001dy-O5; Tue, 18 Aug 2020 00:21:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34593 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7h-0006dT-0d; Tue, 18 Aug 2020 00:21:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNk2k1Mz9sWB; Tue, 18 Aug 2020 14:19:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724374;
 bh=nhGwyAeymaASkHK5D/WcPZyVl5hEMzVQYliqIctBXOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ik4SSBtIPMC+/JBYA6SO1Xs0ymadVtjRHrDofR5+TLXCQczF4Hkw4/as0p/hy0l3T
 ML0kAe5Xt5MojrMmldvtdX6ZnoN0ujJf4Fd8qTC1kWoMrGaPSbQ7gJOzPRhh2aEdmC
 wtE6x3Cnml2E6MMUeKmcBOCNpUqRUf0GB2n9XswY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 40/40] spapr/xive: Use xive_source_esb_len()
Date: Tue, 18 Aug 2020 14:19:22 +1000
Message-Id: <20200818041922.251708-41-david@gibson.dropbear.id.au>
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

static inline size_t xive_source_esb_len(XiveSource *xsrc)
{
    return (1ull << xsrc->esb_shift) * xsrc->nr_irqs;
}

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159733969034.320580.6571451425779179477.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c     | 2 +-
 hw/intc/spapr_xive_kvm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 3c84f64dc4..4bd0d606ba 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -336,7 +336,7 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(xive), &end_xsrc->esb_mmio);
 
     /* Set the mapping address of the END ESB pages after the source ESBs */
-    xive->end_base = xive->vc_base + (1ull << xsrc->esb_shift) * xsrc->nr_irqs;
+    xive->end_base = xive->vc_base + xive_source_esb_len(xsrc);
 
     /*
      * Allocate the routing tables
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index d871bb1a00..e8667ce5f6 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -831,7 +831,7 @@ void kvmppc_xive_disconnect(SpaprInterruptController *intc)
 
     /* Clear the KVM mapping */
     xsrc = &xive->source;
-    esb_len = (1ull << xsrc->esb_shift) * xsrc->nr_irqs;
+    esb_len = xive_source_esb_len(xsrc);
 
     if (xsrc->esb_mmap) {
         memory_region_del_subregion(&xsrc->esb_mmio, &xsrc->esb_mmio_kvm);
-- 
2.26.2


