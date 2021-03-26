Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16034A2B5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:50:37 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhEq-0003v3-3A
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDF-0002cR-1Z
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:48:57 -0400
Received: from mout.web.de ([212.227.15.3]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhD8-0002WP-Rj
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616744926;
 bh=dn5JnxLD03A1MjGbpLQHn5ts0L4MXedl8j8wX6j74LA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=AGtjUAfX/PGKmfY/Kyrmi409LKaHufQUUvcdP9iRm6SGqNEluhL8/4HTtFKHiPu3l
 kCju/nHdHQc7PJMEEYneefMFUXfvAs0lqESNg80Wd/4O5hma5fyM7A/LxMUduO5fMn
 D1vh8qPWuK9FnIJlttWcTHB8/cuPSzNQ4x7biSmE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MeUbo-1lxeyv41hs-00aXha; Fri, 26
 Mar 2021 08:48:46 +0100
Date: Fri, 26 Mar 2021 08:48:44 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 1/4] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <e9f19008fa7f4e2cd15a03d08a8efab3a12754bf.1616744509.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616744509.git.lukasstraub2@web.de>
References: <cover.1616744509.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WJKqvMtKKuUFIjgy.xfvcxc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:AU2Rgykes3wSvIiBmIVH62grL5Wq+sRy75PwqFtai42H82ywmzA
 IMVhHsWvGJD2jj7eo/IQo/9GA7wIxfsWjIztVD0zhblOeA+qs47iLeL18Qc/nSNYUlBpCX3
 +PPb5JfxsxFsp/qn7E66WG7z3Eq51nhH8unbS6klH/sSBi+ycKGhbAkGF8U4kEjBcCU0pbl
 NaPOPIJRKEotvd5EMj2Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SkUsXfJL4k0=:YHzGQgB0dlUDlHQDn1kZCn
 ZRtsRr46QCHXq6VmGYapiMC5XwRd7ZArLYdiC2/pnaS6+dywRtA3mww7MWdnWYAzW3za6Io1z
 KI+yNzdB4w3ALMSJiBgb0Z3X5tPVHNMjHwkIbiCxfOy5KFbcK6ucWdOz00M5EuUxesINZvJzu
 CSevNahWJd6grlWa3R36Mih3okPXQpjuSePdPCcz3BNkDMYf39t2An/uHt0dmpGa4sGwuUs0r
 u6fGyR6YYD/MnpD50683TnTA0ZhfNma69Tsi+pi2+ekNgCN1qCSW8un04S8m/KYcEMDP58o/I
 341dOoyeYd1N1IlvLWp30voeyCehZMgQCQdByq/DY93KBW3QiB/HPhk0I1vAa4ySedbvT7CW5
 ScgNx7kTj+kb7y6lY7U4eIr/cUQO4r5NndGRCfCWuoAYgvDx0a28WpNKPvwwiu/Neftlharbu
 +YR/yFyZSNs02vEuHtOEHd2rgj/FuxIzYj5t6d56O/z5CIyJrOslwwT1UDUgdhaPcmSsIHFqg
 0uiQ/5zfdkdscmwXgYOoUjjGght5BJ3KCYsgMfQ8jyklWvqQhZoIw0adRYQhLpWeF0IaTrVqM
 FMXotRHNkmjihRYvzS+QHPp57FfRgBenBtWOkHOzikAGQBzc5hTOrPREGpW7i+IQF2588R7rZ
 6ZKlXF+PeXWrbFJZdUzkCmUvqQMFoG2Jaolz5mK8KYQHlGYXtuzOc3RRGwhe0dJEYJ4ebiyOr
 youWNY4mKkWn1hTLUz/TQqazCOJ3h7GXOfDkJvJkfKnKOYATSgxpObW6+qR9PsCFan0ndA66X
 9ZcZClFQGZcPg9tfFkecodN2xKKWwIfAJw62JID2o8uByM2xOBf7UF2xsSfA2p71pVfws0b8D
 Y6Ef543vQr9x/qwJFgO+4W9w5WUl2aFRJsJfa1cj+gHitCUHG2b19d5vPAlvb3nUzyFyXXGER
 1NjWVKDlSVFYC85KROTgpUiGYbrE6v+cTI0XoceZQuktQSwFzBNXZS9YVtI7Xr58IHaldwbRy
 XTpGXTTZwwkxM5zpp3why/ao4LAdUnuCXCGlpxfXlKVlOD0UrBQuUye/3d1O+UVEYkFegXGLG
 eQzGj4aCjU6Ksh3AMSGOB85tPLyq7jjR7b71FAgBDxxJqGkIxHwIfOkIhx0KqBTUlJ78ohDlL
 Kr13g+jvUTYxMN3qAxJvPNEat8PsH3oE8KwzIgmWnz7lfd7lqh3BfcvDr9/ldKVgX2OB4=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/WJKqvMtKKuUFIjgy.xfvcxc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Move object_property_try_add_child out of chardev_new into it's
callers. This is a preparation for the next patches to fix yank
with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 140d6d9d36..48f321b3e1 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -975,7 +975,9 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     qemu_char_open(chr, backend, &be_opened, &local_err);
     if (local_err) {
-        goto end;
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
     }

     if (!chr->filename) {
@@ -985,22 +987,6 @@ static Chardev *chardev_new(const char *id, const char=
 *typename,
         qemu_chr_be_event(chr, CHR_EVENT_OPENED);
     }

-    if (id) {
-        object_property_try_add_child(get_chardevs_root(), id, obj,
-                                      &local_err);
-        if (local_err) {
-            goto end;
-        }
-        object_unref(obj);
-    }
-
-end:
-    if (local_err) {
-        error_propagate(errp, local_err);
-        object_unref(obj);
-        return NULL;
-    }
-
     return chr;
 }

@@ -1009,6 +995,7 @@ Chardev *qemu_chardev_new(const char *id, const char *=
typename,
                           GMainContext *gcontext,
                           Error **errp)
 {
+    Chardev *chr;
     g_autofree char *genid =3D NULL;

     if (!id) {
@@ -1016,7 +1003,19 @@ Chardev *qemu_chardev_new(const char *id, const char=
 *typename,
         id =3D genid;
     }

-    return chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    if (!chr) {
+        return NULL;
+    }
+
+    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr=
),
+                                       errp)) {
+        object_unref(OBJECT(chr));
+        return NULL;
+    }
+    object_unref(OBJECT(chr));
+
+    return chr;
 }

 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
@@ -1037,6 +1036,13 @@ ChardevReturn *qmp_chardev_add(const char *id, Chard=
evBackend *backend,
         return NULL;
     }

+    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr=
),
+                                       errp)) {
+        object_unref(OBJECT(chr));
+        return NULL;
+    }
+    object_unref(OBJECT(chr));
+
     ret =3D g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr)) {
         ret->pty =3D g_strdup(chr->filename + 4);
--
2.30.2


--Sig_/WJKqvMtKKuUFIjgy.xfvcxc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdkdwACgkQNasLKJxd
slgybxAAoJNgJmM0TQjJsq/qWPEYXrmfo8/sPWYtn1mgM3Pr0UIqakhrMzlMZ2I+
TcFW0KdUNnLbdyqL8SnAPinyKBabu6ZSSr5A+vYhmUu41GX9l0mshAc2drWWGudj
HMCRCjL6CGL1Pbe5+AyUrhE+mHj+6VM+zHlXfJTSySCfeJsxWg6yvX5KwUHvCq8B
V9zHvsqX216WWT/uCKwCDGkLUYJGTxyn9bmd8MkuxRqmR+DkHFlCR0upLaoRWngZ
PjJrY6p37jsNacXJXUHgjCyQmmT/OtUzkhkJPzHJ7A16pInpI8leK9Sopc13XRVf
sU+ruI0C8Z66+HLoWTHnt6anKl8aMZZjBSU1CjZkQ/89p7T94VW3r2ydzXJs6pM8
WxlJc4Va3lw82NIXATrXDlu0ABcEMU7DewGkGbiF0tUTeqezB+vXSOdBxSzXqNOj
wfCrTO8jMDG9DJIO4FqScLgLKk4UKQ3DFXAgRdyetkaPVMOsDtSHbDiUgYCWkXo7
5GkHvzNlK5lYIYSDJzgaq/iZ7e1s8+7Cp7/58WORytYf+kEbN6hZ/q9J0e8tlySK
/52VQCVGTnBQtPPBsrkAzdMUPnUG2FkSRKA12N3NcX9aTMa+BNlgMJ+uMylnKvR7
NMYYzX8Xc0AJVi9WWEHUXxaleLmde06liWAKMtwrTX9fTQp3hKk=
=VW/2
-----END PGP SIGNATURE-----

--Sig_/WJKqvMtKKuUFIjgy.xfvcxc--

