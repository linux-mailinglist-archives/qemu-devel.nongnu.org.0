Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07A9B243
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:39:21 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Aim-0004g3-LT
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1AdK-0000Qp-BQ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1AdJ-0001rL-BM
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1AdG-0001pk-PF; Fri, 23 Aug 2019 10:33:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 17CB7307D915;
 Fri, 23 Aug 2019 14:33:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E549B5D9CA;
 Fri, 23 Aug 2019 14:33:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 16:32:47 +0200
Message-Id: <20190823143249.8096-5-philmd@redhat.com>
In-Reply-To: <20190823143249.8096-1-philmd@redhat.com>
References: <20190823143249.8096-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 23 Aug 2019 14:33:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/6] hw/arm/fsl-imx: Add the cpu as child of
 the SoC object
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Child properties form the composition tree. All objects need to be
a child of another object. Objects can only be a child of one object.

Respect this with the i.MX SoC, to get a cleaner composition tree.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: reworded commit description with Markus suggestions
---
 hw/arm/fsl-imx25.c | 4 +++-
 hw/arm/fsl-imx31.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 2b2fdb203a..3cb5a8fdfd 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -36,7 +36,9 @@ static void fsl_imx25_init(Object *obj)
     FslIMX25State *s =3D FSL_IMX25(obj);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), ARM_CPU_TYPE_NAME("arm926=
"));
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            ARM_CPU_TYPE_NAME("arm926"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
                           TYPE_IMX_AVIC);
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 6760de3c8c..55e90d104b 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -33,7 +33,9 @@ static void fsl_imx31_init(Object *obj)
     FslIMX31State *s =3D FSL_IMX31(obj);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), ARM_CPU_TYPE_NAME("arm113=
6"));
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            ARM_CPU_TYPE_NAME("arm1136"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
                           TYPE_IMX_AVIC);
--=20
2.20.1


