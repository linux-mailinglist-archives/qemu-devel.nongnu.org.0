Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE02F4D18
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 14:24:13 +0100 (CET)
Received: from localhost ([::1]:54266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT4FI-0002rF-HT
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 08:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iT4CM-0008MD-UM
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:21:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iT4CL-0005iP-Ea
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:21:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41795
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iT4CL-0005i0-Aj
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573219268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHgwrJYHF9E5pQ8zo/iGauHWTqEusn4R5G+Q+48iYTY=;
 b=SND0IN2kOxsfArdDcAL7LzbdodBSjl/ExURQUOKeY5W0AXGphQnlOQmcnWAYDvBy6Je2oj
 8jhSC1dAYMPKVDfj5nSbr6fF54BzpCLdP8xD2yKuqVpiFeVVgCCyA3v+t1CdpQz+FhIJUs
 1TU05iiNm0FEvKFS9J40Y2NCYISSG+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-yGa-W6t-NAKnKRD7rzhlOg-1; Fri, 08 Nov 2019 08:21:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F761005500;
 Fri,  8 Nov 2019 13:21:04 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA18B1001920;
 Fri,  8 Nov 2019 13:20:59 +0000 (UTC)
Message-ID: <e6387ee5ac80b8bbe9a934509d4125ff1dbb00a9.camel@redhat.com>
Subject: Re: [PATCH v2 05/11] block/crypto: implement the encryption key
 management
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Date: Fri, 08 Nov 2019 15:20:58 +0200
In-Reply-To: <3b5ab7e8-2f74-1dcb-535f-1c1ba8ada09b@redhat.com>
References: <20190912223028.18496-1-mlevitsk@redhat.com>
 <20190912223028.18496-6-mlevitsk@redhat.com>
 <bcc8844d-ec0f-93d1-209b-7b7af4f2c24a@redhat.com>
 <afdbbabe3a81e69b0699bca9f69112c317a5ebdc.camel@redhat.com>
 <05065ed2-6b42-ccae-64d9-4960885a7b8f@redhat.com>
 <248adc2a05942db73a310a7d3a0339345f4628a5.camel@redhat.com>
 <3b5ab7e8-2f74-1dcb-535f-1c1ba8ada09b@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yGa-W6t-NAKnKRD7rzhlOg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel
 P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-11-08 at 14:12 +0100, Max Reitz wrote:
> On 08.11.19 12:04, Maxim Levitsky wrote:
> > On Fri, 2019-11-08 at 11:49 +0100, Max Reitz wrote:
> > > On 08.11.19 10:30, Maxim Levitsky wrote:
> > > > On Fri, 2019-10-04 at 20:41 +0200, Max Reitz wrote:
> > > > > On 13.09.19 00:30, Maxim Levitsky wrote:
> > > > > > This implements the encryption key management
> > > > > > using the generic code in qcrypto layer
> > > > > > (currently only for qemu-img amend)
> > > > > >=20
> > > > > > This code adds another 'write_func' because the initialization
> > > > > > write_func works directly on the underlying file,
> > > > > > because during the creation, there is no open instance
> > > > > > of the luks driver, but during regular use, we have it,
> > > > > > and should use it instead.
> > > > > >=20
> > > > > >=20
> > > > > > This commit also adds a=09'hack/workaround' I and=09Kevin Wolf =
(thanks)
> > > > > > made to=09make the driver=09still support write sharing,
> > > > > > but be safe against concurrent  metadata update (the keys)
> > > > > > Eventually write sharing for luks driver will be deprecated
> > > > > > and removed together with this hack.
> > > > > >=20
> > > > > > The hack is that we ask=09(as a format driver) for
> > > > > > BLK_PERM_CONSISTENT_READ always
> > > > > > (technically always unless opened with BDRV_O_NO_IO)
> > > > > >=20
> > > > > > and then when we want to update=09the keys, we
> > > > > > unshare=09that permission. So if someone else
> > > > > > has the=09image open, even readonly, this=09will fail.
> > > > > >=20
> > > > > > Also thanks to Daniel Berrange for the variant of
> > > > > > that hack that involves=09asking for read,
> > > > > > rather that write permission
> > > > > >=20
> > > > > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > > > ---
> > > > > >  block/crypto.c | 118 +++++++++++++++++++++++++++++++++++++++++=
++++++--
> > > > > >  1 file changed, 115 insertions(+), 3 deletions(-)
> > > > > >=20
> > > > > > diff --git a/block/crypto.c b/block/crypto.c
> > > > > > index a6a3e1f1d8..f42fa057e6 100644
> > > > > > --- a/block/crypto.c
> > > > > > +++ b/block/crypto.c
> > > > > > @@ -36,6 +36,7 @@ typedef struct BlockCrypto BlockCrypto;
> > > > > > =20
> > > > > >  struct BlockCrypto {
> > > > > >      QCryptoBlock *block;
> > > > > > +    bool updating_keys;
> > > > > >  };
> > > > > > =20
> > > > > > =20
> > > > > > @@ -70,6 +71,24 @@ static ssize_t block_crypto_read_func(QCrypt=
oBlock *block,
> > > > > >      return ret;
> > > > > >  }
> > > > > > =20
> > > > > > +static ssize_t block_crypto_write_func(QCryptoBlock *block,
> > > > > > +                                       size_t offset,
> > > > > > +                                       const uint8_t *buf,
> > > > > > +                                       size_t buflen,
> > > > > > +                                       void *opaque,
> > > > > > +                                       Error **errp)
> > > > >=20
> > > > > There=E2=80=99s already a function of this name for creation.
> > > >=20
> > > > There is a long story why two write functions are needed.
> > > > i tried to use only one, but at the end I and Daniel both agreed
> > > > that its just better to have two functions.
> > > >=20
> > > > The reason is that during creation, the luks BlockDriverState doesn=
't exist yet,
> > > > and so the creation routine basically just writes to the underlying=
 protocol driver.
> > > >=20
> > > > Thats is why the block_crypto_create_write_func receives a BlockBac=
kend pointer,
> > > > to which the BlockDriverState of the underlying protocol driver is =
inserted.
> > > >=20
> > > >=20
> > > > On the other hand, for amend, the luks block device is open, and it=
 only knows
> > > > about its own BlockDriverState, and thus the io should be done on b=
s->file
> > > >=20
> > > > So instead of trying to coerce a single callback to do both of this=
,
> > > > we decided to just have a little code duplication.
> > >=20
> > > I meant: This doesn=E2=80=99t compile.  There=E2=80=99s already anoth=
er function of this
> > > name.
> > >=20
> >=20
> > You probably didn't apply the 'block-crypto: misc refactoring' patch,=
=20
> > or I forgot to send it.
>=20
> Maybe you forgot to mention anywhere that I should.

Now I remember that this patch was in the original re-factoring patch serie=
s,
and for some reason it was dropped.
Its now locally in my git tree, so I forgot that it wasn't in this patch se=
ries
already.

Sorry for the mess, I'll soon resend the updated patch series.

Best regards,
=09Maxim Levitsky





