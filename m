Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFDE2BF9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:21:14 +0200 (CEST)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYMq-0007My-PB
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKQ-0004b7-8p
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKO-0004yQ-Tl
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59063)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iNYKO-0004rP-Gx; Thu, 24 Oct 2019 04:18:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46zKrX2xX5z9sPc; Thu, 24 Oct 2019 19:18:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571905116;
 bh=5KV84r29nIJXr/A9Jl+oWqntFxHPYStDWAbStjFb6C0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOIo6nL/g0cs7ZmGtQyiVU+Xwptba5ORRELo0HylMxOJfHIlyM0NGu3E/5XmLd9Zs
 B6riZ8E/jZ8RC2HkJPL7s7MrJfWtZ4z+/NdFX3LkBWPAY88qyz2XDxnPfvcy/AVoCk
 8LshCdkzJzY+USm1i9YBjvUJUAz+MLNGx8pXqTc8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/28] xive: Make some device types not user creatable
Date: Thu, 24 Oct 2019 19:17:46 +1100
Message-Id: <20191024081813.2115-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024081813.2115-1-david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Some device types of the XIVE model are exposed to the QEMU command
line:

$ ppc64-softmmu/qemu-system-ppc64 -device help | grep xive
name "xive-end-source", desc "XIVE END Source"
name "xive-source", desc "XIVE Interrupt Source"
name "xive-tctx", desc "XIVE Interrupt Thread Context"

These are internal devices that shouldn't be instantiable by the
user. By the way, they can't be because their respective realize
functions expect link properties that can't be set from the command
line:

qemu-system-ppc64: -device xive-source: required link 'xive' not found:
 Property '.xive' not found
qemu-system-ppc64: -device xive-end-source: required link 'xive' not foun=
d:
 Property '.xive' not found
qemu-system-ppc64: -device xive-tctx: required link 'cpu' not found:
 Property '.cpu' not found

Hide them by setting dc->user_creatable to false in their respective
class init functions.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157017473006.331610.2983143972519884544.stgit@bahia.lan>
Message-Id: <157045578401.865784.6058183726552779559.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
[dwg: Folded comment update into base patch]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 29df06df11..453d389848 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -670,6 +670,11 @@ static void xive_tctx_class_init(ObjectClass *klass,=
 void *data)
     dc->realize =3D xive_tctx_realize;
     dc->unrealize =3D xive_tctx_unrealize;
     dc->vmsd =3D &vmstate_xive_tctx;
+    /*
+     * Reason: part of XIVE interrupt controller, needs to be wired up
+     * by xive_tctx_create().
+     */
+    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo xive_tctx_info =3D {
@@ -1118,6 +1123,11 @@ static void xive_source_class_init(ObjectClass *kl=
ass, void *data)
     dc->props   =3D xive_source_properties;
     dc->realize =3D xive_source_realize;
     dc->vmsd    =3D &vmstate_xive_source;
+    /*
+     * Reason: part of XIVE interrupt controller, needs to be wired up,
+     * e.g. by spapr_xive_instance_init().
+     */
+    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo xive_source_info =3D {
@@ -1853,6 +1863,11 @@ static void xive_end_source_class_init(ObjectClass=
 *klass, void *data)
     dc->desc    =3D "XIVE END Source";
     dc->props   =3D xive_end_source_properties;
     dc->realize =3D xive_end_source_realize;
+    /*
+     * Reason: part of XIVE interrupt controller, needs to be wired up,
+     * e.g. by spapr_xive_instance_init().
+     */
+    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo xive_end_source_info =3D {
--=20
2.21.0


