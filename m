Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D823634B181
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:46:42 +0100 (CET)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPuHx-0006ZJ-Rl
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFi-0005EA-UH
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:22 -0400
Received: from mout.web.de ([217.72.192.78]:53057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFg-0003HV-W5
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616795056;
 bh=2jOYsuPsIukmBHFjsoLqXzpRRhJipIA8qem4dKpPm/8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=E8nylxvXc/WC81Ly9shVUeIM9YRM4yIEzLj6Rv/wTMZrY5QyQZnlCnOuRZPN//OhY
 LQmRZDQnHLe//C6m3Glsea1rLDAvpeYR4BW9R2lYobyGvVfTPlWLZHAeqWW9zCwTR2
 hbCWlKdnQWgkhN43s9FW2e/8wIulod5QJyiyO4M4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEEa4-1lS8EK109I-00FRnG; Fri, 26
 Mar 2021 22:44:16 +0100
Date: Fri, 26 Mar 2021 22:44:14 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 3/4] chardev: Fix yank with the chardev-change case
Message-ID: <9637888d7591d2971975188478bb707299a1dc04.1616794852.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616794852.git.lukasstraub2@web.de>
References: <cover.1616794852.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4W4O0aF7NWQ+qH1m6bYJKAe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:6RQsfqgtWWueOcpOcYelLOtrnBJWd97yWIUnOQnAeotbkW09MVc
 YqcW62MgXzp8wMZg1nVsiV8xvpuBeTeClDU5erj8IyVVoyKxL8T2ZAIU9VJtvxk1SJmSVZW
 sRTJttUq4ZlZOH31rFnLzF24behpcJYteJkxq5TjBHlYb6oPzYvZQwggS5w5S/S5NU8uARZ
 M3jEtEI6gnmwxutJSxCgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zCfrauL0fT4=:3wBZm3HHEMThrdTIksEfsi
 Kt9M43gU/Sej4mMEsL/gqUMUyq9F3HjcOin2ttjkfAS0LpDthuR0Neh+10TYmI6aj0oLz2tLM
 6/M50BpobmANMgPz5BVhnZMgHRi9KIaPl3wWnETtX4uDpNQHNUuJgxjj7O+cME+HaJxO4kIMt
 v+T6e0wNTTF8cKOmUylTIJ6wJPoU2FBrF8WoLVjZEoihQqoeFFLCrEHzdf6QJZQHSSI63dzfz
 rKN+37/rpoCTyw8QgOkBmD7m88mvfcMxVqrhPOtk+VZPCg1GWMn68Fmtu9bSfnnVEZWwPIf1a
 ZaZASCFJy9Dk9YQdoyMZLpIz7hzc/5A1Nh1NyoMEC8OYN47oOQgXKBnqMPdoSLs+p212udigr
 uu0r5GF9xUtUhSMx+Dc2l/51bFhJhuRgDh/uGk8mNzHhLKFHHVU0ujkKGYF+adVUGXX6Tiam9
 Y38UpdoZlJKyeeU+65XOVlIQF57vTTOwjVJ8O3IF/jUYZAL8tj24y8PZbXnml8IhrfnOmQjy+
 1WjJDwJSIt/HcZMR737jPBTxR+zG7gI5gpYCz5EKs1uiiRgWN1/Dj8YuaLfRPswouY6NLflfX
 OCBfrGVD+jZMiZjh27TmCzaGCB1QO70E/G5S4JVmhoWSzXJJ7S3OOq7Fx61Gmv96vxziTHvM4
 9pY86i4G5mYCDCiY7DvAeF43j1k55Uqt9IaDwz5cbaPBy23zB+ht8Lu0b7Fx9MS0952Z22vCn
 e+XPheU6KskU8LMzhfPJKM5whx3sMWg4XBV8u7uKGac+i4qsU8fizKoK0FmuumjnnwaN3RSw9
 KoS3y6R3mawFUqmRsK5s3HpUUfuU5gf9Mk4abDB4Ik/d7H0ZuwW8J/ngtAzVBx8JOcE3ABYJ6
 zZtKXmsucC1+ehyp/cURvBQfPKT+ree/4h5AMyPSzU/x/bqhHIiWWKgNdYywtykGAm0HdD5Wx
 6k3IdxXrAgts/E672NH0ETAjPAKyhrtO02BH9W8HujtP757Qh4l0SGyue/qxbGnK4DmirjkfX
 rFvKl0lhzCm6qIP9OtopOUmv4Pgm8x+IR1wtdkeyLrJ/rLYLgSu0QCecisVuojhxw0nCuNJ+F
 6C3YWBAYqR6mFcs+v1/DTv0hQc0qTfxy/0+4HveWBP9oFoSfklSF4kS0zJUwDjA13NJ8bPldo
 ya/lh+uHJhAU4SCQ7cZb9ozjG/oShtp7hn2461TA+kf2CGdorJ1y3LwktMthHKFWAIuY0=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
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

--Sig_/4W4O0aF7NWQ+qH1m6bYJKAe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When changing from chardev-socket (which supports yank) to
chardev-socket again, it fails, because the new chardev attempts
to register a new yank instance. This in turn fails, as there
still is the yank instance from the current chardev. Also,
the old chardev shouldn't unregister the yank instance when it
is freed.

To fix this, now the new chardev only registers a yank instance if
the current chardev doesn't support yank and thus hasn't registered
one already. Also, when the old chardev is freed, it now only
unregisters the yank instance if the new chardev doesn't need it.

If the initialization of the new chardev fails, it still has
chr->handover_yank_instance set and won't unregister the yank
instance when it is freed.

s->registered_yank is always true here, as chardev-change only works
on user-visible chardevs and those are guraranteed to register a
yank instance as they are initialized via
chardev_new()
 qemu_char_open()
  cc->open() (qmp_chardev_open_socket()).

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char-socket.c  | 20 +++++++++++++++++---
 chardev/char.c         | 35 ++++++++++++++++++++++++++++-------
 include/chardev/char.h |  3 +++
 3 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 1d455ecca4..daa89fe5d1 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1126,7 +1126,13 @@ static void char_socket_finalize(Object *obj)
     }
     g_free(s->tls_authz);
     if (s->registered_yank) {
-        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        /*
+         * In the chardev-change special-case, we shouldn't unregister the=
 yank
+         * instance, as it still may be needed.
+         */
+        if (!chr->handover_yank_instance) {
+            yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        }
     }

     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
@@ -1424,8 +1430,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }

-    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
-        return;
+    /*
+     * In the chardev-change special-case, we shouldn't register a new yank
+     * instance, as there already may be one.
+     */
+    if (!chr->handover_yank_instance) {
+        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), err=
p)) {
+            return;
+        }
     }
     s->registered_yank =3D true;

@@ -1567,6 +1579,8 @@ static void char_socket_class_init(ObjectClass *oc, v=
oid *data)
 {
     ChardevClass *cc =3D CHARDEV_CLASS(oc);

+    cc->supports_yank =3D true;
+
     cc->parse =3D qemu_chr_parse_socket;
     cc->open =3D qmp_chardev_open_socket;
     cc->chr_wait_connected =3D tcp_chr_wait_connected;
diff --git a/chardev/char.c b/chardev/char.c
index 75993f903f..398f09df19 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -39,6 +39,7 @@
 #include "qemu/option.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
+#include "qemu/yank.h"

 #include "chardev-internal.h"

@@ -266,6 +267,7 @@ static void char_init(Object *obj)
 {
     Chardev *chr =3D CHARDEV(obj);

+    chr->handover_yank_instance =3D false;
     chr->logfd =3D -1;
     qemu_mutex_init(&chr->chr_write_lock);

@@ -959,6 +961,7 @@ void qemu_chr_set_feature(Chardev *chr,
 static Chardev *chardev_new(const char *id, const char *typename,
                             ChardevBackend *backend,
                             GMainContext *gcontext,
+                            bool handover_yank_instance,
                             Error **errp)
 {
     Object *obj;
@@ -971,6 +974,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
+    chr->handover_yank_instance =3D handover_yank_instance;
     chr->label =3D g_strdup(id);
     chr->gcontext =3D gcontext;

@@ -1004,7 +1008,7 @@ Chardev *qemu_chardev_new(const char *id, const char =
*typename,
         id =3D genid;
     }

-    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1032,7 +1036,7 @@ ChardevReturn *qmp_chardev_add(const char *id, Charde=
vBackend *backend,
     }

     chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, errp);
+                      backend, NULL, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1057,9 +1061,10 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
ardevBackend *backend,
                                   Error **errp)
 {
     CharBackend *be;
-    const ChardevClass *cc;
+    const ChardevClass *cc, *cc_new;
     Chardev *chr, *chr_new;
     bool closed_sent =3D false;
+    bool handover_yank_instance;
     ChardevReturn *ret;

     chr =3D qemu_chr_find(id);
@@ -1091,13 +1096,20 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
         return NULL;
     }

-    cc =3D char_get_class(ChardevBackendKind_str(backend->type), errp);
-    if (!cc) {
+    cc =3D CHARDEV_GET_CLASS(chr);
+    cc_new =3D char_get_class(ChardevBackendKind_str(backend->type), errp);
+    if (!cc_new) {
         return NULL;
     }

-    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                          backend, chr->gcontext, errp);
+    /*
+     * The new chardev should not register a yank instance if the current
+     * chardev has registered one already.
+     */
+    handover_yank_instance =3D cc->supports_yank && cc_new->supports_yank;
+
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_new)=
),
+                          backend, chr->gcontext, handover_yank_instance, =
errp);
     if (!chr_new) {
         return NULL;
     }
@@ -1121,6 +1133,15 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
ardevBackend *backend,
         return NULL;
     }

+    /* change successfull, clean up */
+    chr_new->handover_yank_instance =3D false;
+
+    /*
+     * When the old chardev is freed, it should not unregister the yank
+     * instance if the new chardev needs it.
+     */
+    chr->handover_yank_instance =3D handover_yank_instance;
+
     object_unparent(OBJECT(chr));
     object_property_add_child(get_chardevs_root(), chr_new->label,
                               OBJECT(chr_new));
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 4181a2784a..7c0444f90d 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -65,6 +65,8 @@ struct Chardev {
     char *filename;
     int logfd;
     int be_open;
+    /* used to coordinate the chardev-change special-case: */
+    bool handover_yank_instance;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -251,6 +253,7 @@ struct ChardevClass {
     ObjectClass parent_class;

     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
+    bool supports_yank;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);

     void (*open)(Chardev *chr, ChardevBackend *backend,
--
2.30.2


--Sig_/4W4O0aF7NWQ+qH1m6bYJKAe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeVa4ACgkQNasLKJxd
sljZSg/9EA0vVTOXJaN3W4WYMwfFvyxVCk0qquVvifhDQRPdVy3900wHWLTSqaFO
w6Av1yPxUgv9GQO7kua0wSVmdCoT/Akl4AmVBVEbQKibJm0pvtEXSbH54pVhWa9X
RO2GArmbS3bywwFn7NbPU7PXDxToR1r7f/xcC7NsTAyIYeuEEYwSXzF+5n83AH0/
K6RWvkD9jCbaYXZxDHHHF6zWyq7w/9jY9aJ/efzeE7UQ3WRpCuCMOZzuloTv9F6y
i5u1Jj6qEZ7MFSkVPLwBOHGfGewcHkhKYfcbmllLu8+wPKV/CjCLwTRLIFEFLFJk
IsqPQpRdNOqRcMdNdulnES08CigkA28YrQDJ9HWQR/Y7C/svs8z595GK+Ma4LtQ1
N2pMlbh0jWy4XPcFdTJHzw0lrQqlDFoCHeF4gIKHZ8Oj3FjgUQR4Cw+Gs7Us4Ik5
irOqz1nnIDfvloOtfT7NxHKk49agg9Zl+Sgy9YH6c/kKwKwStubSSSJizpM2NKFq
oEx0sirK3kaZ3yhWgYn81IZk+o81XCxRTLB4YNyYLX3xwaPuxyi3g8ay1KQN5Fb9
nK7KdvF0V7exk7yfiTntBADwfh3FTm1+j8SI5dPWCXw3hXYCSV5LFxPllCccO1H9
mokJA5lNF5DT9LSFGmxtAcbESvRRJ93bdvz+8wK/ge2ykzJyK/E=
=00wW
-----END PGP SIGNATURE-----

--Sig_/4W4O0aF7NWQ+qH1m6bYJKAe--

