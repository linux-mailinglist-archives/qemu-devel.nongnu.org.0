Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0A3277A1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 07:30:32 +0100 (CET)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGc4d-0002Qd-Ei
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 01:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGc3E-0001XK-P0; Mon, 01 Mar 2021 01:29:04 -0500
Received: from ozlabs.org ([203.11.71.1]:55601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGc3C-0004Us-8B; Mon, 01 Mar 2021 01:29:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dpr220x49z9sSC; Mon,  1 Mar 2021 17:28:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614580138;
 bh=uzbPqLxBJnFfCUnV386M1AoEalJmqBZAZegGcy8IDLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOf3ChHXYPAtJb1PU2ahcAJuon5nH3fa+U82Krq1cewn2RxezINaQqz+F9iV+BfyF
 ChOJDxAFk6IOUUNWwX1oSw5orBP05PrFA/ntfVSHiRM4WgATQM7hT8Mt8dF9gqFwrw
 KAvGQPBUZW/j4lcuDnEzeqORTCFH/HHZkc1Mgxb4=
Date: Mon, 1 Mar 2021 14:52:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/1] qemu_timer.c: add timer_deadline_ms() helper
Message-ID: <YDxlDYExXOheFSLA@yekko.fritz.box>
References: <20210225212914.366462-1-danielhb413@gmail.com>
 <8d895a95-f587-37a8-988e-71be67d88760@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kaJRRUQWptR6OFgO"
Content-Disposition: inline
In-Reply-To: <8d895a95-f587-37a8-988e-71be67d88760@redhat.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kaJRRUQWptR6OFgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 03:29:55PM +0100, Paolo Bonzini wrote:
> On 25/02/21 22:29, Daniel Henrique Barboza wrote:
> > The pSeries machine is using QEMUTimer internals to return the timeout
> > in seconds for a timer object, in hw/ppc/spapr.c, function
> > spapr_drc_unplug_timeout_remaining_sec().
> >=20
> > Create a helper in qemu-timer.c to retrieve the deadline for a QEMUTimer
> > object, in ms, to avoid exposing timer internals to the PPC code.
> >=20
> > CC: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >=20
> > This patch is applicable on top of David's ppc-for-6.0.
>=20
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

With Paolo's ack, I've taken this into the ppc-for-6.0 tree, hope
that's ok.

>=20
> >   hw/ppc/spapr_drc.c   |  5 ++---
> >   include/qemu/timer.h |  8 ++++++++
> >   util/qemu-timer.c    | 13 +++++++++++++
> >   3 files changed, 23 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> > index 8c4997d795..98b626acf9 100644
> > --- a/hw/ppc/spapr_drc.c
> > +++ b/hw/ppc/spapr_drc.c
> > @@ -421,9 +421,8 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
> >   int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
> >   {
> > -    if (drc->unplug_requested && timer_pending(drc->unplug_timeout_tim=
er)) {
> > -        return (qemu_timeout_ns_to_ms(drc->unplug_timeout_timer->expir=
e_time) -
> > -                qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL)) / 1000;
> > +    if (drc->unplug_requested) {
> > +        return timer_deadline_ms(drc->unplug_timeout_timer) / 1000;
> >       }
> >       return 0;
> > diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> > index 1678238384..5e76e3f8c2 100644
> > --- a/include/qemu/timer.h
> > +++ b/include/qemu/timer.h
> > @@ -795,6 +795,14 @@ static inline int64_t get_max_clock_jump(void)
> >       return 60 * NANOSECONDS_PER_SECOND;
> >   }
> > +/**
> > + * timer_deadline_ms:
> > + *
> > + * Returns the remaining miliseconds for @timer to expire, or zero
> > + * if the timer is no longer pending.
> > + */
> > +int64_t timer_deadline_ms(QEMUTimer *timer);
> > +
> >   /*
> >    * Low level clock functions
> >    */
> > diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> > index 81c28af517..3a03a63daa 100644
> > --- a/util/qemu-timer.c
> > +++ b/util/qemu-timer.c
> > @@ -243,6 +243,19 @@ int64_t timerlist_deadline_ns(QEMUTimerList *timer=
_list)
> >       return delta;
> >   }
> > +/*
> > + * Returns the time remaining for the deadline, in ms.
> > + */
> > +int64_t timer_deadline_ms(QEMUTimer *timer)
> > +{
> > +    if (timer_pending(timer)) {
> > +        return qemu_timeout_ns_to_ms(timer->expire_time) -
> > +               qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   /* Calculate the soonest deadline across all timerlists attached
> >    * to the clock. This is used for the icount timeout so we
> >    * ignore whether or not the clock should be used in deadline
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kaJRRUQWptR6OFgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA8ZQkACgkQbDjKyiDZ
s5JggBAAr9tGcaPgnm4OUz/0NEEYzYytqMjK8Io/l6adoAorSVjLyB5Tjhu2677p
nTbp2l+pGJU8vJRLB7iIY64j3qImL3XFggo/uFtUVWlk+6+bK3OCmA0dXbv2W9+/
MBRcA12QAHuLyXTHnSob1rCCwQgupSSkOZGcajJUkYHzS2bqwmozfRsNJfSZLXqv
bxAjtC0P9Zfuymqo8eDCpTtt8MsIs4Mxxr5HuLtI4DHiTP24giEdK9JNk0dis6kD
XiC0BPpk7u8YNkhTjNHUBtLQXOZkD1UsYQowhpP55ttdV9zZBjMv/ekoFYGEFOTi
CK0OfYUNEqrF4bb+FsF5eW3f14vQzAuCjX/rXURenZuvE8yKfynKMo3VVr93qEw4
SNMWC33L9e0inm+8qgFVq2zrhxorlxzBlFG6zotz7pvb/POfbTD80S4hgJtvl8fS
XBLEdQgU8As9bliMhupFI5kR/bDzhDAVx3j0WtKbWEnZftXWUmuGer2sWkyk49un
Xun0cNL4RkochgSCJWTWyznPESXTfIOHpI8YO5It41Po0B29pP2AJGZ8V6Q+Uqb8
Rzv9skh1UQyhmV5AlC31UsRYGsiF7ar399OSf0AlktXbYQRlRZZtDukB0s0IbV0h
TIXSConZoYc/YiopVpNDxpwMntTCTHLdJGzkPaFYxH254VlSsJo=
=gEzQ
-----END PGP SIGNATURE-----

--kaJRRUQWptR6OFgO--

