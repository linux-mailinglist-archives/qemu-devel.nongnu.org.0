Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B32D8CEC
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:59:40 +0100 (CET)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQ2N-0005GV-OC
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPri-0005a7-OO; Sun, 13 Dec 2020 06:48:39 -0500
Received: from mout.web.de ([212.227.17.12]:55105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrg-0002NQ-ET; Sun, 13 Dec 2020 06:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607860110;
 bh=4mPUeJ20EJC5qcXWtIBJGf6xePp4csQ6wgD+OF0lKyA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=T2XsFsmmTndSGqSv5fRqfrD4Aed72sbdRd7xpqmnyUpg0KB5q6xeCG8C0kLv/QLuW
 wtsm6HrsyNwzB5D7ppZ4YbDPyUHQypy1R2dOBrrLial9kQ48lK08oTliIcw8d+FCrX
 Bo/L7fuEErhjGLsMzq0Vef8MYfAb65ESst4iUxHg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.131]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MGAG3-1krvqb2tUd-00FCTX; Sun, 13
 Dec 2020 12:48:30 +0100
Date: Sun, 13 Dec 2020 12:48:29 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 5/7] io/channel-tls.c: make qio_channel_tls_shutdown
 thread-safe
Message-ID: <702fb93323fd7b3d6f0e1b6915e7df5f1dd01102.1607858747.git.lukasstraub2@web.de>
In-Reply-To: <cover.1607858747.git.lukasstraub2@web.de>
References: <cover.1607858747.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sdqCvHjzmdcIQAkLzh5WC5o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:jCImSP1Jt8BdDsl3tZ3PcwbgolyYjw706hyC6KMI8mcmxNP9PzA
 2H/krdmGvA79SIw+WX3Wh5c/KQJQrkZtjxNr13XE8105PFeIFaVXaT5aNHRb14EZLhkzUfU
 cRZZZhrTFpWPd/qtySeK1wpYp0nKL7J+GeOurUlusHgLkIxhU+RwyRrwd1Me3Nhnskf3fkq
 1WCyNAka9bOJx9i+1Nn0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BJR1J63wSzA=:Lb4Smuw70QIpM9IEoGPbUG
 ZAB2tTsLBwUFcXRvDqyDPx3wdRuqxPu8dWmtrDCQtqKuFJagTgbhk6cKXxbweVBocqhvTDGzD
 C3sXLhA7KtoPagegMGPxonNeookB19uxuAT5V8nB+2N/pVpkYqQVKR2FNQ8W7LhBD9qsHdJjE
 HEJP45DFsS/maMKEq+4DXgtr5o4pyiHriKugXAfhUAmBW8IvIXzVzv0rDoNocAETECFymSO8w
 gk/5JyWIUFvFA1ufKW7D/+Fr1NEAmabrQSGT7PQG31Z02Xxv8szF/B/cNXGQY78BFoQrQwS4m
 j54+d9sDRMV8WUTZzkGJVzzC4TJlULSh4Xqg3GnydsFJhJgV97cNiS1PytXpnoF+yBir5Yqva
 0daie2LIZTtnot2SG9x12j9kuGbTTLDe55D9+M2KUd5wLimJMV8yGde74tL2SWgikSQN2i/5g
 WDtmD597enuY+HGb556M4PWeN4sPBgBVr3i0jSCx6ERb7PCJx+kNZFiwHwaqdNJDEsk8dR11l
 F6RoGmzYVSMFSBKR7ALpT0i2tNgdTeS5krRKMmsDmb46tDL2AsQqBIT7nx5Yz+EYLjQm5olf4
 CFYYEOOmBencC5T3n9Mk3l6O84dGyGz3HCVCkDMKbzOxqNDe3WzPm+VZBvprQnxtKirYVuz4P
 M3y9S33u6iPgqitU6w/axuf++VJsmapymh2biqOldwY/of16u9OaMsT1B3bKJgVMGvUSDpQRo
 iP8DLWVbwGRv499tfuOkyDr9GnUaTEa2qr8Q4NnQVuKfsAPSWEUpDrVXS4S19kPufb+33hLgR
 B8Y5rVHOf9AD46iyll3PABnz784RgSP3D3I9V8tL6zakTIbu2RsFXd2PDVABI/AkQ5gu7gbko
 BxXGpElaGgkz0KEmdkuiMDtfhP5arkHLtGZ/jaa1w=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/sdqCvHjzmdcIQAkLzh5WC5o
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


--Sig_/sdqCvHjzmdcIQAkLzh5WC5o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/V/40ACgkQNasLKJxd
slibqw//SdC+6NYmpRtMv+kCS0Qc04kkGvjzpC8IN76W63Kn+5el4Fd4uyiK35YJ
DIcFePs+b7xmpLdHJw2IeoILV/Ea+ijEVg4Qr2emufygJWPr3gSSMfATXyAiFfeO
4p3Yl9mIpnEmhm8lG2J8sZqJbPoR+ysok/ctpE/4annCoL7DRqXk64Fy3bmyydCA
9VZvuczcCOC9ftBTyVvnG/NCW4f1ffyU43GtFhRGvaj+uz4btUVr7l909C1U8O5X
uwllCewIh7qYBZmPbdhPZaWIkngRNkPxQb5JC1IQQxMzLDpCdWiTFW9S2Q72Oy4F
EdihTQmBWxCi0BPH+Dxg+0MJiOBi/yiSnkw55nCNOggGyffJdtcS4nvnKLKolzVF
TyMW6NADp9tSvxjfVTGWXAOsaKB4O0Fh/BKBDc+06Rqc5zsQQv1217Wi8110jClv
fhcWjlfVAHRdEg6wTP5aHonyYEKlc2FdU+iFid58YXc5WySEnYdDKZ/kRqCMWB7T
7YDfMFFedFzpUlJQ2J4nfnNNJvxheyEeZDW/behQQDFGUv4K5oQ+TTl2/gNF4MI4
IhDRUJfE23VKzWCT613aG7Ic0RQWB0X5ecu/JNSwleJqy0cU6e0IuBTIpyzbALG4
cmWfTwfhoR1xHC57X26ku37NbNZK5jfuNwuBv1BA3D0GMDowxvk=
=kDiu
-----END PGP SIGNATURE-----

--Sig_/sdqCvHjzmdcIQAkLzh5WC5o--

