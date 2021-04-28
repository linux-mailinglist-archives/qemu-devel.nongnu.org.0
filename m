Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0436D4A1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:17:30 +0200 (CEST)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgK0-00042V-SQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbgI5-0003Su-FQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbgI0-00011E-7o
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619601322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VsEYpB6T4eYt8QvDLZV/q7qMrP9nlR0e9xB2TOsPwRk=;
 b=dYjryHwvs40lx4lgRbmsmno/HwoJZT1QsM6I8v7G2xXvDqr89KdOoKSah85RtTSv4UsGCC
 kSyDpxUiwjteuzzV7Gq9iYQ+oHz4eEZ7kNYTUMUyNhtb9DqSfrcg/RcZ27y3MhgHfPNNXJ
 zE9Pr74QSWYKuJCd9TBX3bORXozqtVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-5X86sswhP6GPdoR87BzFOw-1; Wed, 28 Apr 2021 05:15:20 -0400
X-MC-Unique: 5X86sswhP6GPdoR87BzFOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED965C73A0;
 Wed, 28 Apr 2021 09:15:18 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7174661093;
 Wed, 28 Apr 2021 09:15:18 +0000 (UTC)
Date: Wed, 28 Apr 2021 10:15:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
Message-ID: <YIknpUAyIn9hTzpl@stefanha-x1.localdomain>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
 <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hcrL76JLjT7MXaTH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hcrL76JLjT7MXaTH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 07:54:21PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/27/21 7:16 PM, John Snow wrote:
> > On 4/27/21 9:54 AM, Stefan Hajnoczi wrote:
> >> I suggest fixing this at the qdev level. Make piix3-ide have a
> >> sub-device that inherits from ISA_DEVICE so it can only be instantiate=
d
> >> when there's an ISA bus.
> >>
> >> Stefan
> >=20
> > My qdev knowledge is shaky. Does this imply that you agree with the
> > direction of Thomas's patch, or do you just mean to disagree with Phil
> > on his preferred course of action?
>=20
> My understanding is a disagreement to both, with a 3rd direction :)
>=20
> I agree with Stefan direction but I'm not sure (yet) that a sub-device
> is the best (long-term) solution. I guess there is a design issue with
> this device, and would like to understanding it first.
>=20
> IIUC Stefan says the piix3-ide is both a PCI and IDE device, but QOM
> only allow a single parent. Multiple QOM inheritance is resolved as
> interfaces, but PCI/IDE qdev aren't interfaces, rather abstract objects.
> So he suggests to embed an IDE device within the PCI piix3-ide device.
>=20
> My view is the PIIX is a chipset that share stuffs between components,
> and the IDE bus belongs to the chipset PCI root (or eventually the
> PCI-ISA bridge, function #0). The IDE function would use the IDE bus
> from its root parent as a linked property.
> My problem is currently this device is user-creatable as a Frankenstein
> single PCI function, out of its chipset. I'm not sure yet this is a
> dead end or I could work something out.

Kevin and Paolo previously pointed out that piix3-ide is sometimes used
with the Q35 machine type. The user-creatable piix3-ide device needs to
be deprecated before it can be dropped. That's a long process that
cannot fix the current crash any time soon.

I do support deprecating the user-creatable piix3-ide device in favor of
a proper Q35 Legacy IDE implementation. The main problem is this
involves a bunch of work and I'm not sure who would do it (the payoff is
not very high).

Stefan

--hcrL76JLjT7MXaTH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCJJ6UACgkQnKSrs4Gr
c8j5Uwf+PZdDtmYDsubljnyYBet5ljIddulfhISJ3UmE8ZsCKwWqbgD79NryVknU
hNM7tbzXg6No9AUnOar/3YF6g53Eyg1ZQ5yU4fRae2KB8aQjJeREf8t1Lg1eUWJf
hQFe/psNJ+qIWvEPklyoS8n9+5d/he0iRH+In7LLplTd3tME+i7vp2qWUz1bPGO8
pxwvIOiie4vG8jFdTBrZZqE79ijmL5dGpeV2bAObg5rAwtaeky7BbidRhplMx+u9
N+cvnqFCYVTZVLdnGwGERDiJjibamJulp0Tx0RIFse7up3c+ximreOdbnX/sj+oY
f/tJF+dJTnuX4oh/Cy3pdpLuVtp+iQ==
=dk3m
-----END PGP SIGNATURE-----

--hcrL76JLjT7MXaTH--


