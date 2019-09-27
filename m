Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1046BFEC1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 07:57:33 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDjG0-0004uF-Lf
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 01:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9V-0006qh-Q3
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDj9S-000539-RY
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 01:50:49 -0400
Received: from ozlabs.org ([203.11.71.1]:40913)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDj9S-00050b-D3; Fri, 27 Sep 2019 01:50:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46fgrD6Tzrz9sQw; Fri, 27 Sep 2019 15:50:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569563436;
 bh=DQmngEMiivkphtE6NW57+oUk3GSNufbe24fbel5QQ2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MAHscsVrWsENst15DP+2RNW88Mni30ri+G4nPe6Z92Jx8lrlaaTgoDsjd+QRXhmMm
 xQIatFc7HMesg+wv5n0TTN/vFdbHmlP7Vs7Wppmx0AEg3AIxuDAY8K5WlBqr4HzAxM
 mXTENASXSUZwO83PnCs9JpoBcBl5gghKLO4kM+gQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 14/33] spapr: Remove unhelpful tracepoints from
 spapr_irq_free_xics()
Date: Fri, 27 Sep 2019 15:50:09 +1000
Message-Id: <20190927055028.11493-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927055028.11493-1-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These traces contain some useless information (the always-0 source#) and
have no equivalents for XIVE mode.  For now just remove them, and we can
put back something more sensible if and when we need it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/spapr_irq.c  | 4 ----
 hw/ppc/trace-events | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index ec2229d2d1..9919910a86 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -140,11 +140,7 @@ static void spapr_irq_free_xics(SpaprMachineState *s=
papr, int irq, int num)
     int i;
=20
     if (ics_valid_irq(ics, irq)) {
-        trace_spapr_irq_free(0, irq, num);
         for (i =3D srcno; i < srcno + num; ++i) {
-            if (ics_irq_free(ics, i)) {
-                trace_spapr_irq_free_warn(0, i);
-            }
             memset(&ics->irqs[i], 0, sizeof(ICSIRQState));
         }
     }
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 96dad767a1..9ea620f23c 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -13,10 +13,6 @@ spapr_pci_msi_retry(unsigned config_addr, unsigned req=
_num, unsigned max_irqs) "
 spapr_cas_failed(unsigned long n) "DT diff buffer is too small: %ld byte=
s"
 spapr_cas_continue(unsigned long n) "Copy changes to the guest: %ld byte=
s"
=20
-# spapr_irq.c
-spapr_irq_free(int src, int irq, int num) "Source#%d, first irq %d, %d i=
rqs"
-spapr_irq_free_warn(int src, int irq) "Source#%d, irq %d is already free=
"
-
 # spapr_hcall.c
 spapr_cas_pvr(uint32_t cur_pvr, bool explicit_match, uint32_t new_pvr) "=
current=3D0x%x, explicit_match=3D%u, new=3D0x%x"
 spapr_h_resize_hpt_prepare(uint64_t flags, uint64_t shift) "flags=3D0x%"=
PRIx64", shift=3D%"PRIu64
--=20
2.21.0


