Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD9014DAE7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 13:44:25 +0100 (CET)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix9BI-00035R-44
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 07:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ix961-0005QG-50
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:38:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ix95z-0002CQ-No
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:38:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44389
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ix95z-0002Am-It
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580387935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GnB+cXdmokeSMQBdd0RXqARS2wmP6c0ELCqi+s3ZXw=;
 b=f0T04jr06TKVU/4of4V1KZ8+ccKjtwSHyfvbLRQUJEsa+BB87G8cQDQaVvRlJzklO9ApR2
 pZBDk1ZRlSZLyAGl84TF/+pgQ1NmAWM/XsZGfFmwORlLhafg85p7Rh4sZ+qKfPmuux6/Aj
 JwedbF9q2hwk1du5RUrZwu3GVxeJQZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-6O42ln5mP-2HYkY_Y9mkrA-1; Thu, 30 Jan 2020 07:38:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89D021005510;
 Thu, 30 Jan 2020 12:38:52 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-25.ams2.redhat.com [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 736F677927;
 Thu, 30 Jan 2020 12:38:48 +0000 (UTC)
Date: Thu, 30 Jan 2020 13:38:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 02/13] qcrypto-luks: implement encryption key management
Message-ID: <20200130123847.GE6438@linux.fritz.box>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
 <87r1zti6r8.fsf@dusky.pond.sub.org>
 <dc902f2ba314b63da7ae7a003463f9268e7b3535.camel@redhat.com>
 <20200128171116.GU1446339@redhat.com>
 <20200128173251.GZ1446339@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200128173251.GZ1446339@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6O42ln5mP-2HYkY_Y9mkrA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.01.2020 um 18:32 hat Daniel P. Berrang=E9 geschrieben:
> On Tue, Jan 28, 2020 at 05:11:16PM +0000, Daniel P. Berrang=E9 wrote:
> > On Tue, Jan 21, 2020 at 03:13:01PM +0200, Maxim Levitsky wrote:
> > > On Tue, 2020-01-21 at 08:54 +0100, Markus Armbruster wrote:
> > >=20
> > > <trimmed>
> > >=20
> > > > > +##
> > > > > +# @LUKSKeyslotUpdate:
> > > > > +#
> > > > > +# @keyslot:         If specified, will update only keyslot with =
this index
> > > > > +#
> > > > > +# @old-secret:      If specified, will only update keyslots that
> > > > > +#                   can be opened with password which is contain=
ed in
> > > > > +#                   QCryptoSecret with @old-secret ID
> > > > > +#
> > > > > +#                   If neither @keyslot nor @old-secret is speci=
fied,
> > > > > +#                   first empty keyslot is selected for the upda=
te
> > > > > +#
> > > > > +# @new-secret:      The ID of a QCryptoSecret object providing a=
 new decryption
> > > > > +#                   key to place in all matching keyslots.
> > > > > +#                   null/empty string erases all matching keyslo=
ts
> > > >=20
> > > > I hate making the empty string do something completely different th=
an a
> > > > non-empty string.
> > > >=20
> > > > What about making @new-secret optional, and have absent @new-secret
> > > > erase?
> > >=20
> > > I don't remember already why I and Keven Wolf decided to do this this=
 way, but I think that you are right here.
> > > I don't mind personally to do this this way.
> > > empty string though is my addition, since its not possible to pass nu=
ll on command line.
> >=20
> > IIUC this a result of using  "StrOrNull" for this one field...
> >=20
> >=20
> > > > > +# Since: 5.0
> > > > > +##
> > > > > +{ 'struct': 'LUKSKeyslotUpdate',
> > > > > +  'data': {
> > > > > +           '*keyslot': 'int',
> > > > > +           '*old-secret': 'str',
> > > > > +           'new-secret' : 'StrOrNull',
> > > > > +           '*iter-time' : 'int' } }
> >=20
> > It looks wierd here to be special casing "new-secret" to "StrOrNull"
> > instead of just marking it as an optional string field
> >=20
> >    "*new-secret": "str"
> >=20
> > which would be possible to use from the command line, as you simply
> > omit the field.
> >=20
> > I guess the main danger here is that we're using this as a trigger
> > to erase keyslots. So simply omitting "new-secret" can result
> > in damage to the volume by accident which is not an attractive
> > mode.

Right. It's been a while since I discussed this with Maxim, but I think
this was the motivation for me to suggest an explicit null value.

As long as we don't support passing null from the command line, I see
the problem with it, though. Empty string (which I think we didn't
discuss before) looks like a reasonable enough workaround to me, but if
you think this is too much magic, then maybe not.

> Thinking about this again, I really believe we ought to be moire
> explicit about disabling the keyslot by having the "active" field.
> eg
>=20
> { 'struct': 'LUKSKeyslotUpdate',
>   'data': {
>           'active': 'bool',
>           '*keyslot': 'int',
>           '*old-secret': 'str',
>           '*new-secret' : 'str',
>           '*iter-time' : 'int' } }
>=20
> "new-secret" is thus only needed when "active" =3D=3D true.

Hm. At the very least, I would make 'active' optional and default to
true, so that for adding or updating you must only specify 'new-secret'
and for deleting only 'active'.

> This avoids the problem with being unable to specify a null for
> StrOrNull on the command line too.

If we ever get a way to pass null on the command line, how would we
think about a struct like this? Will it still feel right, or will it
feel like we feel about simple unions today (they exist, we would like
to get rid of them, but we can't because compatibility)?

Instead of keeping talking about potential future extensions, would it
make more sense to just extend the grammar of the keyval parser now so
that you can specify a type, including null?

We already wanted to use an alternate for keyslot (int) and old-secret
(str) initially, which makes it clear on the schema level that you can
only specify one of both. It would have worked fine for QMP, but not on
the command line because we can't tell integers from strings there. If
we can distinguish them as foo:int=3D2 and foo:str=3D2 then that wouldn't b=
e
a problem any more either.

Kevin


