Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370BDB0265
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 19:11:25 +0200 (CEST)
Received: from localhost ([::1]:53994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i869M-00048u-BD
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 13:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i868Y-0003ST-9V
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 13:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i868W-0005wx-VN
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 13:10:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i868W-0005wL-NY
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 13:10:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 075513B738
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 17:10:32 +0000 (UTC)
Received: from work-vm (ovpn-117-243.ams2.redhat.com [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01B0F60872;
 Wed, 11 Sep 2019 17:10:30 +0000 (UTC)
Date: Wed, 11 Sep 2019 18:10:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190911171028.GI2894@work-vm>
References: <20190911164202.31136-1-dgilbert@redhat.com>
 <20190911164202.31136-2-dgilbert@redhat.com>
 <20190911165627.GG24295@redhat.com> <20190911170423.GH2894@work-vm>
 <20190911170933.GJ24295@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190911170933.GJ24295@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 11 Sep 2019 17:10:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] rcu: Add automatically released
 rcu_read_lock variant
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Wed, Sep 11, 2019 at 06:04:23PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> > > On Wed, Sep 11, 2019 at 05:42:00PM +0100, Dr. David Alan Gilbert (g=
it) wrote:
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > >=20
> > > > RCU_READ_LOCK_AUTO takes the rcu_read_lock  and then uses glib's
> > > > g_auto infrastrcture (and thus whatever the compilers hooks are) =
to
> > > > release it on all exits of the block.
> > > >=20
> > > > Note this macro has a variable declaration in, and hence is not i=
n
> > > > a while loop.
> > > >=20
> > > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > ---
> > > >  include/qemu/rcu.h | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> > > > index 22876d1428..6a25b27d28 100644
> > > > --- a/include/qemu/rcu.h
> > > > +++ b/include/qemu/rcu.h
> > > > @@ -154,6 +154,18 @@ extern void call_rcu1(struct rcu_head *head,=
 RCUCBFunc *func);
> > > >        }),                                                       =
         \
> > > >        (RCUCBFunc *)g_free);
> > > > =20
> > > > +typedef char rcu_read_auto_t;
> > > > +static inline void rcu_read_auto_unlock(rcu_read_auto_t *r)
> > > > +{
> > > > +  rcu_read_unlock();
> > > > +}
> > > > +
> > > > +G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(rcu_read_auto_t, rcu_read_auto_=
unlock)
> > > >
> > > > +#define RCU_READ_LOCK_AUTO g_auto(rcu_read_auto_t) \
> > > > +    _rcu_read_auto =3D 'x'; \
> > > > +    rcu_read_lock();
> > > > +
> > >=20
> > > Functionally this works, but my gut feeling would be to follow
> > > the design of GMutexLocker as-is:
> > >=20
> > >   https://developer.gnome.org/glib/stable/glib-Threads.html#g-mutex=
-locker-new
> > >=20
> > > so you get a use pattern of
> > >=20
> > >   g_autoptr(rcu_read_locker) locker =3D rcu_read_locker_new();
> > >=20
> > > This makes it explicit that the code is creating a variable here, w=
hich
> > > in turns means it is clear to force unlock early with
> > >=20
> > >   g_clear_pointer(&locker, rcu_read_locker_free)
> >=20
> > The difference compared to the g-mutex-locker is that I don't have
> > another object to use as my pointer; that uses the address of the GMu=
tex
> > as the dummy pointer value.  I did try an experiment with g_autoptr
> > and found that it did need to return a non-NULL value for it to work,
> > which then lead me to think what value to use - while it seems to wor=
k
> > if I return (void *)1 it makes me nervous.
>=20
> Yeah, '(void*)1' would have been what I'd pick. The only thing that the
> value is used for is to pass to the rcu_read_locker_free() function
> which ignores it, which seems safe enough.

glib seems to be at least checking it; if you pass NULL the free'r
doesn't get called; so it worries me that we'd be relying on the current
definition.

Dave

> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

