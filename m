Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CB4195B51
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:42:00 +0100 (CET)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHs3T-0004b6-33
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jHs2M-0003x5-Ld
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jHs2L-0004UT-2e
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:40:50 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:23304)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jHs2K-0004Td-U6
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585327248;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhCa1SDyhe82hPNjIlMd9xi1pGnnJkWeenSQ2gCKGeQ=;
 b=aOPGHAvqHqqQJ34iXeqpihDRxSA3Vrjrv/7qTBIhwUuARSWNssJTbr4FOsBSZKlI4rNSDW
 GO/vjuPBPNyA7tUktFRpjTR6p6S4pwJBbZL836ajmvOj0aEPgP5N+O9TytTyQBMRrQQYVj
 jTbTknkLHlTWSHIQ3Nxe2yvd8VoHObs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-rA1Lu5ElNQCzMBRgoi8LiA-1; Fri, 27 Mar 2020 12:40:46 -0400
X-MC-Unique: rA1Lu5ElNQCzMBRgoi8LiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3E1800D4E;
 Fri, 27 Mar 2020 16:40:45 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9FD5C1C3;
 Fri, 27 Mar 2020 16:40:43 +0000 (UTC)
Date: Fri, 27 Mar 2020 16:40:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/3] io: Support shutdown of TLS channel
Message-ID: <20200327164040.GQ1619@redhat.com>
References: <20200327161936.2225989-1-eblake@redhat.com>
 <20200327161936.2225989-3-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200327161936.2225989-3-eblake@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 27, 2020 at 11:19:35AM -0500, Eric Blake wrote:
> Gnutls documents that while many apps simply yank out the underlying
> transport at the end of communication in the name of efficiency, this
> is indistinguishable from a malicious actor terminating the connection
> prematurely.  Since our channel I/O code already supports the notion of
> a graceful shutdown request, it is time to plumb that through to the
> TLS layer, and wait for TLS to give the all clear before then
> terminating traffic on the underlying channel.
>=20
> Note that channel-tls now always advertises shutdown support,
> regardless of whether the underlying channel also has that support.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  io/channel-tls.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 7ec8ceff2f01..f90905823e1d 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -360,10 +360,35 @@ static int qio_channel_tls_shutdown(QIOChannel *ioc=
,
>                                      Error **errp)
>  {
>      QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);
> +    int ret =3D 0;
>=20
>      tioc->shutdown |=3D how;
>=20
> -    return qio_channel_shutdown(tioc->master, how, errp);
> +    do {
> +        switch (how) {
> +        case QIO_CHANNEL_SHUTDOWN_READ:
> +            /* No TLS counterpart */
> +            break;
> +        case QIO_CHANNEL_SHUTDOWN_WRITE:
> +            ret =3D qcrypto_tls_session_shutdown(tioc->session, QCRYPTO_=
SHUT_WR);
> +            break;
> +        case QIO_CHANNEL_SHUTDOWN_BOTH:
> +            ret =3D qcrypto_tls_session_shutdown(tioc->session,
> +                                               QCRYPTO_SHUT_RDWR);
> +            break;
> +        default:
> +            abort();
> +        }
> +    } while (ret =3D=3D -EAGAIN);

I don't think it is acceptable to do this loop here. The gnutls_bye()
function triggers several I/O operations which could block. Looping
like this means we busy-wait, blocking this thread for as long as I/O
is blocking on the socket.

If we must call gnutls_bye(), then it needs to be done in a way that
can integrate with the main loop so it poll()'s / unblocks the current
coroutine/thread.  This makes the whole thing significantly more
complex to deal with, especially if the shutdown is being done in
cleanup paths which ordinarily are expected to execute without
blocking on I/O.  This is the big reason why i never made any attempt
to use gnutls_bye().


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


