Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A234538D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:03:47 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOUWQ-0001bB-Dt
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUU3-0000K6-HV; Mon, 22 Mar 2021 20:01:19 -0400
Received: from ozlabs.org ([203.11.71.1]:37137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUU0-0002u5-Ux; Mon, 22 Mar 2021 20:01:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4BNR31RFz9sW4; Tue, 23 Mar 2021 11:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616457671;
 bh=e7lSp/BjJf4M5A/EhwNfL4Lp3GHdBeU2Ab1t8y4dBdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONCNUxXnas9TwUqetKxcCj8DZi08pi+CQXViGS/wRMR9enWh8NHrdY1Q6TvC0xy1d
 cFw7KwqkwH48PLJ7LUlcbKTvzkL2nSHlspc4mCCvGsnHseM1CSJaCyI21hAQkFYyLJ
 nySedHWtsYipG8W/dmVJL6iiA24VsTLnlprHBSGQ=
Date: Tue, 23 Mar 2021 11:01:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 13/17] target/ppc: Remove env->immu_idx and
 env->dmmu_idx
Message-ID: <YFkvv6H8dOMWvg3W@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-14-richard.henderson@linaro.org>
 <YFgcbsRHrTxRqKI8@yekko.fritz.box>
 <9e0425b8-6239-5b34-7fc4-7a8b59532d6f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PppwPHSmaF4fA7PW"
Content-Disposition: inline
In-Reply-To: <9e0425b8-6239-5b34-7fc4-7a8b59532d6f@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PppwPHSmaF4fA7PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 11:27:49AM -0600, Richard Henderson wrote:
> On 3/21/21 10:26 PM, David Gibson wrote:
> > On Mon, Mar 15, 2021 at 12:46:11PM -0600, Richard Henderson wrote:
> > > We weren't recording MSR_GS in hflags, which means that BookE
> > > memory accesses were essentially random vs Guest State.
> > >=20
> > > Instead of adding this bit directly, record the completed mmu
> > > indexes instead.  This makes it obvious that we are recording
> > > exactly the information that we need.
> > >=20
> > > This also means that we can stop directly recording MSR_IR.
> >=20
> > What still uses MSR_DR, that you can't also drop it?
>=20
> #define CHK_HVRM                                            \
>     do {                                                    \
>         if (unlikely(ctx->pr || !ctx->hv || ctx->dr)) {     \
>=20
> I have this notion that this (and CHK_HV and CHK_SV) could be a test agai=
nst
> mmu_idx instead, but was reluctant to make that change.

Yeah, that's checking for hypervisor real mode (hence "HVRM") for
ldcix and friends, so it should be equivalent to (mmu_idx !=3D 7).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PppwPHSmaF4fA7PW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZL78ACgkQbDjKyiDZ
s5IUUw//dR7SqTugSxPFOFjEu90RkaRhS8fk5Z0ggD8vdnouM7wEqCvy81SoINJm
bJ3/uTEyRK8TN2I2YitVoZrPEgmKioKWO9Dy2JSCh7NiUqjwVbpnAnnOAFPXFwdl
tzVr7xi5PGVySIOLsQXU+JnAivyQF8ZngL+MwCBwAWiVHQXTvQz8wGSRtgmhPi12
wvDnNkEq0aM1s9t0+stMYn4A4RR1K7HkUOM9QRSaQHgiEW45pNb+UOlnnadgHMWD
/RJJj34jxs/d8U3N7f0Kz3I2f/aNbX4UJpLnn8XmQo0lVIQCV1IC8nbmloBPqRDV
yp5d6UckTjkAsMPis14d5AnFxP5nwVXw0mD6a2mktaXpptcgLExpQhX99YqD6Ytc
3ObTH2cJPpvMuKFl42HUP/1tyKfD/pltSXnzPX4nhnVFYqee8m7zXWk2l65MfQWh
/7FJN/bm7XusUUN1Voey48Sm7Ay5YZL4hU5ihxsW17OYqqjbjO7TGMtFMLe1ys5f
NmnxTMfM7H8j9BtmBJCcobmC79q7BEdWJ7TcA7hRl/QynR+c0e021P0n9ijP7BSd
vt59jwV3nAODvb4QIi0BoOdNzCbrajq8sYlyCd3yKjEDtgkCgSkj+h5QsR7pLZwN
WdtokD7D558F8nMGckr5rTo53qq9XJm1pTnrTiREw7csZqjWpcw=
=7zfJ
-----END PGP SIGNATURE-----

--PppwPHSmaF4fA7PW--

