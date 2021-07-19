Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B03CCE76
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:25:11 +0200 (CEST)
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5NeI-0006oQ-1C
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5Naa-0004cJ-6c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:21:20 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5NaW-0004FF-VF
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:21:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GStYZ4HD8z9sRN; Mon, 19 Jul 2021 17:21:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626679266;
 bh=jU+NUshFWOuhQIYP3+QC5b9CoHDVPBwPEpkghTnWOyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSib1XbXdJkKrlb+eI6Pw+lBROxVMcJj7OgADpfd3M9gaOMWElWI9Q/Xxjf2ORQ+w
 UpB4hr1bYDbveUrRHW5fyq1/shVDCec3V1yDe6Yrrc6X3MrtHG263NtR1L0oogW96j
 KCUHIXllOdANeqMPpjW01S5iyA2J5XkFsSgBumJ0=
Date: Mon, 19 Jul 2021 17:20:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: spapr_events: Sure we may ignore migrate_add_blocker() failure?
Message-ID: <YPUn2quWrztTqyML@yekko>
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7MBMVq1HYt6vV1dJ"
Content-Disposition: inline
In-Reply-To: <87lf62ydow.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7MBMVq1HYt6vV1dJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 09:18:07AM +0200, Markus Armbruster wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Jul 15, 2021 at 03:32:06PM +0200, Markus Armbruster wrote:
> >> Commit 2500fb423a "migration: Include migration support for machine
> >> check handling" adds this:
> >>=20
> >>     ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, &local=
_err);
> >>     if (ret =3D=3D -EBUSY) {
> >>         /*
> >>          * We don't want to abort so we let the migration to continue.
> >>          * In a rare case, the machine check handler will run on the t=
arget.
> >>          * Though this is not preferable, it is better than aborting
> >>          * the migration or killing the VM.
> >>          */
> >>         warn_report("Received a fwnmi while migration was in progress"=
);
> >>     }
> >>=20
> >> migrate_add_blocker() can fail in two ways:
> >>=20
> >> 1. -EBUSY: migration is already in progress
> >>=20
> >>    Ignoring this one is clearly intentional.  The comment explains why.
> >>    I'm taking it at face value (I'm a spapr ignoramus).
> >
> > Right.  The argument isn't really about papr particularly, except
> > insofar as understanding what fwnmi is.  fwnmi (FirmWare assisted NMI)
> > is a reporting mechanism for certain low-level hardware failures
> > (think memory ECC or cpu level faults, IIRC).  If we migrate between
> > detecting and reporting the error, then the particulars we report will
> > be mostly meaningless since they relate to hardware we're no longer
> > running on.  Hence the migration blocker.
> >
> > However, migrating away from a (non-fatal) fwnmi error is a pretty
> > reasonable response, so we don't want to actually fail a migration if
> > its already in progress.
> >
> >>    Aside: I doubt
> >>    the warning is going to help users.
> >
> > You're probably right, but it's not very clear how to do better.  It
> > might possibly help someone in tech support explain why the reported
> > fwnmi doesn't seem to match the hardware the guest is (now) running
> > on.
>=20
> Perhaps pointing to the actual problem could help: the FWNMI's
> information is mostly meaningless.

Sorry, I don't follow what you're suggesting.

>=20
> >> 2. -EACCES: we're running with -only-migratable
> >>=20
> >>    Why may we ignore -only-migratable here?
> >
> > Short answer: because I didn't think about that case.  Long answer:
> > I think we probably shoud ignore it anyway.  As above, receiving a
> > fwnmi doesn't really prevent migration, it just means that if you're
> > unlucky it can report stale information.  Since migrating away from a
> > possibly-dubious host would be a reasonable response to a non-fatal
> > fwnmi, I don't think we want to simply prohibit fwnmi entirely with
> > -only-migratable.
>=20
> I think the comment text and placement could be improved to make clear
> ignoring this failure is intentional, too.  How do you like the
> following?

That's fair..

>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index a8f2cc6bdc..54d8e856d3 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -911,16 +911,14 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool reco=
vered)
>          }
>      }
> =20
> +    /*
> +     * Try to block migration while FWNMI is being handled, so the
> +     * machine check handler runs where the information passed to it
> +     * actually makes sense.  This won't actually block migration,
> +     * only delay it slightly.  If the attempt fails, carry on.
> +     */
>      ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
>      if (ret =3D=3D -EBUSY) {
> -        /*
> -         * We don't want to abort so we let the migration to continue.
> -         * In a rare case, the machine check handler will run on the tar=
get.
> -         * Though this is not preferable, it is better than aborting
> -         * the migration or killing the VM. It is okay to call
> -         * migrate_del_blocker on a blocker that was not added (which the
> -         * nmi-interlock handler would do when it's called after this).
> -         */
>          warn_report("Received a fwnmi while migration was in progress");
>      }

LGTM.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7MBMVq1HYt6vV1dJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD1J9UACgkQbDjKyiDZ
s5JYLA/+O2s+aFQVqf5Uo8T3JA9WWcTPraIbLCDzrriYr9FMyc2K5zC+H00v6rTf
FnjhlKwF+2zfxGLYu9b6jHwfo+MD2L5yyMRV0jYODjuvLYF8VLEIUeL2tRrZQv9u
37RHZbKafPwGpDVl/kowSxWOvv5asO/Ih7+xBaiXfCtSoCfnvpcltfhcEZIKDizZ
x0Q/gKmlAvogh8lx9Homlcdh6Sih59Lb4FKQMjHeN2k+HJ5Kaq5YDgdRMbU6KZDM
iLYBmLg4aL7JC8jWO6qYMa9peg1zmPUdlwsR/UJmDwQgvJfJCE5rr6FncH6OQUmv
WQlN+ciREUUlH/LW/Nhhu3WX001Ics5ibyB+7y72okDsilZI8JVxzv/BXsTTMRm3
u1ozIrqxpAQmHKbN65WWHdhVXYqRyhGYo2S0gqWStKjLFSylFHWn7CCFewC9fmCf
SDPHO6AqmFodJf4Cic/yPIFzrLmLCag/O4XH8jV4apM0MQzg0cQ9CixrO3xli6+Y
nNe9y6GSCoLBzUGsJ0qxHczZ5MoF2yzrnXFOfGMZOT95F7lVZEdQQJpSEldGuwnU
HTD1vrpc+tqqjyBvhorzVFr1F1HDj7BhH+BBGaF0mWVT2aS66tOP9fYAqTtyssx2
zozswdCO/+3aqCxJNtKte5+hm0ed6exsnqrCbq703EsXrf0UK04=
=lPkt
-----END PGP SIGNATURE-----

--7MBMVq1HYt6vV1dJ--

