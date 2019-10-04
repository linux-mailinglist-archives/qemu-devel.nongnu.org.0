Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4542CB7F5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:11:08 +0200 (CEST)
Received: from localhost ([::1]:44718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKYF-0004Ty-5O
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2f-0005HQ-3x
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2e-0005QT-2Q
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:29 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2d-00054o-L0; Fri, 04 Oct 2019 05:38:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YH7459z9sRh; Fri,  4 Oct 2019 19:37:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181876;
 bh=AEoLWeLd9AOwHmqcsLlE//fc+RQgpEU22pqwOzc2tHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SzXoGtwrhWAlHwtw0qlM2dp+eZt8B0vTBJDjG9K7KdGAqp+2CxJVhDNAtEk541nC/
 Rgh+dlNGSLvfIkETwzK2F9HU/sdX/Z4nGh/A8OS6YYs/QqiiZtocsoXsZMhBHnJgVU
 lU1s0tcdq4CdrManCvTgdjaDf/W6KlD6oAjQE4+k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 18/53] spapr: Skip leading zeroes from memory@ DT node names
Date: Fri,  4 Oct 2019 19:37:12 +1000
Message-Id: <20191004093747.31350-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

The device tree build by QEMU at the machine reset time is used by SLOF
to build its internal device tree but the node names are not preserved
exactly so when QEMU provides a device tree update in response to H_CAS,
it might become tricky to match a node from the update blob to
the actual node in SLOF.

This removed leading zeroes from "memory@" nodes and makes
the DTC checker happy.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c69c034183..42a5b8d2fd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -388,7 +388,7 @@ static int spapr_populate_memory_node(void *fdt, int =
nodeid, hwaddr start,
     mem_reg_property[0] =3D cpu_to_be64(start);
     mem_reg_property[1] =3D cpu_to_be64(size);
=20
-    sprintf(mem_name, "memory@" TARGET_FMT_lx, start);
+    sprintf(mem_name, "memory@%" HWADDR_PRIx, start);
     off =3D fdt_add_subnode(fdt, 0, mem_name);
     _FDT(off);
     _FDT((fdt_setprop_string(fdt, off, "device_type", "memory")));
--=20
2.21.0


