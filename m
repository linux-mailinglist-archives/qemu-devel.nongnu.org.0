Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705F348248
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:58:35 +0100 (CET)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9eE-0003it-G9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP9cS-0002os-RV
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP9cQ-00019k-Kp
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616615801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FR4xDYEqq9SeinryOpRk29/fRDFODlEaN+wXaq3UKJg=;
 b=bWWzP7g+YijcoYMl8w9ocQXX7/pDknxuMIE7o6g2Qs2dVfTju4rSc9hv39zBDyzR1Q8mkN
 GOueQufEcVg0avF/ArEl2ybreOB4sI3oqW3G4T5d5jtZ3kYrUCaZveeppqCxP9Vb17i8AV
 m19OjDkSlnG/R1zfJWjkQKBihzzbCDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-i347DweHMdCZp_icOVZThg-1; Wed, 24 Mar 2021 15:56:39 -0400
X-MC-Unique: i347DweHMdCZp_icOVZThg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD7A8107ACCD
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 19:56:37 +0000 (UTC)
Received: from localhost (ovpn-112-107.ams2.redhat.com [10.36.112.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6835D9CA;
 Wed, 24 Mar 2021 19:56:37 +0000 (UTC)
Date: Wed, 24 Mar 2021 19:56:36 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
Message-ID: <YFuZdDNIhfROJQCi@stefanha-x1.localdomain>
References: <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
 <20201210115547.GH416119@stefanha-x1.localdomain>
 <CAJaqyWe3EKiHHxgtabeZ8d7TS3LKP_BsCvHjt3YUDGLxy-Egjg@mail.gmail.com>
 <CAJaqyWdNeaboGaSsXPA8r=mUsbctFLzACFKLX55yRQpTvjqxJw@mail.gmail.com>
 <YFh2tpwBdedgrwLE@stefanha-x1.localdomain>
 <CAJaqyWccygCK4a8riMy9ZTf1cDepQQTyAK4vvh08cAUCX7nTYQ@mail.gmail.com>
 <YFjWcswhZWkyKOOR@stefanha-x1.localdomain>
 <CAJaqyWfnAYQnuUyp1UUJ0g0KAizycqRQ5kTfFWevzyVktQTzMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfnAYQnuUyp1UUJ0g0KAizycqRQ5kTfFWevzyVktQTzMg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MyEhy5kTsSHESPYE"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MyEhy5kTsSHESPYE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 08:04:07PM +0100, Eugenio Perez Martin wrote:
> On Mon, Mar 22, 2021 at 6:40 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Mon, Mar 22, 2021 at 04:55:13PM +0100, Eugenio Perez Martin wrote:
> > > On Mon, Mar 22, 2021 at 11:51 AM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
> > > >
> > > > On Thu, Mar 11, 2021 at 07:53:53PM +0100, Eugenio Perez Martin wrot=
e:
> > > > > On Fri, Jan 22, 2021 at 7:18 PM Eugenio Perez Martin
> > > > > <eperezma@redhat.com> wrote:
> > > > > >
> > > > > > On Thu, Dec 10, 2020 at 12:55 PM Stefan Hajnoczi <stefanha@redh=
at.com> wrote:
> > > > > > >
> > > > > > > On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Marti=
n wrote:
> > > > > > > > On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gm=
ail.com> wrote:
> > > > > > > > > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=E9rez=
 wrote:
> > > > > > > > > > +        while (true) {
> > > > > > > > > > +            int r;
> > > > > > > > > > +            if (virtio_queue_full(vq)) {
> > > > > > > > > > +                break;
> > > > > > > > > > +            }
> > > > > > > > >
> > > > > > > > > Why is this check necessary? The guest cannot provide mor=
e descriptors
> > > > > > > > > than there is ring space. If that happens somehow then it=
's a driver
> > > > > > > > > error that is already reported in virtqueue_pop() below.
> > > > > > > > >
> > > > > > > >
> > > > > > > > It's just checked because virtqueue_pop prints an error on =
that case,
> > > > > > > > and there is no way to tell the difference between a regula=
r error and
> > > > > > > > another caused by other causes. Maybe the right thing to do=
 is just to
> > > > > > > > not to print that error? Caller should do the error printin=
g in that
> > > > > > > > case. Should we return an error code?
> > > > > > >
> > > > > > > The reason an error is printed today is because it's a guest =
error that
> > > > > > > never happens with correct guest drivers. Something is broken=
 and the
> > > > > > > user should know about it.
> > > > > > >
> > > > > > > Why is "virtio_queue_full" (I already forgot what that actual=
ly means,
> > > > > > > it's not clear whether this is referring to avail elements or=
 used
> > > > > > > elements) a condition that should be silently ignored in shad=
ow vqs?
> > > > > > >
> > > > > >
> > > > > > TL;DR: It can be changed to a check of the number of available
> > > > > > descriptors in shadow vq, instead of returning as a regular ope=
ration.
> > > > > > However, I think that making it a special return of virtqueue_p=
op
> > > > > > could help in devices that run to completion, avoiding having t=
o
> > > > > > duplicate the count logic in them.
> > > > > >
> > > > > > The function virtio_queue_empty checks if the vq has all descri=
ptors
> > > > > > available, so the device has no more work to do until the drive=
r makes
> > > > > > another descriptor available. I can see how it can be a bad nam=
e
> > > > > > choice, but virtio_queue_full means the opposite: device has po=
p()
> > > > > > every descriptor available, and it has not returned any, so the=
 driver
> > > > > > cannot progress until the device marks some descriptors as used=
.
> > > > > >
> > > > > > As I understand, if vq->in_use >vq->num would mean we have a bu=
g in
> > > > > > the device vq code, not in the driver. virtio_queue_full could =
even be
> > > > > > changed to "assert(vq->inuse <=3D vq->vring.num); return vq->in=
use =3D=3D
> > > > > > vq->vring.num", as long as vq->in_use is operated right.
> > > > > >
> > > > > > If we hit vq->in_use =3D=3D vq->num in virtqueue_pop it means t=
he device
> > > > > > tried to pop() one more buffer after having all of them availab=
le and
> > > > > > pop'ed. This would be invalid if the device is counting right t=
he
> > > > > > number of in_use descriptors, but then we are duplicating that =
logic
> > > > > > in the device and the vq.
> > > >
> > > > Devices call virtqueue_pop() until it returns NULL. They don't need=
 to
> > > > count virtqueue buffers explicitly. It returns NULL when vq->num
> > > > virtqueue buffers have already been popped (either because
> > > > virtio_queue_empty() is true or because an invalid driver state is
> > > > detected by checking vq->num in virtqueue_pop()).
> > >
> > > If I understood you right, the virtio_queue_full addresses the revers=
e
> > > problem: it controls when the virtqueue is out of buffers to make
> > > available for the device because the latter has not consumed any, not
> > > when the driver does not offer more buffers to the device because it
> > > has no more data to offer.
> > >
> > > I find it easier to explain with the virtio-net rx queue (and I think
> > > it's the easier way to trigger this issue). You are describing it's
> > > regular behavior: The guest fills it (let's say 100%), and the device
> > > picks buffers one by one:
> > >
> > > virtio_net_receive_rcu:
> > > while (offset < size) {
> > >     elem =3D virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
> >
> > The lines before this loop return early when the virtqueue does not hav=
e
> > sufficient buffer space:
> >
> >   if (!virtio_net_has_buffers(q, size + n->guest_hdr_len - n->host_hdr_=
len)) {
> >       return 0;
> >   }
> >
> > When entering this loop we know that we can pop the buffers needed to
> > fill one rx packet.
> >
> > >     if (!elem) {
> > >         virtio_error("unexpected empty queue");
> > >     }
> > >     /* [1] */
> > >     /* fill elem with rx packet */
> > >     virtqueue_fill(virtqueue, elem);
> > >     ...
> > >     virtqueue_flush(q->rx_vq, i);
> > > }
> > >
> > > Every device as far as I know does this buffer by buffer, there is
> > > just processing code in [1], and it never tries to pop more than one
> > > buffers/chain of buffers at the same time. In the case of a queue
> > > empty (no more available buffers), we hit an error, because there are
> > > no more buffers to write.
> >
> > It's an error because we already checked that the virtqueue has buffer
> > space. This should never happen.
> >
> > > In other devices (or tx queue), empty
> > > buffers means there is no more work to do, not an error.
> > >
> > > In the case of shadow virtqueue, we cannot limit the number of expose=
d
> > > rx buffers to 1 buffer/chain of buffers in [1], since it will affect
> > > batching. We have the opposite problem: All devices (but rx queue)
> > > want to queue "as empty as possible", or "to mark all available
> > > buffers empty". Net rx queue is ok as long as it has a buffer/buffer
> > > chain big enough to write to, but it will fetch them on demand, so
> > > "queue full" (as in all buffers are available) is not a problem for
> > > the device.
> > >
> > > However, the part of the shadow virtqueue that forwards the available
> > > buffer seeks the opposite: It wants as many buffers as possible to be
> > > available. That means that there is no [1] code that fills/read &
> > > flush/detach the buffer immediately: Shadow virtqueue wants to make
> > > available as many buffers as possible, but the device may not use the=
m
> > > until it has more data available. To the extreme (virtio-net rx queue
> > > full), shadow virtqueue may make available all buffers, so in a
> > > while(true) loop, it will try to make them available until it hits
> > > that all the buffers are already available (vq->in_use =3D=3D vq->num=
).
> > >
> > > The solution is to check the number of buffers already available
> > > before calling virtio_queue_pop(). We could duplicate in_use in shado=
w
> > > virtqueue, of course, but everything we need is already done in
> > > VirtQueue code, so I think to reuse it is a better solution. Another
> > > solution could be to treat vq->in_use =3D=3D vq->num as an special re=
turn
> > > code with no printed error in virtqueue_pop, but to expose if the
> > > queue is full (as vq->in_use =3D=3D vq->num) sounds less invasive to =
me.
> > >
> > > >
> > > > > > In shadow vq this situation happens with the correct guest netw=
ork
> > > > > > driver, since the rx queue is filled for the device to write. N=
etwork
> > > > > > device in qemu fetch descriptors on demand, but shadow vq fetch=
 all
> > > > > > available in batching. If the driver just happens to fill the q=
ueue of
> > > > > > available descriptors, the log will raise, so we need to check =
in
> > > > > > handle_sw_lm_vq before calling pop(). Of course the shadow vq c=
an
> > > > > > duplicate guest_vq->in_use instead of checking virtio_queue_ful=
l, but
> > > > > > then it needs to check two things for every virtqueue_pop() [1]=
.
> > > >
> > > > I don't understand this scenario. It sounds like you are saying the
> > > > guest and shadow rx vq are not in sync so there is a case where
> > > > vq->in_use > vq->num is triggered?
> > >
> > > Sorry if I explain it bad, what I meant is that there is a case where
> > > SVQ (as device code) will call virtqueue_pop() when vq->in_use =3D=3D
> > > vq->num. virtio_queue_full maintains the check as >=3D, I think it
> > > should be safe to even to code virtio_queue_full to:
> > >
> > > assert(vq->in_use > vq->num);
> > > return vq->inuse =3D=3D vq->num;
> > >
> > > Please let me know if this is not clear enough.
> >
> > I don't get it. When virtqueue_split_pop() has popped all requests
> > virtio_queue_empty_rcu() should return true and we shouldn't reach if
> > (vq->inuse >=3D vq->vring.num). The guest driver cannot submit more
> > available buffers at this point.
> >
>=20
> Hi Stefan.
>=20
> After the meeting, and reviewing the code carefully, I think you are
> right. I'm not sure what I did to reproduce the issue, but I'm not
> able to do it anymore, even in the conditions I thought where it was
> trivially reproducible. Now I think it was caused in the previous
> series because of accessing directly to guest's vring.
>=20
> So I will delete this commit from the series. I still need to test SVQ
> with the new additions, so if the bug persists it will reproduce for
> sure.

Okay, thanks!

Stefan

--MyEhy5kTsSHESPYE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbmXQACgkQnKSrs4Gr
c8hmiQgAt/bvo1eCqHKB0RYwhPZ3h7Buzy5N5NtbW+FDPPJreMTj/IzVFA+NE3JH
MzY1OQv5OLpxKpiDjRZYItYQcXQn77l3jEPGsMLSK40tqCDrthzv2ZMDhN3WWypO
mDIjfb2XtnTVP1//hMg8+w4/j108wlbPGDJ6SrZBrP+M+pgW5JmGTOh9TDGUeLoM
luUb3njZZniav89+c8cI5IdFWUqtzsl2EO8RR7fBXvAA/obKh7yUhqX8+r5chJ7I
1/BJxCG9jfVkAFyqN/SN9K/olx8rirsVBZgv+tGw9nSGim/PNNDmC0dMcz065yny
UnowAOx2dUklPbjcHYgWmHkapJ6HFw==
=I9Yh
-----END PGP SIGNATURE-----

--MyEhy5kTsSHESPYE--


