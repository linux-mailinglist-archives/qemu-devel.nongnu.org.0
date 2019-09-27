Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7DC0A83
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 19:40:31 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDuEH-0006VM-Mh
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 13:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDsfq-00046T-GW
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDsfp-0003a8-Dw
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:00:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iDsfi-0003SH-O0; Fri, 27 Sep 2019 12:00:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC7D5308A968;
 Fri, 27 Sep 2019 16:00:38 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 939792618A;
 Fri, 27 Sep 2019 16:00:31 +0000 (UTC)
Message-ID: <91f8e3a583d6b0626ecaba4a24d164e1a212c050.camel@redhat.com>
Subject: Re: [PATCH v2 01/13] block-crypto: misc refactoring
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Fri, 27 Sep 2019 19:00:30 +0300
In-Reply-To: <20190927101535.GE20911@redhat.com>
References: <20190925213527.9117-1-mlevitsk@redhat.com>
 <20190925213527.9117-2-mlevitsk@redhat.com>
 <20190927101535.GE20911@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 27 Sep 2019 16:00:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-09-27 at 11:15 +0100, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Sep 26, 2019 at 12:35:15AM +0300, Maxim Levitsky wrote:
> > * rename the write_func to create_write_func,
> >   and init_func to create_init_func
> >   this is  preparation for other write_func that will
> >   be used to update the encryption keys.
> >=20
> > No functional changes
> >=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >  block/crypto.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/block/crypto.c b/block/crypto.c
> > index 7eb698774e..6e822c6e50 100644
> > --- a/block/crypto.c
> > +++ b/block/crypto.c
> > @@ -78,7 +78,7 @@ struct BlockCryptoCreateData {
> >  };
> > =20
> > =20
> > -static ssize_t block_crypto_write_func(QCryptoBlock *block,
> > +static ssize_t block_crypto_create_write_func(QCryptoBlock *block,
> >                                         size_t offset,
> >                                         const uint8_t *buf,
> >                                         size_t buflen,
>=20
> The parameters need re-indenting when you change this name.

I am just blind thats all :-(
I checked all the patches for the indention and still missed it :-(
Will do of course.

Best regards,
	Maxim Levitsky


>=20
> > @@ -96,8 +96,7 @@ static ssize_t block_crypto_write_func(QCryptoBlock=
 *block,
> >      return ret;
> >  }
> > =20
> > -
> > -static ssize_t block_crypto_init_func(QCryptoBlock *block,
> > +static ssize_t block_crypto_create_init_func(QCryptoBlock *block,
> >                                        size_t headerlen,
> >                                        void *opaque,
> >                                        Error **errp)
>=20
> And here
>=20
> I dropped this one from the pull request, so please bundle it into your
> other luks series
>=20
> Regards,
> Daniel



