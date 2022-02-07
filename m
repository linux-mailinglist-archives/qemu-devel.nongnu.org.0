Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED74AB346
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 03:02:35 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGtMQ-0005ZE-7d
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 21:02:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nGtFM-0002id-Ut; Sun, 06 Feb 2022 20:55:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:37945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nGtFH-0006Lx-OA; Sun, 06 Feb 2022 20:55:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JsTjg3Ks2z4xcl; Mon,  7 Feb 2022 12:55:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644198903;
 bh=dtafXlnjYhwMcJ0OgRXmDFa5KX/nYbkeEOpZKW+CbZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ehbaV0jk87oF2NQ/PebWqLkoL7jUFEOx3bVHokqevk0rvqLuCrLXngC8FK1a5JEvq
 aI++dmWJUTzKf7qfI1ZEUhkhUDIfewpZ7hDRNCUKpK5CScmQ80GCO8nztd7QgI3QzK
 rzDdqNXo0oj8UwDBAanyZMkD2V0U4SRgxiEraFc8=
Date: Mon, 7 Feb 2022 12:50:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
Message-ID: <YgB67Ldk2SRKpOCN@yekko>
References: <20220129065007.103681-1-npiggin@gmail.com>
 <87y22vdhuj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="78AOLwJIoPjxyH2K"
Content-Disposition: inline
In-Reply-To: <87y22vdhuj.fsf@linux.ibm.com>
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


--78AOLwJIoPjxyH2K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 12:51:00PM -0300, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
> > The behaviour of the Address Translation Mode on Interrupt resource is
> > not consistently supported by all CPU versions or all KVM versions.  In
> > particular KVM HV only supports mode 0 on POWER7 processors, and does
> > not support mode 2 on any processors. KVM PR only supports mode 0. TCG
> > can support all modes (0,2,3).
> >
> > This leads to inconsistencies in guest behaviour and could cause
> > problems migrating guests.
> >
> > This was not too noticable for Linux guests for a long time because the
> > kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
> > advisory (KVM would not always honor it either) and it kept both sets of
> > interrupt vectors around.
> >
> > Recent Linux guests depend on the AIL mode working as defined by the ISA
> > to support the SCV facility interrupt. If AIL mode 3 can not be provide=
d,
> > then Linux must be given an error so it can disable the SCV facility.
> >
> > Add the ail-modes capability which is a bitmap of the supported values
> > for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
> > a new KVM CAP that exports the same thing, and provide defaults for PR
> > and HV KVM that predate the cap.
> > ---
> >
> > I just wanted to get some feedback on the approach before submitting a
> > patch for the KVM cap.
>=20
> Could you expand a bit on what is the use case for setting this in the
> QEMU cmdline? I looks to me we already have all the information we need
> with just the KVM cap.

The problem is that changing guest visible behaviour based on a KVM
cap is a no-no.  It causes grief with migration, because the basic
assumption of qemu's migration model is that identically configured
machines are migration compatible, but that's no longer the case if
the machine's behaviour can be altered by host properties like a KVM
cap.

In this specific case, I can see one approach that *might* avoid the
need for an spapr cap.  That would be to declare that we were always
(at least since the AIL setting hypercall was introduced) "supposed"
to support AIL modes 0 and 3 and the fact that we didn't on certain
hosts was simply a bug.  Then we could start enforcing this and simply
error outrun at all on host where KVM doesn't support those modes.
The trade-off, obviously, is that we'd now fail on certain setups
which previously worked (albeit in a fragile way).

You'd also need to enforce that the guest not select AIL mode 2, of
course.  That's technically an incompatible breaking change, but I
think it's one we could get away with, since the vast majority of
setups in practice never worked with it anyway.  If you did want to
add support for AIL mode 2, then you'd need an spapr cap.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--78AOLwJIoPjxyH2K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIAeuUACgkQgypY4gEw
YSLp2hAAowt5jeGjcNAQQltbEgJDULwXl06cBbKbvhn/nT81I8dgzXYJCD/oEHnu
Rldkd36PwM8AWl25M3DaAPteidFY6eLrvL8YvceaWQ/H9Azm/I8xoypzvNQLbkFk
9F9Ft/NslXJ/KOwZhA7X5D+H0ORq3Dsnw13Qepc64n1UrgvX3zFQ5mHh1ZuqTdXE
xWD3q6J/NCDKOvlQL57Qine9gC0rsIA8x1X1vY4IEKPYBkEhmpIosFKY5WQH+SQO
+B8/rX2F/aIb3Ngx4PxKS/ZzH4YiDNeRu7yj2sBFDH/+EkC0DA9gmv0fb1dvJriI
yeqOQWHAUiLVyKXscpD+EJ2TFLZoA7YarINi7V28l8bbMsMv7//6ulQr53sK34FE
hNWRn/k+6oA/fk/QI3fUDYVnYdgObmCgzyTUV/0Itfg2//Hqlc6WIzKlUO90Y+6F
mwQddU6SzQZw+u4vkZ2L9BmjIC0vF+I39VXseodih0SCE9HJxCpZhs/yKz0lwc4n
kJlY58Cs7yaaoq9KlP2rrVkCQtAKIXImh8tLwywn1QwBxY9yrAKLxiv+AvN+03cs
/F1nJn/SwSrbRXRih34T/cc+v31nZE6JW58TsvrYT3E8OX01/zUPI4423aKesaUM
3SJjt4b7LQ2h2TaHWwgsrhH2NcwnMUDGcIPTPZsZ4IL+iXqG7M4=
=bXqz
-----END PGP SIGNATURE-----

--78AOLwJIoPjxyH2K--

