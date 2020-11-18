Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC12B2B75ED
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 06:30:27 +0100 (CET)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfG30-0005e1-A1
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 00:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kfG0h-0004HK-8y; Wed, 18 Nov 2020 00:28:03 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38075 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kfG0c-0004m1-RL; Wed, 18 Nov 2020 00:28:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CbWXv6lZPz9sPB; Wed, 18 Nov 2020 16:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1605677263;
 bh=iREk8p8w7Uw+33lW/V7Z2GeX0QSk3CCgerDbXWzhUAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RheqRGMe5Gh0luKL4J7L7sxcRi0FqIDhcRLFI+vCXZ5+pMfRn8scsnawQKBikc38v
 DbgqY0HD/c/0fE0pUxAqhg2F6evfo8JQZbBippcdKpOn1rkPUThlnSQeepNrm6u5Uj
 uWOK2XfpDnJbfolAFSvJ0pGGaBrUW4rAyVfUQI/s=
Date: Wed, 18 Nov 2020 16:24:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-5.2] Revert series "spapr/xive: Allocate vCPU IPIs
 from the vCPU contexts"
Message-ID: <20201118052442.GC411463@yekko.fritz.box>
References: <160554086275.1325084.12110142252189044646.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline
In-Reply-To: <160554086275.1325084.12110142252189044646.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Satheesh Rajendran <sathnaga@linux.ibm.com>,
 Gustavo Romero <gromero@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 04:34:22PM +0100, Greg Kurz wrote:
> This series was largely built on the assumption that IPI numbers are
> numerically equal to vCPU ids. Even if this happens to be the case
> in practice with the default machine settings, this ceases to be true
> if VSMT is set to a different value than the number of vCPUs per core.
> This causes bogus IPI numbers to be created in KVM from a guest stand
> point. This leads to unknow results in the guest, including crashes
> or missing vCPUs (see BugLink) and even non-fatal oopses in current
> KVM that lacks a check before accessing misconfigured HW (see [1]).
>=20
> A tentative patch was sent (see [2]) but it seems too complex to be
> merged in an RC. Since the original changes are essentially an
> optimization, it seems safer to revert them for now. The damage is
> done by commit acbdb9956fe9 ("spapr/xive: Allocate IPIs independently
> from the other sources") but the previous patches in the series are
> really preparatory patches. So this reverts the whole series:
>=20
> eab0a2d06e97 ("spapr/xive: Allocate vCPU IPIs from the vCPU contexts")
> acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the other sou=
rces")
> fa94447a2cd6 ("spapr/xive: Use kvmppc_xive_source_reset() in post_load")
> 235d3b116213 ("spapr/xive: Modify kvm_cpu_is_enabled() interface")
>=20
> [1] https://marc.info/?l=3Dkvm-ppc&m=3D160458409722959&w=3D4
> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03626.html
>=20
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Fixes: acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the ot=
her sources")
> BugLink: https://bugs.launchpad.net/qemu/+bug/1900241
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> Peter,
>=20
> I'm Cc'ing you because we really want to fix this regression in 5.2.
> Reverting the culprit optimization seems a lot safer than the changes
> proposed in my other patch. David is on PTO right now and I'm not sure
> if he can post a PR anytime soon. Just in case: would it be acceptable
> to you if I send a PR after it got some positive feedback from the
> people on the Cc: list ? The better the sooner or do we wait for David
> to get a chance to step in ?

I am indeed on holiday, and I'm not going to review this until next
week.  I trust Greg's judgement, though, so I'm happy for this to be
applied directly.


> ---
>  hw/intc/spapr_xive_kvm.c |  102 ++++++++--------------------------------=
------
>  1 file changed, 18 insertions(+), 84 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 66bf4c06fe55..e8667ce5f621 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -36,9 +36,10 @@ typedef struct KVMEnabledCPU {
>  static QLIST_HEAD(, KVMEnabledCPU)
>      kvm_enabled_cpus =3D QLIST_HEAD_INITIALIZER(&kvm_enabled_cpus);
> =20
> -static bool kvm_cpu_is_enabled(unsigned long vcpu_id)
> +static bool kvm_cpu_is_enabled(CPUState *cs)
>  {
>      KVMEnabledCPU *enabled_cpu;
> +    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cs);
> =20
>      QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
>          if (enabled_cpu->vcpu_id =3D=3D vcpu_id) {
> @@ -146,45 +147,6 @@ int kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx=
, Error **errp)
>      return s.ret;
>  }
> =20
> -/*
> - * Allocate the vCPU IPIs from the vCPU context. This will allocate
> - * the XIVE IPI interrupt on the chip on which the vCPU is running.
> - * This gives a better distribution of IPIs when the guest has a lot
> - * of vCPUs. When the vCPUs are pinned, this will make the IPI local
> - * to the chip of the vCPU. It will reduce rerouting between interrupt
> - * controllers and gives better performance.
> - */
> -typedef struct {
> -    SpaprXive *xive;
> -    Error *err;
> -    int rc;
> -} XiveInitIPI;
> -
> -static void kvmppc_xive_reset_ipi_on_cpu(CPUState *cs, run_on_cpu_data a=
rg)
> -{
> -    unsigned long ipi =3D kvm_arch_vcpu_id(cs);
> -    XiveInitIPI *s =3D arg.host_ptr;
> -    uint64_t state =3D 0;
> -
> -    s->rc =3D kvm_device_access(s->xive->fd, KVM_DEV_XIVE_GRP_SOURCE, ip=
i,
> -                              &state, true, &s->err);
> -}
> -
> -static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, Error **=
errp)
> -{
> -    XiveInitIPI s =3D {
> -        .xive =3D xive,
> -        .err  =3D NULL,
> -        .rc   =3D 0,
> -    };
> -
> -    run_on_cpu(cs, kvmppc_xive_reset_ipi_on_cpu, RUN_ON_CPU_HOST_PTR(&s)=
);
> -    if (s.err) {
> -        error_propagate(errp, s.err);
> -    }
> -    return s.rc;
> -}
> -
>  int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -195,7 +157,7 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **e=
rrp)
>      assert(xive->fd !=3D -1);
> =20
>      /* Check if CPU was hot unplugged and replugged. */
> -    if (kvm_cpu_is_enabled(kvm_arch_vcpu_id(tctx->cs))) {
> +    if (kvm_cpu_is_enabled(tctx->cs)) {
>          return 0;
>      }
> =20
> @@ -214,12 +176,6 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **=
errp)
>          return ret;
>      }
> =20
> -    /* Create/reset the vCPU IPI */
> -    ret =3D kvmppc_xive_reset_ipi(xive, tctx->cs, errp);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
>      kvm_cpu_enable(tctx->cs);
>      return 0;
>  }
> @@ -279,12 +235,6 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, i=
nt srcno, Error **errp)
> =20
>      assert(xive->fd !=3D -1);
> =20
> -    /*
> -     * The vCPU IPIs are now allocated in kvmppc_xive_cpu_connect()
> -     * and not with all sources in kvmppc_xive_source_reset()
> -     */
> -    assert(srcno >=3D SPAPR_XIRQ_BASE);
> -
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
>          state |=3D KVM_XIVE_LEVEL_SENSITIVE;
>          if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> @@ -296,28 +246,12 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, =
int srcno, Error **errp)
>                               true, errp);
>  }
> =20
> -/*
> - * To be valid, a source must have been claimed by the machine (valid
> - * entry in the EAS table) and if it is a vCPU IPI, the vCPU should
> - * have been enabled, which means the IPI has been allocated in
> - * kvmppc_xive_cpu_connect().
> - */
> -static bool xive_source_is_valid(SpaprXive *xive, int i)
> -{
> -    return xive_eas_is_valid(&xive->eat[i]) &&
> -        (i >=3D SPAPR_XIRQ_BASE || kvm_cpu_is_enabled(i));
> -}
> -
>  static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
>      int i;
> =20
> -    /*
> -     * Skip the vCPU IPIs. These are created/reset when the vCPUs are
> -     * connected in kvmppc_xive_cpu_connect()
> -     */
> -    for (i =3D SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
> +    for (i =3D 0; i < xsrc->nr_irqs; i++) {
>          int ret;
> =20
>          if (!xive_eas_is_valid(&xive->eat[i])) {
> @@ -399,7 +333,7 @@ static void kvmppc_xive_source_get_state(XiveSource *=
xsrc)
>      for (i =3D 0; i < xsrc->nr_irqs; i++) {
>          uint8_t pq;
> =20
> -        if (!xive_source_is_valid(xive, i)) {
> +        if (!xive_eas_is_valid(&xive->eat[i])) {
>              continue;
>          }
> =20
> @@ -582,7 +516,7 @@ static void kvmppc_xive_change_state_handler(void *op=
aque, int running,
>              uint8_t pq;
>              uint8_t old_pq;
> =20
> -            if (!xive_source_is_valid(xive, i)) {
> +            if (!xive_eas_is_valid(&xive->eat[i])) {
>                  continue;
>              }
> =20
> @@ -610,7 +544,7 @@ static void kvmppc_xive_change_state_handler(void *op=
aque, int running,
>      for (i =3D 0; i < xsrc->nr_irqs; i++) {
>          uint8_t pq;
> =20
> -        if (!xive_source_is_valid(xive, i)) {
> +        if (!xive_eas_is_valid(&xive->eat[i])) {
>              continue;
>          }
> =20
> @@ -713,22 +647,22 @@ int kvmppc_xive_post_load(SpaprXive *xive, int vers=
ion_id)
>          }
>      }
> =20
> -    /*
> -     * We can only restore the source config if the source has been
> -     * previously set in KVM. Since we don't do that at reset time
> -     * when restoring a VM, let's do it now.
> -     */
> -    ret =3D kvmppc_xive_source_reset(&xive->source, &local_err);
> -    if (ret < 0) {
> -        goto fail;
> -    }
> -
>      /* Restore the EAT */
>      for (i =3D 0; i < xive->nr_irqs; i++) {
> -        if (!xive_source_is_valid(xive, i)) {
> +        if (!xive_eas_is_valid(&xive->eat[i])) {
>              continue;
>          }
> =20
> +        /*
> +         * We can only restore the source config if the source has been
> +         * previously set in KVM. Since we don't do that for all interru=
pts
> +         * at reset time anymore, let's do it now.
> +         */
> +        ret =3D kvmppc_xive_source_reset_one(&xive->source, i, &local_er=
r);
> +        if (ret < 0) {
> +            goto fail;
> +        }
> +
>          ret =3D kvmppc_xive_set_source_config(xive, i, &xive->eat[i], &l=
ocal_err);
>          if (ret < 0) {
>              goto fail;
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+0sBoACgkQbDjKyiDZ
s5KfqxAAvLFjCE/nCB530OAxyF2WzO6BujHtpSYwPvBVajet633QLSX+UxoT9ykv
n2V+tZBDJCaVF/+v6OZ7UajBFz1k2bLf3GceVKEMjks6AmwKPU+YkSk953qPRkxk
b+haYxdMepTxZn1mZ6Pwr/fn4+3j8RP8MDqJgnno1cowCR2q/nk2DpLuySPy0k8t
tEF5Xw4nbTRpXerdr6s/14koCmnh3mNqquLTvE299uB8ucvc16PkzY0X9eU3C6SI
xvbw2ZMT2NQ+6Z9HdEexMEoEYiGLdb3QqEMtnOTyGkBl5qsOqwjLLxD+zmN4fqAi
z9Iy2sdpEhZubtyzGDDxof3T5Qprg7Sn3RhFoNj8QhxkvDN5iRaDQBu2HSaOfliQ
KqUOFHTA9KNVAhKkUcKJVCp4iH14yDqSlkAnQlK3ujc7h/uekZf7NpZOi6Dt+kwJ
poZD/yMnMfYG0czFhHh+xs2RteMlrzjMxVC08+NqYIPeRrbdqwy9YSC8qyBNvjac
CjYPo8bKFkPfrg7mxWtHPkP5KRTWHSANsna87qihw9AO1XcUTd1bxokqgm1qXJk0
gIpwMUhrp62c+f2nIXwUlc8QffAj49k/E+m+j99BDCakttfBKVut0dMHJgMQBts2
sxjjBPkeJpqtvTxrUnKRzuxJ32B0GdDuivIJzKHEeUg4V+vVbWg=
=3rkW
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--

