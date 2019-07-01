Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A912DFE7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 16:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVzge-00056s-3x
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 10:36:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hVzcK-0002e0-FC
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hVzcJ-0004ed-Bt
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:31:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hVzcI-0004J5-Uy
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:31:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95E023179B5E;
	Wed, 29 May 2019 14:31:25 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-181.brq.redhat.com
	[10.40.204.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2797B611AD;
	Wed, 29 May 2019 14:31:22 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 16:31:04 +0200
Message-Id: <20190529143106.11789-3-lvivier@redhat.com>
In-Reply-To: <20190529143106.11789-1-lvivier@redhat.com>
References: <20190529143106.11789-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 29 May 2019 14:31:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 2/4] rng-builtin: add an RNG backend that
 uses qemu_guest_getrandom()
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
	Kashyap Chamarthy <kchamart@redhat.com>, Amit Shah <amit@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new RNG backend using QEMU builtin getrandom function.

It can be created and used with something like:

    ... -object rng-builtin,id=3Drng0 -device virtio-rng,rng=3Drng0 ...

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 backends/Makefile.objs |  2 +-
 backends/rng-builtin.c | 78 ++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx        |  7 ++++
 3 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 backends/rng-builtin.c

diff --git a/backends/Makefile.objs b/backends/Makefile.objs
index 981e8e122f2c..f0691116e86e 100644
--- a/backends/Makefile.objs
+++ b/backends/Makefile.objs
@@ -1,4 +1,4 @@
-common-obj-y +=3D rng.o rng-egd.o
+common-obj-y +=3D rng.o rng-egd.o rng-builtin.o
 common-obj-$(CONFIG_POSIX) +=3D rng-random.o
=20
 common-obj-$(CONFIG_TPM) +=3D tpm.o
diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
new file mode 100644
index 000000000000..3381d47174df
--- /dev/null
+++ b/backends/rng-builtin.c
@@ -0,0 +1,78 @@
+/*
+ * QEMU Builtin Random Number Generator Backend
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/rng.h"
+#include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
+
+#define TYPE_RNG_BUILTIN "rng-builtin"
+#define RNG_BUILTIN(obj) OBJECT_CHECK(RngBuiltin, (obj), TYPE_RNG_BUILTI=
N)
+
+typedef struct RngBuiltin {
+    RngBackend parent;
+    QEMUBH *bh;
+} RngBuiltin;
+
+static void rng_builtin_receive_entropy_bh(void *opaque)
+{
+    RngBuiltin *s =3D opaque;
+
+    while (!QSIMPLEQ_EMPTY(&s->parent.requests)) {
+        RngRequest *req =3D QSIMPLEQ_FIRST(&s->parent.requests);
+
+        qemu_guest_getrandom_nofail(req->data, req->size);
+
+        req->receive_entropy(req->opaque, req->data, req->size);
+
+        rng_backend_finalize_request(&s->parent, req);
+    }
+}
+
+static void rng_builtin_request_entropy(RngBackend *b, RngRequest *req)
+{
+    RngBuiltin *s =3D RNG_BUILTIN(b);
+
+    qemu_bh_schedule(s->bh);
+}
+
+static void rng_builtin_init(Object *obj)
+{
+    RngBuiltin *s =3D RNG_BUILTIN(obj);
+
+    s->bh =3D qemu_bh_new(rng_builtin_receive_entropy_bh, s);
+}
+
+static void rng_builtin_finalize(Object *obj)
+{
+    RngBuiltin *s =3D RNG_BUILTIN(obj);
+
+    qemu_bh_delete(s->bh);
+}
+
+static void rng_builtin_class_init(ObjectClass *klass, void *data)
+{
+    RngBackendClass *rbc =3D RNG_BACKEND_CLASS(klass);
+
+    rbc->request_entropy =3D rng_builtin_request_entropy;
+}
+
+static const TypeInfo rng_builtin_info =3D {
+    .name =3D TYPE_RNG_BUILTIN,
+    .parent =3D TYPE_RNG_BACKEND,
+    .instance_size =3D sizeof(RngBuiltin),
+    .instance_init =3D rng_builtin_init,
+    .instance_finalize =3D rng_builtin_finalize,
+    .class_init =3D rng_builtin_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&rng_builtin_info);
+}
+
+type_init(register_types);
diff --git a/qemu-options.hx b/qemu-options.hx
index f6e9bd1d9c42..4e6a6828d7ce 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4322,6 +4322,13 @@ other options.
=20
 The @option{share} boolean option is @var{on} by default with memfd.
=20
+@item -object rng-builtin,id=3D@var{id}
+
+Creates a random number generator backend which obtains entropy from
+QEMU builtin functions. The @option{id} parameter is a unique ID that
+will be used to reference this entropy backend from the @option{virtio-r=
ng}
+device.
+
 @item -object rng-random,id=3D@var{id},filename=3D@var{/dev/random}
=20
 Creates a random number generator backend which obtains entropy from
--=20
2.20.1


