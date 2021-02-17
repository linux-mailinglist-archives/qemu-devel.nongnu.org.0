Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAEF31D3C8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 02:30:53 +0100 (CET)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCBg4-00011u-EN
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 20:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZR-0003vV-5a; Tue, 16 Feb 2021 20:24:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56513 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZO-00062c-TP; Tue, 16 Feb 2021 20:24:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgKqM00jpz9sVX; Wed, 17 Feb 2021 12:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613525023;
 bh=gCt9FoU0o53Xkt4pt5/SnMlzmXRn+h7HK2zE/nz0la0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mp0p+qsCrA0NHbD/ULnQ2ld4/5+llR7fS16lh52CaN3VTVs+XQXjl/8J//1YrRY8F
 snkQasEbDwzWt7ezPdrUGGUevcYUBXt47DKoVCJuJbiPbNgjXq7lGVFlhuy69krJPJ
 uw50c2T9yoixEJPRsxvYQpltT/Vn9Ojsz0G10mO4=
Date: Wed, 17 Feb 2021 12:14:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 5/7] spapr_drc.c: introduce unplug_timeout_timer
Message-ID: <YCxt4VVYe5FBQX42@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VU5lw5bbOBAC1TIq"
Content-Disposition: inline
In-Reply-To: <20210211225246.17315-6-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--VU5lw5bbOBAC1TIq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 07:52:44PM -0300, Daniel Henrique Barboza wrote:
> The LoPAR spec provides no way for the guest kernel to report failure of
> hotplug/hotunplug events. This wouldn't be bad if those operations were
> granted to always succeed, but that's far for the reality.
>=20
> What ends up happening is that, in the case of a failed hotunplug,
> regardless of whether it was a QEMU error or a guest misbehavior, the pSe=
ries
> machine is retaining the unplug state of the device in the running guest.
> This state is cleanup in machine reset, where it is assumed that this sta=
te
> represents a device that is pending unplug, and the device is hotunpluged
> from the board. Until the reset occurs, any hotunplug operation of the sa=
me
> device is forbid because there is a pending unplug state.
>=20
> This behavior has at least one undesirable side effect. A long standing p=
ending
> unplug state is, more often than not, the result of a hotunplug error. Th=
e user
> had to dealt with it, since retrying to unplug the device is noy allowed,=
 and then
> in the machine reset we're removing the device from the guest. This means=
 that
> we're failing the user twice - failed to hotunplug when asked, then hotun=
plugged
> without notice.
>=20
> Solutions to this problem range between trying to predict when the hotunp=
lug will
> fail and forbid the operation from the QEMU layer, from opening up the IR=
Q queue
> to allow for multiple hotunplug attempts, from telling the users to 'rebo=
ot the
> machine if something goes wrong'. The first solution is flawed because we=
 can't
> fully predict guest behavior from QEMU, the second solution is a trial an=
d error
> remediation that counts on a hope that the unplug will eventually succeed=
, and the
> third is ... well.
>=20
> This patch introduces a crude, but effective solution to hotunplug errors=
 in
> the pSeries machine. For each unplug done, we'll timeout after some time.=
 If
> a certain amount of time passes, we'll cleanup the hotunplug state from t=
he machine.
> During the timeout period, any unplug operations in the same device will =
still
> be blocked. After that, we'll assume that the guest failed the operation,=
 and
> allow the user to try again. If the timeout is too short we'll prevent le=
gitimate
> hotunplug situations to occur, so we'll need to overestimate the regular =
time
> an unplug operation takes to succeed to account that.
>=20
> The true solution for the hotunplug errors in the pSeries machines is a P=
APR change
> to allow for the guest to warn the platform about it. For now, the work d=
one in this
> timeout design can be used for the new PAPR 'abort hcall' in the future, =
given that
> for both cases we'll need code to cleanup the existing unplug states of t=
he DRCs.
>=20
> At this moment we're adding the basic wiring of the timer into the DRC. N=
ext patch
> will use the timer to timeout failed CPU hotunplugs.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_drc.c         | 36 ++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr_drc.h |  2 ++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 67041fb212..c88bb524c5 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -57,6 +57,8 @@ static void spapr_drc_release(SpaprDrc *drc)
>      drck->release(drc->dev);
> =20
>      drc->unplug_requested =3D false;
> +    timer_del(drc->unplug_timeout_timer);
> +
>      g_free(drc->fdt);
>      drc->fdt =3D NULL;
>      drc->fdt_start_offset =3D 0;
> @@ -453,6 +455,24 @@ static const VMStateDescription vmstate_spapr_drc_un=
plug_requested =3D {
>      }
>  };
> =20
> +static bool spapr_drc_unplug_timeout_timer_needed(void *opaque)
> +{
> +    SpaprDrc *drc =3D opaque;
> +
> +    return timer_pending(drc->unplug_timeout_timer);
> +}
> +
> +static const VMStateDescription vmstate_spapr_drc_unplug_timeout_timer =
=3D {
> +    .name =3D "DRC unplug timeout timer",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D spapr_drc_unplug_timeout_timer_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(unplug_timeout_timer, SpaprDrc),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

I think we can probably avoid adding extra data to the migration
stream.  Because the exact length of the timeout isn't super
important, so long as it's "long enough" I think it's acceptable if we
restart the timeout period after a migration.  That can be
accomplished with a post-load hook that just restarts the timer at the
initial duration if the DRC is in the unplug_requested state.

>  static bool spapr_drc_needed(void *opaque)
>  {
>      SpaprDrc *drc =3D opaque;
> @@ -486,10 +506,20 @@ static const VMStateDescription vmstate_spapr_drc =
=3D {
>      },
>      .subsections =3D (const VMStateDescription * []) {
>          &vmstate_spapr_drc_unplug_requested,
> +        &vmstate_spapr_drc_unplug_timeout_timer,
>          NULL
>      }
>  };
> =20
> +static void drc_unplug_timeout_cb(void *opaque)
> +{
> +    SpaprDrc *drc =3D opaque;
> +
> +    if (drc->unplug_requested) {
> +        drc->unplug_requested =3D false;
> +    }
> +}
> +
>  static void drc_realize(DeviceState *d, Error **errp)
>  {
>      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
> @@ -512,6 +542,11 @@ static void drc_realize(DeviceState *d, Error **errp)
>      object_property_add_alias(root_container, link_name,
>                                drc->owner, child_name);
>      g_free(link_name);
> +
> +    drc->unplug_timeout_timer =3D timer_new_ms(QEMU_CLOCK_VIRTUAL,
> +                                             drc_unplug_timeout_cb,
> +                                             drc);
> +
>      vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spa=
pr_drc,
>                       drc);
>      trace_spapr_drc_realize_complete(spapr_drc_index(drc));
> @@ -529,6 +564,7 @@ static void drc_unrealize(DeviceState *d)
>      name =3D g_strdup_printf("%x", spapr_drc_index(drc));
>      object_property_del(root_container, name);
>      g_free(name);
> +    timer_free(drc->unplug_timeout_timer);
>  }
> =20
>  SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 02a63b3666..b2e6222d09 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -187,6 +187,8 @@ typedef struct SpaprDrc {
>      bool unplug_requested;
>      void *fdt;
>      int fdt_start_offset;
> +
> +    QEMUTimer *unplug_timeout_timer;
>  } SpaprDrc;
> =20
>  struct SpaprMachineState;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VU5lw5bbOBAC1TIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsbd8ACgkQbDjKyiDZ
s5KgdA//YBsOlrrChn61eRVMVEOSUBC06UA2xuuEM/64/p5X9ehWa+uJ8wLq08qy
UI0XZy3Cyrh7Qil913QSHNUIjJZJVdhac6B2uLgi0Gu/0FVyDJSeUHU9CylgVDWQ
wOtIkf8SbGvJHg6jKfPyt3dC2mT8jDb8jKbQY+VXYxIAXCh1jAV9JZXTP0cAZCPZ
LWre+rfgNQUp3rYhUg4f53m8FYjRnSv8RSVTVzADS3uimKq6GMJ9mU5c7gvYaU+K
YHOGdQvnZZtc5Iup7NPQbj/Fe81UjzpK6e8na9wlREFO/Y+9jN8GcNjYsIyLxqRS
5CUc3gmoVb+ptmyFiqUQyqzhnOOzrBwt8F2pp+YF228YuW9TYyeSPGLW4ZJEIX+B
mINpmHbHG0+XiKQlPpm6ZHQhau6847JNzIJ0hBCoAW142NOFIaJ/Je/hTWYyC5m+
dA7JwldzOEG5r8Ppqiwn12OUpVkrRGL5CzsUJyqZ/ZprOo4FRH3JwqVaBf5C3ZKH
zk2TwmirJcD+RTDhisKcFQAczOmnMW3bYZZQZufdHwx1Qy2oxxj8fvfU5GDTCxne
dVybR4RHEMrmbsAHNONb9lOw5IVv0ShC+ulxl7zQsf+MPPoJ7P13dEPpcxDs6SCb
4viXx6ATtImASAZHQaKZoQNaSfmGLsI6UaAFahPOrqD8niXXR3U=
=uiSx
-----END PGP SIGNATURE-----

--VU5lw5bbOBAC1TIq--

