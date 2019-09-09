Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B029AAE154
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 01:04:37 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7Si4-0003Ir-Bx
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 19:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i7Sgv-0002dn-Ug
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 19:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i7Sgu-0005fJ-7a
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 19:03:25 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52289)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i7Sgt-0005bs-1p; Mon, 09 Sep 2019 19:03:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46S3by0Hcgz9sCJ; Tue, 10 Sep 2019 09:03:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1568070190;
 bh=U+U7rHDfuPOr4j6NgDReyOw8zaTUdLlgSyP7tVF1wxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzLX0m9Y6+Q/lUCNIv/U9AMbNRCvQqkzDT1wKMAiiqO2C+sLIC944yOaFhvzaJsmW
 4K95mluRQzYO/xdSCGBoiA034Wa7KzOrr/o8U4qW101DmsZpu+QJRsRXVYDz0p0pI9
 eLeW6Mfaj8S333ZRhRZEsm3upH69r9/tdZAd3qFU=
Date: Tue, 10 Sep 2019 09:01:57 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190909230157.GB10452@umbus.fritz.box>
References: <156805260916.1779401.11054185183758185247.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <156805260916.1779401.11054185183758185247.stgit@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH] spapr-tpm-proxy: Drop misleading check
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2019 at 08:10:09PM +0200, Greg Kurz wrote:
> Coverity is reporting in CID 1405304 that tpm_execute() may pass a NULL
> tpm_proxy->host_path pointer to open(). This is based on the fact that
> h_tpm_comm() does a NULL check on tpm_proxy->host_path and then passes
> tpm_proxy to tpm_execute().
>=20
> The check in h_tpm_comm() is abusive actually since a spapr-proxy-tpm
> requires a non NULL host_path property, as checked during realize.
>=20
> Fixes: 0fb6bd073230
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-4.2, thanks.

> ---
>  hw/ppc/spapr_tpm_proxy.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
> index b835d25be6f6..ca1caec113f0 100644
> --- a/hw/ppc/spapr_tpm_proxy.c
> +++ b/hw/ppc/spapr_tpm_proxy.c
> @@ -114,7 +114,7 @@ static target_ulong h_tpm_comm(PowerPCCPU *cpu,
>          return H_FUNCTION;
>      }
> =20
> -    trace_spapr_h_tpm_comm(tpm_proxy->host_path ?: "null", op);
> +    trace_spapr_h_tpm_comm(tpm_proxy->host_path, op);
> =20
>      switch (op) {
>      case TPM_COMM_OP_EXECUTE:
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl122eMACgkQbDjKyiDZ
s5Ji/RAAjvAf2CPrcy5rkx3Nwqf1zC9WARpIfhFxe98oK3PFGxR/yKrDddpf9NaC
UUcqMpkpxT7q93zXVXKidr3WmS9je6CGx6+vBtxHH775S4GZ3uVeuhMZ5VlOx3ES
GwolsskBYb8nKsofwnzHmDHJWkMAcDaJKXb+XC3BCPfdDnunVIA/hEj/3tGx18U0
6BDdcQpYBCJHaRuYtWrFs5OvtrZ2Ap6b9tFJkl4CZUDD0mAVHLSRXF3h20Y3vvY5
SthcVNuuTKiACnN4Qa+nX+HAg6sPki8LH3CWuYOodztjeEtVqW3+a55sspPVCbJM
YIIoBBULZ3oIzraI90v4tm2Bnoi97n4bQbuAkbB6Q+MTnL01WTeweXcBedjQ0mvN
LyfubCMUY9MmvovXsyszniYAcq/tHxBF6OAwdtGM9gavqsteDxI6y0PFn6PaSLZW
hh5gg2PelQLRoZXOTABCcSzWJZUZBaCT/QWlK+dGLTYm02QQZaZyOwR/zAotkqyS
EH4JArCZMOywIeJZ0Vj2h6wmBFve32q6cCE3RwduWUc4E07oj9ZCoY4KZIZa4ijI
aIU3QxxTZCN3f9KNFIcN377C71ewh3LUCDURyfwdZ+8j5bniG6u8pwnhQgUUNGWL
FH918T03DbzNcT8fUb5fo0ZTxzmWuq0/UNURbJwXMMjY3oNMoVA=
=+s0E
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

