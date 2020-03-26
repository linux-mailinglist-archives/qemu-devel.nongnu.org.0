Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BC1937FA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 06:41:53 +0100 (CET)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHLH6-0004bb-Nz
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 01:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jHLFc-0003Af-Gd
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 01:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jHLFb-0000qX-By
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 01:40:20 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35897)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jHLFb-0000nk-1b; Thu, 26 Mar 2020 01:40:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48nv2l0HFmz9sSN; Thu, 26 Mar 2020 16:40:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585201215;
 bh=5zqp0BrSo+XTId26i2ES/dDzCNRx9VXm9kO8rq5wvko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=abWvDedwz82reARhapOf2htJGZJtP1ees/pUhyK973xRViXTJUUoWZil4r44gLnHl
 vcTf3OoXK2mfvghPnJkvW058u6+mP0wALrzh5fxftvEU1HWi5AjNF8KfL04HBcevfP
 IaSxcPTzo8mFSnbBQpCVL/HhETT+0z2w/og0DtEk=
From: David Gibson <david@gibson.dropbear.id.au>
To: aik@ozlabs.ru,
	groug@kaod.org
Subject: [RFC for-5.1 3/4] spapr: Fix failure path for attempting to hot
 unplug PCI bridges
Date: Thu, 26 Mar 2020 16:40:08 +1100
Message-Id: <20200326054009.454477-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326054009.454477-1-david@gibson.dropbear.id.au>
References: <20200326054009.454477-1-david@gibson.dropbear.id.au>
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For various technical reasons we can't currently allow unplug a PCI to PC=
I
bridge on the pseries machine.  spapr_pci_unplug_request() correctly
generates an error message if that's attempted.

But.. if the given errp is not error_abort or error_fatal, it doesn't
actually stop trying to unplug the bridge anyway.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.25.1


