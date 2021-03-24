Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29E34813D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:08:22 +0100 (CET)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8rd-0005Hx-E1
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lP8oJ-0004Fv-3c
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lP8oB-0003f7-Vm
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616612686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRyKlG8N4WByqKWGIIubaEEWVPQCXiYLu+231bSQdo0=;
 b=gxbPp0jQBhYsaDw8NIffcdz0N2G9YFCFYJhcLJEkb3be0b9Ds3m9RsI0tDLuzP9ePBZQwT
 Th0Mqd0cqWvtLxA1QnOL2uz7W381YWzVCy2b5TYfrr+UALoq/jsQgspsvm+kuyBCGnzHPm
 q7Gg0gFUqHbXgms4xeD92tfesldB9/8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-P3TjADkWNyGWqdDKz-awyA-1; Wed, 24 Mar 2021 15:04:44 -0400
X-MC-Unique: P3TjADkWNyGWqdDKz-awyA-1
Received: by mail-qv1-f71.google.com with SMTP id j3so2051262qvo.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 12:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uRyKlG8N4WByqKWGIIubaEEWVPQCXiYLu+231bSQdo0=;
 b=ByrS8lpoNP4ZABgwaQPg+YUsUa/lgrmX+XjVQd7UHonG7KtTJAbUItcD9ona/BK0jF
 9QKvZaMDQP4MkEeIBC7bb+94ErfoM0PJL5WKNcymPAIa/Bu8n9bekhnk4f1rEKUD99PW
 kPMnViMXAiy1B8aHSrai9lbdr4hkHzrosUaw+zEOONnAcwe1E4iGNKPS2ozlmDo9qPnh
 UGXsB351FEH0BGAUXV6DnYzgAgypV21oMhIz0K8M+EjJY8KL8wwfxDEuHd0k83UeeID+
 Ya35cdaajdotA3/XXWLkgneMGBDloXBA6LIrKTgDEqRpm24IffUloznvuUh2S3kZY7mG
 ZFow==
X-Gm-Message-State: AOAM531p7AZFZs4k4jrnMd1G3cvBP2MLz6AMbMpf78P7SgHnSMUgYjiD
 i7Y/SzsE7OXppC3//uvSLCniRTBXrsnh5oziNvAPVeEQVqVdgUQO+qa3lqTkcQzvLKKa45uN2oO
 Wp8Z/1ZfoobdVlw70a2sJQy+oAsDdWCA=
X-Received: by 2002:a0c:f946:: with SMTP id i6mr4805154qvo.40.1616612683891;
 Wed, 24 Mar 2021 12:04:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxufL5XlNK+OPN3Q3PqaCAx4ojXWNbmKVN+MkzSdjhBAsNN7Kvz/hM3BE4NyBCxiqF8P6RoDpivBOqtCw+9HNU=
X-Received: by 2002:a0c:f946:: with SMTP id i6mr4805134qvo.40.1616612683536;
 Wed, 24 Mar 2021 12:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
 <20201210115547.GH416119@stefanha-x1.localdomain>
 <CAJaqyWe3EKiHHxgtabeZ8d7TS3LKP_BsCvHjt3YUDGLxy-Egjg@mail.gmail.com>
 <CAJaqyWdNeaboGaSsXPA8r=mUsbctFLzACFKLX55yRQpTvjqxJw@mail.gmail.com>
 <YFh2tpwBdedgrwLE@stefanha-x1.localdomain>
 <CAJaqyWccygCK4a8riMy9ZTf1cDepQQTyAK4vvh08cAUCX7nTYQ@mail.gmail.com>
 <YFjWcswhZWkyKOOR@stefanha-x1.localdomain>
In-Reply-To: <YFjWcswhZWkyKOOR@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 24 Mar 2021 20:04:07 +0100
Message-ID: <CAJaqyWfnAYQnuUyp1UUJ0g0KAizycqRQ5kTfFWevzyVktQTzMg@mail.gmail.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

On Mon, Mar 22, 2021 at 6:40 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Mon, Mar 22, 2021 at 04:55:13PM +0100, Eugenio Perez Martin wrote:
> > On Mon, Mar 22, 2021 at 11:51 AM Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > >
> > > On Thu, Mar 11, 2021 at 07:53:53PM +0100, Eugenio Perez Martin wrote:
> > > > On Fri, Jan 22, 2021 at 7:18 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Thu, Dec 10, 2020 at 12:55 PM Stefan Hajnoczi <stefanha@redhat=
.com> wrote:
> > > > > >
> > > > > > On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Martin =
wrote:
> > > > > > > On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmai=
l.com> wrote:
> > > > > > > > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=C3=A9re=
z wrote:
> > > > > > > > > +        while (true) {
> > > > > > > > > +            int r;
> > > > > > > > > +            if (virtio_queue_full(vq)) {
> > > > > > > > > +                break;
> > > > > > > > > +            }
> > > > > > > >
> > > > > > > > Why is this check necessary? The guest cannot provide more =
descriptors
> > > > > > > > than there is ring space. If that happens somehow then it's=
 a driver
> > > > > > > > error that is already reported in virtqueue_pop() below.
> > > > > > > >
> > > > > > >
> > > > > > > It's just checked because virtqueue_pop prints an error on th=
at case,
> > > > > > > and there is no way to tell the difference between a regular =
error and
> > > > > > > another caused by other causes. Maybe the right thing to do i=
s just to
> > > > > > > not to print that error? Caller should do the error printing =
in that
> > > > > > > case. Should we return an error code?
> > > > > >
> > > > > > The reason an error is printed today is because it's a guest er=
ror that
> > > > > > never happens with correct guest drivers. Something is broken a=
nd the
> > > > > > user should know about it.
> > > > > >
> > > > > > Why is "virtio_queue_full" (I already forgot what that actually=
 means,
> > > > > > it's not clear whether this is referring to avail elements or u=
sed
> > > > > > elements) a condition that should be silently ignored in shadow=
 vqs?
> > > > > >
> > > > >
> > > > > TL;DR: It can be changed to a check of the number of available
> > > > > descriptors in shadow vq, instead of returning as a regular opera=
tion.
> > > > > However, I think that making it a special return of virtqueue_pop
> > > > > could help in devices that run to completion, avoiding having to
> > > > > duplicate the count logic in them.
> > > > >
> > > > > The function virtio_queue_empty checks if the vq has all descript=
ors
> > > > > available, so the device has no more work to do until the driver =
makes
> > > > > another descriptor available. I can see how it can be a bad name
> > > > > choice, but virtio_queue_full means the opposite: device has pop(=
)
> > > > > every descriptor available, and it has not returned any, so the d=
river
> > > > > cannot progress until the device marks some descriptors as used.
> > > > >
> > > > > As I understand, if vq->in_use >vq->num would mean we have a bug =
in
> > > > > the device vq code, not in the driver. virtio_queue_full could ev=
en be
> > > > > changed to "assert(vq->inuse <=3D vq->vring.num); return vq->inus=
e =3D=3D
> > > > > vq->vring.num", as long as vq->in_use is operated right.
> > > > >
> > > > > If we hit vq->in_use =3D=3D vq->num in virtqueue_pop it means the=
 device
> > > > > tried to pop() one more buffer after having all of them available=
 and
> > > > > pop'ed. This would be invalid if the device is counting right the
> > > > > number of in_use descriptors, but then we are duplicating that lo=
gic
> > > > > in the device and the vq.
> > >
> > > Devices call virtqueue_pop() until it returns NULL. They don't need t=
o
> > > count virtqueue buffers explicitly. It returns NULL when vq->num
> > > virtqueue buffers have already been popped (either because
> > > virtio_queue_empty() is true or because an invalid driver state is
> > > detected by checking vq->num in virtqueue_pop()).
> >
> > If I understood you right, the virtio_queue_full addresses the reverse
> > problem: it controls when the virtqueue is out of buffers to make
> > available for the device because the latter has not consumed any, not
> > when the driver does not offer more buffers to the device because it
> > has no more data to offer.
> >
> > I find it easier to explain with the virtio-net rx queue (and I think
> > it's the easier way to trigger this issue). You are describing it's
> > regular behavior: The guest fills it (let's say 100%), and the device
> > picks buffers one by one:
> >
> > virtio_net_receive_rcu:
> > while (offset < size) {
> >     elem =3D virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
>
> The lines before this loop return early when the virtqueue does not have
> sufficient buffer space:
>
>   if (!virtio_net_has_buffers(q, size + n->guest_hdr_len - n->host_hdr_le=
n)) {
>       return 0;
>   }
>
> When entering this loop we know that we can pop the buffers needed to
> fill one rx packet.
>
> >     if (!elem) {
> >         virtio_error("unexpected empty queue");
> >     }
> >     /* [1] */
> >     /* fill elem with rx packet */
> >     virtqueue_fill(virtqueue, elem);
> >     ...
> >     virtqueue_flush(q->rx_vq, i);
> > }
> >
> > Every device as far as I know does this buffer by buffer, there is
> > just processing code in [1], and it never tries to pop more than one
> > buffers/chain of buffers at the same time. In the case of a queue
> > empty (no more available buffers), we hit an error, because there are
> > no more buffers to write.
>
> It's an error because we already checked that the virtqueue has buffer
> space. This should never happen.
>
> > In other devices (or tx queue), empty
> > buffers means there is no more work to do, not an error.
> >
> > In the case of shadow virtqueue, we cannot limit the number of exposed
> > rx buffers to 1 buffer/chain of buffers in [1], since it will affect
> > batching. We have the opposite problem: All devices (but rx queue)
> > want to queue "as empty as possible", or "to mark all available
> > buffers empty". Net rx queue is ok as long as it has a buffer/buffer
> > chain big enough to write to, but it will fetch them on demand, so
> > "queue full" (as in all buffers are available) is not a problem for
> > the device.
> >
> > However, the part of the shadow virtqueue that forwards the available
> > buffer seeks the opposite: It wants as many buffers as possible to be
> > available. That means that there is no [1] code that fills/read &
> > flush/detach the buffer immediately: Shadow virtqueue wants to make
> > available as many buffers as possible, but the device may not use them
> > until it has more data available. To the extreme (virtio-net rx queue
> > full), shadow virtqueue may make available all buffers, so in a
> > while(true) loop, it will try to make them available until it hits
> > that all the buffers are already available (vq->in_use =3D=3D vq->num).
> >
> > The solution is to check the number of buffers already available
> > before calling virtio_queue_pop(). We could duplicate in_use in shadow
> > virtqueue, of course, but everything we need is already done in
> > VirtQueue code, so I think to reuse it is a better solution. Another
> > solution could be to treat vq->in_use =3D=3D vq->num as an special retu=
rn
> > code with no printed error in virtqueue_pop, but to expose if the
> > queue is full (as vq->in_use =3D=3D vq->num) sounds less invasive to me=
.
> >
> > >
> > > > > In shadow vq this situation happens with the correct guest networ=
k
> > > > > driver, since the rx queue is filled for the device to write. Net=
work
> > > > > device in qemu fetch descriptors on demand, but shadow vq fetch a=
ll
> > > > > available in batching. If the driver just happens to fill the que=
ue of
> > > > > available descriptors, the log will raise, so we need to check in
> > > > > handle_sw_lm_vq before calling pop(). Of course the shadow vq can
> > > > > duplicate guest_vq->in_use instead of checking virtio_queue_full,=
 but
> > > > > then it needs to check two things for every virtqueue_pop() [1].
> > >
> > > I don't understand this scenario. It sounds like you are saying the
> > > guest and shadow rx vq are not in sync so there is a case where
> > > vq->in_use > vq->num is triggered?
> >
> > Sorry if I explain it bad, what I meant is that there is a case where
> > SVQ (as device code) will call virtqueue_pop() when vq->in_use =3D=3D
> > vq->num. virtio_queue_full maintains the check as >=3D, I think it
> > should be safe to even to code virtio_queue_full to:
> >
> > assert(vq->in_use > vq->num);
> > return vq->inuse =3D=3D vq->num;
> >
> > Please let me know if this is not clear enough.
>
> I don't get it. When virtqueue_split_pop() has popped all requests
> virtio_queue_empty_rcu() should return true and we shouldn't reach if
> (vq->inuse >=3D vq->vring.num). The guest driver cannot submit more
> available buffers at this point.
>

Hi Stefan.

After the meeting, and reviewing the code carefully, I think you are
right. I'm not sure what I did to reproduce the issue, but I'm not
able to do it anymore, even in the conditions I thought where it was
trivially reproducible. Now I think it was caused in the previous
series because of accessing directly to guest's vring.

So I will delete this commit from the series. I still need to test SVQ
with the new additions, so if the bug persists it will reproduce for
sure.

Thank you very much!

> I only checked split rings, not packed rings.
>
> Can you point to the SVQ code which has this problem? It may be easier
> to re-read the code than try to describe it in an email.
>
> Stefan


