Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF66FB6A8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6GQ-0007GV-IH; Mon, 08 May 2023 15:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GO-0007G2-JA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:12 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GK-000448-Sn
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573065; i=lukasstraub2@web.de;
 bh=RLJxB0vqXLDgxgpf3+7W0iM4sU9TCrsn1WfbSjL6Mi0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QWZUdqWKtV7i4AMWQJdYHGBjrXgEWiECHS1f8OSxaZY0WFKDgMx7zdH/WBnPUSblq
 bU53pFV+WjJDuVeFbGuCgqBmIy+2/gL9vzdrSxpLuO+0VyF1M5/lTzyBQr/9HnwjSe
 U6U2dutZPEgifVZ5qWWZFPwHMm564+qKp9ybsZiy+5g8ee0pPhks8kuU3iQnBgR28B
 /gqb8gTq88ScYqmGkBU8JbJZTJPLORaWiv2U+O5XRdTpKzIIdkoDONeRiHplXiC905
 MjExn2ck/3kIlrmNcXFX7L9ykAdNhnH3qamcTq0JWW0Nv5XCu7NKOvbG828bP5DoOp
 pfjWuHFfjCJuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQPdl-1pZm1Z3WG9-00MOik; Mon, 08
 May 2023 21:11:04 +0200
Date: Mon, 8 May 2023 21:11:03 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 4/6] multifd: Introduce a overridable revc_pages method
Message-ID: <276b19d89a054aadce0eb69269e114e164a1da9d.1683572883.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683572883.git.lukasstraub2@web.de>
References: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UeWA3fgZuKPZcG=B0RQutvm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:YaOgXu2wN4wgyqsCGz9e4iTpGRW8VX0oW7tmdfsbX67UA2ho9cC
 7rPqRKWedt+Pp4oss4OjsKhVltNfHo2ko9NZZGJ6vORTE9Mxek80hxQIlw0+4g9cEUQYOjc
 hDxTFxFtcCHXfvV9rIKSNGBwLSKNar9vU+Whajh2lTr9aQqZmaEiq7UP9AG33ethOEHYU4H
 /uWHkVmv3i5p5Hxm98+tg==
UI-OutboundReport: notjunk:1;M01:P0:Zt8udie3o9k=;JGCM98op9+j6EnrL3tpRwl42VLN
 r1yHWoqtJgrsfesLiZ5kIfINMp6NR/55x1AkR8JdTSDJuniVi8Z10dPvu/RbFh/8ap2iXuc7Y
 B0TYqGJMhaBzKQqOsswOVZmV2+RiFUBQxgY8KATiRb6r430P4nZFt8D0j6JJPNKlq/vWEP/XB
 /YkIAyZtZu5p1ZV/tI0pjeRtRlRNJpYRKhUU+oF/mYtyqkuf/VV9tk+qyEq4PKZZ9YTIZN77D
 AIbNxVByykq0bRUfymUWHgd9ZLopS+qUGoX7Q/qS/6Eg3SHILa/EjqDajiKBLrTuzpYKjMUKF
 xRtU3SCbVUMz00rP36i0/KvCcD2jcdz68/MjedPpWM73edHrPZcDl+v/cNBObpaO7rHB/3/Oh
 KHXvGcSn3XFfhoZ4zzyWHqpXVsvV3E6sZ3VVraMBc8zkVIMCgzp2lzgZ4yV45tHO/85FDryXF
 3TuKmWHNOqnTlDBbLPJ8c4zijJEQhV31MFlP1HQsd5Sk8z1QdonhnB415EbjxpKv+UIcnRy7G
 us6lzoGf5dpCn5bkmKlZWM0/MHHfbmN+a/VLwx4SsWub6iUIKesjBU4+QW4k1vZUqdlceaEjI
 TE1upyxr1RDXsGhsJdszebgsM2gg0JeNFhkGgCXGeDRFf15S+t2IgfE1G3I7ZJ+QpT/x1ZMUY
 WVxsx23NthAHcewBAMXon4xCLHojuqaDb3lu0eUgpuFLczTC2Q6cW/iGpFojYDj6BG+2UiBu7
 9YQWVxZVCj8ICNxyVcxLIMH77Jxic6AnpwGpQ0PpUUjm8O4ox0kJ5ZYIuCnmEXmG/76mPryNO
 yJB4xQexlogacIKJxf3QWvkCYxr39PbUiSnAS52fdb78KOB/ZHBMbFw2qS8+hop/OhvCH0fBO
 NXiHwpNE4TIMrDutE14LnPeUqPl6VB7zPK28TmbJGOT6wWcj86Xkh7IWonvJU6Wj/hF4QiZTu
 a23SKWQp+RM3ZxP1mOeRUgBN/6U=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/UeWA3fgZuKPZcG=B0RQutvm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This allows to override the behaviour around recv_pages. Think of
it like a "multifd_colo" child class of multifd.

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build        |  1 +
 migration/multifd-colo.c     | 39 +++++++++++++++++++++++++++++
 migration/multifd-internal.h |  5 ++++
 migration/multifd.c          | 48 ++++++++++++++++++++++++++++--------
 4 files changed, 83 insertions(+), 10 deletions(-)
 create mode 100644 migration/multifd-colo.c

diff --git a/migration/meson.build b/migration/meson.build
index da1897fadf..22ab6c6d73 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -23,6 +23,7 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
+  'multifd-colo.c',
   'options.c',
   'postcopy-ram.c',
   'savevm.c',
diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c
new file mode 100644
index 0000000000..c035d15e87
--- /dev/null
+++ b/migration/multifd-colo.c
@@ -0,0 +1,39 @@
+/*
+ * multifd colo implementation
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/target_page.h"
+#include "exec/ramblock.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "ram.h"
+#include "multifd.h"
+#include "io/channel-socket.h"
+
+#define MULTIFD_INTERNAL
+#include "multifd-internal.h"
+
+static int multifd_colo_recv_pages(MultiFDRecvParams *p, Error **errp)
+{
+    return multifd_recv_state->ops->recv_pages(p, errp);
+}
+
+int multifd_colo_load_setup(Error **errp)
+{
+    int ret;
+
+    ret =3D _multifd_load_setup(errp);
+    if (ret) {
+        return ret;
+    }
+
+    multifd_recv_state->recv_pages =3D multifd_colo_recv_pages;
+
+    return 0;
+}
diff --git a/migration/multifd-internal.h b/migration/multifd-internal.h
index 6eeaa028e7..82357f1d88 100644
--- a/migration/multifd-internal.h
+++ b/migration/multifd-internal.h
@@ -29,6 +29,11 @@ struct MultiFDRecvState {
     uint64_t packet_num;
     /* multifd ops */
     MultiFDMethods *ops;
+    /* overridable recv method */
+    int (*recv_pages)(MultiFDRecvParams *p, Error **errp);
 };
=20
 extern struct MultiFDRecvState *multifd_recv_state;
+
+int _multifd_load_setup(Error **errp);
+int multifd_colo_load_setup(Error **errp);
diff --git a/migration/multifd.c b/migration/multifd.c
index f6bad69b6c..fb5e8859de 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1126,7 +1126,7 @@ static void *multifd_recv_thread(void *opaque)
         qemu_mutex_unlock(&p->mutex);
=20
         if (p->normal_num) {
-            ret =3D multifd_recv_state->ops->recv_pages(p, &local_err);
+            ret =3D multifd_recv_state->recv_pages(p, &local_err);
             if (ret !=3D 0) {
                 break;
             }
@@ -1152,20 +1152,12 @@ static void *multifd_recv_thread(void *opaque)
     return NULL;
 }
=20
-int multifd_load_setup(Error **errp)
+int _multifd_load_setup(Error **errp)
 {
     int thread_count;
     uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
=20
-    /*
-     * Return successfully if multiFD recv state is already initialised
-     * or multiFD is not enabled.
-     */
-    if (multifd_recv_state || !migrate_multifd()) {
-        return 0;
-    }
-
     thread_count =3D migrate_multifd_channels();
     multifd_recv_state =3D g_malloc0(sizeof(*multifd_recv_state));
     multifd_recv_state->params =3D g_new0(MultiFDRecvParams, thread_count);
@@ -1204,6 +1196,42 @@ int multifd_load_setup(Error **errp)
     return 0;
 }
=20
+static int multifd_normal_recv_pages(MultiFDRecvParams *p, Error **errp)
+{
+    return multifd_recv_state->ops->recv_pages(p, errp);
+}
+
+static int multifd_normal_load_setup(Error **errp)
+{
+    int ret;
+
+    ret =3D _multifd_load_setup(errp);
+    if (ret) {
+        return ret;
+    }
+
+    multifd_recv_state->recv_pages =3D multifd_normal_recv_pages;
+
+    return 0;
+}
+
+int multifd_load_setup(Error **errp)
+{
+    /*
+     * Return successfully if multiFD recv state is already initialised
+     * or multiFD is not enabled.
+     */
+    if (multifd_recv_state || !migrate_multifd()) {
+        return 0;
+    }
+
+    if (migrate_colo()) {
+        return multifd_colo_load_setup(errp);
+    } else {
+        return multifd_normal_load_setup(errp);
+    }
+}
+
 bool multifd_recv_all_channels_created(void)
 {
     int thread_count =3D migrate_multifd_channels();
--=20
2.39.2


--Sig_/UeWA3fgZuKPZcG=B0RQutvm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZSUcACgkQNasLKJxd
slilxQ//efkShKHosDryk+HwQgdBgyUOhP0XBaYnnWAFuNXUzvMIZph2mCAGe32e
Cu6TaytuzfZSkWrcy2sprl2SjjH3IxkimLlMU0RJYUsMbkjfqK/DTw2worgSCvIq
LPX09N1w/rVTDcA6XVvJ3lFIggbljJkT0NpVRidvhio7j4OsE5WRVPlv/JsI01yi
xPOqSKKZw4OS+G2pgw+v7/Oq/fEu+eQ2iwN+xdyyU9oUgP6x7+mygYbXDru6/Zlo
D1UTFN4DTohdHu45AEBFyphhjQfhXFJ0dQG4gWF5opBHOjcy/eNyeojVbaM0Nvnq
fScKSE8+CCwpFLsrl2wAEW6sfQndWDtJARTTahkjwg38nUeZ0Z6IOYcQ0XfJ4Fss
kX0dKVrUEHVYyhiJW0hRggxLw00a6FBMppotACWOCQJnBc4jZdHXWghzQw/SIWJH
OlUt+/UQLjffqlx2+vNAUMbf0GAcnCCEXccf94fN4ylUfnRhaE2J147UFpRyyckF
RmY3qGPg4Xbj9M90nopWsKwcGtDqnAEsAf/h/5leyRRlW54CIJyw39mIXAZ9+9xJ
Y83HZ/wZJRsqQ9k3fm+JdFh1wiqCZ/zJC/Lul/0Q6+21uXOPIRYuGYJcTF9kIpCO
ZAY6Z9+vcPnTHoBBFpZVKKxmK5yHF3aRHMjzhvJklLrdIZBvEZA=
=k+0A
-----END PGP SIGNATURE-----

--Sig_/UeWA3fgZuKPZcG=B0RQutvm--

