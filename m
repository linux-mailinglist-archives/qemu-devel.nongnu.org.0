Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884671CD08
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 18:33:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQaMP-0002KD-OI
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 12:33:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hQaHg-0007Dd-R7
	for qemu-devel@nongnu.org; Tue, 14 May 2019 12:28:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hQaHf-0006ko-CK
	for qemu-devel@nongnu.org; Tue, 14 May 2019 12:28:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hQaHe-0006hM-PC
	for qemu-devel@nongnu.org; Tue, 14 May 2019 12:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 431D65945C;
	Tue, 14 May 2019 16:28:04 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5BC3BA54;
	Tue, 14 May 2019 16:28:00 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 18:27:43 +0200
Message-Id: <20190514162744.30398-4-lvivier@redhat.com>
In-Reply-To: <20190514162744.30398-1-lvivier@redhat.com>
References: <20190514162744.30398-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 14 May 2019 16:28:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 3/4] virtio-rng: Keep the default backend
 out of VirtIORNGConf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Kashyap Chamarthy <kchamart@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>, Amit Shah <amit@kernel.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

The default backend is only used within virtio_rng_device_realize().
Replace VirtIORNGConf member default_backend by a local variable.
Adjust its type to reduce conversions.

While there, pass &error_abort instead of NULL when failure would be a
programming error.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/virtio/virtio-rng.c         | 20 +++++++++-----------
 include/hw/virtio/virtio-rng.h |  2 --
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 30493a258622..73ffb476e030 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -16,6 +16,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-rng.h"
 #include "sysemu/rng.h"
+#include "sysemu/rng-random.h"
 #include "qom/object_interfaces.h"
 #include "trace.h"
=20
@@ -189,27 +190,24 @@ static void virtio_rng_device_realize(DeviceState *=
dev, Error **errp)
     }
=20
     if (vrng->conf.rng =3D=3D NULL) {
-        vrng->conf.default_backend =3D RNG_RANDOM(object_new(TYPE_RNG_RA=
NDOM));
+        Object *default_backend =3D object_new(TYPE_RNG_RANDOM);
=20
-        user_creatable_complete(USER_CREATABLE(vrng->conf.default_backen=
d),
+        user_creatable_complete(USER_CREATABLE(default_backend),
                                 &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
-            object_unref(OBJECT(vrng->conf.default_backend));
+            object_unref(default_backend);
             return;
         }
=20
-        object_property_add_child(OBJECT(dev),
-                                  "default-backend",
-                                  OBJECT(vrng->conf.default_backend),
-                                  NULL);
+        object_property_add_child(OBJECT(dev), "default-backend",
+                                  default_backend, &error_abort);
=20
         /* The child property took a reference, we can safely drop ours =
now */
-        object_unref(OBJECT(vrng->conf.default_backend));
+        object_unref(default_backend);
=20
-        object_property_set_link(OBJECT(dev),
-                                 OBJECT(vrng->conf.default_backend),
-                                 "rng", NULL);
+        object_property_set_link(OBJECT(dev), default_backend,
+                                 "rng", &error_abort);
     }
=20
     vrng->rng =3D vrng->conf.rng;
diff --git a/include/hw/virtio/virtio-rng.h b/include/hw/virtio/virtio-rn=
g.h
index 922dce7caccf..28ff752c4096 100644
--- a/include/hw/virtio/virtio-rng.h
+++ b/include/hw/virtio/virtio-rng.h
@@ -13,7 +13,6 @@
 #define QEMU_VIRTIO_RNG_H
=20
 #include "sysemu/rng.h"
-#include "sysemu/rng-random.h"
 #include "standard-headers/linux/virtio_rng.h"
=20
 #define TYPE_VIRTIO_RNG "virtio-rng-device"
@@ -26,7 +25,6 @@ struct VirtIORNGConf {
     RngBackend *rng;
     uint64_t max_bytes;
     uint32_t period_ms;
-    RngRandom *default_backend;
 };
=20
 typedef struct VirtIORNG {
--=20
2.20.1


