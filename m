Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C831D3C3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 02:27:14 +0100 (CET)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCBcX-0005cQ-Ex
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 20:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZO-0003qO-46; Tue, 16 Feb 2021 20:23:58 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58495 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZK-00061R-Py; Tue, 16 Feb 2021 20:23:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgKqL40fcz9sBJ; Wed, 17 Feb 2021 12:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613525022;
 bh=hmpxYMT5eqk7WvEUC9eHxwGeu6SoMro5qeSV8KYp/2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hm4E+8c5e2gINLisRKmUygPtKCyr+r48j68YvylbqDY4zR8OHMrwQhYg2k8Oebaio
 kAP5yWRRxxpRq1g/X6CY4ZzScXwvkGlUs4dIuvJgt/0wk+Xgdaq1iB7d5LkjaxWVhU
 v5zIqPK6rUeZegofTseaX1nTbIyKZoqcQVp2HLic=
Date: Wed, 17 Feb 2021 11:51:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 1/7] spapr_drc.c: do not call spapr_drc_detach() in
 drc_isolate_logical()
Message-ID: <YCxof8OyqtuZvCx+@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-2-danielhb413@gmail.com>
 <20210215114006.52bf0a8d@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jh9g41d0CWuS9qLX"
Content-Disposition: inline
In-Reply-To: <20210215114006.52bf0a8d@bahia.lan>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jh9g41d0CWuS9qLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 11:40:06AM +0100, Greg Kurz wrote:
> On Thu, 11 Feb 2021 19:52:40 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>=20
> > drc_isolate_logical() is used to move the DRC from the "Configured" to =
the
> > "Available" state, erroring out if the DRC is in the unexpected "Unisol=
ate"
> > state and doing nothing (with RTAS_OUT_SUCCESS) if the DRC is already in
> > "Available" or in "Unusable" state.
> >=20
> > When moving from "Configured" to "Available", the DRC is moved to the
> > LOGICAL_AVAILABLE state, a drc->unplug_requested check is done and, if =
true,
> > spapr_drc_detach() is called.
> >=20
> > What spapr_drc_detach() does then is:
> >=20
> > - set drc->unplug_requested to true. In fact, this is the only place wh=
ere
> > unplug_request is set to true;
> > - does nothing else if drc->state !=3D drck->empty_state. If the DRC st=
ate
> > is equal to drck->empty_state, spapr_drc_release() is called. For logic=
al
> > DRCs, drck->empty_state =3D LOGICAL_UNUSABLE.
> >=20
> > In short, calling spapr_drc_detach() in drc_isolate_logical() does noth=
ing. It'll
> > set unplug_request to true again ('again' since it was already true - o=
therwise the
> > function wouldn't be called), and will return without calling spapr_drc=
_release()
> > because the DRC is not in LOGICAL_UNUSABLE, since drc_isolate_logical()=
 just
> > moved it to LOGICAL_AVAILABLE. The only place where the logical DRC is =
released
> > is when called from drc_set_unusable(), when it is moved to the "Unusab=
le" state.
> > As it should, according to PAPR.
> >=20
> > Even though calling spapr_drc_detach() in drc_isolate_logical() is beni=
gn, removing
> > it will avoid further thought about the matter. So let's go ahead and d=
o that.
> >=20
>=20
> Good catch. This path looks useless for logical DRCs indeed.
>=20
> > As a note, this logic was introduced in commit bbf5c878ab76. Since then=
, the DRC
> > handling code was refactored and enhanced, and PAPR itself went through=
 some
> > changes in the DRC area as well. It is expected that some assumptions w=
e had back
> > then are now deprecated.
> >=20
>=20
> As specified in [1]:
>=20
> Please do not use lines that are longer than 76 characters in your
> commit message (so that the text still shows up nicely with "git show"
> in a 80-columns terminal window).
>=20
> [1] https://wiki.qemu.org/Contribute/SubmitAPatch#Write_a_meaningful_comm=
it_message

I've applied this patch, but re-wrapped the commit message.

> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/ppc/spapr_drc.c | 13 -------------
> >  1 file changed, 13 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> > index 8571d5bafe..84bd3c881f 100644
> > --- a/hw/ppc/spapr_drc.c
> > +++ b/hw/ppc/spapr_drc.c
> > @@ -132,19 +132,6 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
> > =20
> >      drc->state =3D SPAPR_DRC_STATE_LOGICAL_AVAILABLE;
> > =20
> > -    /* if we're awaiting release, but still in an unconfigured state,
> > -     * it's likely the guest is still in the process of configuring
> > -     * the device and is transitioning the devices to an ISOLATED
> > -     * state as a part of that process. so we only complete the
> > -     * removal when this transition happens for a device in a
> > -     * configured state, as suggested by the state diagram from PAPR+
> > -     * 2.7, 13.4
> > -     */
> > -    if (drc->unplug_requested) {
> > -        uint32_t drc_index =3D spapr_drc_index(drc);
> > -        trace_spapr_drc_set_isolation_state_finalizing(drc_index);
>=20
> I was expecting a change in hw/ppc/trace-events to ditch this trace,
> but it is still called by drc_isolate_physical(), so we're good.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> > -        spapr_drc_detach(drc);
> > -    }
> >      return RTAS_OUT_SUCCESS;
> >  }
> > =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jh9g41d0CWuS9qLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsaH8ACgkQbDjKyiDZ
s5KMqA//VR4m8CilBmgEvKw9X0zS8MCghzvA3Jbe/zKfVQxsz7UnSgGhkl0BSxXK
mmCyXSrPE7ITIh1AkwA/fNav2yHNy7iXIR3LAM1MP8N/hQJqpbMKlPZWBlgJP9L3
NVgg4uIeFqwCLckcF50koNWYQERgAw4zYO4MLnzMU1DvMNf5HasBIh4YeSVbxvwc
AtprwXvKqDi6ZvaaMfMP0NbUkPwvjvvRtC8MJ/xbPTpONAbV4BHXiXZBFk5NVBsX
B1TqF0XMO1DecQS7QiIVmq2+OgSGLkmfcLOop4bz3ro8swoXnVdVFNULoqQaO5B8
77sCClQ4FrRzShEHHs1L5XLRQdEMX8L2FAG69FgF6O/M6KEtahoJ1n06xmNtr9Nu
WGIdRCO6zir0GcKi3qxI3oSC9JB9pUVS/h381d6ScaFkAKz9LUxU31eiO3Zugx8t
uYEjFvikzE6yzlLw8gLiSnkAXNuFZIXNOR36uW2f59wcBkLKrjh4HiT+W9SgUe6t
ZSPP8Ile0aqalPbMy7FQukTeqnU7g3S8+TstLwYAAYwuy9LP9Fta7fKGhwhQhDm+
jkknDkT0hT0DTsavB2rXIqKQB7N4GDTpZp6gYSEchgotw4+vsk2Ioi9ACWgGVPMp
pmkBgNAJOTqLrVdcPkBbiO6mtUVYi7PUPZQcJ0oHhppy1mSobs8=
=naZM
-----END PGP SIGNATURE-----

--jh9g41d0CWuS9qLX--

