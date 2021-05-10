Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8A377BFA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 07:56:16 +0200 (CEST)
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfytr-0006kN-3e
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 01:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lfyrq-0003qw-A0; Mon, 10 May 2021 01:54:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36481 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lfyrn-00013E-S1; Mon, 10 May 2021 01:54:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FdqxK0Nfbz9vFt; Mon, 10 May 2021 15:53:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620626037;
 bh=Dex4GpvbUQbXqChv0Q2g0NAer0UcJ6OSYIFxuMVyNHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eaquEyrqb9fzb1vK0YO7vT9KISXpfThh7X1MEWp1UAdTmRWjn9Tz6nRTfiK5Od/2C
 d6DKcxainnV7OOlUMdNpunT9KS10aq6euzLqVqePTx5P2KGXxC05Tk36i+6/Ix3pIC
 x9VRmH9YjmgSgoErYMqgp7jppB/ga3n3HFmMxWyE=
Date: Mon, 10 May 2021 15:38:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 15/17] target/ppc/kvm: Replace alloca() by g_malloc()
Message-ID: <YJjGuvsB5r5f7x/F@yekko>
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-16-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d0Yk/ttOaOG9s+2E"
Content-Disposition: inline
In-Reply-To: <20210507144315.1994337-16-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--d0Yk/ttOaOG9s+2E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 04:43:13PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The ALLOCA(3) man-page mentions its "use is discouraged".
>=20
> Use autofree heap allocation instead, replacing it by a g_malloc call.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb5..23c4ea377e8 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>                             uint16_t n_valid, uint16_t n_invalid, Error *=
*errp)
>  {
> -    struct kvm_get_htab_header *buf;
> +    g_autofree struct kvm_get_htab_header *buf =3D NULL;
>      size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
>      ssize_t rc;
> =20
> -    buf =3D alloca(chunksize);
> +    buf =3D g_malloc(chunksize);
>      buf->index =3D index;
>      buf->n_valid =3D n_valid;
>      buf->n_invalid =3D n_invalid;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d0Yk/ttOaOG9s+2E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCYxrgACgkQbDjKyiDZ
s5ITGQ//cx1kIrgp8Q/IhYmEdRIUtMGVyBCKWYUh37rI50BsqykhIjP6v0MGQUVq
+vcEanUqTaYiCQxcwG4wj09Peh1Y1ldVGVshKKvfpyTRx7XNQieiUgrcPNH6Z+x3
X948ERPAlwDCnFT6OUc+wzszjbdLbjiTa1YVBIAP6XPNN+GS4edSJSnmhWQ0owkl
zSqzxYCR4HLB7ltUy7DLvifuDDM+NIl6eZBfgzy0oC7VBLSgSRGIUMthgJOyXgbh
XqmzV39VdyTKLhK7b+XMULwTAL+Qxls9ARFjyiCoXR67pEzTE2wglNxDpifi9TPF
3pV7xQbd5aWPQ7GR7P6sVtzz8091elcUxvaJ9te7Fwiqfj/Oe65vuDDNMnVKO3Rn
elpNLSCI2uW9SA2AwRUt1nPeN46URQMzYd2wCyXALj8VJhmWwtUSTGfrYOjH0xCM
M8p8qMf5U2Iutk3fAHTtaybmGY+JCC/34DgVUoh7zKcFyigzQoIp5avZ2/LkspQc
9xJwLEVP/mHSet9CHMUwu6OFNAJNzGgeCh0y2DqVthQoUOQNhCOMn5Xg9McrmGAv
5kKOz2Rh/Ibz2mBzxAMkqNOZuCBh0tV5JEgcXL/UZywVwqPG24jNXEL34JR2W75t
mp7+J0fm280huxEfjQX/F2EfD1i0sWKoGMXriord4Ps+bmLEF7s=
=9BxG
-----END PGP SIGNATURE-----

--d0Yk/ttOaOG9s+2E--

