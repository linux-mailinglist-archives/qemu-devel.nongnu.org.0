Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BF604A1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 12:39:02 +0200 (CEST)
Received: from localhost ([::1]:51460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjLcL-0003dg-Ii
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 06:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hjLYa-0001SY-CO
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 06:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hjLYY-0003ZX-1h
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 06:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57440)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hjLYR-0003D6-JQ; Fri, 05 Jul 2019 06:35:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84EB3307D869;
 Fri,  5 Jul 2019 10:34:55 +0000 (UTC)
Received: from redhat.com (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F443100164A;
 Fri,  5 Jul 2019 10:34:53 +0000 (UTC)
Date: Fri, 5 Jul 2019 11:34:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190705103450.GG32473@redhat.com>
References: <20190703224707.12437-1-eblake@redhat.com>
 <265ccc9f-9df9-3885-ec79-fef36b8d0acc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <265ccc9f-9df9-3885-ec79-fef36b8d0acc@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 05 Jul 2019 10:34:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 RFC] qemu-nbd: Permit TLS with Unix
 sockets
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>, rjones@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 05, 2019 at 11:31:51AM +0200, Max Reitz wrote:
> On 04.07.19 00:47, Eric Blake wrote:



> > diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
> > index 9b46284ab0de..b86bee020649 100644
> > --- a/tests/qemu-iotests/233.out
> > +++ b/tests/qemu-iotests/233.out
>=20
> [...]
>=20
> > +=3D=3D check TLS works over Unix =3D=3D
> > +image: nbd+unix://?socket=3DSOCKET
> > +file format: nbd
> > +virtual size: 64 MiB (67108864 bytes)
> > +disk size: unavailable
>=20
> This has worked surprisingly well considering you did not pass tls-host=
name.
>=20
> On the same note: If I remove the tls-hostname option from the =E2=80=9C=
perform
> I/O over TLS=E2=80=9D test, it keeps working.

Yeah, that's a bug in crypto/tlssession.c.

It is assuming that the hostname will always be provided for sessions
in client mode, which was valid previously as all sessions were TCP
based. ie it assumed that if hostname was NULL, it was doing server
side certificate validation.

That assumption is bogus now we allow sessions on non-TCP, so we must
fix the code thus:


@@ -365,6 +367,14 @@ qcrypto_tls_session_check_certificate(QCryptoTLSSess=
ion *session,
                     goto error;
                 }
             }
+            if (!session->hostname &&
+                session->creds->endpoint =3D=3D
+                QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
+                error_setg(errp,
+                           "No hostname available to validate against "
+                           "server's x509 certificate");
+                goto error;
+            }
             if (session->hostname) {
                 if (!gnutls_x509_crt_check_hostname(cert, session->hostn=
ame)) {
                     error_setg(errp,



Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

