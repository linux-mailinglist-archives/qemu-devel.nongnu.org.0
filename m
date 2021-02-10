Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1EE315DE7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 04:43:47 +0100 (CET)
Received: from localhost ([::1]:35356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9gPq-0006l3-2K
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 22:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9gOo-0006F7-4a; Tue, 09 Feb 2021 22:42:42 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55203 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9gOl-0001k5-KN; Tue, 09 Feb 2021 22:42:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db5Dn2PfQz9sBy; Wed, 10 Feb 2021 14:42:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612928553;
 bh=rXIgiojFMZn42cW11KiChdTQEiLTLVidHMwwb+AE0FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZSG6IxRrzKwUC2GN2q/hdytHKUKINoovHxSL/RnhDnFYJNs11SorX9/kkd8H/U7L
 qK+ZaVkmyU9dHIaTJmcOth5XyQDkvir7Kb9olZiCZ8BoiH3XoKg9VClTpruALx5X2y
 tpw53Sl8W55mWaXeObSCmk7Z9jmR+wdhsqRzdJBM=
Date: Wed, 10 Feb 2021 14:38:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Message-ID: <20210210033840.GH4450@yekko.fritz.box>
References: <1612923021-19746-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Content-Disposition: inline
In-Reply-To: <1612923021-19746-1-git-send-email-bmeng.cn@gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 10:10:21AM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> Per MPC8548ERM [1] chapter 14.5.3.4.1:
>=20
> When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
> a DA match. But currently QEMU does the opposite. This commit
> reverses the RCTRL.RSF testing logic to match the manual.
>=20
> Due to the reverse of the logic, certain guests may potentially
> break if they don't program eTSEC to have RCTRL.RSF bit set.
> When RCTRL.RSF is 0, short frames are silently dropped, however
> as of today both slirp and tap networking do not pad short frames
> (e.g.: an ARP packet) to the minimum frame size of 60 bytes. So
> ARP requests will be dropped, preventing the guest from becoming
> visible on the network.
>=20
> The same issue was reported on e1000 and vmxenet3 before, see:
>=20
> commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes=
)")
>=20
> [1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf
>=20
> Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC=
)")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Applied to ppc-for-6.0.

>=20
> ---
>=20
> Changes in v3:
> - remove the slirp/tap networking workaround and only do the reverse
>=20
> Changes in v2:
> - rewrite the commit message and reverse the RCTRL.RSF test logic
>=20
>  hw/net/fsl_etsec/rings.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 121415a..fe055d3 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -502,7 +502,7 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8=
_t *buf, size_t size)
>          return -1;
>      }
> =20
> -    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> +    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
>          /* CRC is not in the packet yet, so short frame is below 60 byte=
s */
>          RING_DEBUG("%s: Drop short frame\n", __func__);
>          return -1;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjVT4ACgkQbDjKyiDZ
s5JXeRAAkwZAXIyUeWG7Tp5iYRtae2/JVFFCU1Sh69E0i1RDba3g5KY5CApayf3v
8275S+2zliiySLey8uAtyYn6YHcmkkXSObcp47rlcEEcutaVLgXAsw15+EmeZWVW
2CvUcGxEQ1ymofkZPWIBYw3OcD290rUB1NfR7ha2lbIHggJB9+/VfiKmIpuHuOs/
trdTzsrjnZup82zzJRAzW2K/QmFyv6s9R7AeCXk8XIVjbZBlkmYUaXOEnZhDSzbj
bo0Yk82FHSbKDslipvMXc899dBVxGL0Tk7BWEgvf9s6CMWDRk2xXX+wUjEOnyTSY
TBbO4zJW8CcTJq0QbuYblN4vVY3FMPZtOLkPpTy7UqerjGGP/6/icz+eMuT+4FJJ
FSILoP0smh5b1Lb0FU81m3Joxi/NQQyCLXHyiMf0yulzGyYwhng+5ENMfycCTPOs
/RREFcAK8hunB+bvG/Gqy+ENN2xJU7rp4C7IPtOV8brfUwqDVgnCP+a/9j5XjUwl
T2BUapVYhTnDoAai3BFtN4mbiJkcl0bvR8PcKej/7H8luf+nArSFumm23jblHrhf
yf6thfYy05QvN18OnTaH+5Dhxvxz208+2ae7oeP6TVQ3vZUY5ccMXA0r8huzfU+f
TDKDf9qkWu3lctPWOBO7tzuhTqpVn/n2Az3hefCSDa9Dkk2ibzY=
=J/4D
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--

