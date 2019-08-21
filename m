Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C32973C1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:43:44 +0200 (CEST)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LHT-00088H-08
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0R-0004Zw-NP
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0Q-00085q-DJ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:07 -0400
Received: from ozlabs.org ([203.11.71.1]:38709)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0O-00080z-4o; Wed, 21 Aug 2019 03:26:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjC0XKZz9sPX; Wed, 21 Aug 2019 17:25:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372351;
 bh=Earpzbotodmq+6AVBesUPaAt9w4yNd1a53n3eu+jomQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=plNQQtbs17e80F8ssoB9Qzr8Qg/OUJHBSA6yQXrgzetQRV7+Og8UfBy5exddsJ80S
 6IXct0XwJa3QUyYKyPxvJ4IRTsU8UFRbzEC9tGgN5CyqrcHD7qmTscTR3bSlPI5AFJ
 fEwtgFqLkJZawUnE1RQroasNrAdWnI8zH/5Sszbk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:12 +1000
Message-Id: <20190821072542.23090-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 12/42] ppc: fix memory leak in
 spapr_caps_add_properties
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

Free the capability name string after setting
the capability.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-Id: <156335156198.82682.8756968724044750843.stgit@lep8c.aus.stgla=
bs.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_caps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index a61bf329bf..481dfd2a27 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -793,7 +793,7 @@ void spapr_caps_add_properties(SpaprMachineClass *smc=
, Error **errp)
=20
     for (i =3D 0; i < ARRAY_SIZE(capability_table); i++) {
         SpaprCapabilityInfo *cap =3D &capability_table[i];
-        const char *name =3D g_strdup_printf("cap-%s", cap->name);
+        char *name =3D g_strdup_printf("cap-%s", cap->name);
         char *desc;
=20
         object_class_property_add(klass, name, cap->type,
@@ -801,11 +801,13 @@ void spapr_caps_add_properties(SpaprMachineClass *s=
mc, Error **errp)
                                   NULL, cap, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
+            g_free(name);
             return;
         }
=20
         desc =3D g_strdup_printf("%s", cap->description);
         object_class_property_set_description(klass, name, desc, &local_=
err);
+        g_free(name);
         g_free(desc);
         if (local_err) {
             error_propagate(errp, local_err);
--=20
2.21.0


