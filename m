Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED01373430
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 06:18:28 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le8zS-00039K-T6
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 00:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le8yG-0001zL-72; Wed, 05 May 2021 00:17:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51765 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le8yD-0007Fl-M2; Wed, 05 May 2021 00:17:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZk1h6bsXz9sW1; Wed,  5 May 2021 14:16:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620188216;
 bh=HBkbdE2t3/52p6GQJFZBmmCZULEd4eW3ABcs8GV4g/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CohvIB8y/6hg882dBBht/SLM9pfsW61WLcBRXglx1tWpMmLtLwhqSo7WdwAraa3C9
 oAr7doi6q4r7A/j1OK5Z+oI2kWLovAdpfpgo8sR3vIKphRyvgCvSbCoiSkMRNQTpPw
 FJWWe9LMy/hrId1n4e23OyoS5Vc+pBKtnZsbBpQo=
Date: Wed, 5 May 2021 13:29:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 0/2] Fix for compat mode in P9 < 2.2
Message-ID: <YJIRISyL/Nt24ITD@yekko>
References: <20210505001130.3999968-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1n1sCBU69wKVSQ3q"
Content-Disposition: inline
In-Reply-To: <20210505001130.3999968-1-farosas@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1n1sCBU69wKVSQ3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 09:11:28PM -0300, Fabiano Rosas wrote:
> We dropped support in KVM for mixing MMU modes in machines that have
> old POWER9 processors which don't support mixing. As usual I forgot
> that compat mode exists:
>=20
>   $ lscpu | grep pvr
>   Model:               2.1 (pvr 004e 1201)
>=20
>   $ ~/qemu-system-ppc64 -machine pseries,accel=3Dkvm,max-cpu-compat=3Dpow=
er8 ...
>   error: kvm run failed Invalid argument
>   NIP 0000000000000100   LR 0000000000000000 CTR 0000000000000000 XER 000=
0000000000000 CPU#0
>   MSR 8000000000001000 HID0 0000000000000000  HF 8000000000000000 iidx 3 =
didx 3
>   TB 00000000 00000000 DECR 0
>   GPR00 0000000000000000 0000000000000000 0000000000000000 000000007ff000=
00
>   GPR04 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   GPR08 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   GPR12 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   GPR16 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   GPR20 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   GPR24 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   GPR28 0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
>   CR 00000000  [ -  -  -  -  -  -  -  -  ]             RES ffffffffffffff=
ff
>    SRR0 0000000000000000  SRR1 0000000000000000    PVR 00000000004e1201 V=
RSAVE 0000000000000000
>   SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  =
SPRG3 0000000000000000
>   SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  =
SPRG7 0000000000000000
>   HSRR0 0000000000000000 HSRR1 0000000000000000
>    CFAR 0000000000000000
>    LPCR 000000000004f01f
>    PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000
>=20
> This series reuses some code we already have to abort and print a
> proper message if the chosen MMU mode is not supported by the host.

Applied to ppc-for-6.1, thanks.

>=20
> Fabiano Rosas (2):
>   hw/ppc/spapr.c: Extract MMU mode error reporting into a function
>   hw/ppc/spapr.c: Make sure the host supports the selected MMU mode
>=20
>  hw/ppc/spapr.c         | 17 +++++++++++++++++
>  hw/ppc/spapr_hcall.c   | 14 ++------------
>  include/hw/ppc/spapr.h |  1 +
>  3 files changed, 20 insertions(+), 12 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1n1sCBU69wKVSQ3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSER8ACgkQbDjKyiDZ
s5IZxhAA46/9BnkQGM3ZMt+sP59cpqQ757fDksXDxN0Btw/AafHJSlka5I2XVTUB
yZZhMVwWlxIqGu4mvPmvL/6jLgyDPvYZ9108V+V+V9aLk+Ey0YL8K4qHKL77RCnV
AR9r7NiQN7jGl1brbdYmdDZBzI+2fqyDt6ttgZqzB9FhglNNA6ZjQge8wV/M2OEy
ND63wlvKnnYikyoEVuLNrRPbntvOCmTLfwYviSNK5te+WwkqPsIDfXah/zzgjtuJ
MA2yd7FR1+8tsnJ2b3MSZQDAHLC2Bv/KiRS3j2dB6vYoYpYkYw26Si4gS88NNhK3
zcBcMbR16janXrfS6SGLYmKYzmXe0EWH1Sxn3P13cXFGTygbdUTyDXYThE9s9ekE
HXiNv4TrmE1qg0plxwVhmd2WSaSyOkCZnYbM1nQ9HcgluOeV+NSRKqMsNy+jJefF
LeQ+8vbutGULdXmZPJlv0x0j2mIZn4DstMZBkr5vnYclnNeZ43taqVLE6WZMTdn+
0d/0MziAyD0WZyOcz15ROa2jdvukLY2M/uatzqouuzzvz8LfDa+zZKq3U24Qyfjx
CeFtDJDDPWUt+u9bGmMuaIdx3DLUNDesjG5H+RGZxO4B5XdpPMEkcUPao8KNULbx
r5BdcMUo6YcuoXT7MKEeKg0Vx05llWq9Oj/wTVG5srr83kazFp0=
=+sdc
-----END PGP SIGNATURE-----

--1n1sCBU69wKVSQ3q--

