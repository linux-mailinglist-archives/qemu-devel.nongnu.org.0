Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DE64DD3B5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 04:48:39 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV3bR-0002om-GT
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 23:48:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nV3Ux-0001Ay-JQ; Thu, 17 Mar 2022 23:41:55 -0400
Received: from [2404:9400:2221:ea00::3] (port=33283 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nV3Ut-0004bh-QF; Thu, 17 Mar 2022 23:41:55 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KKVDk173mz4xvl; Fri, 18 Mar 2022 14:41:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647574902;
 bh=A4szHiUuramKfim8uBlvANIcD7OovDcaUW233hk0uF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iC2B/RPIj9rbEFnQjExLlKy4AZtl3QtYngh1D8z2Cncf1MeEucbEvc6XmP9tJpTUN
 JRIpIJsBlnK2IN+aduKjnA4yP4RMdrTFnz3DcCPhYIC+tM9v4SQfwfYZJTV0lhwyU+
 RYU7EX+9cqNPj23WFRuWPuWldNGkRZ5VChAyqlB8=
Date: Fri, 18 Mar 2022 14:29:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/3] spapr: Ignore nested KVM hypercalls when not running
 TCG
Message-ID: <YjP8iOgtvoLI3e/z@yekko>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
 <20220317172049.2681740-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Gg5fteLoWABIbJ6n"
Content-Disposition: inline
In-Reply-To: <20220317172049.2681740-2-farosas@linux.ibm.com>
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Gg5fteLoWABIbJ6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 02:20:47PM -0300, Fabiano Rosas wrote:
> It is possible that nested KVM hypercalls reach QEMU while we're
> running KVM. The spapr virtual hypervisor implementation of the nested
> KVM API only works when the L1 is running under TCG. So return
> H_FUNCTION if we are under KVM.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index f008290787..119baa1d2d 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1508,7 +1508,7 @@ static target_ulong h_set_ptbl(PowerPCCPU *cpu,
>  {
>      target_ulong ptcr =3D args[0];
> =20
> -    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
> +    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV) || !tcg_enabled()=
) {

I was about to nack this on the grounds that it changes guest visible
behaviour based on host properties.  Then I realized that's not the
case, because in the KVM + SPAPR_CAP_NESTED_KVM_HV case the hypercall
should be caught by KVM first and never reach here.

So at the very least I think this needs a comment explaining that.

However, I'm still kind of confused how we would get here in the first
place.  If SPAPR_CAP_NESTED_KVM_HV is set, but KVM doesn't support it,
we should fail outright in cap_nested_kvm_hv_apply().  So how *do* we
get here?  Is the kernel not doing what we expect of it?  If so, we
should probably abort, rather than just returning H_FUNCTION.


>          return H_FUNCTION;
>      }
> =20
> @@ -1532,6 +1532,10 @@ static target_ulong h_tlb_invalidate(PowerPCCPU *c=
pu,
>       * across L1<->L2 transitions, so nothing is required here.
>       */
> =20
> +    if (!tcg_enabled()) {
> +        return H_FUNCTION;
> +    }
> +
>      return H_SUCCESS;
>  }
> =20
> @@ -1572,6 +1576,10 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>      uint64_t cr;
>      int i;
> =20
> +    if (!tcg_enabled()) {
> +        return H_FUNCTION;
> +    }
> +
>      if (spapr->nested_ptcr =3D=3D 0) {
>          return H_NOT_AVAILABLE;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Gg5fteLoWABIbJ6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIz/H4ACgkQgypY4gEw
YSKmqA/9Gjy5umPZOUBscxbtxrvgkrdwH3ziAs4rvWfpTF6uCTknwpcedoDriWAg
cprAZz9BgCjUBr3+WEPSLNmnJvPUR2JJL2v/3HFKwDYtmvcibYj+GJAcPn32h5cI
8bV2oOgPAldo7Y0+jKgbXRk5nJT9kuXlXMnfk7unUqSnLIfby4BYWvwnPRzDL9o2
TGwUCex7r9nsV8lx45uU93YutP1KHHbOxSkO/c++v59M0+gXk5YdO6FtlvOjlpxJ
yisyVna3KvnPiBZPSGsBJ5gTrEpB+FMtOoukkySabHZzYNkmeWZIcuAUhNcTxsoE
mqsZqVq6LrlvvuKLh2RTIlNilKq5Q5YenEyCIFqYtTeb0CDsqCLa1X9EQCLWxBSs
uVkAugHe8RMwZlAR/raatwMPOPw/fHKbG2VOeZ5tGZINjrPTP4yjbJ8wTZ+h0r1+
EhbAMSMqtZmWow2TRD8o/2MF7827t7ZKPOrxaVPu+CMTrU3hNzEmdcceIgg9Wyxd
osvhC//TDs7dWjaKIWClVrVQFraEGm1Zxc1OTJRm1L8T0SSQ2fuOC1XRAvXBORQk
WtXoYCyMYZVYE9VtVzc+KNNzG9tt/Vd0hFhhGU7tb7lLoj1fvxUF22mvKOuAwMnI
pjntw4oylxzdUWOY4KdkXuGc53/WctQr/+dA/xoZDhiAFiUi6lo=
=ddC0
-----END PGP SIGNATURE-----

--Gg5fteLoWABIbJ6n--

