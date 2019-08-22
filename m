Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826FF99162
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 12:52:38 +0200 (CEST)
Received: from localhost ([::1]:40526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0khp-0005i6-Ge
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 06:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i0kfE-0004AI-8K
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:49:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i0kfD-0001bM-55
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:49:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44526)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1i0kfA-0001YY-FV; Thu, 22 Aug 2019 06:49:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF3467F76A;
 Thu, 22 Aug 2019 10:49:51 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA25460BF3;
 Thu, 22 Aug 2019 10:49:47 +0000 (UTC)
Date: Thu, 22 Aug 2019 11:49:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190822104945.GJ3267@redhat.com>
References: <20190814202219.1870-1-mlevitsk@redhat.com>
 <20190814202219.1870-6-mlevitsk@redhat.com>
 <6019b9e3-a4a6-4780-9652-f7c2bec024a5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6019b9e3-a4a6-4780-9652-f7c2bec024a5@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 22 Aug 2019 10:49:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 05/13] qcrypto-luks: clear the masterkey
 and password before freeing them always
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 08:12:51PM +0200, Max Reitz wrote:
> On 14.08.19 22:22, Maxim Levitsky wrote:
> > While there are other places where these are still stored in memory,
> > this is still one less key material area that can be sniffed with
> > various side channel attacks
> >=20
> >=20
> >=20
>=20
> (Many empty lines here)
>=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  crypto/block-luks.c | 52 ++++++++++++++++++++++++++++++++++++++-----=
--
> >  1 file changed, 44 insertions(+), 8 deletions(-)
>=20
> Wouldn=E2=80=99t it make sense to introduce a dedicated function for th=
is?

Yes, it would.

In fact I have a series pending which bumps min glib and introduces
use of auto-free functions in this code.

It would be desirable to have a autp-free func for memset+free
so we can just declare the variable

   q_autowipefree char *password =3D NULL;

and have it result in memset+free

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

