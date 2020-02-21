Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E9166DFB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:44:16 +0100 (CET)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zEd-0004ov-PL
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7z-0002F9-KQ
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7x-0008Ml-R0
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:23 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33791 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7x-00080P-Ez; Thu, 20 Feb 2020 22:37:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwG37Lgz9sSV; Fri, 21 Feb 2020 14:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256222;
 bh=oto2DP51lfwFNY8850lSwPwMGWIzyB8Fptb3GKQeMEM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CzlokUDrjrdyR1xI8BDsyLYN7fvapZewHiN6SYWvCT3DqPzs6BnPF80r97DPGTKK+
 skZltN/BTjkp2wPSuuXMvOMAF1BL0wpTezZ3/D0zlG9RuH4neZPi4N0EaC1ziYgz3p
 Bl6DHdDDvROLhq9IZ7BNlRNvYorOs6jlekzcMeA4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/20] pnv/phb4: Fix error path in pnv_pec_realize()
Date: Fri, 21 Feb 2020 14:36:41 +1100
Message-Id: <20200221033650.444386-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Obviously, we want to pass &local_err so that we can check it then
line below, not errp.

Reported-by: Coverity CID 1419395 'Constant' variable guards dead code
Fixes: 4f9924c4d4cf "ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge=
"
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <158153364605.3229002.2796177658957390343.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/pci-host/pnv_phb4_pec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 68e1db3eac..911d147ffd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -391,7 +391,7 @@ static void pnv_pec_realize(DeviceState *dev, Error *=
*errp)
=20
         object_property_set_int(stk_obj, i, "stack-no", &error_abort);
         object_property_set_link(stk_obj, OBJECT(pec), "pec", &error_abo=
rt);
-        object_property_set_bool(stk_obj, true, "realized", errp);
+        object_property_set_bool(stk_obj, true, "realized", &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
--=20
2.24.1


