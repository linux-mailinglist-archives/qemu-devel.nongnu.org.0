Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91365247D8A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:31:53 +0200 (CEST)
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tHs-00036F-JW
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6C-0007Xb-Nb; Tue, 18 Aug 2020 00:19:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6A-0006Mz-Uh; Tue, 18 Aug 2020 00:19:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNc40Cxz9sVT; Tue, 18 Aug 2020 14:19:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724368;
 bh=be243u2yZPlEiN07XeWKF1dOQ1lSXdIuEaA2RcjcqXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nzNM4wn+ikHuFPlSNGn7vQxk78JkSg/h5SCiMGV4016SwZiRNDi7imvx2aa20+I6d
 MC+yExuQRvgtACp7zv3BbyP1Jo7aQeeYk295cyZh7JkyCX3vTZznfI5vLAhUcLhloP
 RFg9fnb0l3+tURuOH4vBxXtbdzLxwak/t8GSofI8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/40] spapr/xive: Fix xive->fd if kvm_create_device() fails
Date: Tue, 18 Aug 2020 14:19:01 +1000
Message-Id: <20200818041922.251708-20-david@gibson.dropbear.id.au>
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

If the creation of the KVM XIVE device fails for some reasons, the
negative errno ends up in xive->fd, but the rest of the code assumes
that xive->fd either contains an open fd, ie. positive value, or -1.

This doesn't cause any misbehavior except kvmppc_xive_disconnect()
that will try to close(xive->fd) during rollback and likely be
rewarded with an EBADF.

Only set xive->fd with a open fd.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159673296585.766512.15404407281299745442.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index edb7ee0e74..d55ea4670e 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -745,6 +745,7 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     size_t esb_len = (1ull << xsrc->esb_shift) * xsrc->nr_irqs;
     size_t tima_len = 4ull << TM_SHIFT;
     CPUState *cs;
+    int fd;
 
     /*
      * The KVM XIVE device already in use. This is the case when
@@ -760,11 +761,12 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     }
 
     /* First, create the KVM XIVE device */
-    xive->fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_XIVE, false);
-    if (xive->fd < 0) {
-        error_setg_errno(errp, -xive->fd, "XIVE: error creating KVM device");
+    fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_XIVE, false);
+    if (fd < 0) {
+        error_setg_errno(errp, -fd, "XIVE: error creating KVM device");
         return -1;
     }
+    xive->fd = fd;
 
     /* Tell KVM about the # of VCPUs we may have */
     if (kvm_device_check_attr(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
-- 
2.26.2


