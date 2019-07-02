Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016485C923
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:12:27 +0200 (CEST)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiC1i-00075R-4g
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByf-0004lQ-AS
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBye-0002pF-8O
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:17 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50719 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByd-0002nQ-Rp; Tue, 02 Jul 2019 02:09:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMg3j0kz9sPF; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047743;
 bh=b9zd/dpZ/t8tuh+qwvM4HZcNs6C7W3R28XR9WEYPM+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pxGQlCjf+dPLye5IymXssP231KDkmOBH7JOFyG8JGL+cQ0rWa2D7tE4PBtIaVYXte
 WdsxOngO2FYYtbh73eU28+QNgu9iqdBavSjYTQJge/8ZmMHFgZbp7ynVSIFggxO5ah
 rxShILQJ4QMwOxFp02dOUFMWFmJXuaV1NJgPu3Oc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:11 +1000
Message-Id: <20190702060857.3926-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 03/49] ppc/pnv: fix StoreEOI activation
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

The firmware (skiboot) of the PowerNV machines can configure the XIVE
interrupt controller to activate StoreEOI on the ESB pages of the
interrupts. This feature lets software do an EOI with a store instead
of a load. It is not activated today on P9 for rare race condition
issues but it should be on future processors.

Nevertheless, QEMU has a model for StoreEOI which can be used today by
experimental firmwares. But, the use of object_property_set_int() in
the PnvXive model is incorrect and crashes QEMU. Replace it with a
direct access to the ESB flags of the XiveSource object modeling the
internal sources of the interrupt controller.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190612162357.29566-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/pnv_xive.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index a55c2bbc88..9ab77feee9 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -781,8 +781,7 @@ static void pnv_xive_ic_reg_write(void *opaque, hwadd=
r offset,
          * support recently though)
          */
         if (val & (VC_SBC_CONF_CPLX_CIST | VC_SBC_CONF_CIST_BOTH)) {
-            object_property_set_int(OBJECT(&xive->ipi_source),
-                                    XIVE_SRC_STORE_EOI, "flags", &error_=
fatal);
+            xive->ipi_source.esb_flags |=3D XIVE_SRC_STORE_EOI;
         }
         break;
=20
--=20
2.21.0


