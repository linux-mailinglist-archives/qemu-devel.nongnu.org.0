Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFC2D518D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:42:25 +0100 (CET)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCqW-0000jM-Kg
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCmA-0006nr-6V; Wed, 09 Dec 2020 22:37:54 -0500
Received: from ozlabs.org ([203.11.71.1]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knCm5-0003Uf-9p; Wed, 09 Dec 2020 22:37:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cs03p0H4Fz9sWX; Thu, 10 Dec 2020 14:37:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607571462;
 bh=yACx9zzJe2P+v2+01MERfZsu8XJZz94Jpn6KxfYlNEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=COmBUKgSJjk6L6qgr91rP+EWjvHFLV4E0oQQYin/EPnEcznUaz1NeGSCtoW/kiM/y
 nY7AlajocgR33MtH2/NA8hrvYkF9lcvT2vVwIzkUcLwf65HibQs+Pzh4tHursNqEV9
 iF1Znf6a3ww/lbR3cVqt/oPprlRFErSF7OBjmIPs=
Date: Thu, 10 Dec 2020 14:37:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Message-ID: <20201210033736.GK2555@yekko.fritz.box>
References: <20201208134536.1012045-1-danielhb413@gmail.com>
 <20201208153309.78825861@bahia.lan>
 <d142b41a-69c2-77de-861e-e68c3c0459b4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="73fGQZLCrFzENemP"
Content-Disposition: inline
In-Reply-To: <d142b41a-69c2-77de-861e-e68c3c0459b4@gmail.com>
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--73fGQZLCrFzENemP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 12:32:46PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 12/8/20 11:33 AM, Greg Kurz wrote:
> > Hi Daniel,
> >=20
> > On Tue,  8 Dec 2020 10:45:36 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >=20
> > > spapr_kvm_type() is considering 'vm_type=3DNULL' as a valid input, wh=
ere
> > > the function returns 0. This is relying on the current QEMU machine
> > > options handling logic, where the absence of the 'kvm-type' option
> > > will be reflected as 'vm_type=3DNULL' in this function.
> > >=20
> > > This is not robust, and will break if QEMU options code decides to pr=
opagate
> > > something else in the case mentioned above (e.g. an empty string inst=
ead
> > > of NULL).
> > >=20
> > > Let's avoid this entirely by setting a non-NULL default value in case=
 of
> > > no user input for 'kvm-type'. spapr_kvm_type() was changed to handle =
3 fixed
> > > values of kvm-type: "HV", "PR" and, if no kvm-type was set by the use=
r,
> > > DEFAULT_KVM_TYPE. This allows us always be predictable regardless of =
any
> > > enhancements/changes made in QEMU options mechanics.
> > >=20
> > > While we're at it, let's also document in 'kvm-type' description what
> > > happens if the user does not set this option. This information is bas=
ed
> > > on how the pseries kernel handles the KVM_CREATE_VM ioctl(), where the
> > > default value '0' makes the kernel choose an available KVM module to
> > > use, giving precedence to kvm_hv. This logic is described in the kern=
el
> > > source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >=20
> > > The case I mentioned in the second paragraph is happening when we try=
 to
> > > execute a pseries guest with '--enable-kvm' using Paolo's patch
> > > "vl: make qemu_get_machine_opts static" [1]:
> > >=20
> > > $ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -mach=
ine pseries --enable-kvm
> > > qemu-system-ppc64: Unknown kvm-type specified ''
> > >=20
> > > This happens due to the differences between how qemu_opt_get() and
> > > object_property_get_str() works when there is no 'kvm-type' specified.
> > > See [2] for more info about the issue found.
> > >=20
> > >=20
> > > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.ht=
ml
> > > [2] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01578.ht=
ml
> > >=20
> > >=20
> > >   hw/ppc/spapr.c | 19 +++++++++++++++++--
> > >   1 file changed, 17 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index b7e0894019..32d938dc6a 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -3021,9 +3021,10 @@ static void spapr_machine_init(MachineState *m=
achine)
> > >       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
> > >   }
> > > +#define DEFAULT_KVM_TYPE "auto"
> > >   static int spapr_kvm_type(MachineState *machine, const char *vm_typ=
e)
> > >   {
> > > -    if (!vm_type) {
> > > +    if (!strcmp(vm_type, DEFAULT_KVM_TYPE)) {
> > >           return 0;
> > >       }
> > > @@ -3131,6 +3132,16 @@ static char *spapr_get_kvm_type(Object *obj, E=
rror **errp)
> > >   {
> > >       SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> > > +    /*
> > > +     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TY=
PE
> > > +     * instead of NULL. This allows us to be more predictable with w=
hat
> > > +     * is expected to happen in spapr_kvm_type(), since we can stop =
relying
> > > +     * on receiving a 'NULL' parameter as a valid input there.
> > > +     */
> >=20
> > Returning what is obviously a default value is straightforward enough
> > that is doesn't need to a comment IMHO.
> >=20
> > > +    if (!spapr->kvm_type) {
> > > +        return g_strdup(DEFAULT_KVM_TYPE);
> > > +    }
> > > +
> > >       return g_strdup(spapr->kvm_type);
> >=20
> > Alternatively you could simply do:
> >=20
> >      return g_strdup(spapr->kvm_type ? spapr->kvm_type : DEFAULT_KVM_TY=
PE);
>=20
> Got it. I'll update it in v2.
>=20
> >=20
> > >   }
> > > @@ -3273,7 +3284,11 @@ static void spapr_instance_init(Object *obj)
> > >       object_property_add_str(obj, "kvm-type",
> > >                               spapr_get_kvm_type, spapr_set_kvm_type);
> > >       object_property_set_description(obj, "kvm-type",
> > > -                                    "Specifies the KVM virtualizatio=
n mode (HV, PR)");
> > > +                                    "Specifies the KVM virtualizatio=
n mode (HV, PR)."
> >=20
> > Why not documenting "auto" as a valid option as well ?
>=20
>=20
> This was my first idea but I got cold feet about it. I got afraid that
> exposing the default 'auto' option might misled users into believing that
> we're adding a new configuration option, even thought it's just the
> same behavior users are dealing with for 7+ years. I chose to use the
> 'auto' value as an internal default that isn't documented . Granted, this
> also means that we have now a hidden 'kvm-type=3Dauto' setting, so yeah.
>=20
> If there is a consensus that exposing the "auto" default is the right
> thing to do in this case I'll just go ahead and expose it.

I think it should be fine to expose it.

> > While here you could maybe convert HV and PR to lowercase in order to
> > have a prettier "hv, pr, auto" set of valid values in the help string.
> > You'd need to convert the related checks in spapr_kvm_type() to still
> > check for the uppercase versions for compatibility, eg. by using
> > g_ascii_strcasecmp().
>=20
> Roger that.
>=20
> >=20
> > > +                                    " If not specified, defaults to =
any available KVM"
> > > +                                    " module loaded in the host. In =
case both kvm_hv"
> > > +                                    " and kvm_pr are loaded, kvm_hv =
takes precedence.");
> > > +
> >=20
> > s/If not specified/If 'auto'/ and mention 'auto' as being the default v=
alue.
>=20
>=20
> As I said above, I'll happily mention the 'auto' default if we can agree
> that this will not lead to user confusion thinking this is a new option a=
nd
> so on.
>=20
>=20
> Thanks,
>=20
>=20
> DHB
>=20
> >=20
> > >       object_property_add_bool(obj, "modern-hotplug-events",
> > >                               spapr_get_modern_hotplug_events,
> > >                               spapr_set_modern_hotplug_events);
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--73fGQZLCrFzENemP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Rl/8ACgkQbDjKyiDZ
s5J1zxAAyJfYknBOP5kLv64jJ4+/PF8WgkO55QFJ+rouHFbI6ed92kQ3ODo8+57z
XOqK2sw0w14lTGLL/h4OUGhCNh43eXOqaiiNAvUWxtk6NnofDcG07ANZShm642zn
rePvdpVyCAFowwRVDzGEVdGJ1L/vX7HoCGb4yeloPa2PLQzY09YjujveQq8vQmgT
qdlzvrLmr5h4msszk0waX/qP2+h0qv1Zo7nk+kzRBSsxshTsXtEbPryDb5AIFJso
QPYIcASCLKiheW6MCpMUzK70gHXl3JC6wHEVhqp+mod+fB1gJDO3Ci/FcS0B+9cb
CqyHn51zPWU8i43nwLJ/JDtImDMV1yYDHAZgj2ffNiFKhuJavdZqTlAlZbEdKEJh
31BI9udDBNVTxLrdtxQUeITjIypqsIsOwsnZw+ItKJmlK5RdNANaAUoScB37IWTt
kxg6NZB4sqxoD2rpszgRd99wKKnsi+m2hLnp1fiTCcfadiSaFs5A7f5oEq1FqJdE
qrqf9YNOJmQSCwkezTW7kwN5yyNJjMA2CrnNmQZ9alJ4BbpGZlkHYzb9+pHOEAUM
U0yJDXfmxTyjyFsbRLVW7byvm/wVw4SYu/M8culibf3KsziIAHzQ3DBQdWjyHG0I
mIf8hzf53UFnwcu2XkAfeOX9d0Yg7K+d/yDiAxfWRDsr7VTsbAY=
=399Y
-----END PGP SIGNATURE-----

--73fGQZLCrFzENemP--

