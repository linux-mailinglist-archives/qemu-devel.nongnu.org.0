Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55E973D3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:49:47 +0200 (CEST)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LNK-000691-EE
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0S-0004ao-1w
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0Q-000861-DB
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:07 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54263)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0O-00080q-Ao; Wed, 21 Aug 2019 03:26:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjB5DLfz9sPw; Wed, 21 Aug 2019 17:25:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372350;
 bh=woew5jedMl67jP/p1INAk3eA67fBKDOdXV2P5VEctgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0bvpi1fxH0WOoFMqvuSAaFOsFh1M1FUiNHrR0JatMb3uOyYRBwlSHlwmTRw8uB1o
 2K/O9U7E9lkwlt8wJ98qoOQ+WNyQWXYNZm2rLpvMzuzOjEWFglX6BnTz5fzPd+T0cd
 ouGBnCxD1H2xuuv0MeF5rCXGQ9mg/8qIWdiDFxxE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:13 +1000
Message-Id: <20190821072542.23090-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 13/42] ppc: fix memory leak in spapr_dt_drc()
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
Cc: lvivier@redhat.com, Shivaprasad G Bhat <sbhat@linux.ibm.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

Leaking the drc_name while preparing the DT properties.
Fixing that.

Also, remove the const qualifier from spapr_drc_name().

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-Id: <156335159028.82682.5404622104535818162.stgit@lep8c.aus.stgla=
bs.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 09255f4951..62f1a42592 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -227,7 +227,7 @@ static uint32_t drc_set_unusable(SpaprDrc *drc)
     return RTAS_OUT_SUCCESS;
 }
=20
-static const char *spapr_drc_name(SpaprDrc *drc)
+static char *spapr_drc_name(SpaprDrc *drc)
 {
     SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
=20
@@ -828,6 +828,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask)
         Object *obj;
         SpaprDrc *drc;
         SpaprDrcClass *drck;
+        char *drc_name =3D NULL;
         uint32_t drc_index, drc_power_domain;
=20
         if (!strstart(prop->type, "link<", NULL)) {
@@ -857,8 +858,10 @@ int spapr_dt_drc(void *fdt, int offset, Object *owne=
r, uint32_t drc_type_mask)
         g_array_append_val(drc_power_domains, drc_power_domain);
=20
         /* ibm,drc-names */
-        drc_names =3D g_string_append(drc_names, spapr_drc_name(drc));
+        drc_name =3D spapr_drc_name(drc);
+        drc_names =3D g_string_append(drc_names, drc_name);
         drc_names =3D g_string_insert_len(drc_names, -1, "\0", 1);
+        g_free(drc_name);
=20
         /* ibm,drc-types */
         drc_types =3D g_string_append(drc_types, drck->typename);
--=20
2.21.0


