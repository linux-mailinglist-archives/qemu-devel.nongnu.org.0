Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F63E2BF8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:21:13 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYMq-0007NV-7n
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKQ-0004as-9F
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKO-0004y8-Sh
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53349 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iNYKN-0004rx-Pn; Thu, 24 Oct 2019 04:18:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46zKrX4wNPz9sQv; Thu, 24 Oct 2019 19:18:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571905116;
 bh=DjdvcuO8WddDt5+4oGTr2StA6WKWigfux/PYV+2l3b4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GvW40OoylaXcri4/IYc5e3lqH0ma/HNvz+LkTeYYx0icTC3L9XTIKMOASYiEE+unL
 gjrCcVfKMCxyGpJC+nFW0SAgiDnC3lE6bCRTOyOxOIO++EeStVrIkfO3Bse62Sondy
 32a6oP1nqmCHDLA/Q8en+GLiMRDyiFDoL2znodj4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/28] ppc/pnv: Use address_space_stq_be() when triggering an
 interrupt from PSI
Date: Thu, 24 Oct 2019 19:17:50 +1100
Message-Id: <20191024081813.2115-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024081813.2115-1-david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Include the XIVE_TRIGGER_PQ bit in the trigger data which is how
hardware signals to the IC that the PQ bits of the interrupt source
have been checked.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191007084102.29776-3-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_psi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index a997f16bb4..68d0dfacfe 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -660,10 +660,19 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32=
_t srcno)
=20
     uint32_t offset =3D
         (psi->regs[PSIHB_REG(PSIHB9_IVT_OFFSET)] >> PSIHB9_IVT_OFF_SHIFT=
);
-    uint64_t lisn =3D cpu_to_be64(offset + srcno);
+    uint64_t data =3D XIVE_TRIGGER_PQ | offset | srcno;
+    MemTxResult result;
=20
-    if (valid) {
-        cpu_physical_memory_write(notify_addr, &lisn, sizeof(lisn));
+    if (!valid) {
+        return;
+    }
+
+    address_space_stq_be(&address_space_memory, notify_addr, data,
+                         MEMTXATTRS_UNSPECIFIED, &result);
+    if (result !=3D MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: trigger failed @%"
+                      HWADDR_PRIx "\n", __func__, notif_port);
+        return;
     }
 }
=20
--=20
2.21.0


