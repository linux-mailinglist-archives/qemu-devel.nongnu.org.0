Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A23449AA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:50:10 +0100 (CET)
Received: from localhost ([::1]:40988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMoj-0001dZ-6o
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgh-0000Q7-4Y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:51 -0400
Received: from mout.web.de ([217.72.192.78]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOMgR-0005E6-Me
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616427689;
 bh=Gl33u9j2TbXFFO3Gf5oBmhcCMRF22sas4Sh0IKghxLo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OOXJuQUWwXYbXYgtIE1HZJWRF/AFSLEA3ge7+HpzEzubp2P7mfVrYrAxw7R2aZUoi
 nKluI8OY5hHgVhzLWb41cUwywKiQhjLoY5La5z1z5AsopYglU5XjLKvmskDJdFGbAL
 nY6x6Eou3lXoaVWvcTqMMxP8ftWOxsy1HN7HYTIQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9IOj-1lLsNj3Ue7-006ZDh; Mon, 22
 Mar 2021 16:41:28 +0100
Date: Mon, 22 Mar 2021 16:41:27 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/5] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <f7f04a07c6ef42c39fef0010366b773a563eeedf.1616427054.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616427054.git.lukasstraub2@web.de>
References: <cover.1616427054.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TGd6SVci5DbR2+sSrlf=PCY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:WWEqgPAmKKwYCrOwOCbVK5mvX7SBvcyRp9Ng0BOJpG+ySXjq08g
 eMD4g2ocFWKjMhwQBzOXy0SkdUUDB7gbhSln/RV/pol4AMqrpRDNp+2J9gLgHpaRXDfrK91
 S51KZwP8tmDZAclcmrKJg+LgMNjHiUxYa1Sr/zXFrRUPl9F2nkUuh0EIV1/+UPkEltwmRc3
 XvzO9Ii99ljmGiAr91upg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k2eb/rfNrc0=:1KtGjgKH8iwyBIKL63yGW6
 pHAXg/aAN3xcaPAKfsF3TGbEXUEuc6zFYotpKK7YuyFikcJCtvGTB40LfWp8x9Gt21MzvP52a
 +5VaDyQFFb19Q9d6609U3sXGGvVeyy9AZ9Gcl5/8Gb5gPEVKYdMIfQXVJgfLprpKaD/5v9w94
 bA3sAtaEjkJzCJbpxHM06AURCekbc3bVITcOplYNsItpM3H2kWA+kGTH+w8zupbtL51Ji37SH
 311AXlfNa0gcKjuLh2x4LS6eFrpeZx67nTebLBQzQMiH/c4mMuWEwJeQo8eK3MWMb+s+TKDL4
 knjYR26qpXGMYzqLb9bwuYbaXJcaXnHBVZ80knWTo4tvmKFS0EodBsdAhVArHgYnZG/oTEjZT
 hVrsp/WKQvMHvm+ZDWhEx6clRgyed3kh8ccToXVlU47Qbom96ENv2dpj6l7MKONcAcR/OlJ52
 eB81GMHgoPY1bPXUJ/F6tuhF5opaNOkpMi9hngHWKBI16l+Fb0SQQ2j0h7YKhVrG0F5BSmgeK
 WUVbB0TrEz4rFO+TndN/g3Qpu/FDb12lCtnL+GhMlf2QKSbxKybXHlZp9T1VzFOBNbxb+XcOy
 GessLkfHg50ssnQj0eOVL8oBH3Et7gtK7iSUZSG+ejkqsACPs5YWrRazpJTCn/8u11qqqMieu
 kjGVpr7A+2z7YJ54VmttKTCZ2JYbcGqmKbiNNpaGT56b1WB3tx3OC+a9m3txPl7LYE3E0Yvym
 kDH+trMOrGPZqJp5GRBrK+7+5BgD3L0Cw4WRbXdK+02c/62KOdKH8HV+wUunPrW/ILmYEzvT0
 XrNOMQk/2KU9+yXbBddUcfHG4USuLVRR8X1TdQeEPwRy47jxX0Ei9OWRMukcJbxpqAVt8rVEY
 pExGIAuExplULf92vcbQ==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/TGd6SVci5DbR2+sSrlf=PCY
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
index 97cafd6849..1584865027 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -972,7 +972,9 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     qemu_char_open(chr, backend, &be_opened, &local_err);
     if (local_err) {
-        goto end;
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
     }

     if (!chr->filename) {
@@ -982,22 +984,6 @@ static Chardev *chardev_new(const char *id, const char=
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

@@ -1006,6 +992,7 @@ Chardev *qemu_chardev_new(const char *id, const char *=
typename,
                           GMainContext *gcontext,
                           Error **errp)
 {
+    Chardev *chr;
     g_autofree char *genid =3D NULL;

     if (!id) {
@@ -1013,7 +1000,19 @@ Chardev *qemu_chardev_new(const char *id, const char=
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
@@ -1034,6 +1033,13 @@ ChardevReturn *qmp_chardev_add(const char *id, Chard=
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


--Sig_/TGd6SVci5DbR2+sSrlf=PCY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYuqcACgkQNasLKJxd
sliXahAAjuy36LExhdg5RRk9C/6kiKBncGBq8Hd/rblV9d/UtMrZoEjUycEaxSni
ZiUscUBqHG8McWkTC1/lX3ayndq4/KvgYbNfSPFtiup7MSgJ3qvshtisAGhBekRW
pmQEpFDIW8A62WbU0lsUsI3lI23DSwy5x4ENvu+uBCGiRY1WD3XLZmUVIkh5XNpR
Cjw4SfuvKKbD0pBOA8lE0izwP4Y8pZtpi/C/FENx0xuxopSEiLUSqa0QaNWU9SY4
ketSCIb7HcjdFraNVKM1ApFTt5xoALDWZb9WWTcR1iBB61zMStHczp9vCfNKkvI3
vipCwY/r1/U/wMcOkVEb6h2Njn/rNkWNKECC080UXwHVIjvObX1qX2FZh+tNNs6L
XKL4YnkoHZAAtzfO6L0Acgd6FiLimz0522ZYONTtqUt7hJUCqIFk7CYQzEeZWuhz
/Wop6Wu+KJcHMoIyPplFV+WqMCK+IEa9WnCesxUxxW2Llc8ICGzusHUyeSDRXZDZ
DPGx/XSx7pvkbgJ6qwaiPQOwBwEtH7sWYHXW6OhAzSMeR8NNYzqwYuZiJpc9fXpA
LBXk2Lz60c9XkCcgwyxkLTSWBfpzVTA/yOkanYEv0WOzVEl59fp819Hb3RWQp9vp
Max7IGdV2a/RvrXvZSFxNc2/LH0v/hHd+sx9jtJ3qV1Ko6BxKaE=
=hDYX
-----END PGP SIGNATURE-----

--Sig_/TGd6SVci5DbR2+sSrlf=PCY--

