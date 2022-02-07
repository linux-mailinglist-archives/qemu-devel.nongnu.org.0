Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B4E4AB345
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 03:02:35 +0100 (CET)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGtMP-0005Xh-M4
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 21:02:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nGtFM-0002ie-PQ; Sun, 06 Feb 2022 20:55:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:36211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nGtFI-0006Mf-Kq; Sun, 06 Feb 2022 20:55:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JsTjg3TWHz4xPv; Mon,  7 Feb 2022 12:55:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644198903;
 bh=C/x2Nf/whMqTPEnWaYfdEHMYBHLoOS+TqKzYoJiblaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VuygTotCktZSuX+qWaEPqhxwff/NOFo1SpKhX/ACjaZ9999Th5yPgD75D/IsEnQG8
 PTKf3+7fPimX6FX3cfZH3rGy3jcRdwB14HYN9a+7/DEST2FLyrN78JM+DgEcIIrfTR
 +xDP3qKpVSSqUmwwAy3yPk4+1qU8/PEVq4uppK5s=
Date: Mon, 7 Feb 2022 12:54:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
Message-ID: <YgB74ak6QGuAd22y@yekko>
References: <20220129065007.103681-1-npiggin@gmail.com>
 <21b0c97c-3963-518c-e910-eb8264fe74a9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jXUNc2uqWp6FZ8M5"
Content-Disposition: inline
In-Reply-To: <21b0c97c-3963-518c-e910-eb8264fe74a9@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jXUNc2uqWp6FZ8M5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 04:10:34PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 1/29/22 03:50, Nicholas Piggin wrote:
> > The behaviour of the Address Translation Mode on Interrupt resource is
> > not consistently supported by all CPU versions or all KVM versions.  In
> > particular KVM HV only supports mode 0 on POWER7 processors, and does
> > not support mode 2 on any processors. KVM PR only supports mode 0. TCG
> > can support all modes (0,2,3).
> >=20
> > This leads to inconsistencies in guest behaviour and could cause
> > problems migrating guests.
> >=20
> > This was not too noticable for Linux guests for a long time because the
> > kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
> > advisory (KVM would not always honor it either) and it kept both sets of
> > interrupt vectors around.
> >=20
> > Recent Linux guests depend on the AIL mode working as defined by the ISA
> > to support the SCV facility interrupt. If AIL mode 3 can not be provide=
d,
> > then Linux must be given an error so it can disable the SCV facility.
>=20
> Is this the scenario where migration failures can occur? I don't understa=
nd
> what are the migration problems you cited that were possible to
> happen.

The problem case (well, the main one) is migrating from qemu on a
recent KVM running with AIL=3D=3D3 to qemu on an older KVM (or PR) where
AIL=3D=3D3 doesn't work properly.

Theoretically, a qemu running with AIL=3D=3D2 on TCG to a qemu running on
KVM is also a problem, though it's not going to arise in practice,
since AFAIK no guests we care about use AIL=3D=3D2.

> > Add the ail-modes capability which is a bitmap of the supported values
> > for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
> > a new KVM CAP that exports the same thing, and provide defaults for PR
> > and HV KVM that predate the cap.
>=20
> Why add a new machine cap in this case? Isn't something that the KVM capa=
bility
> should be able to handle by itself, where we always assume that we should=
 have
> the best AIL value possible?

Because the "best AIL possible" might change across a migration.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jXUNc2uqWp6FZ8M5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIAe9oACgkQgypY4gEw
YSIJcg//cOX8T8zywP8Om1pg6LXe1Xn3e5EpLN2PnHiKzA8ieDRpZ5MZ7P4JRxiN
spCgApfD4U+UnOZwcZDHIY3gqgPYMqFdMHhYDBKMqQPx9/v8GYFaHZI5T47/InBz
dSY9i/yt4u4ukFVlZm6hj1HAUDxYJPiR9D8w0rDyi+zfv5g/BKVhzcrQJb3w2JRa
O/vUufh1MffAVmyRsSkfB6MsuNlf256MiNyCl6OJdsIkYG6P99Bfw5T6xAXyp6G0
vVcLYOV6BETj0lu4NRfPec8NR4AmDH5KvFAMgyW1E+KIjcMGHq8nrNGh5JgGoRXh
OIu/VAAfxWnHSZvJkH8JQbA86u1M0zVQLlCJaih5L0VdmatOk9gPxipfG8EgGdxa
xkKzAny6FfMn57JnOu7xu0sr3ir6ic9L//s5NITEW+kvI7ETO51SSPo254Ex98+D
mkxKpUZ4MMeWueotEpe/+xMPy/0SJdET6Nb7nv+9OnaHfWDbbvUAe1lFQ63LXb3d
X0ftSbiDOKxC3aPWKc5IEOSN64zr+kGs11oHqZjoK9JksDREYbhu03tNNicjstiX
LZ1sveZwOqV7lXKG1gJLiAOecz1Z5OVWfooHM9+iWRXTTdyO+K5ticI8beHw7mRm
dq40lY6dDancBKoHhzWXv7FM2iSnrLTJyBMVj40VA7d/oqV3PCo=
=5AfU
-----END PGP SIGNATURE-----

--jXUNc2uqWp6FZ8M5--

