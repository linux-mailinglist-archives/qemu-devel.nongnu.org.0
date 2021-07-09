Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC53C1CF0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:10:26 +0200 (CEST)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1f29-0000qD-6W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eyx-0006oy-Gq; Thu, 08 Jul 2021 21:07:07 -0400
Received: from ozlabs.org ([203.11.71.1]:55755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eys-0003Cv-DM; Thu, 08 Jul 2021 21:07:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLZkT2rFfz9sWd; Fri,  9 Jul 2021 11:06:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625792817;
 bh=dNQIYenT3nj/hBZXLfi4o0eTdb610Uau2O2J/9HPOhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I30aSLrCx3lytAI+CYuvgm8KV9PhghG6y6Hkj+TWnG7oblDOj9QIr1T6boNDFZqfX
 Z62cb9cWEDdkK9/2H6kLGTmawrCN1q3g8D92pGmFJcsgroVvdB+dR0pih69LFZnDan
 vzpKF5KanYcnnndkbAzlB3DXxipxCITheQgIQa0c=
Date: Fri, 9 Jul 2021 10:57:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
Message-ID: <YOefCOQD+9UE8PVt@yekko>
References: <20210625055155.2252896-1-aik@ozlabs.ru> <YOZlnOiCeeF4mwJO@yekko>
 <a8ae3a91-6451-2543-89d-f5dd5fca9f2@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HdJx4KzXk+pjKINE"
Content-Disposition: inline
In-Reply-To: <a8ae3a91-6451-2543-89d-f5dd5fca9f2@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HdJx4KzXk+pjKINE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 09, 2021 at 12:22:15AM +0200, BALATON Zoltan wrote:
> On Thu, 8 Jul 2021, David Gibson wrote:
> > On Fri, Jun 25, 2021 at 03:51:55PM +1000, Alexey Kardashevskiy wrote:
> > [snip]
> > > diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> > > new file mode 100644
> > > index 000000000000..a17fd9d2fe94
> > > --- /dev/null
> > > +++ b/hw/ppc/vof.c
> > [snip]
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
>=20
> It's Linux which passes both upper and lower case variants (and all that a
> few line apart in the same file). The Pegasos2 SmartFirmware displays the=
se
> with upper case address parts but accepts both upper and lower case. Here=
's
> a device tree dump from the original board firmware:

Right, sorry.  s/Zoltan's firmware/Zoltan's obscure platform Linux/

> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/PegasosII_=
OFW-Tree.txt
>=20
> Apple's OpenFirmware seems to have lower case addresses:
>=20
> http://nandra.segv.jp/NetBSD/G4.dump-device-tree.txt
>=20
> but maybe it also accepts upper case? I can't try that now.
>=20
> This works for pegasos2 guests I've tried but maybe only because the only
> problematic query is /pci@80000000/ide@C,1. If something wanted to get
> /pci@C0000000/isa@C then that might fail but I think most devices are on
> /pci@80000000 so this problem is unlikely to happen. The most correct way
> would be to convert all parts between @ and / or \0 to lower case but eit=
her
> this or the changed version in v23 which does strrcht('@') works for the
> cases I have.
>=20
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
> This message has helped to catch problem with instantiate-rtas so it's
> useful to have here even if normally it would not get here. I don't remem=
ber
> what was the problem, maybe too small rtas-size or similar but getting a
> message instead of crashing did point to the problem.
>=20
> Regards,
> BALATON Zoltan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HdJx4KzXk+pjKINE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDnnwgACgkQbDjKyiDZ
s5ICZRAArCPNOCvNTo/Jo0QmwI/kfCsgJjZLdUWe1fsHwKxAGEnziio4nGSmojWs
tKPoGtarc46GehT0SaqerFSCekh3sJZ6gkstsfN2h5EH9XXQcXgchLTmlfQ98fl1
M79SI2dZDITqG1tTNcqyIhFvjTeNJOwqPtObWHOluSf4tseqBuUFxBVmhXD2EHqz
snlET2aFCMseluH05vI1r9IS+G+hKe61BQ/Y5uiqIU7OVmoN2gw8NEtPK6JNiXN1
1f/Ay6WgHHJY/pkGgMgPnj00ojmGvH+cw3f6YMqz0kTY9M2fIKSl+5zCpMJCNAg3
zYIKH700vbeuUR1PjZ6jGxEIXxmlFuKXsCghsveWEm7ZVP+UC5UTEL93cLLI9smv
dhHaUgZ5avjV/nVedj1UpDMyfoUWkDP4seuPDgucXl9eFFP/blFBVwpUjgneCTo8
bbC3aSiZVctJYDH9JOyjR+YkuP2Cg6fuwKXdaBGicSdwMcdrssvCVePslS6kjf6G
AHNbnG8pY4UqkXfibp8Ov45hPPyL6wqnOPt8ZgosyrYdh8/cnhNZ/WaHL3htFa0N
/pe6lKiU5+WpHjeejADVa1HCvpmsfa6ysd3Z8RoNXlHj81QhmDX8KIgblqxhH7t5
metceokLVreLZreWtl19xFq40HkE1q/WQKbyJuRnMVmSjCFC5J4=
=Ar4R
-----END PGP SIGNATURE-----

--HdJx4KzXk+pjKINE--

