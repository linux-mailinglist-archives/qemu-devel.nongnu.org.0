Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A95F324A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 17:05:26 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofN0X-0001YD-Ab
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 11:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofMwN-0007yP-He
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 11:01:09 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:36951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofMwI-0005PZ-K6
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 11:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=A6A1tGbBR0ipj0XJuzp+jxkq+HulOtmA4LMtAdZaHX4=; b=BucmbYy62yU/j6eRLnvelMUyvO
 AkQvtKjM7KYtqQxdzX7ktgltrrjwGAGgqHo8sJ4Mmah3JPbcqND4QoKcrj4z8HtPVBH+z3ktuLb/f
 WUW3AUxwuPko/FYkG+kBNELx3seNCDpvlg2xrzSw/zIrykev+ym/QpjnGyLqu04B55hfvr7Gd7rsl
 +/j9xKcIll0KwMJu1rbN4NMSNhQUQvPFpJ3ypUDlCFLDO12LALb9/YqN94wQBhN5X+0ZqyKbKH6Y/
 u2ja2uswZLWgsLD5m+l4mUSLg0qrcPEMZHcML4SlNr1Bb4P4wp0yUN58zH7YlRAn1BnzOgj5eyt1Q
 yyN6/EYLioXsBfT6TJ9Tmc80eDM5rI+qQ1+z0m0MmtGlKCZO6KpsLjLTwYFcw3D4fqZL65sotI3vG
 AXNYm9wsQK1seDbs1wcZQiBmhhgENW3C+yeDuqFdR7jvtJM1S757Ifwwwhgryn4c0yGHCmMqKUmY2
 6dBFshCbP3pG+RThyHletoFiNQlyi+jh2eUFb1qbpl8CvRi5PxDPA7BQlVs0P5C68ce5yH4/ZMZdL
 mfQYuJ/RjkzyAdWF7eq72deZxadDXDdrk62HCfEvLmaIge5V9P0VIAjQGEV5TewIi9w5do5wex1t3
 c7SFMVd29szK8CMdTkmB+95nmxwI4Hh8F/W/Tmk2A=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] net: improve error message for missing netdev backend
Date: Mon, 03 Oct 2022 17:00:59 +0200
Message-ID: <33977161.gUOJYfmdpQ@silver>
In-Reply-To: <YzrafHjJoFK/Orip@redhat.com>
References: <20221003100612.596845-1-berrange@redhat.com>
 <2257290.J6gMhxssjS@silver> <YzrafHjJoFK/Orip@redhat.com>
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
X-Mailman-Version: 2.1.29
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

On Montag, 3. Oktober 2022 14:50:04 CEST Daniel P. Berrang=E9 wrote:
> On Mon, Oct 03, 2022 at 02:46:04PM +0200, Christian Schoenebeck wrote:
> > On Montag, 3. Oktober 2022 12:06:12 CEST Daniel P. Berrang=E9 wrote:
> > > The current message when using '-net user...' with SLIRP disabled at
> > >=20
> > > compile time is:
> > >   qemu-system-x86_64: -net user: Parameter 'type' expects a net backe=
nd
> > >   type
> > >=20
> > > (maybe it is not compiled into this binary)
> >=20
> > Is this intended as alternative to Marc-Andr=E9's previous patch?
>=20
> This is a patch that should be applied regardless of any other change,
> because the error message we report here today is awful and needs
> improving.
>=20
> >                                                                  If yes,
> >                                                                  then
> >=20
> > same applies here: what about people not passing any networking arg to
> > QEMU? They would not get any error message at all, right?
>=20
> Yes, I mentioned that in the text that you've quoted below....

Yeah, missed that one, sorry.

> > > An observation is that we're using the 'netdev->type' field here which
> > > is an enum value, produced after QAPI has converted from its string
> > > form.
> > >=20
> > > IOW, at this point in the code, we know that the user's specified
> > > type name was a valid network backend. The only possible scenario that
> > > can make the backend init function be NULL, is if support for that
> > > backend was disabled at build time. Given this, we don't need to cave=
at
> > > our error message with a 'maybe' hint, we can be totally explicit.
> > >=20
> > > The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> > > user friendly error message text. Since this is not used to set a
> > > specific QAPI error class, we can simply stop using this pre-formatted
> > > error text and provide something better.
> > >=20
> > > Thus the new message is:
> > >   qemu-system-x86_64: -net user: network backend 'user' is not compil=
ed
> > >   into
> > >=20
> > > this binary
> >=20
> > And why not naming the child, i.e. that QEMU was built without slirp?
>=20
> There are several network backends that can be conditionally disabled
> at build time, and IMHO its overkill to give a different message for
> each one. This message is sufficient to show users where to go next.

Yes, but that is not a user friendly error message, especially for people w=
ho=20
never dealt with QEMU's networking options before. That message does not ma=
ke=20
it obvious how to find the solution IMO.

What about a web link to the QEMU networking docs where this issue could th=
en=20
be clarified in a more user friendly manner? #anchors_are_cheap

> > > The case of passing 'hubport' for -net is also given a message remind=
ing
> > > people they should have used -netdev/-nic instead, as this backend ty=
pe
> > > is only valid for the modern syntax.
> > >=20
> > > Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> > > ---
> > >=20
> > > NB, this does not make any difference to people who were relying on t=
he
> > > QEMU built-in default hub that was created if you don't list any -net=
 /
> > > -netdev / -nic argument, only those using explicit args.
>=20
> .... here.
>=20
>=20
>=20
> With regards,
> Daniel



