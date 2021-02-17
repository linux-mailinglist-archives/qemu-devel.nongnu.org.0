Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024F31D3F4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 03:35:07 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCCgE-0000tO-K3
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 21:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCCeZ-0008Nn-Rh; Tue, 16 Feb 2021 21:33:24 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51419 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCCeX-0004gl-2j; Tue, 16 Feb 2021 21:33:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgMMZ6qTTz9sRf; Wed, 17 Feb 2021 13:33:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613529194;
 bh=ybuP2uxZWcqgXGIdNxIAsC/Po4B22bK9vG+eVKrWJgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JacNLUBCAsllnEmi7Pf9wu1i0gxrLu+CJRt6vVSnGSSXc+oUwaf/oXuGFnx6uK+gs
 YzwL8SezqbBTXV1Bq6Z60HHSjXoKAk6JI7jpGkN13JFaxNguT8ev+ULEx0jkfKcrbU
 nNHeKhWOPmIsntGHmZUYb64dUhrFigo3xAryQuew=
Date: Wed, 17 Feb 2021 13:31:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 7/7] spapr_drc.c: use DRC reconfiguration to cleanup
 DIMM unplug state
Message-ID: <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ohOW0kNf5n6XSvz"
Content-Disposition: inline
In-Reply-To: <20210211225246.17315-8-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2ohOW0kNf5n6XSvz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 07:52:46PM -0300, Daniel Henrique Barboza wrote:
> Handling errors in memory hotunplug in the pSeries machine is more complex
> than any other device type, because there are all the complications that =
other
> devices has, and more.
>=20
> For instance, determining a timeout for a DIMM hotunplug must consider if=
 it's a
> Hash-MMU or a Radix-MMU guest, because Hash guests takes longer to hotunp=
lug DIMMs.
> The size of the DIMM is also a factor, given that longer DIMMs naturally =
takes
> longer to be hotunplugged from the kernel. And there's also the guest mem=
ory usage to
> be considered: if there's a process that is consuming memory that would b=
e lost by
> the DIMM unplug, the kernel will postpone the unplug process until the pr=
ocess
> finishes, and then initiate the regular hotunplug process. The first two
> considerations are manageable, but the last one is a deal breaker.
>=20
> There is no sane way for the pSeries machine to determine the memory load=
 in the guest
> when attempting a DIMM hotunplug - and even if there was a way, the guest=
 can start
> using all the RAM in the middle of the unplug process and invalidate our =
previous
> assumptions - and in result we can't even begin to calculate a timeout fo=
r the
> operation. This means that we can't implement a viable timeout mechanism =
for memory
> unplug in pSeries.
>=20
> Going back to why we would consider an unplug timeout, the reason is that=
 we can't
> know if the kernel is giving up the unplug. Turns out that, sometimes, we=
 can.
> Consider a failed memory hotunplug attempt where the kernel will error ou=
t with
> the following message:
>=20
> 'pseries-hotplug-mem: Memory indexed-count-remove failed, adding any remo=
ved LMBs'
>=20
> This happens when there is a LMB that the kernel gave up in removing, and=
 the LMBs
> marked for removal of the same DIMM are now being added back. This proces=
s happens

We need to be a little careful about terminology here.  From the
guest's point of view, there's no such thing as a DIMM, only LMBs.
What the guest is doing here is essentially rejecting a single "index
+ number" DRC unplug request, which corresponds to one DIMM on the
qemu side.

> in the pseries kernel in [1], dlpar_memory_remove_by_ic() into dlpar_add_=
lmb(), and
> after that update_lmb_associativity_index(). In this function, the kernel=
 is configuring
> the LMB DRC connector again. Note that this is a valid usage in LOPAR, as=
 stated in
> section "ibm,configure-connector RTAS Call":
>=20
> 'A subsequent sequence of calls to ibm,configure-connector with the same =
entry from
> the =E2=80=9Cibm,drc-indexes=E2=80=9D or =E2=80=9Cibm,drc-info=E2=80=9D p=
roperty will restart the configuration of
> devices which were not completely configured.'
>=20
> We can use this kernel behavior in our favor. If a DRC connector reconfig=
uration
> for a LMB that we marked as unplug pending happens, this indicates that t=
he kernel
> changed its mind about the unplug and is reasserting that it will keep us=
ing the
> DIMM. In this case, it's safe to assume that the whole DIMM unplug was ca=
ncelled.
>=20
> This patch hops into rtas_ibm_configure_connector() and, in the scenario =
described
> above, clear the unplug state for the DIMM device. This will not solve al=
l the
> problems we still have with memory unplug, but it will cover this case wh=
ere the
> kernel reconfigures LMBs after a failed unplug. We are a bit more resilie=
nt,
> without using an unreliable timeout, and we didn't make the remaining err=
or cases
> any worse.

I wonder if we could use this as a beginning of a hotplug failure
reporting mechanism.  As noted, this is explicitly allowed by PAPR and
I think in general it makes sense that a configure-connector would
re-assert that the guest is using the resource and we can't unplug it.

Could we extend guests to do an indicative configure-connector on any
unplug it knows it can't complete?  Or if configure-connector is too
disruptive could we use an (extra) H_SET_INDICATOR to "UNISOLATE"
state? If I'm reading right, that should be both permitted and a no-op
for existing PAPR implementations, so it should be a pretty safe way
to add that indication.

>=20
> [1] arch/powerpc/platforms/pseries/hotplug-memory.c
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c         | 30 ++++++++++++++++++++++++++++++
>  hw/ppc/spapr_drc.c     | 14 ++++++++++++++
>  include/hw/ppc/spapr.h |  2 ++
>  3 files changed, 46 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index ecce8abf14..4bcded4a1a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3575,6 +3575,36 @@ static SpaprDimmState *spapr_recover_pending_dimm_=
state(SpaprMachineState *ms,
>      return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
>  }
> =20
> +void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> +                                           PCDIMMDevice *dimm)
> +{
> +    SpaprDimmState *ds =3D spapr_pending_dimm_unplugs_find(spapr, dimm);
> +    SpaprDrc *drc;
> +    uint32_t nr_lmbs;
> +    uint64_t size, addr_start, addr;
> +    int i;
> +
> +    if (ds) {
> +        spapr_pending_dimm_unplugs_remove(spapr, ds);
> +    }

Hrm... how would !ds arise?  Could this just be an assert?

> +
> +    size =3D memory_device_get_region_size(MEMORY_DEVICE(dimm), &error_a=
bort);
> +    nr_lmbs =3D size / SPAPR_MEMORY_BLOCK_SIZE;
> +
> +    addr_start =3D object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_P=
ROP,
> +                                          &error_abort);
> +
> +    addr =3D addr_start;
> +    for (i =3D 0; i < nr_lmbs; i++) {
> +        drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
> +                              addr / SPAPR_MEMORY_BLOCK_SIZE);
> +        g_assert(drc);
> +
> +        drc->unplug_requested =3D false;
> +        addr +=3D SPAPR_MEMORY_BLOCK_SIZE;
> +    }
> +}
> +
>  /* Callback to be called during DRC release. */
>  void spapr_lmb_release(DeviceState *dev)
>  {
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index c143bfb6d3..eae941233a 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -1230,6 +1230,20 @@ static void rtas_ibm_configure_connector(PowerPCCP=
U *cpu,
> =20
>      drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> =20
> +    /*
> +     * This indicates that the kernel is reconfiguring a LMB due to
> +     * a failed hotunplug. Clear the pending unplug state for the whole
> +     * DIMM.
> +     */
> +    if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_LMB &&
> +        drc->unplug_requested) {
> +
> +        /* This really shouldn't happen in this point, but ... */
> +        g_assert(drc->dev);

I'm a little worried that a buggy or malicious guest could trigger
this assert.

> +
> +        spapr_clear_pending_dimm_unplug_state(spapr, PC_DIMM(drc->dev));
> +    }
> +
>      if (!drc->fdt) {
>          void *fdt;
>          int fdt_size;
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ccbeeca1de..5bcc8f3bb8 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -847,6 +847,8 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
>  int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **er=
rp);
>  void spapr_clear_pending_events(SpaprMachineState *spapr);
>  void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
> +void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> +                                           PCDIMMDevice *dimm);
>  int spapr_max_server_number(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2ohOW0kNf5n6XSvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsf/8ACgkQbDjKyiDZ
s5Iuhw//UIs1N0GLNX9eGtcbAJQAnmh1x8W3jMWfO58Fcf/GHh6yA44cfw5bd95z
2ioHNkqODHyC1SJ57AWzMIcQEfSsbGUEML+cILR5lwJDOHzjBl4xkSbcjN7pq2Ax
HRPts3ke2+wVhxg9mx6addUFTKfQw6BrUGCg2ueBnN+kyDdGIEa2n9OpvAJtD5Rn
aXp/i+prgXRVzZCFrxmCc95udQRtNTO9Lsh3y/H7qucDRerNa6+UezuaAH9KS2Th
lk+mayEwMJwmj2MxGFMFCeRwu6Ky5HqccgOUXjwFdmJzUWamq/RStuelAwCT9oVq
KX29T0S6A/SVP4N/PEEEzctymkTa4LQUEjwLQH4iBtFDGgyauZGuiHy3IPonlsty
7dya1SwfjUH3DwNejUADJX1haEVtiFDk238cSsWfZtK58/ry/djMs6Qo/aeLopK3
0OFYxsniovAQ/MNboDIUNh7qb3Moakemx+BvjPdr8p85bxUU+dUotJhpk3v+mRj0
1cx8GEeNLFEcf1uB/pKcoUp4loPvXhNjEUC9qcoathZRRubQE9zzZWbfI9Ldlj0z
rvyxDC7ugqyVhlTB9Y0lWsguQKvKqE9RZQgAP7leEtnJ1BHnEDlSlcuYfzTFNjLv
FK7+XjvHudlBk4I5zQkD29HWd7IAdh6kT/948zqnYbuCeXaHly8=
=1vbB
-----END PGP SIGNATURE-----

--2ohOW0kNf5n6XSvz--

