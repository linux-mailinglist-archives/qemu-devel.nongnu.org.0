Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7E3CCCB2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:42:02 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KAL-0003Lz-AF
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5K6N-00017k-Rr
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:37:55 -0400
Received: from ozlabs.org ([203.11.71.1]:48001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5K6K-0002w8-Qw
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:37:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSnbv0zmhz9sRR; Mon, 19 Jul 2021 13:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626665867;
 bh=2H+8TXxLwLJJEynSQQ+9id2SAhxm0X4Mr4PYo9IrMt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7m9IQcFZnRZujySDvjrz01ieBLQmcOc3CVFGVQxLYS9SEAvVrF0P+HgtXB4PVhqN
 r0Xvx2QlC6p5TkTnFeI3qnUucri0gFGL7dGCZva32MhMaykTWVLIp2TkFoHu+JF8+O
 KPShbVwm+qyaFs/iA7UIELP73ZLN9CLjHTKXSZDY=
Date: Mon, 19 Jul 2021 12:31:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: spapr_events: Sure we may ignore migrate_add_blocker() failure?
Message-ID: <YPTj6ml6LoMJkypI@yekko>
References: <87tukvaejt.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TTbMrvlsdWrHCjGO"
Content-Disposition: inline
In-Reply-To: <87tukvaejt.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--TTbMrvlsdWrHCjGO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2021 at 03:32:06PM +0200, Markus Armbruster wrote:
> Commit 2500fb423a "migration: Include migration support for machine
> check handling" adds this:
>=20
>     ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_er=
r);
>     if (ret =3D=3D -EBUSY) {
>         /*
>          * We don't want to abort so we let the migration to continue.
>          * In a rare case, the machine check handler will run on the targ=
et.
>          * Though this is not preferable, it is better than aborting
>          * the migration or killing the VM.
>          */
>         warn_report("Received a fwnmi while migration was in progress");
>     }
>=20
> migrate_add_blocker() can fail in two ways:
>=20
> 1. -EBUSY: migration is already in progress
>=20
>    Ignoring this one is clearly intentional.  The comment explains why.
>    I'm taking it at face value (I'm a spapr ignoramus).

Right.  The argument isn't really about papr particularly, except
insofar as understanding what fwnmi is.  fwnmi (FirmWare assisted NMI)
is a reporting mechanism for certain low-level hardware failures
(think memory ECC or cpu level faults, IIRC).  If we migrate between
detecting and reporting the error, then the particulars we report will
be mostly meaningless since they relate to hardware we're no longer
running on.  Hence the migration blocker.

However, migrating away from a (non-fatal) fwnmi error is a pretty
reasonable response, so we don't want to actually fail a migration if
its already in progress.

>    Aside: I doubt
>    the warning is going to help users.

You're probably right, but it's not very clear how to do better.  It
might possibly help someone in tech support explain why the reported
fwnmi doesn't seem to match the hardware the guest is (now) running
on.

> 2. -EACCES: we're running with -only-migratable
>=20
>    Why may we ignore -only-migratable here?

Short answer: because I didn't think about that case.  Long answer:
I think we probably shoud ignore it anyway.  As above, receiving a
fwnmi doesn't really prevent migration, it just means that if you're
unlucky it can report stale information.  Since migrating away from a
possibly-dubious host would be a reasonable response to a non-fatal
fwnmi, I don't think we want to simply prohibit fwnmi entirely with
-only-migratable.

> By the way, we leak @local_err on failure.  I'll post a patch, but I'd
> like my question answered first.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TTbMrvlsdWrHCjGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD04+gACgkQbDjKyiDZ
s5KFARAApu5S2HdWRkLNmWCzPSOob/UX2kXmIqsciAHPoCHRyv8o0heErc4dbpWh
xqZM96x8wA2cM77xbH8nhpCwbfpc6Lwx1vMw7ULtUWsgdisog8sF3iglzoEb3Tky
QJhEr6hoOgGmKb7+IAXZuN69Xxig+8kauP507nsJdIVAl6M2VZQn8vmX+yZHhC7y
28TDHSfhkYEgzT6EFsfLpRDRSKcwYffcXJ6+0cdNkMZXKMrdhySlNBgavUCmFlat
qqJr2s3Kt8kHaEwn7Thz8k8H0X6Fb3a5TQ1YLQeR95Hq/pPaOZJuk6ha8GyahWEm
7xfYdKZZpXjha14UUqxnmrUQmPgByqrKWxOK1RhR3nCo2omZR/wFv/fXXfzZ7uzf
Mb8/U7kUznQ43kqTvUZfYBcsBiOWBBlJu9FC1hQLvwMlU0E2opO0+IiNQDAFiwND
bFRRgS1Dn9lfV+76cm7baySd2naVBewocVlgGqIGKBbLtN4NsPY9zNlUqA1i7Re6
yVj6aJJKR2MloHUir7GLzMHvbRWh4PXMqSfAudlceEG1SntaDlldQoavRosvued6
y3KfJI8/CFGPHBNH+wEn3WfIstQ9HVkMmXIUvctb1iSFii5Jvo23SASDZ3wJG9ag
qQ0/aaWv5KhIMHRDeInev+P80UY1oVMdTp0j7Qpxj10LMsCCxcc=
=OPvu
-----END PGP SIGNATURE-----

--TTbMrvlsdWrHCjGO--

