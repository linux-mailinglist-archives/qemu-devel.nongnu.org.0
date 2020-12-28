Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31FD2E4148
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:06:13 +0100 (CET)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu68-0000dL-Kf
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttz9-00032O-6m; Mon, 28 Dec 2020 09:59:00 -0500
Received: from mout.web.de ([212.227.15.4]:59115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttz7-0006Zq-JB; Mon, 28 Dec 2020 09:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167531;
 bh=xTxUnzjUnA38dyvVmkYbdHX7AdjG9X3ODr8poi3pd+k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=osapwambrY5+EuJLAYoCEnCrDE4KwbxytPw65sUGxExvpzAKqnPjbT6ArBcPuENIK
 G6udYIgdLiKqwyMs7plTq+qaQbq89/sqSAVxPCiJW5Wp89DorOA1kjwV3S3oEZWSB4
 XCH5Vh5UdeAJGbOqWz9VLtUYv8en5Bgfs/JB5IUo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBjMO-1kjysh31kS-00CUF6; Mon, 28
 Dec 2020 15:58:51 +0100
Date: Mon, 28 Dec 2020 15:58:50 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 5/7] io/channel-tls.c: make qio_channel_tls_shutdown
 thread-safe
Message-ID: <4708cdb2a270bc363d6de2d0b9ad74425ed0e2d1.1609166587.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609166587.git.lukasstraub2@web.de>
References: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZouMWtKK7q31XoOZfLk=Ud+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:FS3mPOW/xfR9/6RJ1LbTyEDjnN7d0W+MxhW4iy6p7eeyZwtcKl+
 FbJ5DKFBoePg8SYxzIlefXLbaT2AbwNOUyGVYtAJ+xjv/bX9dnl2mA8yCSVb71kTbIlPH5F
 UKUwMQgdHh6v8oo6nrO9euKbXpKQQnVJmbY9dfv/l0nglUYc0wgvO3LTl0Nq7fxjXay5gpc
 h4v8+HNkBXQLUBb5xB+MA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f+ilFZRGpYY=:oa133+4ec7G8NksZOSap+E
 zWjOCxo0kpJXN5mFNkRhIzm7Nvsov4stMm4CTypRhSMub7p5YnKkYfNgjkdiEnecU7izDEPZY
 t8J77LbZuE2PEUtv3Uz1XR49LxdHj2ZO5Rja/E7oZrzxEwoElwfCbokCOLOTWG8i2udlZVjGT
 u4X7KOvOxbDziEImBiLJavhMiPVwk+PnezqMuf+nTV2kufWbGSciRnk7F4JLwaJbL/YIADYeC
 aPtjlKQ7LT8+dVRFieIFucsbEyRox6O/dLaa9hphsShGL5Hq39CupMKhSZovkWMJeMAtNFidE
 3MdZ9DSPZZxt8qE5zK7tg5tPUxVIRAIVCz+/8Ir7vsCu3sKweJFKbqYMJoYR0t8MfU8vd1UIN
 JFVY3zan30fdfDwXZFhIFKq+1U2nIU+YImm2I75ur7mXPYUXhScKvHUm1Vkji7nFfdCm6pWEc
 IDtXzKL0MWX0oPz74+N2oL6o+BwP9wJRHZR0BUZ63CIdgwdCwcp4sbbRbKDuItD4N0eoJtlC1
 V4heEZjRcJcBXdNqtBIyxzLb9rBG+iTIF64uVI07fFYQg1NWFC5AMSxnm5qCVN1OJO8WvVlwQ
 8CVHwamy1PhEW+upqRvWjJJQW7JbqKocr+/fBx9JoWQeeXIzrYtjxWq2VJEbb+HUw9SBjOiB0
 DyixDFpehuYsI0EtUJgD8rq0IMwXfyVq0yIDO/NEhch6nvqhYgSS+FlXfWRBwMqs3jF6XMbuk
 21BXiA6f29zzWl/0BqHiSdMfGnmn/lVNoyVSDxJHV6Mtk6KMgwx5+4xbNzmwjIGRY0d0zUb2T
 wrKLO2XEjrPqQoao4g70aO3wfPn8qZEXNypOC3+vhnkCl36u/LaR8KfjSAuVSLgtVGop5w5ix
 8Klzpw9YcORw3GqhYRo9D1TywFel2k4jI7XysSF5c=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 =?UTF-8?B?XA==?=" <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr.
 David Alan  Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ZouMWtKK7q31XoOZfLk=Ud+
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
2.29.2


--Sig_/ZouMWtKK7q31XoOZfLk=Ud+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8qoACgkQNasLKJxd
slih0RAAiVvPtZzfGwM4vN9rQ9LxFQmfYTp5kmTEejWUBnhJk3uSk7DhpApXCPHY
Jom3X5ZJMyXFJ5kDSbNWFiDT/HN4fKHiDnaJGFUt0kcFv6pmXdm42arZCordxYNR
X5/F5IyePJmja8P3kKIYexg2n3DKKKmwxyEVyulWijqNZviL/W9btTHoMx9U3Oup
+AhD18M9j37LYrAYd+u7IV+SPET9pFVkf1RLbJ/c2UdEsIr5lgAryvn2eA0iB7TB
V7K4tdpp4imwSaDfmdxD6+nfLfomRePgln+R4Z8gBKV8l6e0uFh1ChaOHE/mGXCK
Rb7LaPm+9b3ra2AvV3IEOznQgbVM14XR6vlduoaopgrM6KRE4r27UweD7JYrYdeD
Jc5zFyxQu5OCv6mPb0h0oSuhKvm/UId2Cdvnf7cBLBjXeBY0tqym6P5JwfdsP1yG
m6R33ugGrOj15I7FZzxHj32dzLNopz/9+tu16BwKFISXTRe9dYN/UP8vBcGaAQGz
rKnR/e7mx2lmqdoWbW0uoKcXyRCxDpbCmzq5Jd/y7hV1QnyEPGDofDe6ayWtKINM
9hHRL2Wp5+e2rhUzzmTu+bnTf2XtWhAzOggygFY3Bb5JNghn2H3t5wTvqQEp8WvM
KT+nkXcYAkFtqMNmB4swEe7TOSX7L4EZU7ja3HTSc39q/ta1d/0=
=GA7G
-----END PGP SIGNATURE-----

--Sig_/ZouMWtKK7q31XoOZfLk=Ud+--

