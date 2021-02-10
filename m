Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96507315C06
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 02:19:27 +0100 (CET)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9eA9-0000VG-T3
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 20:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9e7q-0007fy-SC; Tue, 09 Feb 2021 20:17:02 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41361 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9e7m-0000Zd-ER; Tue, 09 Feb 2021 20:17:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db20V3ngFz9sBy; Wed, 10 Feb 2021 12:16:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612919802;
 bh=S4j+gd5ClRCrdhUtYbSO2tscXPJ/RrUPrt37W7O6d4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZZLgPHu0wzV0Y9mS3NAKIU2X8DGINbNMg0PmeoZENiiiN5PmwPPDgpoRK//WvwB2
 ogIl5BVTNAwK8WLnAT/Bose5zefiwLYG2GQMwQXD+jsgPAsQohQ+BT3ujBrm0N3X3T
 hIknhrCQ/nzPU7IzNWu6NAeiX6gSNPxda5z/2aUQ=
Date: Wed, 10 Feb 2021 11:11:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Message-ID: <20210210001151.GC4450@yekko.fritz.box>
References: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-yPsHpq+q7osCKTGGJ7LiHdMWFxuxJN9Gyey5dJvjWcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-yPsHpq+q7osCKTGGJ7LiHdMWFxuxJN9Gyey5dJvjWcw@mail.gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 09:48:18AM +0000, Peter Maydell wrote:
> On Tue, 9 Feb 2021 at 01:22, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per MPC8548ERM [1] chapter 14.5.3.4.1:
> >
> > When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
> > a DA match. But currently QEMU does the opposite.
> >
> > When RCTRL.RSF is 0, short frames are silently dropped, however
> > we cannot drop such frames in QEMU as of today, due to both slirp
> > and tap networking do not pad short frames (e.g.: an ARP packet)
> > to the minimum frame size of 60 bytes.
> >
> > If eTSEC is programmed to reject short frames, ARP requests will be
> > dropped, preventing the guest from becoming visible on the network.
> >
> > The same issue was reported on e1000 and vmxenet3 before, see:
> >
> > commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes=
)")
> > commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 byt=
es)")
> >
> > Ideally this should be fixed on the slirp/tap networking side to
> > pad short frames to the minimum frame length, but I am not sure
> > whether that's doable.
> >
> > This commit reverses the RCTRL.RSF testing logic to match the spec.
> > The log message is updated to mention the reject short frames
> > functionality is unimplemented.
> >
> > [1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf
> >
> > Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTS=
EC)")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>=20
>=20
> > -    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> > +    /*
> > +     * Both slirp and tap networking do not pad short frames
> > +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> > +     *
> > +     * If eTSEC is programmed to reject short frames, ARP requests
> > +     * will be dropped, preventing the guest from becoming visible
> > +     * on the network.
> > +     */
> > +    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> >          /* CRC is not in the packet yet, so short frame is below 60 by=
tes */
> > -        RING_DEBUG("%s: Drop short frame\n", __func__);
> > -        return -1;
> > +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
> >      }
>=20
> This change is doing two things at once.

Oops, I missed that.

> One of them is an entirely uncontroversial bug fix: we
> got the sense of the RCTRL_RSF test the wrong way round.
>=20
> The other is different: it is working around a bug elsewhere in QEMU.
>=20
> If there's a problem with packets that should not be short
> frames being presented to ethernet devices as short frames,
> please fix that bug at the source. I don't think we should
> take any more device-model workarounds for it. We have lots
> and lots of ethernet device models: it will be much more
> effort to try to fix them all one by one as people encounter
> this bug than it would be to just fix the code that's creating
> bogus short frames.
>=20
> David, could you drop this from your queue, please ?

Done.

>=20
> thanks
> -- PMM
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjJMcACgkQbDjKyiDZ
s5IA3g//TQXz2kBgRhIAgx9KAcM6NAJmDTUFBJ+mQjoV5romM5G4bIl42BQLARnm
ksBIljjiT1BhlFgamwvRdZcIbJPwCuElVottaow1mT+xFbEnGY/ehUcx8scQ6oSO
ik60LjFBiOqHlG2uHa6m4Dxth6BVHthCMW/k9PYgIdx4d0d6ey05Y6h8Ojwdcpvq
IJpCm3qDGbyijdjBd9QDyl55dDsykt3LTF5Sitx8qtzw83UM6xcFimpQB8wFPmPk
DqGjAiiAOccMf1tMq2VpaTISMCuQvPsYwMyGMWfcDOw0d4glsPCjmQDTsWhAyy2E
6XCEDgtE0Mg6vryPC1nRMxxQR75sIZAiZUtqJ7824RfKd+qTj7yYD18D31zXo2+Q
S6dOz0Xsr3KRuw+Pq6AjYnC5lMXb/c9wlseD/pu2UpS3gm9r/y8Ne4bQN5X7ah0n
dOAiu2OkUf0FT0oX0ZPsQGqWLTUL2xhaYMUdZTwyyJHSI2Kje8RT1Bq7kODSyVQK
/u2xtRufGdcjlD+3hBGu7SmorjxMi6bx6+nmjtCmE/8uzHYiEN73kVVnzSn3ZVR7
yc6HudydyUzsn1JfjOukMahdMRHbTEg5WqfqzwxwxZ21GdiZ13YqLFFbukc0t4NU
OXkWmH9uNTYRql050vGVzOsCKG70cJ1gsrzOay4aZuchiyYGlso=
=HX0k
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--

