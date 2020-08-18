Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E05247D91
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:34:15 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tKA-0006wl-UE
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6Y-0008Q5-4X; Tue, 18 Aug 2020 00:20:10 -0400
Received: from ozlabs.org ([203.11.71.1]:39803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6W-0006NF-AO; Tue, 18 Aug 2020 00:20:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNc659Wz9sVZ; Tue, 18 Aug 2020 14:19:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724368;
 bh=br1dq6DE2bypNpRudqQL9GprFBfraC/xQtt+MK7jboA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CUNbAnyU2AQz7T2r5szy9Du4Z4iPBFGt7nvElZBNmWA0hKPUnmqC627vtv0gO8Ngc
 uC/4dqkYwp9n3DXr753rRdpoQO0LtBdtw/RVdL+uxh778eWUafroVkUfFz2I4NQ59/
 bYXEboJIGPaNk/7jYr2mElpZVn/uZ/bD+kvqgRTM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 20/40] spapr/xive: Simplify kvmppc_xive_disconnect()
Date: Tue, 18 Aug 2020 14:19:02 +1000
Message-Id: <20200818041922.251708-21-david@gibson.dropbear.id.au>
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

Since this function begins with:

    /* The KVM XIVE device is not in use */
    if (!xive || xive->fd == -1) {
        return;
    }

we obviously don't need to check xive->fd again.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159673297296.766512.14780055521619233656.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index d55ea4670e..893a1ee77e 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -873,10 +873,8 @@ void kvmppc_xive_disconnect(SpaprInterruptController *intc)
      * and removed from the list of devices of the VM. The VCPU
      * presenters are also detached from the device.
      */
-    if (xive->fd != -1) {
-        close(xive->fd);
-        xive->fd = -1;
-    }
+    close(xive->fd);
+    xive->fd = -1;
 
     kvm_kernel_irqchip = false;
     kvm_msi_via_irqfd_allowed = false;
-- 
2.26.2


