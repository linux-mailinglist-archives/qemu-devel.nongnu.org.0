Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C511D3453A4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 01:13:16 +0100 (CET)
Received: from localhost ([::1]:52426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOUfb-0005ax-Qt
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 20:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUc3-0004Qx-81; Mon, 22 Mar 2021 20:09:35 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOUc0-0006ZX-1S; Mon, 22 Mar 2021 20:09:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4BYz25cvz9sW4; Tue, 23 Mar 2021 11:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616458167;
 bh=Iz7HmnL/FtuOdi+0bqVJ3O3wT6bEVJt2zkbfaBA9FL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GKI9RcNYorRuOee5vAsemiAVJpyvYVblYIxqVOizZC8Sh2ySnqsnaubMAiuUcHpZl
 fSszXB4Ri9rLfmtxHvmYPOaqQt9XNKwEl9eMjcLfH9fc0m3t8MosKklcMWXcX5AirB
 bSG89axBQk/2uVtuJrVy+tkYGIk+mebzPV6ltr4c=
Date: Tue, 23 Mar 2021 11:08:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
Message-ID: <YFkxhd7AIfKVOZsA@yekko.fritz.box>
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4uI/ucwGGqFF0/bO"
Content-Disposition: inline
In-Reply-To: <20210316081505.72898-1-bmeng.cn@gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4uI/ucwGGqFF0/bO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 04:15:05PM +0800, Bin Meng wrote:
> As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> min_frame_len should excluce CRC, so it should be 60 instead of 64.
>=20
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>=20
>  hw/net/fsl_etsec/rings.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index d6be0d7d18..8f08446415 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -259,7 +259,7 @@ static void process_tx_bd(eTSEC         *etsec,
>                  || etsec->regs[MACCFG2].value & MACCFG2_PADCRC) {
> =20
>                  /* Padding and CRC (Padding implies CRC) */
> -                tx_padding_and_crc(etsec, 64);
> +                tx_padding_and_crc(etsec, 60);
> =20
>              } else if (etsec->first_bd.flags & BD_TX_TC
>                         || etsec->regs[MACCFG2].value & MACCFG2_CRC_EN) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4uI/ucwGGqFF0/bO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZMYUACgkQbDjKyiDZ
s5Jhwg/+KRjY+1g5c251/UU9bNYExE84/xSRUxbpDZWamSo1mwZEZFG981Ft1w9u
GNGcEFVkzG/5ZMYmoTi+pcwaJk07iKiU+oHmrst+JhC3lxzBvx4KRkdwY7hJkyiX
+Wv7BhAgAZCA+wzN16A4ieS1hckg53UugWPHHrpb9g4fhksfigN4uM7LI5W4PPaf
0I4mptE4JkJc1v21GeWXW6OiLuN/473mzjq61SukEA0/bWeFU/4KbWWW7XpugyJ3
6Z5vLIKdbDCaVcEQV2RtlFzqMvuL0Z5dyS59kpmANTaJklOgt1pJ0tzVGn+Y9dA+
AzThX6kMcW4LhO1jQij0X6QzX7h+d9qhX2ATh/J/30mZXbBntaIA1GylOfw75EsZ
wuR9qFUdPUnoKiFeerfKo2hmw/ZIzxnhNB3xYYLIEkLa7se0VnDx7cl1vPbJeyG2
d6JrQlBnG6diN6Ci0jGQnTYnR4YEfwub5oKDMpCbP8Lakm84B8ggzVnHrkYSUn7p
4ffW7XaEE+jfsIPXtKlML1iaugJuwP7bD7inO7X7sybdl/oHL6HHKpjI7ocX4h33
4WAkj8fC4f7O5nJJOj6g2ST7UdSrvnUX2dWJAAuaEyINrHt4aU91AisL/KE7pUwx
CM9XdySgn8CbBVUTMvXpjPFTKaZR43Emdc1uMv5es3wWCSdA6bc=
=homI
-----END PGP SIGNATURE-----

--4uI/ucwGGqFF0/bO--

