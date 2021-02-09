Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E684A3147E7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 06:09:11 +0100 (CET)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9LGw-0002pA-Dv
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 00:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9LFy-000209-Tw; Tue, 09 Feb 2021 00:08:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33831 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9LFv-00017R-RQ; Tue, 09 Feb 2021 00:08:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DZW9s3tgJz9sVb; Tue,  9 Feb 2021 16:08:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612847281;
 bh=ZdwYROD92OZJxUYg+wqtrOw1FZZUz+ghaFFtNxxOVF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kFJxtwzdwquJ1WiCD4a4wHesuCJhrdbc9pPR+QIgQ7W5DqNWDPKQgT5jUzygXdIR0
 HqPB1usZkEtLdodNFeR30hoPMgyl+DX2PC1T6Fh8vPSLF4fFmQB3LEDAkShaajAkpd
 kLQyhDLr8F87pnAhy7auLFCRudAj6LV4hTwFP2jI=
Date: Tue, 9 Feb 2021 13:02:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Message-ID: <20210209020241.GC40668@yekko.fritz.box>
References: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 09:22:41AM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> Per MPC8548ERM [1] chapter 14.5.3.4.1:
>=20
> When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
> a DA match. But currently QEMU does the opposite.
>=20
> When RCTRL.RSF is 0, short frames are silently dropped, however
> we cannot drop such frames in QEMU as of today, due to both slirp
> and tap networking do not pad short frames (e.g.: an ARP packet)
> to the minimum frame size of 60 bytes.
>=20
> If eTSEC is programmed to reject short frames, ARP requests will be
> dropped, preventing the guest from becoming visible on the network.
>=20
> The same issue was reported on e1000 and vmxenet3 before, see:
>=20
> commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes=
)")
>=20
> Ideally this should be fixed on the slirp/tap networking side to
> pad short frames to the minimum frame length, but I am not sure
> whether that's doable.
>=20
> This commit reverses the RCTRL.RSF testing logic to match the spec.
> The log message is updated to mention the reject short frames
> functionality is unimplemented.
>=20
> [1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf
>=20
> Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC=
)")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Applied to ppc-for-6.0.

Thanks for the excellent commit message with the links to the relevant
documentation.

>=20
> ---
>=20
> Changes in v2:
> - rewrite the commit message and reverse the RCTRL.RSF test logic
>=20
>  hw/net/fsl_etsec/rings.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 121415a..f89aa7f 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uin=
t8_t *buf, size_t size)
>          return -1;
>      }
> =20
> -    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> +    /*
> +     * Both slirp and tap networking do not pad short frames
> +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> +     *
> +     * If eTSEC is programmed to reject short frames, ARP requests
> +     * will be dropped, preventing the guest from becoming visible
> +     * on the network.
> +     */
> +    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
>          /* CRC is not in the packet yet, so short frame is below 60 byte=
s */
> -        RING_DEBUG("%s: Drop short frame\n", __func__);
> -        return -1;
> +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
>      }
> =20
>      rx_init_frame(etsec, buf, size);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAh7T8ACgkQbDjKyiDZ
s5IKOg//avGB4xsPpLPEkXctCRXUexFAa6UZRLaaKpIM7APdkpFKTDSrVm8aJRnh
thD6I3pfzek3bheVw9DlyHTsCb2ugb1uSr+NrFqn7d+CjKVhxi/y5q6VCyrMmE13
eH/7rIPsm1XGaKakg7e/ISTwnw99pO8/nCovtTTpPFkTIXvFUF10I9loK4y99rjF
rT4h5DvQ6oE4N96cyGCVfsbbNrrWpS6XEwknUFMfzcQj0HSbUu4sfsjC6jbOQzUA
23FxWz29bCLXC64D9PBtdchHhGo8jeJkGIptEscsta2EPu+APrLXdK8QaQD1Iy3b
GdvfTsy0ITtkhLZiFWSJLbxzfwtCyp7yncQZzDVQR6r0imgBad9qRtkrd80FfOMs
Bc6bTrkn6Z94ZMCft72zEIMapcVvwl+v40leioT0dMJT7PKuh0FXk49+fu3xuvhs
s5M7dG/rXR2hNcPlhfMHb2BUPm55U3Pap9n0CLPrRCPql8QUKmY+mqlBrR2a1VUT
lQO/TjU9ctGduCMRFkH3Ux0QWBtszI6rmHAec2syhCs47g1vpCFEuniu+XkCgBsQ
6KSUVlzXOh04R+9Fuy8IIBxAHKstBkRR1/CcIFotcw5YUCopYvXAGSAmFlMSY1Am
5KoGOnbvmtoqyNaY0Yy1IkRKBmkuNz9Rcs0JxQUGJgbwWR9QccI=
=pE1g
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

