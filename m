Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4702E1067D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 11:47:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLlpX-0000l7-FS
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 05:47:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hLlkO-0005Sj-Tz
	for qemu-devel@nongnu.org; Wed, 01 May 2019 05:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hLlkL-0006Al-Sk
	for qemu-devel@nongnu.org; Wed, 01 May 2019 05:41:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1hLlkL-0006AR-N6; Wed, 01 May 2019 05:41:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFB8A882F2;
	Wed,  1 May 2019 09:41:48 +0000 (UTC)
Received: from redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 973F79081;
	Wed,  1 May 2019 09:41:43 +0000 (UTC)
Date: Wed, 1 May 2019 10:41:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <20190501094140.GO29808@redhat.com>
References: <cover.1556666645.git.alistair.francis@wdc.com>
	<002f222d86322a66276de39cb29796acffe384c1.1556666645.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <002f222d86322a66276de39cb29796acffe384c1.1556666645.git.alistair.francis@wdc.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 01 May 2019 09:41:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/5] util/qemu-sockets: Fix GCC 9 build
 warnings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"alistair23@gmail.com" <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 30, 2019 at 11:28:22PM +0000, Alistair Francis wrote:
> Fix this warning when building with GCC9 on Fedora 30:
> In function =E2=80=98strncpy=E2=80=99,
>     inlined from =E2=80=98unix_connect_saddr.isra.0=E2=80=99 at util/qe=
mu-sockets.c:925:5:
> /usr/include/bits/string_fortified.h:106:10: error: =E2=80=98__builtin_=
strncpy=E2=80=99 specified bound 108 equals destination size [-Werror=3Ds=
tringop-truncation]
>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (=
__dest));
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> In function =E2=80=98strncpy=E2=80=99,
>     inlined from =E2=80=98unix_listen_saddr.isra.0=E2=80=99 at util/qem=
u-sockets.c:880:5:
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  util/qemu-sockets.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 9705051690..8c3322958f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -829,7 +829,7 @@ static int unix_listen_saddr(UnixSocketAddress *sad=
dr,
>      struct sockaddr_un un;
>      int sock, fd;
>      char *pathbuf =3D NULL;
> -    const char *path;
> +    const char *path QEMU_NONSTRING;
> =20
>      sock =3D qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
> @@ -922,7 +922,7 @@ static int unix_connect_saddr(UnixSocketAddress *sa=
ddr, Error **errp)
> =20
>      memset(&un, 0, sizeof(un));
>      un.sun_family =3D AF_UNIX;
> -    strncpy(un.sun_path, saddr->path, sizeof(un.sun_path));
> +    memcpy(un.sun_path, saddr->path, MIN(strlen(saddr->path), sizeof(u=
n.sun_path)));
> =20
>      /* connect to peer */
>      do {

I think my proposed fix for this file is preferrable as it avoids
repeated strlen calls=20

  https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg02124.html


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

