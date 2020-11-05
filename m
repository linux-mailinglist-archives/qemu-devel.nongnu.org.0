Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED3C2A763B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 04:51:44 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaWJL-0006hV-3j
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 22:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kaWHN-0005NY-Ih; Wed, 04 Nov 2020 22:49:41 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42279 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kaWHL-0003wX-DQ; Wed, 04 Nov 2020 22:49:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CRTzb2bsCz9sTD; Thu,  5 Nov 2020 14:49:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1604548171;
 bh=OjxTdqml0JkNTFyhEHrZhmtd+j41envfmwID7MLyDvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RVNE6zxv4ioloRbaj6RzMDQEAtIg0vhNR3CB7nSkLfDn/pU4kXOU+e1rAJUVqN5Kt
 J8/Q3+QcLYEWRL52FQNXkS4R9WLSM+nmlwQhQ/Oo6DtwhoAvHt9r3nMS5cNcI19m3q
 Y+mrSZMT7mD3Z2py7X7EqdS8sAeySfRbJAdGwx0c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 2/3] spapr: Drop dead code in spapr_reallocate_hpt()
Date: Thu,  5 Nov 2020 14:49:18 +1100
Message-Id: <20201105034919.393653-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105034919.393653-1-david@gibson.dropbear.id.au>
References: <20201105034919.393653-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Sometimes QEMU needs to allocate the HPT in userspace, namely with TCG
or PR KVM. This is performed with qemu_memalign() because of alignment
requirements. Like glib's allocators, its behaviour is to abort on OOM
instead of returning NULL.

This could be changed to qemu_try_memalign(), but in the specific case
of spapr_reallocate_hpt(), the outcome would be to terminate QEMU anyway
since no HPT means no MMU for the guest. Drop the dead code instead.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160398562892.32380.15006707861753544263.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 227075103e..12a012d9dd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1522,12 +1522,6 @@ int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **errp)
         int i;
 
         spapr->htab = qemu_memalign(size, size);
-        if (!spapr->htab) {
-            error_setg_errno(errp, errno,
-                             "Could not allocate HPT of order %d", shift);
-            return -ENOMEM;
-        }
-
         memset(spapr->htab, 0, size);
         spapr->htab_shift = shift;
 
-- 
2.28.0


