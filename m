Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC4438DFF4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:49:48 +0200 (CEST)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll1b8-0001jc-JC
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yu-0006Gy-DU; Sun, 23 May 2021 23:47:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41357 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll1Yq-00039N-KI; Sun, 23 May 2021 23:47:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpNSl1rs2z9sVb; Mon, 24 May 2021 13:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621828039;
 bh=JstdtvxgnPNNqSMXTfQwihriNttwFR4vRq8kzHzipcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JE0XO2/IANnNAD/4IlqbaGuHJDSrIUHOq7Quhy67Ruc35WR1GDdZ6Gy3CcOs+vl4e
 6fqokuXhsBbWT2S06yEOWYT5M4yBzPRKtStpNsBZmADPkf9nv2Ju2THry+Hh9ALgpk
 AWBg2UB1MeiCTLu2jLPwBtg8c9WzTN6BnK2XPQHU=
Date: Mon, 24 May 2021 13:12:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Don't hijack current_machine->boot_order
Message-ID: <YKsZkGKAOWZfT2s4@yekko>
References: <20210521160735.1901914-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vWHaxbTwK1h+zRln"
Content-Disposition: inline
In-Reply-To: <20210521160735.1901914-1-groug@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vWHaxbTwK1h+zRln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 06:07:35PM +0200, Greg Kurz wrote:
> QEMU 6.0 moved all the -boot variables to the machine. Especially, the
> removal of the boot_order static changed the handling of '-boot once'
> from:
>=20
>     if (boot_once) {
>         qemu_boot_set(boot_once, &error_fatal);
>         qemu_register_reset(restore_boot_order, g_strdup(boot_order));
>     }
>=20
> to
>=20
>     if (current_machine->boot_once) {
>         qemu_boot_set(current_machine->boot_once, &error_fatal);
>         qemu_register_reset(restore_boot_order,
>                             g_strdup(current_machine->boot_order));
>     }
>=20
> This means that we now register as subsequent boot order a copy
> of current_machine->boot_once that was just set with the previous
> call to qemu_boot_set(), i.e. we never transition away from the
> once boot order.
>=20
> It is certainly fragile^Wwrong for the spapr code to hijack a
> field of the base machine type object like that. The boot order
> rework simply turned this software boundary violation into an
> actual bug.
>=20
> Have the spapr code to handle that with its own field in
> SpaprMachineState. Also kfree() the initial boot device
> string when "once" was used.
>=20
> Fixes: 4b7acd2ac821 ("vl: clean up -boot variables")
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D1960119
> Cc: pbonzini@redhat.com
> Signed-off-by: Greg Kurz <groug@kaod.org>


Applied to ppc-for-6.1, thanks.

> ---
>  include/hw/ppc/spapr.h | 3 +++
>  hw/ppc/spapr.c         | 8 +++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index bbf817af4647..f05219f75ef6 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -223,6 +223,9 @@ struct SpaprMachineState {
>      int fwnmi_machine_check_interlock;
>      QemuCond fwnmi_machine_check_interlock_cond;
> =20
> +    /* Set by -boot */
> +    char *boot_device;
> +
>      /*< public >*/
>      char *kvm_type;
>      char *host_model;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c23bcc449071..4dd90b75cc52 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1005,7 +1005,7 @@ static void spapr_dt_chosen(SpaprMachineState *spap=
r, void *fdt, bool reset)
>      _FDT(chosen =3D fdt_add_subnode(fdt, 0, "chosen"));
> =20
>      if (reset) {
> -        const char *boot_device =3D machine->boot_order;
> +        const char *boot_device =3D spapr->boot_device;
>          char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
>          size_t cb =3D 0;
>          char *bootlist =3D get_boot_devices_list(&cb);
> @@ -2376,8 +2376,10 @@ static SaveVMHandlers savevm_htab_handlers =3D {
>  static void spapr_boot_set(void *opaque, const char *boot_device,
>                             Error **errp)
>  {
> -    MachineState *machine =3D MACHINE(opaque);
> -    machine->boot_order =3D g_strdup(boot_device);
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(opaque);
> +
> +    g_free(spapr->boot_device);
> +    spapr->boot_device =3D g_strdup(boot_device);
>  }
> =20
>  static void spapr_create_lmb_dr_connectors(SpaprMachineState *spapr)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vWHaxbTwK1h+zRln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrGY8ACgkQbDjKyiDZ
s5JZHBAAq9VHNaHtl3EH+6sXZS6xn5dL5P1Tk1RntWS5fwVrCdwER+NAmKXXnJfx
czW2OX2UTNl9StSU/jdTb273K97YMDqNLC9tCwdOsday4Dy5xpVpWtD1/ktR26PM
akGF8ubRVNrgOkv9kcvqygQ9dx61BVWl///MAvDA9iNjbLZ0E4/HfAwYBGoHv0t6
N7x8dQinc4r79BOzNarkYRWPFGGS+m760ueKrQDLZZOfOHuILOi3SmBccz058nXx
N7QpKjSFo+9AuH3kqsI0bt+j3VPEV/yEm7jbtnFeozPLwzyP1nYFbEB/DhJ80Z6k
7E14/d05eqs8IrPJ8gfRcpN0o6p2WSZnwgTuCCMdvMyALbM1xaFSojgmPouXP2Uu
Lu5Lz04S5Lr/bvMQZGacreEJT0hTuLSN87ts5OgFIOJ2l1hDUOnncMSMmI8AfjUd
6tthVnENnanewdMPiTr83+aigUG47iMbnWO72lq1RHR2DzFqK6gWpd2mAR4hTGyY
YgBHJwy2BPNsJOu+H4GGeY1ubgvi9gTi8fcGnfIpGr2t8OiV6bl9A6oiiy6u8KNr
dBcA1giIU39ImlEQVB0Pn40WibCMe5jmSmCcwbH6oHTUbHL5PCjBG+RtpjCed6cr
LVOONmWPpl7QbK1j1I2Uagiz+AZuDLuoU6NPJMCpwKbHkJ15qnc=
=B6uh
-----END PGP SIGNATURE-----

--vWHaxbTwK1h+zRln--

