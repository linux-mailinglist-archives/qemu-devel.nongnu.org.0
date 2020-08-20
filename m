Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15A24ACB0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 03:44:21 +0200 (CEST)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Zcq-0007Nk-59
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 21:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k8Zbh-0005ns-Fe; Wed, 19 Aug 2020 21:43:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39993 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k8Zba-0003xW-TT; Wed, 19 Aug 2020 21:43:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BX6q52txsz9sRN; Thu, 20 Aug 2020 11:42:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597887777;
 bh=ayT+7kXcim4DgHaR1gcnfrUmq4FRALUxHxKVV9Yj5Uk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RtAu3q3b6vgE7HhK5cHuPlugi5/DeWqzpXFwcR7oEJWKZPr90PXU52aJN7IXUqK5t
 B5yMz2BH+4Kcrh6TmGut+CCtzKWzYfdL8CpxUNJSL3Awu9dks+OL6T134/1HC0lhAv
 JjoTQbK26WePNyD9fr9A4BMIv3jJ59DoTbdRJq7s=
Date: Thu, 20 Aug 2020 11:33:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 3/8] spapr/xive: Query the characteristics of a source in
 KVM
Message-ID: <20200820013333.GG271315@yekko.fritz.box>
References: <20200819130843.2230799-1-clg@kaod.org>
 <20200819130843.2230799-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Content-Disposition: inline
In-Reply-To: <20200819130843.2230799-4-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:59:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 03:08:38PM +0200, C=E9dric Le Goater wrote:
> When running a guest with a kernel IRQ chip enabled, the XIVE
> characteristics of the interrupts are advertised to the guest in the
> H_INT_GET_SOURCE_INFO hcall. These characteristics depend on the
> underlying HW interrupts but today, QEMU simply advertises its own
> without checking what the host supports. It is not a problem for the
> moment, but POWER10 will (re)add support for StoreEOI and we need a
> way to in sync with the host.
>=20
> The KVM_DEV_XIVE_GRP_SOURCE_INFO command lets QEMU query the XIVE
> characteristics of the underlying HW interrupts and override any
> previous setting done by QEMU. This allows the fallback mode, when the
> XIVE device is emulated by QEMU, to use its own custom settings on the
> sources but makes sure that we don't let a guest run with features
> incompatible with KVM.
>=20
> It only applies to the StoreEOI feature for the moment.

Urgh.  This means that the source characteristics can change across a
migration, that's kind of a problem.

> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/spapr_xive.h |  2 ++
>  hw/intc/spapr_xive.c        | 20 ++++++++++++++++++++
>  hw/intc/spapr_xive_kvm.c    | 26 ++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 1dddcbcb9cdd..3f325723ea74 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -84,6 +84,8 @@ void kvmppc_xive_disconnect(SpaprInterruptController *i=
ntc);
>  void kvmppc_xive_reset(SpaprXive *xive, Error **errp);
>  int kvmppc_xive_set_source_config(SpaprXive *xive, uint32_t lisn, XiveEA=
S *eas,
>                                    Error **errp);
> +int kvmppc_xive_get_source_info(SpaprXive *xive, uint32_t lisn, uint64_t=
 *flags,
> +                                 Error **errp);
>  void kvmppc_xive_sync_source(SpaprXive *xive, uint32_t lisn, Error **err=
p);
>  uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
>                              uint64_t data, bool write);
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 1fa09f287ac0..943b9958a68b 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -932,6 +932,26 @@ static target_ulong h_int_get_source_info(PowerPCCPU=
 *cpu,
>          args[0] |=3D SPAPR_XIVE_SRC_STORE_EOI;
>      }
> =20
> +    if (kvm_irqchip_in_kernel()) {
> +        Error *local_err =3D NULL;
> +        uint64_t flags =3D 0;
> +
> +        kvmppc_xive_get_source_info(xive, lisn, &flags, &local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            return H_HARDWARE;
> +        }
> +
> +        /*
> +         * Override QEMU settings with KVM values
> +         */
> +        if (flags & XIVE_SRC_STORE_EOI) {
> +            args[0] |=3D SPAPR_XIVE_SRC_STORE_EOI;
> +        } else {
> +            args[0] &=3D ~SPAPR_XIVE_SRC_STORE_EOI;
> +        }
> +    }
> +
>      /*
>       * Force the use of the H_INT_ESB hcall in case of an LSI
>       * interrupt. This is necessary under KVM to re-trigger the
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index e8667ce5f621..90f4509e6959 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -217,6 +217,32 @@ int kvmppc_xive_set_source_config(SpaprXive *xive, u=
int32_t lisn, XiveEAS *eas,
>                               &kvm_src, true, errp);
>  }
> =20
> +int kvmppc_xive_get_source_info(SpaprXive *xive, uint32_t lisn, uint64_t=
 *flags,
> +                                 Error **errp)
> +{
> +    struct kvm_ppc_xive_src kvm_src =3D { 0 };
> +    int ret;
> +
> +    /*
> +     * Check that KVM supports the new attribute to query source
> +     * characteristics.
> +     */
> +    if (!kvm_device_check_attr(xive->fd, KVM_DEV_XIVE_GRP_SOURCE_INFO, 0=
)) {
> +        return 0;
> +    }
> +
> +    ret =3D kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE_INFO, li=
sn,
> +                            &kvm_src, false, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (kvm_src.flags & KVM_XIVE_SOURCE_FLAG_STORE_EOI) {
> +        *flags |=3D XIVE_SRC_STORE_EOI;
> +    }
> +    return 0;
> +}
> +
>  void kvmppc_xive_sync_source(SpaprXive *xive, uint32_t lisn, Error **err=
p)
>  {
>      kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE_SYNC, lisn,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl890usACgkQbDjKyiDZ
s5JDAw/9GN/3LDbV22Ff3ub7O03+t9VS8FyZFAE+dKyrvYDzdgDbo0Zhvw9M8kpI
7nySlrSw+AKrasEVFwYTUJ5tMDJap3m6hSBpTZXO5Sn2ITrKWpp/putgJgPPwxHQ
bhvjXQ1McIGlSr7rWdhOQ/iLXQ1ihhsx301ouBUZdXj9dFYyerhL7mLxR7FnxeA9
pE3IVqPiDXNWQw6rTab/96qfF3Ic+nefaSFtVnIMhV+5z8wuThVJ4E6VPaUOTOFz
I7JNiqHFQ+b1n4WKjZPupszXKzVfV7g1N01AyyyOcIUrUiTxwjVtKsibjdUP55Sx
bZK11wnQyPp/lKs99RMFcdVQ5QLEfiP+ZPT4msA9pjEis1gIgWCWXWKKK6SFoJQm
NToTreGy4GdA3IBIVXcf337+2gomrmAxhkOijDUuJyapGCEMeb83aXulYYUPK3Bt
1yWOlZQqX9bQStRmMG+8PWwAQtCQldGH59niWlyhZ7KoQOd2AdkF4wpjA2EWAB6x
qPEm28XacFq3dp3U+hgBpJnAzfCoE/9kdgyyJXy+Q+Luot0gd/h+NDxVktmVSQoL
sXRve4P3d8Fe51QqcOesKC/FVMnfmqI4RvFrneui/qdTwg1l9yl+pU+Um7A1WpcM
6OoZPe34AJxOgPpEfwE4cryA8uXoGZFP/ALCvpMUV15nm6obdrE=
=UhsZ
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--

