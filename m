Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5954E2124
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:19:53 +0100 (CET)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCKU-0005hg-3y
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:19:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWC59-00073x-4U; Mon, 21 Mar 2022 03:04:01 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWC55-000097-7N; Mon, 21 Mar 2022 03:03:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KMQZY1v3Kz4xc5; Mon, 21 Mar 2022 18:03:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647846229;
 bh=cG/Hb5o2mu5wRjjVoTQAcXb8ZKPiBQIOdo+VJ7dyUrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aczdteGBfDQ36gB31E0WRNwKQb/rkS7V3N7UXW4S0feLvoaZlwSt3YNvZ3tKOaDmL
 8yHmNPaD4qPcfn6+JbaI0HwThdHgM1LJfxPpEnNidPZI5ULrRip8no1Ib+kB78wvMX
 0VsaxbcvSKh1HD0h4alr7yaI0JfzghDxNuZICG6M=
Date: Mon, 21 Mar 2022 14:57:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/3] spapr: Ignore nested KVM hypercalls when not running
 TCG
Message-ID: <Yjf3pU3k5YEg/TVB@yekko>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
 <20220317172049.2681740-2-farosas@linux.ibm.com>
 <YjP8iOgtvoLI3e/z@yekko> <87lex7l6o0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9ExuLAL6n+BFY9K9"
Content-Disposition: inline
In-Reply-To: <87lex7l6o0.fsf@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--9ExuLAL6n+BFY9K9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 10:41:19AM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Mar 17, 2022 at 02:20:47PM -0300, Fabiano Rosas wrote:
> >> It is possible that nested KVM hypercalls reach QEMU while we're
> >> running KVM. The spapr virtual hypervisor implementation of the nested
> >> KVM API only works when the L1 is running under TCG. So return
> >> H_FUNCTION if we are under KVM.
> >>=20
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >> ---
> >>  hw/ppc/spapr_hcall.c | 10 +++++++++-
> >>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> >> index f008290787..119baa1d2d 100644
> >> --- a/hw/ppc/spapr_hcall.c
> >> +++ b/hw/ppc/spapr_hcall.c
> >> @@ -1508,7 +1508,7 @@ static target_ulong h_set_ptbl(PowerPCCPU *cpu,
> >>  {
> >>      target_ulong ptcr =3D args[0];
> >> =20
> >> -    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
> >> +    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV) || !tcg_enable=
d()) {
> >
> > I was about to nack this on the grounds that it changes guest visible
> > behaviour based on host properties.  Then I realized that's not the
> > case, because in the KVM + SPAPR_CAP_NESTED_KVM_HV case the hypercall
> > should be caught by KVM first and never reach here.
> >
> > So at the very least I think this needs a comment explaining that.
>=20
> Ok.
>=20
> > However, I'm still kind of confused how we would get here in the first
> > place.  If SPAPR_CAP_NESTED_KVM_HV is set, but KVM doesn't support it,
> > we should fail outright in cap_nested_kvm_hv_apply().  So how *do* we
> > get here?  Is the kernel not doing what we expect of it?  If so, we
> > should probably abort, rather than just returning H_FUNCTION.
>=20
> Indeed, If all parts are functioning this should never happen. I was
> hacking in L0 and accidentally let some hcalls through. So I'm just
> being overly cautions with this patch. If that will end up causing too
> much confusion, we could drop this one.

Ok, having something check that case is reasonable - but as a "can't
happen" it should abort, rather than returning something sensible to
the guest.

>=20
> >>          return H_FUNCTION;
> >>      }
> >> =20
> >> @@ -1532,6 +1532,10 @@ static target_ulong h_tlb_invalidate(PowerPCCPU=
 *cpu,
> >>       * across L1<->L2 transitions, so nothing is required here.
> >>       */
> >> =20
> >> +    if (!tcg_enabled()) {
> >> +        return H_FUNCTION;
> >> +    }
> >> +
> >>      return H_SUCCESS;
> >>  }
> >> =20
> >> @@ -1572,6 +1576,10 @@ static target_ulong h_enter_nested(PowerPCCPU *=
cpu,
> >>      uint64_t cr;
> >>      int i;
> >> =20
> >> +    if (!tcg_enabled()) {
> >> +        return H_FUNCTION;
> >> +    }
> >> +
> >>      if (spapr->nested_ptcr =3D=3D 0) {
> >>          return H_NOT_AVAILABLE;
> >>      }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9ExuLAL6n+BFY9K9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI3954ACgkQgypY4gEw
YSIa/g//R28zyOyph+u3SAV+ikrR/mBG2zyrrX41NQRfkZkOctgVaIKdrVwIsDCO
CM7UBtlHofZRb6NLap9slBzEpKhCF83btIs7V3SXM3oEGo7OIM0XfsWWfjUho92C
PZr44jwmBNA1qxGgavIcVoBwBX2OjH4EbmjmCMkdiERAtMGZ6tgXlyAIH6ZfOqdb
u3U38jsO6H3O2KDF7BtEK0NA6eu9BbhyGfoood94+jNwFKxhvs5jbniSHYxVlXVi
bziAlzLrevFVuWzQA5FszwnOAtQ0MQpm7r1t2IggPnZnhCyzpQpjrBgQIb7tfz9p
dZaY1cPcQjSH8tNmuukbuheKXLFji2eaP5kHZvZZJ3MNirLRo8nA1pUeEnBddShC
crPlhCfoBWSlyGzEqINr91LKzerKHrnix0gFydOFIB2U7UL28orTReqbL1UwikC2
hI2kWC4DK9B6pDL68Nb6BHpNve/XsGFOj8Z2hG1AITGKJetG82MoOjxP+JKXu/hZ
b+Hsopa2vm3jvqilOvc+nfc9P33HduhS7iCIL1qOahige7XPm1vEH8oPEAtOkxL0
SZ8gd8YoJgN0mfCGHOrsj2us69VRcarMTeex5QCi2Z43zLhmtnRj5PU3ilMiaT0v
WwEBXdKNHDD20p/ho9LwvvvvmftQKvXbgrHD500RsHd+vHK7z2Y=
=xWUp
-----END PGP SIGNATURE-----

--9ExuLAL6n+BFY9K9--

