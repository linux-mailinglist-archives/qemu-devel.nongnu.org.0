Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B26839B2A4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:32:54 +0200 (CEST)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3O0-0005qY-NX
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lp3LN-0003he-NA; Fri, 04 Jun 2021 02:30:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45647 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lp3LK-0001cR-Tk; Fri, 04 Jun 2021 02:30:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FxCYP3lJwz9sTD; Fri,  4 Jun 2021 16:30:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622788201;
 bh=RxZ+qd9UCQEzxRHfpdkXHjkknmiY3KGE6Q4usJg5YHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Aa2FyYKelhnd4Y8yk2irxEMboyuqEV4EVuxbsYnZrztyLWF2zF/lv1QBS6x0kP8I7
 kB7kXIrlkJPBPZ1bD1Z9l3pNzTbfTww2YQK6p/tRpsKPjCqTflVQsjXueDoQkBwu2z
 mfnhmGAomTPkGFqX0NSFDxVAQGNHxU2SKGWwerqU=
Date: Fri, 4 Jun 2021 16:19:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YLnF/9H6aFzNhu5+@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D/HlGNB0XeaFDsOt"
Content-Disposition: inline
In-Reply-To: <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--D/HlGNB0XeaFDsOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2021 at 07:33:01PM +0200, BALATON Zoltan wrote:
> Hello,
>=20
> Two more problems I've found while testing with pegasos2 but I'm not sure
> how to fix them:
>=20
> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
> > diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> > new file mode 100644
> > index 000000000000..a283b7d251a7
> > --- /dev/null
> > +++ b/hw/ppc/vof.c
> > @@ -0,0 +1,1021 @@
> > +/*
> > + * QEMU PowerPC Virtual Open Firmware.
> > + *
> > + * This implements client interface from OpenFirmware IEEE1275 on the =
QEMU
> > + * side to leave only a very basic firmware in the VM.
> > + *
> > + * Copyright (c) 2021 IBM Corporation.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu-common.h"
> > +#include "qemu/timer.h"
> > +#include "qemu/range.h"
> > +#include "qemu/units.h"
> > +#include "qapi/error.h"
> > +#include <sys/ioctl.h>
> > +#include "exec/ram_addr.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/ppc/vof.h"
> > +#include "hw/ppc/fdt.h"
> > +#include "sysemu/runstate.h"
> > +#include "qom/qom-qobject.h"
> > +#include "trace.h"
> > +
> > +#include <libfdt.h>
> > +
> > +/*
> > + * OF 1275 "nextprop" description suggests is it 32 bytes max but
> > + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 char=
s long.
> > + */
> > +#define OF_PROPNAME_LEN_MAX 64
> > +
> > +#define VOF_MAX_PATH        256
> > +#define VOF_MAX_SETPROPLEN  2048
> > +#define VOF_MAX_METHODLEN   256
> > +#define VOF_MAX_FORTHCODE   256
> > +#define VOF_VTY_BUF_SIZE    256
> > +
> > +typedef struct {
> > +    uint64_t start;
> > +    uint64_t size;
> > +} OfClaimed;
> > +
> > +typedef struct {
> > +    char *path; /* the path used to open the instance */
> > +    uint32_t phandle;
> > +} OfInstance;
> > +
> > +#define VOF_MEM_READ(pa, buf, size) \
> > +    address_space_read_full(&address_space_memory, \
> > +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> > +#define VOF_MEM_WRITE(pa, buf, size) \
> > +    address_space_write(&address_space_memory, \
> > +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> > +
> > +static int readstr(hwaddr pa, char *buf, int size)
> > +{
> > +    if (VOF_MEM_READ(pa, buf, size) !=3D MEMTX_OK) {
> > +        return -1;
> > +    }
> > +    if (strnlen(buf, size) =3D=3D size) {
> > +        buf[size - 1] =3D '\0';
> > +        trace_vof_error_str_truncated(buf, size);
> > +        return -1;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
> > +                       const char *s1, unsigned nargscheck, unsigned n=
retcheck)
> > +{
> > +    if (strcmp(s, s1)) {
> > +        return false;
> > +    }
> > +    if ((nargscheck && (nargs !=3D nargscheck)) ||
> > +        (nretcheck && (nret !=3D nretcheck))) {
> > +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static void prop_format(char *tval, int tlen, const void *prop, int le=
n)
> > +{
> > +    int i;
> > +    const unsigned char *c;
> > +    char *t;
> > +    const char bin[] =3D "...";
> > +
> > +    for (i =3D 0, c =3D prop; i < len; ++i, ++c) {
> > +        if (*c =3D=3D '\0' && i =3D=3D len - 1) {
> > +            strncpy(tval, prop, tlen - 1);
> > +            return;
> > +        }
> > +        if (*c < 0x20 || *c >=3D 0x80) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    for (i =3D 0, c =3D prop, t =3D tval; i < len; ++i, ++c) {
> > +        if (t >=3D tval + tlen - sizeof(bin) - 1 - 2 - 1) {
> > +            strcpy(t, bin);
> > +            return;
> > +        }
> > +        if (i && i % 4 =3D=3D 0 && i !=3D len - 1) {
> > +            strcat(t, " ");
> > +            ++t;
> > +        }
> > +        t +=3D sprintf(t, "%02X", *c & 0xFF);
> > +    }
> > +}
> > +
> > +static int get_path(const void *fdt, int offset, char *buf, int len)
> > +{
> > +    int ret;
> > +
> > +    ret =3D fdt_get_path(fdt, offset, buf, len - 1);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    buf[len - 1] =3D '\0';
> > +
> > +    return strlen(buf) + 1;
> > +}
> > +
> > +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, in=
t len)
> > +{
> > +    int ret;
> > +
> > +    ret =3D fdt_node_offset_by_phandle(fdt, ph);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    return get_path(fdt, ret, buf, len);
> > +}
> > +
> > +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
> > +{
> > +    char fullnode[VOF_MAX_PATH];
> > +    uint32_t ret =3D -1;
> > +    int offset;
> > +
> > +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
> > +        return (uint32_t) ret;
> > +    }
> > +
> > +    offset =3D fdt_path_offset(fdt, fullnode);
> > +    if (offset >=3D 0) {
> > +        ret =3D fdt_get_phandle(fdt, offset);
> > +    }
> > +    trace_vof_finddevice(fullnode, ret);
> > +    return (uint32_t) ret;
> > +}
>=20
> The Linux init function that runs on pegasos2 here:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arc=
h/powerpc/kernel/prom_init.c?h=3Dv4.14.234#n2658
>=20
> calls finddevice once with isa@c and next with isa@C (small and capital C)
> both of which works with the board firmware but with vof the comparison is
> case sensitive and one of these fails so I can't make it work. I don't kn=
ow
> if this is a problem in libfdt or the vof_finddevice above should do
> something else to get case insensitive comparison.

This is kind of a subtle incompatibility between the traditional OF
world and the flat tree world.  In traditional OF, the unit address
(bit after the @) doesn't exist as a string.  Instead when you do the
finddevice it will parse that address and compare it against the 'reg'
properties for each of the relevant nodes.  Since that's an integer
comparison, case doesn't enter into it.

But, how to parse (and write) addresses depends on the bus, so the
firmware has to understand each bus type and act accordingly.  That
doesn't really work in the world of minimal firmwares dor the flat
tree.  So instead, we just incorporate a pre-formatted unit address in
the flat tree directly.  Most of the time that works fine, but there
are some edge cases like the one you've hit.

> > +static const void *getprop(const void *fdt, int nodeoff, const char *p=
ropname,
> > +                           int *proplen, bool *write0)
> > +{
> > +    const char *unit, *prop;
> > +
> > +    /*
> > +     * The "name" property is not actually stored as a property in the=
 FDT,
> > +     * we emulate it by returning a pointer to the node's name and adj=
ust
> > +     * proplen to include only the name but not the unit.
> > +     */
> > +    if (strcmp(propname, "name") =3D=3D 0) {
> > +        prop =3D fdt_get_name(fdt, nodeoff, proplen);
> > +        if (!prop) {
> > +            *proplen =3D 0;
> > +            return NULL;
> > +        }
> > +
> > +        unit =3D memchr(prop, '@', *proplen);
> > +        if (unit) {
> > +            *proplen =3D unit - prop;
> > +        }
> > +        *proplen +=3D 1;
> > +
> > +        /*
> > +         * Since it might be cut at "@" and there will be no trailing =
zero
> > +         * in the prop buffer, tell the caller to write zero at the en=
d.
> > +         */
> > +        if (write0) {
> > +            *write0 =3D true;
> > +        }
> > +        return prop;
> > +    }
> > +
> > +    if (write0) {
> > +        *write0 =3D false;
> > +    }
> > +    return fdt_getprop(fdt, nodeoff, propname, proplen);
> > +}
>=20
> MorphOS checks the name property of the root node ("/") to decide what
> platform it runs on so we may need to be able to set this property on /
> where it should return "bplan,Pegasos2", therefore the above maybe should=
 do
> getprop first and only generate name property if it's not set (or at least
> check if we're on the root node and allow setting name property there). (=
On
> Macs the root node is named "device-tree" and this was before found to be
> needed for MorphOS.)

Ah.  Hrm.  Have to think about what to do about that.

> Other than the above two problems, I've found that getting the device tree
> from vof returns it in reverse order compared to the board firmware if I =
add
> it the expected order. This may or may not be a problem but to avoid it I
> can build the tree in reverse order then it comes out right so unless
> there's an easy fix this should not cause a problem but may worth a comme=
nt
> somewhere.

The order of things in the device tree *should* never matter.  If it
does, that's definitely a client bug... but of course that doesn't
necessarily mean we won't have to work around it in practice.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--D/HlGNB0XeaFDsOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC5xfsACgkQbDjKyiDZ
s5LMJBAA4wv3+ZkcYDEg1QVYU7Na0xLf+UgP8zJ6eREizhqmBQLmFfH3wpxfLVVu
Kp6dc0seBN8b/84NPZSOAvafurUYsEyRUzdaYE2PMMx0eqY1JxAbaEmgb0SvLaCU
nJSibWlgUsksuc0R9IVqXVZ8GwLVBTHDeI9QeJ4e/ziWDSW68V8eUaUl49tURklB
mqc979uTE1WKM/KkaLT6bC7S4QxUVxJC/RUMImfFsymWHHXBNGxJDzpMFUIwbibV
HGClNUWv8iZjzp1F6MQVgCfU3nbM2fEbbMIitQktvW49JGovngD16FDM9Q0eWCzC
215vJEaUxQxa7y50c4Phsj6nlPx3LE5m3K6Phbzcal7raGyfCnlbWKuElbVsAgQV
wnNFsj672Tj/y2qL3ft0/lBE481kQdzUcqzqDffSODdPrdz/yFWyoRVl2YdBlOlm
4vfTXmmvLFUeuTOGvIWEgwg8S0uENMPwvxMenA+wtPyf2MEWXrVwIgLOOqIo9Haa
DkAx6uWlelZorMQ1IPINYx8yKTIzsAlEGpDH26rhQJFbOQHcZF0V9kj8RwqDP8Os
trW4bYpODdS17xnkfnhWMOgfy1J2Im5drj8+v0BzjM/TuMUxwKSuc6LMYGWXRyX5
ujht/M1ZdwQHUbAssd6+4qVdZrpxxbIUpEYBUsUusftxoqFfMGk=
=7oE0
-----END PGP SIGNATURE-----

--D/HlGNB0XeaFDsOt--

