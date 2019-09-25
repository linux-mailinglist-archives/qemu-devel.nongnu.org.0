Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCCBD8B3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 09:04:54 +0200 (CEST)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD1M3-0007Pd-R3
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 03:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iD13o-0008LP-6o
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iD13m-0003Zg-M8
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:45:59 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55503)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iD13l-0003Vk-0k; Wed, 25 Sep 2019 02:45:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46dT8q2m3yz9sQv; Wed, 25 Sep 2019 16:45:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569393947;
 bh=/zwjFMEAaBULPaD+OgxpT0tmoLDpWE8TI3G+IoxSq1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ix3h4CqjzSQUTvJLfRmm5R+2CilzV2Wz1rDiYxdBqxCU0yI/ITPgS+DjUVncPP7Z3
 hdQH7yXqix8mkuXdZJqNDMBIos1RdSLYFb5+vZIr9UJThYofFvu3buxMF8j+hUC7aq
 jBH5QMV1+oUBUL4rszng8jrPHwxvId/zBCr12bD4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/20] spapr: Remove unhelpful tracepoints from
 spapr_irq_free_xics()
Date: Wed, 25 Sep 2019 16:45:28 +1000
Message-Id: <20190925064534.19155-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925064534.19155-1-david@gibson.dropbear.id.au>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These traces contain some useless information (the always-0 source#) and
have no equivalents for XIVE mode.  For now just remove them, and we can
put back something more sensible if and when we need it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c  | 4 ----
 hw/ppc/trace-events | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 79167ccc68..db6755f3ab 100644
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


