Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA734E1F6E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:02:56 +0100 (CET)
Received: from localhost ([::1]:60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW9Fu-000393-RK
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:02:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nW98q-0001dQ-Vc; Sun, 20 Mar 2022 23:55:38 -0400
Received: from [2404:9400:2221:ea00::3] (port=36933 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nW98m-0004Uu-Lc; Sun, 20 Mar 2022 23:55:36 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KMLP44ff9z4xc2; Mon, 21 Mar 2022 14:55:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647834920;
 bh=NhXF9zs0fXHCpHXOItb55/m3GpPJ7X+Of9m/GOUqViU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JNaW/f5Kx3ztbTKuxc36ROFYa9AQjT9bJ+3XvHX3c2CDviFVyipqdirT5dhrj0B0T
 o5Y1olpGQ6knwhxMJd9DcgEs9abFu/L8dos/p4LkkVjxXaj3++d3tZYOgaUFcCBYw6
 qa1sPic3/DDjMhXqhwFybKVMIsbjdkj6Gr0L/5gA=
Date: Mon, 21 Mar 2022 14:55:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-7.1 0/9] spapr: add drc->index, remove
 spapr_drc_index()
Message-ID: <Yjf3Ifdun+jaJ8zF@yekko>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QptgshbiukAzpH5r"
Content-Disposition: inline
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QptgshbiukAzpH5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 02:33:11PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> I decided to make this change after realizing that (1) spapr_drc_index()
> always return the same index value for the DRC regardless of machine or
> device state and (2) we call spapr_drc_index() a lot throughout the
> spapr code.

Hmm.. so, spapr_drc_index() wasn't ever intended as an abstraction
point.  Rather, it's just there as a matter of data redundancy.  The
index can be derived from the drc->id and the type.  Unless there's a
compelling reason otherwise, it's usually a good idea to store data in
just one form (if there's more it's an opportunity for bugs to let it
get out of sync).

>=20
> This means that a new attribute to store the generated index in the DRC
> object time will spare us from calling a function that always returns
> the same value.
>=20
> No functional changes were made.
>=20
> =20
> Daniel Henrique Barboza (9):
>   hw/ppc/spapr_drc.c: add drc->index
>   hw/ppc/spapr_drc.c: redefine 'index' SpaprDRC property
>   hw/ppc/spapr_drc.c: use drc->index in trace functions
>   hw/ppc/spapr_drc.c: use drc->index
>   hw/ppc/spapr.c: use drc->index
>   hw/ppc/spapr_events.c: use drc->index
>   hw/ppc/spapr_nvdimm.c: use drc->index
>   hw/ppc/spapr_pci.c: use drc->index
>   hw/ppc/spapr_drc.c: remove spapr_drc_index()
>=20
>  hw/ppc/spapr.c             | 18 ++++-----
>  hw/ppc/spapr_drc.c         | 79 +++++++++++++++-----------------------
>  hw/ppc/spapr_events.c      |  4 +-
>  hw/ppc/spapr_nvdimm.c      | 10 ++---
>  hw/ppc/spapr_pci.c         |  5 +--
>  include/hw/ppc/spapr_drc.h |  2 +-
>  6 files changed, 48 insertions(+), 70 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QptgshbiukAzpH5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI39xgACgkQgypY4gEw
YSJHIg//dUIvRThqvMvaROcbFn/IHtOwn0EUXslxCGKZB/EQ5HFN4OJxfyodXtf/
3CCrNTu+CFmSTgfz6RBdgFcYUsvVjEliHthQ1uACEqLdGvHNm6rf6geoZvhrniJl
kTzSAm0gTlhWD1SJ8vLVu4TJy6FNuemo56PeYsROlCCbJB0qmuz1MTASTz4vAodu
RP6MWfqkNtGgGgb2nagGfYK7lfc3ctfIvXRdgheY+192CmvRXtbZJebXhJDsT25r
TIdFvfZAWZMHsBJY377SyqGSQr6buCrA4BDkOShlHAzFU/Qi6w0fZqdzKONF42LY
2vbHkQk/4ttZPyYhlF5bVJT9RLwUR9/3vkXTayGb9lo3oQWsFAJl2w8pSMiS6Hyf
gqi75YTYrdiGoGy/ynyoyuxmoIN8XT9S9GdypxOnPbzlrZqmKduNY8RX/5CggfPZ
AOBPwr/P9qz6xrzntJZwq53qrBGdsowXsyvdDFsUWDpUKHXD/XWQS70n5NAidwqy
0NljOV9UMwlazkhjnbBIZzEPEouD5Ksr8LQHqNBAjm1mB5QLIMz5IkzHqq3+ghhf
TFlXzmcfcjIAU78BD/HtFijwZWsTju5vGvJgs7IEmABIHb4TU+uJ5iVRxwYg4FD4
upRVIb7DT1sBnAG9/GbVF81aT7CAPc3bMKjmrXX/+Wg7y8DH/5c=
=gQC9
-----END PGP SIGNATURE-----

--QptgshbiukAzpH5r--

