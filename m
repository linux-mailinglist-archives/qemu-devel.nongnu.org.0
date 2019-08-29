Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187AA119A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:15:02 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Di1-0001L7-1v
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0004Cs-Ez
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dby-0003gP-5a
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:48 -0400
Received: from ozlabs.org ([203.11.71.1]:51993)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dbw-0003ay-S1; Thu, 29 Aug 2019 02:08:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscN1BsVz9sPS; Thu, 29 Aug 2019 16:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058916;
 bh=KQsoY22rZGgAmIzqqaLD+BygSjMqv72FI6tohrrzEss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kQxI+6voqL/wxj46JXo/8CoGIxR3zhTkrJo9xZ30kWbqEFCuh6qJmSdrBjt07lhUQ
 Fa3KkscJSiZS/uwY3mpcTVwjtK3p4k/QqBDx6JlmeQPJkmuikKsL8YbIe6KmnqQ9qQ
 tTLCRUzi6uhSG0hO280LGMoN+JkC0qwUQsdmr4Bc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:17 +1000
Message-Id: <20190829060827.25731-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 09/19] spapr_pci: remove all child functions in
 function zero unplug
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
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

There is nothing wrong with how sPAPR handles multifunction PCI
hot unplugs. The problem is that x86 does it simpler. Instead of
removing each non-zero function and then removing function zero,
x86 can remove any function of the slot to trigger the hot unplug.

Libvirt will be directly impacted by this difference, in the
(hopefully soon) PCI Multifunction hot plug/unplug support. For
hot plugs, both x86 and sPAPR will operate the same way: a XML
with all desired functions to be added, then consecutive hotplugs
of all non-zero functions first, zero last. For hot unplugs, at
least in the current state, a XML with the devices to be removed
must also be provided because of how sPAPR operates - x86 does
not need it - since any function unplug will unplug the whole
PCIe slot. This difference puts extra strain in the management
layer, which needs to either handle both archs differently in
the unplug scenario or choose treat x86 like sPAPR, forcing x86
users to cope with sPAPR internals.

This patch changes spapr_pci_unplug_request to handle the
unplug of function zero differently. When removing function zero,
instead of error-ing out if there are any remaining function
DRCs which needs detaching, detach those. This has no effect in
any existing scripts that are detaching the non-zero functions
before function zero, and can be used by management as a shortcut
to remove the whole PCI multifunction device without specifying
each child function.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20190822195918.3307-1-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index deb0b0c80c..9f176f463e 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1700,11 +1700,13 @@ static void spapr_pci_unplug_request(HotplugHandl=
er *plug_handler,
                 state =3D func_drck->dr_entity_sense(func_drc);
                 if (state =3D=3D SPAPR_DR_ENTITY_SENSE_PRESENT
                     && !spapr_drc_unplug_requested(func_drc)) {
-                    error_setg(errp,
-                               "PCI: slot %d, function %d still present.=
 "
-                               "Must unplug all non-0 functions first.",
-                               slotnr, i);
-                    return;
+                    /*
+                     * Attempting to remove function 0 of a multifunctio=
n
+                     * device will will cascade into removing all child
+                     * functions, even if their unplug weren't requested
+                     * beforehand.
+                     */
+                    spapr_drc_detach(func_drc);
                 }
             }
         }
--=20
2.21.0


