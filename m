Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF64127BFA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 14:51:18 +0100 (CET)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIgX-0008GB-5k
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 08:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIc8-0002oI-F3
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:46:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIc7-0005hp-2d
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:46:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24334
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIc6-0005dk-Sh
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRFY1VkkPB2r+9GUFBRiM+ygTc7inJj6x2CysBHWHLw=;
 b=dtdnZgjPK07lym2trUFBEYUwSWMwyJux3SYJsmOpkO4F4T2EgfJYAxuNDJGPc0Ppnnl8sF
 45qgxDwegPrxtdr1evVAiHIeYB/nC9AQ5NlZai523YWb1ypcNpcemuOClToywI9YmjEBGt
 igQ87x5Q5sUI7SYlNNTGSkn0yzYTKMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-Uay24QYPMzibKBKl2JUmHw-1; Fri, 20 Dec 2019 08:46:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9AF109D368;
 Fri, 20 Dec 2019 13:46:38 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A80926FB3;
 Fri, 20 Dec 2019 13:46:36 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/37] chardev: generate an internal id when none given
Date: Fri, 20 Dec 2019 17:45:28 +0400
Message-Id: <20191220134601.571905-5-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Uay24QYPMzibKBKl2JUmHw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Internally, qemu may create chardev without ID. Those will not be
looked up with qemu_chr_find(), which prevents using qdev_prop_set_chr().

Use id_generate(), to generate an internal name (prefixed with #), so
no conflict exist with user-named chardev.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 chardev/char.c    | 32 ++++++++++++++++++++++++--------
 include/qemu/id.h |  1 +
 util/id.c         |  1 +
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 7b6b2cb123..e7e7492b0e 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -37,6 +37,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/id.h"
=20
 #include "chardev/char-mux.h"
=20
@@ -944,10 +945,10 @@ void qemu_chr_set_feature(Chardev *chr,
     return set_bit(feature, chr->features);
 }
=20
-Chardev *qemu_chardev_new(const char *id, const char *typename,
-                          ChardevBackend *backend,
-                          GMainContext *gcontext,
-                          Error **errp)
+static Chardev *chardev_new(const char *id, const char *typename,
+                            ChardevBackend *backend,
+                            GMainContext *gcontext,
+                            Error **errp)
 {
     Object *obj;
     Chardev *chr =3D NULL;
@@ -991,6 +992,21 @@ end:
     return chr;
 }
=20
+Chardev *qemu_chardev_new(const char *id, const char *typename,
+                          ChardevBackend *backend,
+                          GMainContext *gcontext,
+                          Error **errp)
+{
+    g_autofree char *genid =3D NULL;
+
+    if (!id) {
+        genid =3D id_generate(ID_CHR);
+        id =3D genid;
+    }
+
+    return chardev_new(id, typename, backend, gcontext, errp);
+}
+
 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
                                Error **errp)
 {
@@ -1003,8 +1019,8 @@ ChardevReturn *qmp_chardev_add(const char *id, Charde=
vBackend *backend,
         return NULL;
     }
=20
-    chr =3D qemu_chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                           backend, NULL, errp);
+    chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
+                      backend, NULL, errp);
     if (!chr) {
         return NULL;
     }
@@ -1061,8 +1077,8 @@ ChardevReturn *qmp_chardev_change(const char *id, Cha=
rdevBackend *backend,
         return NULL;
     }
=20
-    chr_new =3D qemu_chardev_new(NULL, object_class_get_name(OBJECT_CLASS(=
cc)),
-                               backend, chr->gcontext, errp);
+    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
+                          backend, chr->gcontext, errp);
     if (!chr_new) {
         return NULL;
     }
diff --git a/include/qemu/id.h b/include/qemu/id.h
index 40c70103e4..b55c406e69 100644
--- a/include/qemu/id.h
+++ b/include/qemu/id.h
@@ -4,6 +4,7 @@
 typedef enum IdSubSystems {
     ID_QDEV,
     ID_BLOCK,
+    ID_CHR,
     ID_MAX      /* last element, used as array size */
 } IdSubSystems;
=20
diff --git a/util/id.c b/util/id.c
index af1c5f1b81..5addb4460e 100644
--- a/util/id.c
+++ b/util/id.c
@@ -34,6 +34,7 @@ bool id_wellformed(const char *id)
 static const char *const id_subsys_str[ID_MAX] =3D {
     [ID_QDEV]  =3D "qdev",
     [ID_BLOCK] =3D "block",
+    [ID_CHR] =3D "chr",
 };
=20
 /*
--=20
2.24.0.308.g228f53135a


