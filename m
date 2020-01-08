Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03417133B29
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 06:31:04 +0100 (CET)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip3vr-0004uT-CW
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 00:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oZ-0003qs-I7
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ip3oY-0002gA-Fv
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 00:23:31 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35841 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ip3oY-0002dS-4m; Wed, 08 Jan 2020 00:23:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47syMB6nWfz9sSH; Wed,  8 Jan 2020 16:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578460998;
 bh=4D/0sZ0MmUUotjD8FLiAeUMQR4zWDe6W7oCEM+G6yhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QY+/MKHXjwpdEU0oA27dSPBzGleAf/MupbAQ/8NVbJqJoTVgma9h8t8DexrDTz/EL
 vyKmZT01wmxuXbzmS2R5i+i33fWCRkFP4H3Wko++XyDyeQg3pUo2tMgrBCMd37J36k
 yUz5MDpLthzwv8JKkVKXnCQnxj9YNSrmtktZ5v7c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/26] spapr.c: remove 'out' label in spapr_dt_cas_updates()
Date: Wed,  8 Jan 2020 16:22:55 +1100
Message-Id: <20200108052312.238710-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108052312.238710-1-david@gibson.dropbear.id.au>
References: <20200108052312.238710-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

'out' can be replaced by 'return' with the appropriate
return value.

CC: David Gibson <david@gibson.dropbear.id.au>
CC: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200106182425.20312-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e62c89b3dd..eb0b84d300 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -878,7 +878,7 @@ static int spapr_dt_cas_updates(SpaprMachineState *sp=
apr, void *fdt,
         g_assert(smc->dr_lmb_enabled);
         ret =3D spapr_populate_drconf_memory(spapr, fdt);
         if (ret) {
-            goto out;
+            return ret;
         }
     }
=20
@@ -889,11 +889,8 @@ static int spapr_dt_cas_updates(SpaprMachineState *s=
papr, void *fdt,
             return offset;
         }
     }
-    ret =3D spapr_ovec_populate_dt(fdt, offset, spapr->ov5_cas,
-                                 "ibm,architecture-vec-5");
-
-out:
-    return ret;
+    return spapr_ovec_populate_dt(fdt, offset, spapr->ov5_cas,
+                                  "ibm,architecture-vec-5");
 }
=20
 static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
--=20
2.24.1


