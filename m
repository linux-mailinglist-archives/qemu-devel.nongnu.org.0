Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD093377BF9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 07:55:37 +0200 (CEST)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfytB-0005i2-Ke
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 01:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lfyrp-0003qk-NA; Mon, 10 May 2021 01:54:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48891 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lfyrn-00013D-Nh; Mon, 10 May 2021 01:54:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FdqxK1hq0z9vFw; Mon, 10 May 2021 15:53:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620626037;
 bh=S8KeLHpcAY1u2PlRQaUt5r11nYniUCfBkDBRW4AzMVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XtdIXpa8VPnSjiAZ8pyoLXBSrAhRP9nOwgvDUUuCqbWW51HEsJBX+Y12E6pes8PAp
 jxPLlO+7psf8NS4tJzd7mjHkJDSinkckyntMQJYE45h7EmdxEGRobC9qEfLVOHzu5K
 9OzLRDwYB8dtV+ktPu/aw6UknATm/Yf3xSYG409U=
Date: Mon, 10 May 2021 15:53:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/2] ppc/pnv: Add support for the POWER10 DD2 CPU
Message-ID: <YJjKbhmdoTApPrqC@yekko>
References: <20210505090609.593194-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nO2zzBtZkE5CZ8Ku"
Content-Disposition: inline
In-Reply-To: <20210505090609.593194-1-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nO2zzBtZkE5CZ8Ku
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:06:07AM +0200, C=E9dric Le Goater wrote:
> Hello,
>=20
> The POWER10 DD2 CPU adds an extra LPCR[HAIL] bit which is a requirement
> to support the scv instruction on PowerNV POWER10 platforms (glibc-2.33).
>=20
> These changes add a POWER10 DD2 CPU and switch the default chip model
> of the powernv10 machine to use this CPU. This to make sure that the
> machine can boot the latest distros.

LGTM as far as it goes.  Couple of points

 * I'd prefer to combine the two patches together, basically
   atomically replacing DD1 with DD2
 * I'd like to sort out the DAWR1 support first, or at the same time.
   I think it's reasonable to treat anything about POWER10 emulation
   as experimental and unstable until we put an actually publically
   available chip in there.  If we sort out DAWR1 support now, it
   means we can avoid having another spapr capability flag to handle
   the case of qemu versions that support DD2, but not DAWR1.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nO2zzBtZkE5CZ8Ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCYymwACgkQbDjKyiDZ
s5JDeBAAuV8byNEd7oPCyH/69uHJojj5RKBO4rfsb7eSeI+nvOYdHnpfjRHKXvoJ
Xpj04Vh6+HmYdiudjvH42IiJpgYO+IfoxgyUbn/DYw4uxszCijb02TbGm23vcqxY
heurGeKdF78WPzHwht9/onFrkbvZ5VdHfRdMsp/gAMyvsM3KRXaR7Ngi3B7JSkJs
HaYng0Pzrw16cqHOYNKbAhh4BHIhfuC5Z1bpGlS9APECPmSgJq9Je3k9GAFWIAsS
ImHjw3NTP9x7hrOabsTUvjkQtBQIBGL6iq/Dmp4fE/MKJIrp8ryRKra4zITHBhVq
t/jIb1eCanDUQlYIaI9zSh2NMQCxGwa8Owzhg1YujSSCITXlqFR1u6Cb4GgK/dH+
ywJrPlWfnSqM86/+7bE7dbWfjkReF2fuYjmiizDONi/zwDrNKphiYI2SXzCrXnRy
jJ/+1wtPpMlhRzBNgFmPnYTtPzJGfLo0TY1usnOHv9tZWHwRKruJCAOI4dLAZ7pt
0lOSHRGvJcrJXIhxlTIqWs+cjLWNIHv/1FKrzMETbh9SwrL+Rlg7hEtC7bWLD58Z
tTJs+En73qr8nvoRmA/suggasny8wtT5+yBWOEIk9JZj/gu7hSA+md3WEJFdNoiR
hPuL0Vcxsqu3ozBGyW3gWxBgBM4qtniNEuUUiNfFShxzWUeY7Hw=
=Fsh7
-----END PGP SIGNATURE-----

--nO2zzBtZkE5CZ8Ku--

