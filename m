Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237663664EA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 07:38:07 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ5Ys-0002n2-7W
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 01:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZ5X9-0001dq-Nw; Wed, 21 Apr 2021 01:36:19 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZ5X7-0004QB-Bf; Wed, 21 Apr 2021 01:36:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FQ8Rb5bgyz9t23; Wed, 21 Apr 2021 15:36:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618983371;
 bh=tw69lfhJTzaMHEJ52ZFsJO7ofOFcUNh/Ln29YETI6Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCyw1cmrEDAXTyGjoGKPVeprf7zJCPl5EMKAF3JHaIBGATtX/5XRX0jgbk5uEKLwV
 c//OKgiHBgvUO78hxYF7RSoQ6X26LwgvjhQPRDCDOXntW6ZarvjgeSz6m+H7CoUEAr
 ntvnen0CfCTg2woWgjQGId65lQ+z/mLqSJlZyJyE=
Date: Wed, 21 Apr 2021 14:09:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] spapr_drc.c: handle hotunplug errors in
 drc_unisolate_logical()
Message-ID: <YH+llL0rYxZL7iGn@yekko.fritz.box>
References: <20210420165100.108368-1-danielhb413@gmail.com>
 <20210420165100.108368-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fMQgQe60JvPnuLtm"
Content-Disposition: inline
In-Reply-To: <20210420165100.108368-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fMQgQe60JvPnuLtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 01:51:00PM -0300, Daniel Henrique Barboza wrote:
> At this moment, PAPR does not provide a way to report errors during a
> device removal operation. This led the pSeries machine to implement
> extra mechanisms to try to fallback and recover from an error that might
> have happened during the hotunplug in the guest side. This started to
> change a bit with commit fe1831eff8a4 ("spapr_drc.c: use DRC
> reconfiguration to cleanup DIMM unplug state"), where one way to
> fallback from a memory removal error was introduced.
>=20
> Around the same time, in [1], the idea of using RTAS set-indicator for
> this role was first introduced. The RTAS set-indicator call, when
> attempting to UNISOLATE a DRC that is already UNISOLATED or CONFIGURED,
> returns RTAS_OK and does nothing else for both QEMU and phyp. This gives
> us an opportunity to use this behavior to signal the hypervisor layer
> when a device removal errir happens, allowing QEMU/phyp to do a proper
> error handling. Using set-indicator to report HP errors isn't strange to
> PAPR, as per R1-13.5.3.4-4. of table 13.7 of current PAPR [2]:
>=20
> "For all DR options: If this is a DR operation that involves the user
> insert- ing a DR entity, then if the firmware can determine that the
> inserted entity would cause a system disturbance, then the set-indicator
> RTAS call must not unisolate the entity and must return an error status
> which is unique to the particular error."
>=20
> A change was proposed to the pSeries Linux kernel to call set-indicator
> to move a DRC to 'unisolate' in the case of a hotunplug error in the
> guest side [3]. Setting a DRC that is already unisolated or configured to
> 'unisolate' is a no-op (returns RTAS_OK) for QEMU and also for phyp.
> Being a benign change for hypervisors that doesn't care about handling
> such errors, we expect the kernel to accept this change at some point.
>=20
> This patch prepares the pSeries machine for this new kernel feature by
> changing drc_unisolate_logical() to handle guest side hotunplug errors.
> For CPUs it's a simple matter of setting drc->unplug_requested to 'false',
> while for LMBs the process is similar to the rollback that is done in
> rtas_ibm_configure_connector().
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06395.html
> [2] https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-2020=
0611.pdf
> [3] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/2021041621021=
6.380291-3-danielhb413@gmail.com/
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr_drc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 9e16505fa1..6918e0c9d1 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -151,9 +151,32 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
> =20
>  static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>  {
> +    SpaprMachineState *spapr =3D NULL;
> +
>      switch (drc->state) {
>      case SPAPR_DRC_STATE_LOGICAL_UNISOLATE:
>      case SPAPR_DRC_STATE_LOGICAL_CONFIGURED:
> +        /*
> +         * Unisolating a logical DRC that was marked for unplug
> +         * means that the kernel is refusing the removal.
> +         */
> +        if (drc->unplug_requested && drc->dev) {
> +            if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_LMB) {
> +                spapr =3D SPAPR_MACHINE(qdev_get_machine());
> +
> +                spapr_memory_unplug_rollback(spapr, drc->dev);
> +            }
> +
> +            drc->unplug_requested =3D false;
> +            error_report("Device hotunplug rejected by the guest "
> +                         "for device %s", drc->dev->id);
> +
> +            /*
> +             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> +             * it is implemented.
> +             */
> +        }
> +
>          return RTAS_OUT_SUCCESS; /* Nothing to do */
>      case SPAPR_DRC_STATE_LOGICAL_AVAILABLE:
>          break; /* see below */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fMQgQe60JvPnuLtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB/pZQACgkQbDjKyiDZ
s5IRNBAAnu+Nyw+3EN1aMItB5zgyUeyBD/wiBC6qAoYVn4eNtcSNzpWu14rcvl7G
kVOJtA0u6fhGJQ+T+kTtghZcRQt+eT99RyIKGLtViQdcpUaiQbdJAlmjfjZKZwe2
I9mOuJr44PWmnwNdJaEwpKpgciAJwINrZehhgT/TGsUB7+lr248BWOJtU8hnwumt
MzAIKOsCbhpRQsZ/kCZN8LwNgYzc/IVonR4ffpd/sUSGW0EvPhkcTzykUkvnZhZY
z98bjJ2MpWftlP1okNTkeuZsn8uZlteVe1cmZZua0V15AigwtIYH6G4WW0zxvEFa
RlNc0mcvjFNvAiqFxjx85YqKk1/6QE3jIWgUs57vl7hVxiX/8Vd9WVGwXVsd3ySP
8xSsFcgQbzOQTDm7xH6xTtWlqfgeAZmjtN4rnusPThWHg3hrCy7QpqQkhnSEHxEZ
syDJsyNSAF6JCnzoIXePPAaMcH1QIQTMnDU+LmXzEZ9l5D8YNbkNEU7NYIShYnTy
ss+Fpvut8DirEIQBmD1t/THphnFNPL95cswVr3G1eONWfq/sNcPzC9Cbwu2jTnbn
RKmp6UUvHhDKHNR7wKuO7STN1gMcF4j05b/hrTgwm1CCPC1aEV+OthwpAnNa9mIN
hbgg+LOwREPLtzsrNkieXqd5otOeCQo42D7ZX509N2sfm89XBgY=
=oNRe
-----END PGP SIGNATURE-----

--fMQgQe60JvPnuLtm--

