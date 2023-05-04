Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E136F795A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 00:49:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puhjj-000655-Hj; Thu, 04 May 2023 18:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1puhje-00064s-2d
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:47:38 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1puhjc-00082o-4V
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683240390; i=lukasstraub2@web.de;
 bh=0tinXPfyrQ2ln/ibUsFuDEneloeQHfv+Na/qPwqREQg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=DwImcvyyTFm3kj9p8ybVf2GdSn5j29npPjUwl8rI/JxApDW6sfC13pkPslQ5jQYWz
 9aTeZZjMSXrAHgRBK1hB91n5Uk2YYfZ4okfTVLkHyaiw1xLXFUGpoFTPAWZF8k78pM
 p6aSrTJXMkaL8MKNw0Hj6EjGg03uDrpc2bZqtL7cfgqb9W59s2lxheTxwTK6J92S+b
 V0r453KF2ovb0UNPy2zBF8F8Rb7RJzkS5qCXm+M4mQ7JlDiBu1eWIzWm8RSErs+t3N
 5NflooYHWy7ZReF+mUJLwe12yUQXuosBA+e2+q+0BIZkxk0EiNHklpNfHOKucG8XUS
 xgcINb4d6dRLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.112]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgANG-1qRHJo0gb0-00huN4; Fri, 05
 May 2023 00:46:30 +0200
Date: Fri, 5 May 2023 00:46:11 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, chen.zhang@intel.com, Peter
 Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Message-ID: <20230504224611.2ea16229@gecko.fritz.box>
In-Reply-To: <35dd6e24-543f-e36e-5130-4f1a92be6a40@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
 <20230504221054.616e4fe6@gecko.fritz.box>
 <35dd6e24-543f-e36e-5130-4f1a92be6a40@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wOj+OKmewFOUTvR2huRjKbM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BT5Lzjd2c9hg9P2bwUPm0tJ0EmTdd8CUiUEUX5Ri5whFz4rGkbb
 CJZitEfQafVOLKAD4Gz08R2uetRB3SZD+eyzHje9g8yHA4ejgykIzDRjU7XvKOK8EWhy54+
 qEbxQPFJ/MKeBla4j8/6dhhOaO14GpUuM0O+vFCO88bPOyxz7IElqOyUw7BkjE0l6eS/MDP
 disZtuErTJqz+6H2au8Cw==
UI-OutboundReport: notjunk:1;M01:P0:+I9iZaGtQZ4=;6FSMxYfJW2JOq3kgBcbO6M5VoM0
 5LUJDLKeOcXy02sxTGE5lnx93goEpgLAFp+DRT2/FQADkE2f37Q5C36uWUifL1ltjhwDloAiS
 A/wye68pjAg9XWIn1iVh1DdzaayG45NCNEnOySp1EAtLg7pog9oYs5E6epLKq8viBXKXbuWCG
 XsCiKY/ThOSlIyv62E3xPvCR6ZrAJ3h6cmkhNYaZ2C7VIaDfUMC4sws8lPws9VNwmqie2i+ze
 GtqrCnOLksgAo9UVdo6zLxwm0+9wjF+vis90fqd+EHkSAwFCWwCMaOdC6YbaCYZousqYbwruS
 P0jbxk2bTUgCRfyE37ts6bR1u+lpF+ryGSDjw1wFSKZ6jRfBjgY07ufH6qyszng9YWeSX5hNF
 PGsnRkbj6SgwNOCJ+bWHerIdjQCs6tssLswHu+/SIJAOrVgdjYwITHeld1w8cu24HrOJyN9vH
 qXModktEipyWLck5kGgMPquW0Qv8gO3TYRo9JCSNuNw+4jIZW8vTMfrN7H6CLmxehfPlnPjmt
 h3bOXnB7xA2cC4+NahipqrGvRLWQ6m+hVRjsXqqEi7iiZ8f+nbu86nooRt7LHhQPCyoyOZLl4
 vSqvkZXlCU2t8ylf5Jx2La5O88ARUiyD0MUdOZ5XAnhCwKSER2Oeg6LrIlQ3OaRxflJ7uuLMJ
 bzzr0B8sy54r+ygjL+NyJeBRPqBZtLavPRoHDBjx7R6ezJzLp6qOIthb6WLt3Ke+25D7wWxPl
 /5jL9ziZvnkC79GF6PRDiZRaLFvt7/xlqe2VBiyv+D1UN1yh9uM80CKOgQryewMh4WgBzhXsu
 JM27QgASdR4vm5yp+2KL1vr5+bcNXjwCuBKLUnrd/2y0bIGGIoUfMDRrciKIGtKEqBwJWPoUW
 DQiiMKUwqhoo7SnErSpvnZ3j7QSRQErQ4i7E/80u3VNXbgIkIH6DvLra0QY9MZxOGtvnDiYb8
 xzpATmQ6OFlsLPr+fBhvIpVSpKM=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/wOj+OKmewFOUTvR2huRjKbM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 5 May 2023 01:30:34 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> On 05.05.23 01:10, Lukas Straub wrote:
> > On Fri, 28 Apr 2023 22:49:28 +0300
> > Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> >  =20
> >> We generally require same set of capabilities on source and target.
> >> Let's require x-colo capability to use COLO on target.
> >>
> >> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru=
> =20
> >=20
> > Good patch, this is needed anyway for COLO with multifd.
> >=20
> > Also, it allows to remove a some code, like
> > migration_incoming_enable_colo(), qemu_savevm_send_colo_enable() etc.
> > I will send patches for that. =20
>=20
> Great! But with such changes we should be careful to not break compatibil=
ity between versions.. On the other hand, x-colo - is still experimental wi=
th that x-, so there is no guarantee how it works.

Given COLO's usecase, I think it should only be run with the same qemu
version on both sides anyway. Maybe we should even enforce that
somehow, while we're at it doing breaking changes.

For upgrading qemu without downtime, normal migration can still be used.

Zhang Cheng, what do you think?

> > Or you can do it if you like. =20
>=20
> To be honest, I don't :)
>=20
> >=20
> > Please update the docs like below, then:
> > Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> >=20
> > diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
> > index 8ec653f81c..2e760a4aee 100644
> > --- a/docs/COLO-FT.txt
> > +++ b/docs/COLO-FT.txt
> > @@ -210,6 +210,7 @@ children.0=3Dchilds0 \
> >  =20
> >   3. On Secondary VM's QEMU monitor, issue command
> >   {"execute":"qmp_capabilities"}
> > +{"execute": "migrate-set-capabilities", "arguments": {"capabilities": =
[ {"capability": "x-colo", "state": true } ] } }
> >   {"execute": "nbd-server-start", "arguments": {"addr": {"type": "inet"=
, "data": {"host": "0.0.0.0", "port": "9999"} } } }
> >   {"execute": "nbd-server-add", "arguments": {"device": "parent0", "wri=
table": true } }
> >  =20
>=20
> I'll resend with this addition, thanks for reviewing!
>=20
> >  =20
> >> ---
> >>   migration/migration.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/migration/migration.c b/migration/migration.c
> >> index 8c5bbf3e94..5e162c0622 100644
> >> --- a/migration/migration.c
> >> +++ b/migration/migration.c
> >> @@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
> >>       return -ENOTSUP;
> >>   #endif
> >>  =20
> >> +    if (!migrate_colo()) {
> >> +        error_report("ENABLE_COLO command come in migration stream, b=
ut c-colo "
> >> +                     "capability is not set");
> >> +        return -EINVAL;
> >> +    }
> >> +
> >>       if (ram_block_discard_disable(true)) {
> >>           error_report("COLO: cannot disable RAM discard");
> >>           return -EBUSY; =20
> >=20
> >=20
> >  =20
>=20



--=20


--Sig_/wOj+OKmewFOUTvR2huRjKbM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRUNbMACgkQNasLKJxd
sljugw//Z3HgSCuTrpjPkPv15evjQYm1ZDZiNFHGhXzb8Q7kudKNeHJYGIBN3+a6
1V4jN8Jn8eAfP7fzvUdAkat+IIBkmLfk1CicKFQT6DGTkC436eQ4lzYNg3sem0C+
8cZgjvkJcN8KzT75srLOwmgIksu3lkbDTrdwvRyCJA4nV29XR8qPdHW7FVIuIamV
aS1A/JHPhO+fkaxLqpOOUNlj8PpWaC9SB9gINSex8ttCTp0TWHCFQ7KsCisUqCS2
7OtoomLj3Yj6Ob64evPx6lrpD72QftaJQJmOJbVwFthySX+18ooouBBnfVfbYEfV
PxHtWp2mGlmFHOnTWRMR5Y7ZYJnGorGvtOwpCh75f4/2MTpyC4CPIc0NhkdYsAxt
xJrMGSEY4LULh7O/8iQcq6UsWV0RozKtD7rHrDk/t0uZDiCZuGiHFTcA63UN4+tN
KDNeRJzTC1DvTHz4o7xQ8GkZQaNhiFb2fdZmnHsaHdYR4U1zfFNyr+45CUApG1fB
XvfIuUzTiqkUR5wFsbj8Y1OzIUmFVYzHIti3xpHba5POU16/teLdJDJqrK81Mc5q
X2+st08VDTuV2O3ZnxGaU+jBNw3JjKvXxRv+L1Ghl+tyXI33/13zW/H1/3tMFfL5
UGwdbTybSwe/INhbOziGffKX8QFrJWNDBxRe+X301QzKs2K2dNY=
=H5b4
-----END PGP SIGNATURE-----

--Sig_/wOj+OKmewFOUTvR2huRjKbM--

