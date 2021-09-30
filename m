Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58C41D38D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:44:50 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpoH-0003cF-7N
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot9-0002Ql-9v; Thu, 30 Sep 2021 01:45:47 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:49217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot7-00046X-Kv; Thu, 30 Sep 2021 01:45:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR46RZz4xc9; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=bQ+CSQS6tqUbVEjEFID6JtPZ/eQk6N3lH9Y1Pi1PwKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i5R+Wz97tHVaXAUM5wMjXTVnyVJhZbVnxLjxDau7yOnnFGR5sH/GbIaWKXmxq0GDI
 6dBabjITZEIpCqATR+cxrgh5ZGMHLkP/3jQGn5kAqV4rTGQ7Gto9IKu/8dFB5ADhOG
 dJzMRzQETSEtwQbQjxSmjrSAEmSUf+D6QTpt1qgc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 38/44] spapr/xive: Fix kvm_xive_source_reset trace event
Date: Thu, 30 Sep 2021 15:44:20 +1000
Message-Id: <20210930054426.357344-39-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The trace event was placed in the wrong routine. Move it under
kvmppc_xive_source_reset_one().

Fixes: 4e960974d4ee ("xive: Add trace events")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210922070205.1235943-1-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 3e534b9685..6d4909d0a8 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -236,6 +236,8 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
     SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
     uint64_t state = 0;
 
+    trace_kvm_xive_source_reset(srcno);
+
     assert(xive->fd != -1);
 
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
@@ -311,8 +313,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
         return xive_esb_rw(xsrc, srcno, offset, data, 1);
     }
 
-    trace_kvm_xive_source_reset(srcno);
-
     /*
      * Special Load EOI handling for LSI sources. Q bit is never set
      * and the interrupt should be re-triggered if the level is still
-- 
2.31.1


