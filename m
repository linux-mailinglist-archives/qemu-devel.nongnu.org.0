Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8A34D54C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:41:52 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuxZ-0004DL-KM
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuW-0001dz-OQ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:40 -0400
Received: from mout.web.de ([217.72.192.78]:40037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuV-0007eK-1L
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617035916;
 bh=bHJt6KTZohUnCiAnbNZQQXAkLGvmbOLYRn7NsHq3GyQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=X2dWHdlePc/marFnDKKduuI6XLa/Hc+irIXeLKgDTKta1wBVg/+Ooh8kPyZOtcrxO
 H8sLQ1lbAoUsXjZ+bw/rlaxOhuA/lanY+uWtsV7uT9IPIOQYDULPS31Sp+mg1xjcHN
 7eKgx87RF72wy+DsRPXglI7IMh1DDGMs2Z0h1FNU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLPRu-1lQMgA2oLq-000ZNX; Mon, 29
 Mar 2021 18:38:36 +0200
Date: Mon, 29 Mar 2021 18:38:35 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 1/4] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <b2a5092ec681737bc3a21ea16f3c00848b277521.1617035720.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617035720.git.lukasstraub2@web.de>
References: <cover.1617035720.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zwbpc5THq/1xSPjMDKasX6+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:7JIrbk2SBGKTy7dbzfl6Eut47m8e2B1qYxyB7p14j+vyKOlG8j/
 lX+6jIrvz8fKsf7zUnErZ8AhR5B3/R8Z/QF+d6L4UAHrwioCMZHZhXzhUZnxXIBcn3gk4ly
 1NbTUVmB2m7rf6F5LwUT+eSHwvfMZJbLtJnTS9U/HLt3yI1fUwc2RMxot7kTp5S2ohqvJ1K
 V1GUKHocVYFOXrHwRq68g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J4FERaaRUPE=:WD3+h6Rd+roLB6iiebWPZr
 dBNVL2TwU7QLOuMj56EPYc69dDAtdrlptSr02MDN7Z5uOyDJ+BCK9iPozqGKTXC0CSaibP7aM
 LoGZA/yooVe4kguQf9j+bLDKvgOLxTQXdotOfYdWaJr6Gz9m6JtsLsealNNIjOWlY9nNG3Mdo
 BGaPIyIlylVU7FlxrzfVC2+8/kG3Equ8pcOqVbRJiQnPgQovC5WKEECNgvJSg5zFmdfso4dAx
 ECXanE5u6P3m4AGxjTWLJcieau74/RX9fL1j5HQwVIYuzEmVtR6LBnYm0PuXCNl7GJ07MMQtQ
 xVE7LX7yGhm4sTDlQBITwTPiZaHq0aHQQFqVaUkdmeq0I9xVvDhMY9qwHb+nb8RkB2TmogJc/
 +4gYATbuT2g/dk1B3qW7IyLVaypSCI5SDZJTFGNKbF+bms0diWf+RChnWr+9b1gC+0JLBQrxf
 fxWMup1s88eGt2JL721snQg5hjmgBrS9PYp+cYA4aN1pz0lIMEZIvyXQWKGpRjI6hbikSWOvD
 xC5PvqqCDZUXfXsbD0eAKOniv2wptnpIMmzPFNOOzHIlB+LGd5hyaufwnlKzhr/44hv5VyBzG
 ijSShIHHGkDEF6GIkjHf+5a/Q4ZpvhZCmEUurAw0DlPvjZOkTC8NEtgQbPFF/5G1Y1DoD0e94
 vg4Af5BLvbeD0lT+V1IRE3Ix6G/9Y38PTBA6h1F4KEtXx4Va3ZHUxbl5VKp3MbrAbg4sh0JKD
 7mH2A+LQqc7G5pMXS/1/uwSeT47IiY/EuKDbHjkrR3PTPLZn6MSdeWn11EiNAnar8FBw1S5OV
 Q4m7Fm2wQS9yJyN9drJGmQNWpfllV0bEcy5iiO3RJPmbjP2Zc4uRS5KKsf9LR1ABTsk+9SFYB
 aHDLrPopHsCcQbpdWn/Re0dx3a0Brb4zShAtCNZDTPm71vGwtOW2A0vNRV3d3YmmYYndWpK8T
 Tuv6KSfrm5yNi0loXZFRj5Ur5fCU+OWvU54cwf2i3WWGX1N/IZwcbknrj6NoR+7jPQyF0PDr1
 73Qmdwa0NCvajdOt4VvaxsmkK9Ex8PXIKqzk5HXgMGQ661Dhj5WWAJs5Viw9vn4YKdb3bEsvv
 ZJY0qSoibK46AJR6yDCEhNuSRA6Fs6GwlF/pOZkOIBd6ctlDYm/wWz5NcI5wiWauOm2HvD8KV
 E1ozJe3LvVLyiYMyPOd54HexbDFC+ToGFKAu8yWmONbWNWTHN0Lzz+VO8JBrZeQE4je2Q=
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/zwbpc5THq/1xSPjMDKasX6+
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


--Sig_/zwbpc5THq/1xSPjMDKasX6+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiAosACgkQNasLKJxd
sli2Xg/9EmGdO3J0iXs+njNtFJpoNyX1oBvnCO7JcJwX01m1Lql+8VkEPzA/2Qq4
FKobJoOVC8Lhi8nBWRf2HmrDdkqLJtvXqHtEOr3LMsLRpiHyvZ/Iv7skE0xkLCWI
myIUrZjHkOmz73Xs1hebqKBVWarG/uA2f2LC6E7RXD/piNVPBHS7k5WsjwiYf2py
jmUdijknWwXekgNfqSH1A2MCVT9VygJvA4MutShD9UBV3AWqyIbdFc3rTc0V1SNe
9Vobo43AL/SxAq77hUyA5R91eqcOnvf/Jl4bMdKfQUPqkXIhtzPSCKWX4bzhHJS2
6DngIGK+0cXZKqhTtj04WZMgG/SbQOdguH2Di2xeJGLuKVJElMepR+E+78hvfo9U
WA5xXg7wTJ08IOpaGZfSggj0R9cNADYYYp6KfaVGQZmt3dQjmqhOX7Kdql3Efggv
PLDqy2M98F038i69iSRMOSusNMy9YsbcdCZkpE7p2mrd8kTn5b3JApdP2aBCsheK
DBagQ9bXraVRB+xVgdlNEgQaAqVIDjc3JEKH51zsor7vPP7KaywCMtGwMn10vL0a
40cILnlT74xXbSoYeiJfEcJpMHTUV5ViSQXV34i9cPRtrH+20oHHTLBeCSslTHON
siqhbOVuiUuJYmzNJ+8I/ylxxXCtEKs8Ky01Us9VIVhAqi2/Y4I=
=6qOv
-----END PGP SIGNATURE-----

--Sig_/zwbpc5THq/1xSPjMDKasX6+--

