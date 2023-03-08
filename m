Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC3E6B1029
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:26:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxY5-0002AS-46; Wed, 08 Mar 2023 12:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZxY3-00029U-8l
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZxY1-0003Bc-BD
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678296352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+vFT7s4ZkltSs4Z3+HN/24vW/ar5o8E4MD5J3RO1hs=;
 b=Itj2Y8j5cEydIZKL+3yFqD4Ye6KCOPGq5jSiUeXpPQFvXDrhq8UzeEid6CwuCXH8vVkG2e
 qEm6DswTLIhnM6yEt9XsU8H8LaLP81e2PkjMboykPIsfKJIXJ851PYhi2AskWCiud9lE78
 hGZ1X2+O9cYa90c1WLGVoPQso1P8JNs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-w4OitJGlMiyX2McnGBHPSg-1; Wed, 08 Mar 2023 12:25:50 -0500
X-MC-Unique: w4OitJGlMiyX2McnGBHPSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C1B980D181;
 Wed,  8 Mar 2023 17:25:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D301121314;
 Wed,  8 Mar 2023 17:25:48 +0000 (UTC)
Date: Wed, 8 Mar 2023 18:25:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Message-ID: <ZAjFF+sfTZ1UmvFK@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-2-stefanha@redhat.com>
 <ZAdxog0T8XkSSUZd@redhat.com> <20230307192019.GB153228@fedora>
 <ZAhL0Xz4tuUWPeXY@redhat.com> <20230308142621.GD299426@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RAvBhe4Y3oL+ZazP"
Content-Disposition: inline
In-Reply-To: <20230308142621.GD299426@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--RAvBhe4Y3oL+ZazP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 08.03.2023 um 15:26 hat Stefan Hajnoczi geschrieben:
> On Wed, Mar 08, 2023 at 09:48:17AM +0100, Kevin Wolf wrote:
> > Am 07.03.2023 um 20:20 hat Stefan Hajnoczi geschrieben:
> > > On Tue, Mar 07, 2023 at 06:17:22PM +0100, Kevin Wolf wrote:
> > > > Am 01.03.2023 um 21:57 hat Stefan Hajnoczi geschrieben:
> > > > > There is no need for the AioContext lock in bdrv_drain_all() beca=
use
> > > > > nothing in AIO_WAIT_WHILE() needs the lock and the condition is a=
tomic.
> > > > >=20
> > > > > Note that the NULL AioContext argument to AIO_WAIT_WHILE() is odd=
=2E In
> > > > > the future it can be removed.
> > > >=20
> > > > It can be removed for all callers that run in the main loop context=
=2E For
> > > > code running in an iothread, it's still important to pass a non-NULL
> > > > context. This makes me doubt that the ctx parameter can really be
> > > > removed without changing more.
> > > >=20
> > > > Is your plan to remove the if from AIO_WAIT_WHILE_INTERNAL(), too, =
and
> > > > to poll qemu_get_current_aio_context() instead of ctx_ or the main
> > > > context?
> > >=20
> > > This is what I'd like once everything has been converted to
> > > AIO_WAIT_WHILE_UNLOCKED() - and at this point we might as well call it
> > > AIO_WAIT_WHILE() again:
> > >=20
> > >   #define AIO_WAIT_WHILE(cond) ({                                    \
> > >       bool waited_ =3D false;                                        =
  \
> > >       AioWait *wait_ =3D &global_aio_wait;                           =
  \
> > >       /* Increment wait_->num_waiters before evaluating cond. */     \
> > >       qatomic_inc(&wait_->num_waiters);                              \
> > >       /* Paired with smp_mb in aio_wait_kick(). */                   \
> > >       smp_mb();                                                      \
> > >       while ((cond)) {                                               \
> > >           aio_poll(qemu_get_current_aio_context(), true);            \
> > >           waited_ =3D true;                                          =
  \
> > >       }                                                              \
> > >       qatomic_dec(&wait_->num_waiters);                              \
> > >       waited_; })
> >=20
> > Ok, yes, this is what I tried to describe above.
> >=20
> > > However, I just realized this only works in the main loop thread beca=
use
> > > that's where aio_wait_kick() notifications are received. An IOThread
> > > running AIO_WAIT_WHILE() won't be woken when another thread (including
> > > the main loop thread) calls aio_wait_kick().
> >=20
> > Which is of course a limitation we already have today. You can wait for
> > things in your own iothread, or for all threads from the main loop.
> >=20
> > However, in the future multiqueue world, the first case probably becomes
> > pretty much useless because even for the same node, you could get
> > activity in any thread.
> >=20
> > So essentially AIO_WAIT_WHILE() becomes GLOBAL_STATE_CODE(). Which is
> > probably a good idea anyway, but I'm not entirely sure how many places
> > we currently have where it's called from an iothread. I know the drain
> > in mirror_run(), but Emanuele already had a patch in his queue where
> > bdrv_co_yield_to_drain() schedules drain in the main context, so if that
> > works, mirror_run() would be solved.
> >=20
> > https://gitlab.com/eesposit/qemu/-/commit/63562351aca4fb05d5711eb410feb=
96e64b5d4ad
> >=20
> > > I would propose introducing a QemuCond for each condition that we wait
> > > on, but QemuCond lacks event loop integration. The current thread wou=
ld
> > > be unable to run aio_poll() while also waiting on a QemuCond.
> > >=20
> > > Life outside coroutines is hard, man! I need to think about this more.
> > > Luckily this problem doesn't block this patch series.
> >=20
> > I hope that we don't really need all of this if we can limit running
> > synchronous code to the main loop.
>=20
> Great idea, I think you're right.
>=20
> I'll audit the code to find the IOThread AIO_WAIT_WHILE() callers and
> maybe a future patch series can work on that.
>=20
> > > > > There is an assertion in
> > > > > AIO_WAIT_WHILE() that checks that we're in the main loop AioConte=
xt and
> > > > > we would lose that check by dropping the argument. However, that =
was a
> > > > > precursor to the GLOBAL_STATE_CODE()/IO_CODE() macros and is now a
> > > > > duplicate check. So I think we won't lose much by dropping it, bu=
t let's
> > > > > do a few more AIO_WAIT_WHILE_UNLOCKED() coversions of this sort to
> > > > > confirm this is the case.
> > > > >=20
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > >=20
> > > > Yes, it seems that we don't lose much, except maybe some consistenc=
y in
> > > > the intermediate state. The commit message could state a bit more
> > > > directly what we gain, though. Since you mention removing the param=
eter
> > > > as a future possibility, I assume that's the goal with it, but I
> > > > wouldn't be sure just from reading the commit message.
> > >=20
> > > AIO_WAIT_WHILE() callers need to be weened of the AioContext lock.
> > > That's the main motivation and this patch series converts the easy
> > > cases where we already don't need the lock. Dropping the function
> > > argument eventually is a side benefit.
> >=20
> > Yes, but the conversion to AIO_WAIT_WHILE_UNLOCKED() could be done with
> > ctx instead of NULL. So moving to NULL is a separate change that needs a
> > separate explanation. You could even argue that it should be a separate
> > patch if it's an independent change.
> >=20
> > Or am I missing something and keeping ctx would actually break things?
>=20
> Yes, ctx argument does not need to be modified when converting from
> AIO_WAIT_WHILE() to AIO_WAIT_WHILE_UNLOCKED(). Passing it bothers me
> because we don't really use it when unlock=3Dfalse.
>=20
> Would you like me to keep ctx non-NULL for now?

I don't really mind doing both changes in one commit because they are so
small, but at least I'd like the commit message to be more explicit
about the eventual goal we have with switching to NULL instead of just
stating that it's odd, but harmless.

Kevin

--RAvBhe4Y3oL+ZazP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmQIxRcACgkQfwmycsiP
L9b2IQ//T27vLDeAjuS7fjbsOsMhD0dkik7bCddJl+u5jSqVluAmkLuev6uMetAi
mRZKhnHgyFHC6uFo5UBpU0OW86F8MTAitpy9urHyBvD1/0O0Vh2Z6pT98S8msiil
CBU10jyaZHhIxKNey2TbVFPRvRjOSthOE1vTtg2xyyTgA7hQE1kOp3HbT/E+Xkfo
7k4dkD80v9wH7oXuRiMqzAEChLakGoMEKngenuM28iJsDOjhYPehq8EKk3yAe2km
MpfJLh9t1NCvQgE3LhOAxLGv+iDE3/ldUufispRh3LRZgUB7/3kSPSbixX0Xp04J
K5IG1LdytBQTo7HQHZTlk3biHCMPIzp3Zl2ag/xNZxEFBcfEuQMML1zv1C1itRGk
/g2vNgnNkHW+g3gJC1vGNZxf3G6/SAxTqpNl8yYatd4PEkMd9zmOCxyfqgnWBtO+
5Iu6Hlz+VADtFusLPJeiHRb3e9thjoNicfh67eaU9BPUM1XXHuoaEXYNNhu42T2M
SFkPwKh/Q3lgsqAicthnGgWjFJHrYfeLX0aYR4Ol6JPyN9xSR9R3JJSlq3fTmWb3
nX3QrGIF8bo+eHSTK2O1YyRIKdT942rcdn9tSqmF282LQvQ2Fp/uOkz47NZwxuyA
prdGM3/w8Zkrj15QTUvXXBygILGJID8lJWAFGzh67DNlMY+gt5A=
=DYvG
-----END PGP SIGNATURE-----

--RAvBhe4Y3oL+ZazP--


