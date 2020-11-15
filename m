Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A42B34A7
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:40:59 +0100 (CET)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGOw-00024q-PK
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKX-0005GA-Bz; Sun, 15 Nov 2020 06:36:27 -0500
Received: from mout.web.de ([217.72.192.78]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKV-0008Ig-Jd; Sun, 15 Nov 2020 06:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440178;
 bh=9ZKQH1Famksq6matfj22LsnulMjl2YZVLuwzqiiJrag=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cwA8nxX+Nx5LsZbc1CNdkTgIzPwubBweEoBesNjgmpmUhLagv6PFbMCuRygJ9Fff3
 BOUYEVGc9G4nWslW6hx0ePYd867NkJmZgK+bM5mXvYzDVFXNlptZQ5uqpm2mNOxHR4
 5ftqcN3DgELZ9PKS6JpJi7RWp2s3A9Psf86aBAIE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MT7aP-1kqkfN08Q3-00UcC6; Sun, 15
 Nov 2020 12:36:18 +0100
Date: Sun, 15 Nov 2020 12:36:16 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 5/7] io/channel-tls.c: make qio_channel_tls_shutdown
 thread-safe
Message-ID: <ffcd9df821c7153fc743559d9044e0d0c8042183.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7nxYIaCb6l+Am23+Uv+7/fm";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:LKalL2J9P/p2G31XSWBsqgLXDL5YVCVAUrhGHYo+EypkPH1tD9m
 JBk3LutzgXL3PO11xYj9NrPLWGeMZ8MVJTrOE0UIK1JiFXNJZIY611RprBl7d/9BHhvF7L9
 M9uHCGWwAEbLcIRCF9tFA+W6TlqfzgCrIzl9tCcPtnCF2qJrHxvxz42VmoQBuj3tXFBX5+X
 d7gFVzTtR9E6iwBwBH51Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:07OHfzW9+VM=:2u/RlV8WzSB1n1lz5JPGn3
 1gpxeUXrwbK/pEutoatLTlADNyxtvxjaksgzkr/qVZeOGgmZB3ewssX+jUxQz+MSqIXweK/Np
 MQMUOsh3TV3pUmUIcxp5J8p/d6ZMtFv6y4/8t9H/iKAEIklJHQhM3KrZUq/kDX7oBqs8rCLLU
 rDCUgoOg8Z/xaMZD7ifYjaK17r3d6s0ptRji325hUO7H0mPw6Nsuk4TwWaQ+zr2KE1NUm19TN
 LA79OpMPJuU4XrmRFWPd7gTSojebxr5doi6LgDTXv8omGck81596k0TnleXDdmyBCc+A8pYPE
 kfcdM+hkkkC7hNj4wofodlNsAOV0WxAcULsdLUlATHIMIJXAd+eQ05DtLjLpnwdtDqLNs6MRJ
 lk0cH1bGay7nRk7X+ZIOW65UdWTuACWbe/Dl7wUFfFfiNham67eoRQrYIUxjybUwKMSvLj+W/
 vQRAd+kkmcfL/LTDKY2FvCYAdJTnXqMKZ6a+n9BTsJ4xkviZqhLboGus21bcwQmEGU4QIwiJp
 3UTDHxf2l/rotZsrfMgnEtKG4+jds1yIgJ7sa7N5DAtH2LZmJVhB6R20I22pHSO8aiE91RHtZ
 33tifZSqqUe2RSFkAS3doo3R2R9Fq9WbStmIsLHzzRBoyxJrq3GVw737DqsT1iuUaoNJmSxSw
 Q9fgdWRWlKWAN//Q52kLyhFki+VA/HLVWPsHvniEP4QFA4pRxVjkUknCatoZCUu85LNWTOGX/
 1wfEAAl03sgPh6yRMhcwVwCYb0qMcLtx7cRiYkDmCUAnQc/xsBQ2WFZPf7SoWyj6TJWZi0D49
 U4qhh/aREjHVjldzG4pMKppi1Sey2SeFqRlVaSQ9bwiHTqp+vg4IMyOCinvecd2uvi3ZiGcpE
 sXvqsGM+5r4SUA81qwOA==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 05:44:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/7nxYIaCb6l+Am23+Uv+7/fm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Make qio_channel_tls_shutdown thread-safe by using atomics when
accessing tioc->shutdown.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 io/channel-tls.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 388f019977..2ae1b92fc0 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "io/channel-tls.h"
 #include "trace.h"
+#include "qemu/atomic.h"


 static ssize_t qio_channel_tls_write_handler(const char *buf,
@@ -277,7 +278,8 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                     return QIO_CHANNEL_ERR_BLOCK;
                 }
             } else if (errno =3D=3D ECONNABORTED &&
-                       (tioc->shutdown & QIO_CHANNEL_SHUTDOWN_READ)) {
+                       (qatomic_load_acquire(&tioc->shutdown) &
+                        QIO_CHANNEL_SHUTDOWN_READ)) {
                 return 0;
             }

@@ -361,7 +363,7 @@ static int qio_channel_tls_shutdown(QIOChannel *ioc,
 {
     QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);

-    tioc->shutdown |=3D how;
+    qatomic_or(&tioc->shutdown, how);

     return qio_channel_shutdown(tioc->master, how, errp);
 }
--
2.20.1


--Sig_/7nxYIaCb6l+Am23+Uv+7/fm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xErAACgkQNasLKJxd
sli5MQ//TXB3c3+A736gDWM+c1DhMojBgLDAw0VkvqCGiQBSjDUf/2mUCilmu4lH
gAQbbuYJwC315v/4gOkAiZoa7XPmz3Zq34kEbihIobAbRt9qFPNbEEFANUyrFu4d
PUomtkgOr0/i+WGuIaTMmTJVXo5ROmXy7Wr5GBOnAv2kAT2zLSEr70QtZer83+y0
eXWoLH2req9VRgVIP/WoIj5P2WPs53Ds0OVHMGVIP4utiqo6xwUJ1bUflgIRM+np
wvPgnHlctlX+5XA1/P4QjAaNXdPTFfAClgXERWCPmoMinjJCyS1B6Xbrud9Th6A5
W9JNlKsAF9EX99T4IYeYGB7W4W1T2fZ0iZ4+hGBMHLKXMfzErPPa8K+kzF3dvRpO
2RoJQJ9jO6pE4FOXD2CAaL9vdw4jYyb2yfmKLnSHtrNmBGqc9SnxNISzB9p0JhAS
jJrle85olHjrJ9gZ6etp21hFh8BtvgfbnB0x0AhtQ2QO7dfAnMvsi0UjVT12f1ef
aFvuorVZ1z1/wqahty2jP67qr0QLPniILkzGbHfjm21KEFwJOuYNIY/cxpV7F8xv
JoXqI7LNiBpTHu4165zIsD6jzJQgM/yr7PPklIb2VI89EAm4/U8cwKouQfLlH1mh
Q1/7lCnFB6FA6ZDW0H8LCheWor9vY0+qkIXdXBb/TePYExXaNJ4=
=AU20
-----END PGP SIGNATURE-----

--Sig_/7nxYIaCb6l+Am23+Uv+7/fm--

