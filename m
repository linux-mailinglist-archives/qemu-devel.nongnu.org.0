Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26B2324333
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:32:43 +0100 (CET)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEy1i-0007Yt-Gp
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lExyu-0006Ee-Co
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:29:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:55189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lExyp-0000a5-Bu
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=cfld9iqQqB8zEmqw3OtX+VEwv5dIhK7gDXNdydRlBRc=; b=MlrQYFCLpq9DCxugQNSJarKUs6
 b6E2XBdPDM7w3E69/Oc5zOl7GEqaqAy/hU1K9+UTbxcjor0ulzadfI8Yahvc/gyRHs0pCC/XmqoJX
 Jsasxy0fF9pjqC0n/yULoe2JD/hklB2A4vAYJHuXXt64+jIjwWpkuP4PoGt7oRNwqM7QcJMUDpjDA
 Wacb4UsI7aZXvAwgQuEe/j5egnCvdrEEarDeWk0MgG8eAbJCFX/7y77+tZbZj01TQYxAFh0CdFHgV
 R4AmY68SS9OP8uFpGmyDMSQoYy9VRrUU3YHtCDLXshOOSBvinjK++YzIyHYS9kQvpiY4aFe2pQQkQ
 amNCgfd+2Yy/3wV125EF7UpQRdKvwJNeYFVmFawiSGsob9rxvT8XrJ4bkYu9P7y61gfN4141LrkrF
 gxcHPbsyQxXPl6VjhR3T+lSkMGj692jZPEOSOs99AbrTqbObY03JdTlqQd2ZpUP+JW7ajn4whmHc7
 XXrbfdpn00qdAPrYq6hLPS7TIMDD1hKSwJUBEXQJ4Pib//1l+MmytX1eN/N895I9L/kRypQihfB4S
 wVg6KB/TAmzHPQfo0MSTfACzYRUPu7XNzfFKlIywnIvXad66fKcWykhda9/Q9EMNBo2xQ++udbW1u
 1IULmOKhV6SiVptG10vFNJQRo5a3KJ2YTf9WshgK8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Jos=E9_Ram=F3n_Mu=F1oz?= Pekkarinen <koalinux@gmail.com>,
 Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com
Subject: Re: [PATCH] Autoconnect jack ports by default
Date: Wed, 24 Feb 2021 18:29:34 +0100
Message-ID: <10027779.MNeJ0xqg2j@silver>
In-Reply-To: <CANWZPg+agYD3bXBPsEYG8txZqV6UwT3piJY0kbKy4t0+8vutZA@mail.gmail.com>
References: <20210224154901.23901-1-koalinux@gmail.com>
 <4436341.rU913LdL3d@silver>
 <CANWZPg+agYD3bXBPsEYG8txZqV6UwT3piJY0kbKy4t0+8vutZA@mail.gmail.com>
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

On Mittwoch, 24. Februar 2021 17:47:03 CET Jos=E9 Ram=F3n Mu=F1oz Pekkarine=
n wrote:
> On Wed, 24 Feb 2021 at 18:40, Christian Schoenebeck <qemu_oss@crudebyte.c=
om>
> wrote:
> > On Mittwoch, 24. Februar 2021 17:16:58 CET Jos=E9 Ram=F3n Mu=F1oz Pekka=
rinen
> >=20
> > wrote:
> > > On Wed, 24 Feb 2021 at 17:49, Jos=E9 Pekkarinen <koalinux@gmail.com>
> >=20
> > wrote:
> > > > This patch provides a default value to connect
> > > > jack ports when the user don't specify connect-ports.
> > > >=20
> > > > Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
> > > >=20
> > > > Signed-off-by: Jos=E9 Pekkarinen <koalinux@gmail.com>
> > > > ---
> > > >=20
> > > >  audio/jackaudio.c | 15 ++++++++++++---
> > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> > > > index 3031c4e29b..a29b1ccba2 100644
> > > > --- a/audio/jackaudio.c
> > > > +++ b/audio/jackaudio.c
> > > > @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void
> >=20
> > *buf,
> >=20
> > > > size_t len)
> > > >=20
> > > >  static void qjack_client_connect_ports(QJackClient *c)
> > > >  {
> > > >=20
> > > > -    if (!c->connect_ports || !c->opt->connect_ports) {
> > > > +    if (!c->connect_ports) {
> > > >=20
> > > >          return;
> > > >     =20
> > > >      }
> > > >     =20
> > > >      c->connect_ports =3D false;
> > > >      const char **ports;
> > > >=20
> > > > -    ports =3D jack_get_ports(c->client, c->opt->connect_ports, NUL=
L,
> > > > -        c->out ? JackPortIsInput : JackPortIsOutput);
> > > > +    if (c->out) {
> > > > +        ports =3D jack_get_ports(c->client,
> > > > +            c->opt->connect_ports ? "system:capture_.*"
> > > > +                : c->opt->connect_ports,
> >=20
> > I think that should be the other way around:
> >         c->opt->connect_ports ? c->opt->connect_ports :
> >         "system:capture_.*"
>=20
>     I was thinking exactly the same when I was reading
> the patch, but in the way you hint it doesn't make it, so
> somewhere we may be taking the logic inverted.

I guess that's because the RegEx patterns are interchanged as well. Try:

if (c->out) {
	...
	c->opt->connect_ports ? c->opt->connect_ports : "system:playback_.*"
	...
} else {
	...
	c->opt->connect_ports ? c->opt->connect_ports : "system:capture_.*"
	...
}

Best regards,
Christian Schoenebeck



