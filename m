Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8069CB7B9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:56:58 +0200 (CEST)
Received: from localhost ([::1]:43944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKKX-0006r3-9P
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2g-0005IW-2C
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2e-0005QF-0Z
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:29 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33753)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2d-00054f-IE; Fri, 04 Oct 2019 05:38:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YH3MkFz9sRV; Fri,  4 Oct 2019 19:37:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181875;
 bh=yKaY1i8StFReKIw88R2mw5v4fvaciPPqgBlWX4sKam8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XSE5WWQNZPUCAAhJdJ/FR0PNHOVObAD7uZsBNR4vXxlZLDhfIl+1ulaKB8assRjfl
 mJeUBBcdreisKVvfKpkZXyQKNoKVVNfvm5vgEkXzp22u6CAStpsYElo2UUDIGsjm73
 6AcxIos653j61GSmVCfGc3roifF99t3Vkxkm16VM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 17/53] spapr: Fixes a leak in CAS
Date: Fri,  4 Oct 2019 19:37:11 +1000
Message-Id: <20191004093747.31350-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

Add a missing g_free(fdt) if the resulting tree is bigger
than the space allocated by SLOF.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 7c3a443776..c69c034183 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1026,6 +1026,7 @@ int spapr_h_cas_compose_response(SpaprMachineState =
*spapr,
     _FDT((fdt_pack(fdt)));
=20
     if (fdt_totalsize(fdt) + sizeof(hdr) > size) {
+        g_free(fdt);
         trace_spapr_cas_failed(size);
         return -1;
     }
--=20
2.21.0


