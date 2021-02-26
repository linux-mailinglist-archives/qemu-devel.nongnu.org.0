Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DEA326213
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:42:52 +0100 (CET)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbWF-0002t0-5E
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lFbUh-0002R2-Bw
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:41:15 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:55027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lFbUf-0005AM-Aa
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=MM25wh+Tj4tUHy2pxZMwLdZQjdVkfETyM0/Xek7PHq0=; b=IAax8yLHPk3IEHX2wJTt6JriOd
 jFX7KiuOHRa7Uawwcj/5JZpyRplXZAFSIJlD6W2TldW2RhXYlDjNz837nD/fX8EsrH4kY30xWkhGw
 0miOd8ImIFaf79/GFH+nhf8KL3JX3lB7wo2zu/SZwFNcvv/Z3QocDvwmCE7V6+eQkqb4oGAdnop3V
 n2ro9qrKMUNt35QQchy0N6SVjEbbC6neG4NQR680eA9A/BFe8ST5qLvGOEfrYdkSjcTrhpnHTni7/
 4K98ewrv8uTKbMAe6ueX1pnvtKxVJg12wArgUiiRfolMf0KJsgqyFFoHCMy0CcA6FmHcmCajfPNmq
 Q0QUdTEH/cKZCQ90RCgenDU6hJUDJ7F+qW6n5rGA3QDoGqbV2E785MDQYJ4O3m8faX+nioaD8lQIK
 fZjx/8W2Kd3AauQZWtFGG/9r9bWUTagr5y8FDSiNvNbOs38e/cWYIey+I0gV2UV+vi7toIXoDB5b1
 WAGoW4onu2hKGaNoSbv6iLMFm1seT9X5WNw59YUMMAmxARnzsKQDgeJcd052+AOwLbqdBcDDyJcsM
 AuLB9x9MEQ2Z2sYphYF/4St4/ouAql1RFs1cT66DONZ3v5u/K518y2YtqOTaVzU4I5vcCLN1TXF5M
 U2YfdpsbmPEn4JIeR4Ps39ZabCMnmsQnFvX6+CLVk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Geoffrey McRae <geoff@hostfission.com>,
 =?ISO-8859-1?Q?Jos=E9?= Pekkarinen <koalinux@gmail.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Date: Fri, 26 Feb 2021 12:40:26 +0100
Message-ID: <5436901.4e4U2xeZI5@silver>
In-Reply-To: <20210225084855.lfyv6ybkcctgulo7@sirius.home.kraxel.org>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <31652865.Htn8XJslzA@silver>
 <20210225084855.lfyv6ybkcctgulo7@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 25. Februar 2021 09:48:55 CET Gerd Hoffmann wrote:
> On Wed, Feb 24, 2021 at 11:33:14PM +0100, Christian Schoenebeck wrote:
> > On Mittwoch, 24. Februar 2021 23:04:47 CET Geoffrey McRae wrote:
> > > This goes against how all standard jack clients work, a new jack clie=
nt
> > > should not auto-connect at all unless explicitly configured to as if
> > > there is an existing audio diagram configured (which is 99% of the ti=
me)
> > > it will cause unexpected/undesired behavior.
> > >=20
> > > Jack is not supposed to be an 'automatic' system, it's the
> > > responsibility of the patch bay software to route connections.
> > >=20
> > > The auto-connect feature exists to allow the jack audiodev to re-conn=
ect
> > > a broken connection when the jack device restarts/reconnects.
> >=20
> > Well, that was also my idea first, and I would agree with you in case o=
f a
> > regular music app of course, but then I thought QEMU is probably not an
> > average JACK client, and it simply lowers the entry level for new users
> > who
> > probably just want to output to system out anyway.
>=20
> Well, I guess there is more software like that, any music player for
> example.  I don't think this is a good reason for qemu to have
> non-standard behavior.  If you want qemu autoconnect, you can use the
> connect-ports option.
>=20
> Beside that I'd expect the patch bay software is able to remember the
> routing configuration per application, so the setup would be a one-time
> thing you don't have to re-do on every qemu launch.  Not fully sure this
> is actually the case though, I'm not a regular jack user.
>=20
> take care,
>   Gerd

Yes, a JACK client with patchbay functionality like QJackCtl stores and=20
restores individual connections. You need to start it each time for doing t=
hat=20
though.

JACK clients with consumer purpose often auto connect to system ports by=20
default because their users mostly use JACK just as a consumer desktop soun=
d=20
server. And I assume this applies to Jos=E9 as well.

Whereas JACK clients intended for musicians typically don't, because their=
=20
common use case is to pipe audio through several music apps in their person=
al,=20
and very custom way.

Then there are also a bunch of JACK clients with built-in support for some =
of=20
the available session management standards. In this scenario you have anoth=
er=20
app, a session manager, which not only takes care about connections, but al=
so=20
actually starts all individual JACK client apps with their respective previ=
ous=20
internal configurations.

Best regards,
Christian Schoenebeck



