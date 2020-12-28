Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28842E4233
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:19:27 +0100 (CET)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuIw-0003wU-H5
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8u-0004PJ-3e; Mon, 28 Dec 2020 10:09:04 -0500
Received: from mout.web.de ([212.227.15.3]:49809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8s-0001EZ-HK; Mon, 28 Dec 2020 10:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609168137;
 bh=00EAiCU6NQFSqynFLpxVcMN9uW9kgzNco1ggwNTcC/0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FD1QyyqvkpHmfG+ONABG+oM+idtn4VWTxpZIZsUKAsFA/R8lYxL7pf1mkoEVm1aUv
 WQLLgknQ4TBeoUFk947aqT83jib71RqPpT9j3fp/h4RM65Qr9Dftiycm0rrvQJGCiL
 BmxIrpyClNojtA9BDm6I401BkuE4UtWEKqVB839I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lb1rd-1k9Gj20MUD-00kfy2; Mon, 28
 Dec 2020 16:08:57 +0100
Date: Mon, 28 Dec 2020 16:08:55 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v14 5/7] io/channel-tls.c: make qio_channel_tls_shutdown
 thread-safe
Message-ID: <5bd8733f583f3558b32250fd0eb576b7aa756485.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609167865.git.lukasstraub2@web.de>
References: <cover.1609167865.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/scE93YRDVni0+txa/3euzwM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:2d5XceAMn6EOZVFtE96Uu08bfkSxIOyp+j1/HkD/WtBmqLtC5CE
 vNi9/QTsf962Yro6zEq8KGtJuA81vBrPMG8EH4QqDaNJsZyC88K6+lOTYcQ28X5IkOe80Gu
 +OvG28WFgG+Rd4a60ozsXjuPEH4r2MWQ/A9C9uyZ9UWQ3GcWy8epq2W6FIqJJvY0NMAxRQh
 TyWxgA3KHKcHyYP1VoKKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yv5WJ8ovZfg=:8a2H7BKV9qgHzZO+nzU9eT
 i+UFHFd/wVnfN2w6bBmuTdjypwxkFqonZrKvK601JUlU1oUbvdExQtiykZLbitPEJMm7hOiIE
 4KCL3Gj4JbFQH8jB33KKv3ArAuZNfJuWq+fomgjby2bGO+QGOApWgvYEIUy4wB/GEBtetjJpY
 mY/z6pmoQ5TtXPb78VzSgZ8uvM2JG3yzXucCAkDV6X+0wwqSbaiDTXYI2nJYB/eiCCb0W69OZ
 o/9tsSBQood2PczvmFclxAHledQOUQ1VisYKTt24oEFHfqZ9AQTAcEtqeQBHqjaI69qMTGlLb
 e5c0zPbEzXq0Hevp+kGYjmEQniJZHDr7V2vQzJ9qKqZtXRHrEAqw0ECrAj5TktWHaQBf7etes
 LLHjhFfsiWtdI8KEwX+KO4QXSPRhNo0+3bIM597S7oYRtVgsLh6T1Sviq31olRZpV1JPcae4Z
 sBIplo9LnH9bzThrjcBurQBFpzkmTMcTPnLUYh7eTFgyVa4AfIF6TgH3k9yKJyz8C/mXHMns4
 LBDHpjcAwOcBaL4Qa0YAbPyqJbdcEb9VfrFIpZqlLn+VjKOmgehhukD1xo2ireVuPbSmxkpGs
 bHIIqb+/sIo1Cn3uXrLEQhiPTw6GoD2xueloqb2Pb/5keGI8V3hS/3kA5mfqDEFOpKJCNe4Wo
 6ViP07oZM352xtnTVdafb8EnbN2F6QS2f3Llmc4ClimfCYLuDh2uY7Ev+dSJeg3nWWiWz9sjk
 IUGro4J0FpuTyfQyR/VC7QKoKKU+4JJg4pFwGmy5CvuaFsaM2PXob5oPUIt7SG79eZGP0cCj3
 62hABDuof42KA6SO5wTJsyORXmIbFYGtI2eJeJzPEgKdKE0ySdN4euZNdE5q4SDVoviyfnFKC
 TTU1ioDBq6Xvf9IFysIH+3V8oH+f8UGY+dZ6VCGzg=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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

--Sig_/scE93YRDVni0+txa/3euzwM
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


--Sig_/scE93YRDVni0+txa/3euzwM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p9QcACgkQNasLKJxd
slhbIA//ZX4FIEmn0faamdQzIUVvyWbfe/RcPwfRomASZ+4VITUBasb6Ur25MqBb
B6BSprvIZGVJOj8BK1NzSCoYJPt0LM8DucMR8yciXFMZgiy71DrLUiHmr6KWv90+
xQQM/fBxQ0Shp0IZ0XeW3Yd0f0rjTrBhSB/FYr/HikDzGMOBvTnRgv2RkjfYGCCa
gO4EouO6hy9qPMkBhgX/LiF3SjY4RA4+tZRcvBl5+34vQVOY890ENdqX53bhSxXt
SDab8dpCzYZgPaMPVvvZ/4nhwYtgq/HwmKfS1IOj4dvh0ilaCl4FOUdDpmgdg6gq
77UnotP6I1B/rhJJ+ePiKrNaCHi1EH1VvH7qZZxxIVMdnYgH+J4VfK2+5lAiCwH6
OKtkHH7sbRp2sGs3MOLTa8Mlz0SVoxD8RYM/1LIgG3wNrOFRnPizC0pDqeP481KH
RcTTMCTe/qiw+twHI2tyf3SZM+gOm8FyJjWAKSEdO2AYOEvlAeYQzX2A3BQOndDg
yBlAWwUKqMbQfO4M+i/HUwZ8jFoDW/ZBEUf1MmgD4hAEX2af32f9vVCpBxDfjjAY
xDKOxCJupDb1/eCgw9Ev72QGjbUcBoTYN1n/kUyYSUl2AqOgfN7Ge55smqyEpIKS
/SSXaglSIh8wRs2Ij48n9XdnTh8dv4yf+SVMcZ8RBUU8l1HEjmI=
=iSRJ
-----END PGP SIGNATURE-----

--Sig_/scE93YRDVni0+txa/3euzwM--

