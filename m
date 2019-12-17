Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE7122366
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:10:59 +0100 (CET)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih58M-0002cM-83
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4iS-00008m-Jt
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4iR-0005n9-J0
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:44:12 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52677 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4iR-0005Q9-8L; Mon, 16 Dec 2019 23:44:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWS3GRlz9sSj; Tue, 17 Dec 2019 15:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557812;
 bh=Qr/f8LIMoTqVdF6BB8cAbzhbd2tEVe4IjlvUHANWBx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MF40L5ZUudkHSZpryrBv9Ep/ltcxpiSVzF/0+3hudN8JjiGS2pSADeli6vQ3Ckszo
 oZgAxziaIeWaYGkTLf5VKBHO6oODvrIccviR45zC6Qhb75V6TuOIvjISPkQtB5ZgNd
 lDcS2eDLuZrlgZrPYKmcoNhxlpfFujpJ7rWVW5Ng=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 21/88] ppc/pnv: Quiesce some XIVE errors
Date: Tue, 17 Dec 2019 15:42:15 +1100
Message-Id: <20191217044322.351838-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

When dumping the END and NVT tables, the error logging is too noisy.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191115162436.30548-6-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/pnv_xive.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index a4d80fd5e7..9a771f6407 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -29,7 +29,7 @@
=20
 #include "pnv_xive_regs.h"
=20
-#define XIVE_DEBUG
+#undef XIVE_DEBUG
=20
 /*
  * Virtual structures table (VST)
@@ -157,7 +157,9 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *x=
ive, uint32_t type,
     vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
=20
     if (!(vsd & VSD_ADDRESS_MASK)) {
+#ifdef XIVE_DEBUG
         xive_error(xive, "VST: invalid %s entry %x !?", info->name, idx)=
;
+#endif
         return 0;
     }
=20
@@ -178,7 +180,9 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *x=
ive, uint32_t type,
         vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
=20
         if (!(vsd & VSD_ADDRESS_MASK)) {
+#ifdef XIVE_DEBUG
             xive_error(xive, "VST: invalid %s entry %x !?", info->name, =
idx);
+#endif
             return 0;
         }
=20
--=20
2.23.0


