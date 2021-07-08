Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844183BF4D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:46:12 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LvP-0006AC-83
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Ls4-0004UG-Sj; Thu, 08 Jul 2021 00:42:44 -0400
Received: from ozlabs.org ([203.11.71.1]:60885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Ls1-0000eK-Mp; Thu, 08 Jul 2021 00:42:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL3Ym1Hr2z9sWq; Thu,  8 Jul 2021 14:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625719356;
 bh=qBZe2JJwZSJyAKLeK0GIJwOM+MkaGJOAf2t6H9EEdI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SvkBlQyoFyQZXb+cI9s7No6t4nnopvyW7BKbou9Pf1dmfdPmZYwTN07Mv/CyQH3NX
 PaoKacbhqvcTpINtzyqbRAr26JK8LPTLsrisHzVSZQCvZufxhbUnZbmwCr/4WL5H2k
 34DtmXVTPATikLMpZL451nD3RZXUUeFrRAZx7lUE=
Date: Thu, 8 Jul 2021 14:07:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
Message-ID: <YOZ59azHunGLT2v0@yekko>
References: <20210625055155.2252896-1-aik@ozlabs.ru> <YOZlnOiCeeF4mwJO@yekko>
 <377380cb-64cb-9bde-82c3-7dfcdf3210c6@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j2zxXih3z4Y0YEXT"
Content-Disposition: inline
In-Reply-To: <377380cb-64cb-9bde-82c3-7dfcdf3210c6@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--j2zxXih3z4Y0YEXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 01:15:10PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 08/07/2021 12:40, David Gibson wrote:
> > On Fri, Jun 25, 2021 at 03:51:55PM +1000, Alexey Kardashevskiy wrote:
[snip]
> > > +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fd=
t)
> > > +{
> > > +    char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> > > +    int chosen;
> > > +
> > > +    vof_build_dt(fdt, spapr->vof);
> > > +
> > > +    _FDT(chosen =3D fdt_path_offset(fdt, "/chosen"));
> > > +    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
> > > +                            spapr->vof->bootargs ? : ""));
> >=20
> > You do several things with vof->bootargs, but if you've initialized it
> > from machine->kernel_cmdline, I didn't spot it.
>=20
>=20
> GRUB initilizes it and updates via spapr_vof_setprop().

Right, but my point is if an OF client doesn't poke it, it should have
the value from qemu's -append option which is in
machine->kernel_cmdline.

[snip]
> > > +static int path_offset(const void *fdt, const char *path)
> > > +{
> > > +    g_autofree char *p =3D NULL;
> > > +    char *at;
> > > +
> > > +    /*
> > > +     * https://www.devicetree.org/open-firmware/bindings/ppc/release=
/ppc-2_1.html#HDR16
> > > +     *
> > > +     * "Conversion from numeric representation to text representatio=
n shall use
> > > +     * the lower case forms of the hexadecimal digits in the range a=
=2E.f,
> > > +     * suppressing leading zeros".
> >=20
> > Huh... that suggests that Zoltan's firmware which passes a caps hex
> > and expects it to work is doing the wrong thing.  We still need to
> > accomodate it, though.
> >=20
> > > +     */
> > > +    at =3D strchr(path, '@');
> > > +    if (!at) {
> > > +        return fdt_path_offset(fdt, path);
> > > +    }
> > > +
> > > +    p =3D g_strdup(path);
> > > +    for (at =3D at - path + p + 1; *at; ++at) {
> > > +        *at =3D tolower(*at);
> > > +    }
> >=20
> > This isn't quite right, though we might get away with it in practice.
> > You're taking a whole path here, and each path component could
> > potentially have a unit address.  This will tolower() everything after
> > the first @, potentially case mangling the base names of later
> > components.
>=20
> Ah. I need the last "@" here, at least. But I do not think we need to go =
any
> further than this here.

That's closer to correct, and will probably work in practice.  That
will fail, though, if we find a client that uses bad caps for an
intermediate path component.

[snip]
> > > +static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
> > > +                            uint32_t nodeph, uint32_t pname,
> > > +                            uint32_t valaddr, uint32_t vallen)
> > > +{
> > > +    char propname[OF_PROPNAME_LEN_MAX + 1];
> > > +    uint32_t ret =3D -1;
> > > +    int offset;
> > > +    char trval[64] =3D "";
> > > +    char nodepath[VOF_MAX_PATH] =3D "";
> > > +    Object *vmo =3D object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE=
_IF);
> > > +    g_autofree char *val =3D NULL;
> > > +
> > > +    if (vallen > VOF_MAX_SETPROPLEN) {
> > > +        goto trace_exit;
> > > +    }
> > > +    if (readstr(pname, propname, sizeof(propname))) {
> > > +        goto trace_exit;
> > > +    }
> > > +    offset =3D fdt_node_offset_by_phandle(fdt, nodeph);
> > > +    if (offset < 0) {
> > > +        goto trace_exit;
> > > +    }
> > > +    ret =3D get_path(fdt, offset, nodepath, sizeof(nodepath));
> > > +    if (ret <=3D 0) {
> > > +        goto trace_exit;
> > > +    }
> > > +
> > > +    val =3D g_malloc0(vallen);
> > > +    if (VOF_MEM_READ(valaddr, val, vallen) !=3D MEMTX_OK) {
> > > +        goto trace_exit;
> > > +    }
> > > +
> > > +    if (vmo) {
> > > +        VofMachineIfClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> > > +
> > > +        if (vmc->setprop &&
> > > +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
> > > +            goto trace_exit;
> >=20
> > This defaults to allowing the setprop if the machine doesn't provide a
> > setprop callback.  I think it would be safer to default to prohibiting
> > all setprops except those the machine explicitly allows.
>=20
>=20
> Mmmm... I can imagine the client using the device tree as a temporary
> storage. I'd rather add a trace for such cases.

If they do, I think that's something we'll need to consider and
account for that platform, rather than something we want to allow to
begin with.

[snip]
> > > +static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
> > > +                          uint32_t len)
> > > +{
> > > +    char tmp[VOF_VTY_BUF_SIZE];
> > > +    unsigned cb;
> > > +    OfInstance *inst =3D (OfInstance *)
> > > +        g_hash_table_lookup(vof->of_instances, GINT_TO_POINTER(ihand=
le));
> > > +
> > > +    if (!inst) {
> > > +        trace_vof_error_write(ihandle);
> > > +        return -1;
> > > +    }
> > > +
> > > +    for ( ; len > 0; len -=3D cb) {
> > > +        cb =3D MIN(len, sizeof(tmp) - 1);
> > > +        if (VOF_MEM_READ(buf, tmp, cb) !=3D MEMTX_OK) {
> > > +            return -1;
> > > +        }
> > > +
> > > +        /* FIXME: there is no backend(s) yet so just call a trace */
> >=20
> > Improving that I think should count as a high priority enhancement.
>=20
> Heh. This is the main point of opposition to the entire approach :-)


Ah... yeah...


>=20
>=20
> >=20
> > > +        if (trace_event_get_state(TRACE_VOF_WRITE) &&
> > > +            qemu_loglevel_mask(LOG_TRACE)) {
> > > +            tmp[cb] =3D '\0';
> > > +            trace_vof_write(ihandle, cb, tmp);
> > > +        }
> > > +    }
> > > +
> > > +    return len;
> > > +}
> >=20
> > [snip]
> > > +
> > > +static void vof_instantiate_rtas(Error **errp)
> > > +{
> > > +    error_setg(errp, "The firmware should have instantiated RTAS");
> >=20
> > Since this always fails...
> >=20
> > > +}
> > > +
> > > +static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t=
 methodaddr,
> > > +                                uint32_t ihandle, uint32_t param1,
> > > +                                uint32_t param2, uint32_t param3,
> > > +                                uint32_t param4, uint32_t *ret2)
> > > +{
> > > +    uint32_t ret =3D -1;
> > > +    char method[VOF_MAX_METHODLEN] =3D "";
> > > +    OfInstance *inst;
> > > +
> > > +    if (!ihandle) {
> > > +        goto trace_exit;
> > > +    }
> > > +
> > > +    inst =3D (OfInstance *)g_hash_table_lookup(vof->of_instances,
> > > +                                             GINT_TO_POINTER(ihandle=
));
> > > +    if (!inst) {
> > > +        goto trace_exit;
> > > +    }
> > > +
> > > +    if (readstr(methodaddr, method, sizeof(method))) {
> > > +        goto trace_exit;
> > > +    }
> > > +
> > > +    if (strcmp(inst->path, "/") =3D=3D 0) {
> > > +        if (strcmp(method, "ibm,client-architecture-support") =3D=3D=
 0) {
> > > +            Object *vmo =3D object_dynamic_cast(OBJECT(ms), TYPE_VOF=
_MACHINE_IF);
> > > +
> > > +            if (vmo) {
> > > +                VofMachineIfClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo=
);
> > > +
> > > +                g_assert(vmc->client_architecture_support);
> > > +                ret =3D vmc->client_architecture_support(ms, first_c=
pu, param1);
> > > +            }
> > > +
> > > +            *ret2 =3D 0;
> > > +        }
> > > +    } else if (strcmp(inst->path, "/rtas") =3D=3D 0) {
> > > +        if (strcmp(method, "instantiate-rtas") =3D=3D 0) {
> >=20
> > ... why do you even need to handle it here?
>=20
> Well, I do not _need_ it. I was choosing between leaving a comment here or
> adding the code. The same number of lines but the code seemed more
> descriptive. It also helps when I am playing with no-firmware boot when I
> hack the kernel to call H_VOF directly and seeing the error message about=
 is
> better than a weird crash, this is a very minor thing though.

Hm, ok, you convinced me.

[snip]
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 7d9cd2904264..6fb202f99e90 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1356,6 +1356,18 @@ F: hw/pci-host/mv64361.c
> > >   F: hw/pci-host/mv643xx.h
> > >   F: include/hw/pci-host/mv64361.h
> > > +Virtual Open Firmware (VOF)
> > > +M: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > +M: David Gibson <david@gibson.dropbear.id.au>
> > > +M: Greg Kurz <groug@kaod.org>
> >=20
> > I think "R" might be more appropriate for me and Greg, rather than "M".
>=20
> Sure. Thanks for the review, I'll try to post the folloup before Monday.
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--j2zxXih3z4Y0YEXT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmefUACgkQbDjKyiDZ
s5JZIA//WhulSebaz3pj5T8mMwwP7oGH8S3qKahuDm9aosHEPgcZ6qxv3E7xauQK
+5ft84Np36WhkRsP0NoX9jQbcR1FbPXJ9Oo1Bnmlh3Wga4vMHD507HTQqOJpLLiU
1RO41JbDq4h7qxrxrsZx6wGyLk/9e5sMewR6oNcIdFjJZlmG2o8d56mCIV0Iuh9i
jsx3RmHxVsTke6DVYSHgVk1neobAyis7DuhHJlFd6sKpYvMPtYUwxReFtB0ws//V
8oHuJ6YlvIAosuDaaHnHO+g1LrAtBL7QsxrnriyneWnPvzrt2hMSX08e/VwdBgjb
tc59b/hl3YVvwh6WJwDelWSeYEtp+b/0WP+H4+1GR3d6Tbp1bOcHsVsOuy2tsouM
tu6XiJMu1DN49AyR9hxPehmtbkyqDmfo8K/kT+4Mak7+i1FlEV94UuBIzn2G8OLj
EqyR9nUowaP8xEtAQw6zEyX5UfP1YpnVEuOh8yRkK3pu6dVUu+4whkkRGyAwxMDx
ecffHAE5pHhUNkA2scLkczCDdKh/FKFs+1cpcyS83T4sEmUoZ8sXUtZ3Y6eLIjs5
visib+InTfXUHl5NM8xXlQCZC7AuPYMHdoZGwgAM9updywonQg+A/+POax9xUowZ
liHSdVZMQInLhc7V0UCWEI+EPovHvo3iLqnCxnlIThkwJhD2ZBQ=
=/p66
-----END PGP SIGNATURE-----

--j2zxXih3z4Y0YEXT--

