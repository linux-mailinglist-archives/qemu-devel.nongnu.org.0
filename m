Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D604914DB03
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 13:54:27 +0100 (CET)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix9L0-00058G-V5
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 07:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ix9KI-0004f7-Br
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:53:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ix9KF-0000M5-OA
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:53:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59490
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ix9KF-0000Ll-Jv
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580388818;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPWEkAOnYYajQ4BI3QfXUmtTSwidKDEiL1+fRwqYAPw=;
 b=Hmizm+s5Ut4FWFiSxBb/wCGiCo636mu8CBY8p87P5vZJCL6/L+XWpKpqYrzdfCTdnkhKYo
 1rTwsxi9UtRTW3kIiLYLrl3gyxrHAfSLQx6LJAy+PcayvXgOqtyUen0CKdLoctrOvgFBVv
 uKOD9A3FramdFuaSY6IKgO3cp7YlEuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Ain8VMxLMdKzMWeiTmWGuA-1; Thu, 30 Jan 2020 07:53:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1672800D5B;
 Thu, 30 Jan 2020 12:53:27 +0000 (UTC)
Received: from redhat.com (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C37261001B07;
 Thu, 30 Jan 2020 12:53:22 +0000 (UTC)
Date: Thu, 30 Jan 2020 12:53:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 02/13] qcrypto-luks: implement encryption key management
Message-ID: <20200130125319.GD1891831@redhat.com>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
 <87r1zti6r8.fsf@dusky.pond.sub.org>
 <dc902f2ba314b63da7ae7a003463f9268e7b3535.camel@redhat.com>
 <20200128171116.GU1446339@redhat.com>
 <20200128173251.GZ1446339@redhat.com>
 <20200130123847.GE6438@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200130123847.GE6438@linux.fritz.box>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Ain8VMxLMdKzMWeiTmWGuA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 30, 2020 at 01:38:47PM +0100, Kevin Wolf wrote:
> Am 28.01.2020 um 18:32 hat Daniel P. Berrang=C3=A9 geschrieben:
> > On Tue, Jan 28, 2020 at 05:11:16PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Jan 21, 2020 at 03:13:01PM +0200, Maxim Levitsky wrote:
> > > > On Tue, 2020-01-21 at 08:54 +0100, Markus Armbruster wrote:
> > > >=20
> > > > <trimmed>
> > > >=20
> > > > > > +##
> > > > > > +# @LUKSKeyslotUpdate:
> > > > > > +#
> > > > > > +# @keyslot:         If specified, will update only keyslot wit=
h this index
> > > > > > +#
> > > > > > +# @old-secret:      If specified, will only update keyslots th=
at
> > > > > > +#                   can be opened with password which is conta=
ined in
> > > > > > +#                   QCryptoSecret with @old-secret ID
> > > > > > +#
> > > > > > +#                   If neither @keyslot nor @old-secret is spe=
cified,
> > > > > > +#                   first empty keyslot is selected for the up=
date
> > > > > > +#
> > > > > > +# @new-secret:      The ID of a QCryptoSecret object providing=
 a new decryption
> > > > > > +#                   key to place in all matching keyslots.
> > > > > > +#                   null/empty string erases all matching keys=
lots
> > > > >=20
> > > > > I hate making the empty string do something completely different =
than a
> > > > > non-empty string.
> > > > >=20
> > > > > What about making @new-secret optional, and have absent @new-secr=
et
> > > > > erase?
> > > >=20
> > > > I don't remember already why I and Keven Wolf decided to do this th=
is way, but I think that you are right here.
> > > > I don't mind personally to do this this way.
> > > > empty string though is my addition, since its not possible to pass =
null on command line.
> > >=20
> > > IIUC this a result of using  "StrOrNull" for this one field...
> > >=20
> > >=20
> > > > > > +# Since: 5.0
> > > > > > +##
> > > > > > +{ 'struct': 'LUKSKeyslotUpdate',
> > > > > > +  'data': {
> > > > > > +           '*keyslot': 'int',
> > > > > > +           '*old-secret': 'str',
> > > > > > +           'new-secret' : 'StrOrNull',
> > > > > > +           '*iter-time' : 'int' } }
> > >=20
> > > It looks wierd here to be special casing "new-secret" to "StrOrNull"
> > > instead of just marking it as an optional string field
> > >=20
> > >    "*new-secret": "str"
> > >=20
> > > which would be possible to use from the command line, as you simply
> > > omit the field.
> > >=20
> > > I guess the main danger here is that we're using this as a trigger
> > > to erase keyslots. So simply omitting "new-secret" can result
> > > in damage to the volume by accident which is not an attractive
> > > mode.
>=20
> Right. It's been a while since I discussed this with Maxim, but I think
> this was the motivation for me to suggest an explicit null value.
>=20
> As long as we don't support passing null from the command line, I see
> the problem with it, though. Empty string (which I think we didn't
> discuss before) looks like a reasonable enough workaround to me, but if
> you think this is too much magic, then maybe not.
>=20
> > Thinking about this again, I really believe we ought to be moire
> > explicit about disabling the keyslot by having the "active" field.
> > eg
> >=20
> > { 'struct': 'LUKSKeyslotUpdate',
> >   'data': {
> >           'active': 'bool',
> >           '*keyslot': 'int',
> >           '*old-secret': 'str',
> >           '*new-secret' : 'str',
> >           '*iter-time' : 'int' } }
> >=20
> > "new-secret" is thus only needed when "active" =3D=3D true.
>=20
> Hm. At the very least, I would make 'active' optional and default to
> true, so that for adding or updating you must only specify 'new-secret'
> and for deleting only 'active'.

Is that asymmetry really worth while ? It merely saves a few
characters of typing by omitting "active: true", so I'm not
really convinced.

>=20
> > This avoids the problem with being unable to specify a null for
> > StrOrNull on the command line too.
>=20
> If we ever get a way to pass null on the command line, how would we
> think about a struct like this? Will it still feel right, or will it
> feel like we feel about simple unions today (they exist, we would like
> to get rid of them, but we can't because compatibility)?

Personally I really don't like the idea of using "new-secret:null"
as a way to request deletion of a keyslot. That's too magical
for an action that is so dangerous to data IMhO.

I think of these operations as activating & deactivating keyslots,
hence my suggestion to use an explicit "active: true|false" to
associate the core action being performed, instead of inferring
the action indirectly from the secret.

I think this could lend itself better to future extensions too.
eg currently we're just activating or deactivating a keyslot.
it is conceivable in future (LUKS2) we might want to modify an
existing keyslot in some way. In that scenario, "active" can
be updated to be allowed to be optional such that:

 - active: true ->  activate a currently inactive keyslot
 - active: false -> deactivate a currently active keyslot
 - active omitted -> modify a currently active keyslot

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


