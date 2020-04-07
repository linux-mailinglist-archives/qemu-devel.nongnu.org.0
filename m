Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D61A05D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 06:37:57 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLfzo-0001QE-Fr
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 00:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jLfyM-0007yH-5E
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jLfyL-0004Ch-7r
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:36:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39689 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jLfyK-0004Ak-T0; Tue, 07 Apr 2020 00:36:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48xF3K4yRYz9sT1; Tue,  7 Apr 2020 14:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586234173;
 bh=s6bKQPRhd/ZqHFnqEThnxbQZV4q8BbxQrc+5e7hCMxw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lMjXXg/KVq1k0WpJP3Sp8M2KsM6EGN4SqMbgRhh2vVQukHj139BNbIHEPLefciNvk
 Y5tCOEKFnPH5NGWrSx6BBZUj4Me6/vXD8FGTr402WLKe9mPK1FY72Lb0yVTVmNq5rB
 XPVsJ6Sg9RrnU7Qzv/iZCSS9DLQ7WCAiS5QnvinI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 07/10] spapr: Fix failure path for attempting to hot unplug PCI
 bridges
Date: Tue,  7 Apr 2020 14:36:03 +1000
Message-Id: <20200407043606.291546-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200407043606.291546-1-david@gibson.dropbear.id.au>
References: <20200407043606.291546-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For various technical reasons we can't currently allow unplug a PCI to PC=
I
bridge on the pseries machine.  spapr_pci_unplug_request() correctly
generates an error message if that's attempted.

But.. if the given errp is not error_abort or error_fatal, it doesn't
actually stop trying to unplug the bridge anyway.

Fixes: 14e714900f6b "spapr: Allow hot plug/unplug of PCI bridges and devi=
ces under PCI bridges"
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 709a52780d..55ca9dee1e 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1663,6 +1663,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
=20
         if (pc->is_bridge) {
             error_setg(errp, "PCI: Hot unplug of PCI bridges not support=
ed");
+            return;
         }
=20
         /* ensure any other present functions are pending unplug */
--=20
2.25.2


