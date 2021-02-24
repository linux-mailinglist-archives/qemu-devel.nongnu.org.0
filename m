Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C50632424D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:42:07 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExEj-0001ZC-TI
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lExCo-0000vA-IN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:40:06 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lExCj-0001AR-R6
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=UvqlarPrGs7hSELkoaaMsYVvc4YWqUQLDHNKQp0woho=; b=hyH1pjcpbchlQIR7zmDRQciXYw
 29BMYMimTkg8E4cMzTjAnt6LucUZTITAvx9vzg6GNp3oU4VykeOgOvQ3E4jmuDbVL7W4C/usv3Ecy
 yLKmfrlc2CYefG50Xp/dhPVHeZqV3x1UiqCbSQq8e5v9GBGyn8UmsPOkVpV3jGALQ0Z4iSLWMhNGL
 /nFB5fGpPYqZt3XrFjz12GcpThA4azL/0zy7cNcc8LiXgUn+bOPOVf5QiYqLlRZnz9P3GbklofaW3
 Nlh/AsTYlD13lFRdMYYg5EO+1uVTiENf5tLAtqWL7FwHwExRP3rtuqS/glRhqf8wq9pHs0AaEZxSW
 W3gIuxQa8JvfjZPehiFl6UJX1ve2xXwovJm0416SVR+revO53/DYRqwqB5PVZhrmw+Q0/b2g8zRY1
 rMxNCA8iMOymr5DtdEH1wN7g2RaXFktl59BGeUxWZV3UhSWGzXDhnOJU+MkTlpUSuo9MnB3jGg7LO
 Hf655ViBGPjo/T/BR8x3dWQqPUrDPCwP5IzTdaWp8oBvwJAw/bctSdRstRqbiLPf4F/2rqXY/c27A
 yA980K5099pqYyDr1cEztmhdHyIxLGrYoLgNu3fskh4EWAfQsbwPsYzMg21Ce46QrumfTJO070Awu
 LWh6B0TkNYeZYP9exnHPlPYf6LePVbXmUTwBHp0Pw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Jos=E9_Ram=F3n_Mu=F1oz?= Pekkarinen <koalinux@gmail.com>,
 kraxel@redhat.com, Geoffrey McRae <geoff@hostfission.com>
Subject: Re: [PATCH] Autoconnect jack ports by default
Date: Wed, 24 Feb 2021 17:39:38 +0100
Message-ID: <4436341.rU913LdL3d@silver>
In-Reply-To: <CANWZPgLxUNM3tPg6wxCt=v7Z-d+DN3J9EyTSV3dwv=uzWMnY0Q@mail.gmail.com>
References: <20210224154901.23901-1-koalinux@gmail.com>
 <CANWZPgLxUNM3tPg6wxCt=v7Z-d+DN3J9EyTSV3dwv=uzWMnY0Q@mail.gmail.com>
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

On Mittwoch, 24. Februar 2021 17:16:58 CET Jos=E9 Ram=F3n Mu=F1oz Pekkarine=
n wrote:
> On Wed, 24 Feb 2021 at 17:49, Jos=E9 Pekkarinen <koalinux@gmail.com> wrot=
e:
> > This patch provides a default value to connect
> > jack ports when the user don't specify connect-ports.
> >=20
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
> >=20
> > Signed-off-by: Jos=E9 Pekkarinen <koalinux@gmail.com>
> > ---
> >=20
> >  audio/jackaudio.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> > index 3031c4e29b..a29b1ccba2 100644
> > --- a/audio/jackaudio.c
> > +++ b/audio/jackaudio.c
> > @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void *buf,
> > size_t len)
> >=20
> >  static void qjack_client_connect_ports(QJackClient *c)
> >  {
> >=20
> > -    if (!c->connect_ports || !c->opt->connect_ports) {
> > +    if (!c->connect_ports) {
> >=20
> >          return;
> >     =20
> >      }
> >     =20
> >      c->connect_ports =3D false;
> >      const char **ports;
> >=20
> > -    ports =3D jack_get_ports(c->client, c->opt->connect_ports, NULL,
> > -        c->out ? JackPortIsInput : JackPortIsOutput);
> > +    if (c->out) {
> > +        ports =3D jack_get_ports(c->client,
> > +            c->opt->connect_ports ? "system:capture_.*"
> > +                : c->opt->connect_ports,

I think that should be the other way around:

	c->opt->connect_ports ? c->opt->connect_ports : "system:capture_.*"

> > +            NULL, JackPortIsInput);
> > +    } else {
> > +        ports =3D jack_get_ports(c->client,
> > +            c->opt->connect_ports ? "system:playback_.*"
> > +                : c->opt->connect_ports,

Same here:

	c->opt->connect_ports ? c->opt->connect_ports : "system:playback_.*"

right?

> > +            NULL, JackPortIsOutput);
> > +    }
> >=20
> >      if (!ports) {
> >     =20
> >          return;
> >=20
> > --
> > 2.26.2

Best regards
Christian Schoenebeck



