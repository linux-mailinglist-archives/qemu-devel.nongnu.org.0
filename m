Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B536422EF7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:18:13 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo4y-0005kP-Fn
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXnNG-0005IX-K8; Tue, 05 Oct 2021 12:33:02 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXnN9-0003cP-GT; Tue, 05 Oct 2021 12:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=XGnubg1z6SJECPfGa6yLaeJYnINmKmj6A98aD9Fyh80=; b=N2/itdEsWL195rL7rXJ5pXzC+G
 KJpFuSG5nYSFepBpzWMvzPv0cRyKBWvplic7k/G5NdvWfVqIpNr5Z3PlJvnyM2/uxJB/XxtuBtp9/
 Zo9X6FiF7xqg1bp9KWiuNAFvvOCI/LNkU7ElEovbdEY+j8SPEed0iGuCKh2R9Q9qLC1+UxfLeEyRi
 2zyI04vqdoRk8l/gZAQQwQIXCEjks/p3ihssAc+U4eIIfPZszLeuX1ToIh9/MyxyZkmgqYnDjKQtm
 UBPcim+HujFsxpApadefkCZk+9u4/oR2Wv5Icu94+qbBUQ6+SmE8+nxwvMyCyvrUMzEzdP22gyABB
 nHp6cCVb6B74aA+OPHnXkZSC5ZXZy8Q2NfzOfBrQrTjpQVyJPYi5a3idTlL4+r7suRcKDtM1qPRSo
 a7WkeCgrAfndoYCQt0ZpkvLY0JC5UlM7/jsNey91fQqsYCxe8VRFd6TzB6yJhsQcu8QCpB1ueF1Cs
 d/Q9ypRiUCeJMzDgs09699W3JmRfxtlqEkjaZqKLy+/5Y3d74o+yEq30AVleICP4XGY6zIlVaPRj+
 niogYx3a6Jlagg5UoSIz3pmJcGd8bBf7hWNSdNhLuK65Tp0zFBRoy0AbrKzVmrr1d/r4HIHiEYdnQ
 iDpSK0lXOk2etmWs78JYrjPaf13Lx2SMqdj0jAugI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/3] virtio: turn VIRTQUEUE_MAX_SIZE into a variable
Date: Tue, 05 Oct 2021 18:32:46 +0200
Message-ID: <1950551.Wq8TZpmmRU@silver>
In-Reply-To: <YVxq8EwB8uXouiEj@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <14205148.YOBg3JvQBA@silver> <YVxq8EwB8uXouiEj@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 5. Oktober 2021 17:10:40 CEST Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 03:15:26PM +0200, Christian Schoenebeck wrote:
> > On Dienstag, 5. Oktober 2021 14:45:56 CEST Stefan Hajnoczi wrote:
> > > On Mon, Oct 04, 2021 at 09:38:04PM +0200, Christian Schoenebeck wrote:
> > > > Refactor VIRTQUEUE_MAX_SIZE to effectively become a runtime
> > > > variable per virtio user.
> > > 
> > > virtio user == virtio device model?
> > 
> > Yes
> > 
> > > > Reasons:
> > > > 
> > > > (1) VIRTQUEUE_MAX_SIZE should reflect the absolute theoretical
> > > > 
> > > >     maximum queue size possible. Which is actually the maximum
> > > >     queue size allowed by the virtio protocol. The appropriate
> > > >     value for VIRTQUEUE_MAX_SIZE would therefore be 32768:
> > > >     
> > > >     https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs
> > > >     01.h
> > > >     tml#x1-240006
> > > >     
> > > >     Apparently VIRTQUEUE_MAX_SIZE was instead defined with a
> > > >     more or less arbitrary value of 1024 in the past, which
> > > >     limits the maximum transfer size with virtio to 4M
> > > >     (more precise: 1024 * PAGE_SIZE, with the latter typically
> > > >     being 4k).
> > > 
> > > Being equal to IOV_MAX is a likely reason. Buffers with more iovecs than
> > > that cannot be passed to host system calls (sendmsg(2), pwritev(2),
> > > etc).
> > 
> > Yes, that's use case dependent. Hence the solution to opt-in if it is
> > desired and feasible.
> > 
> > > > (2) Additionally the current value of 1024 poses a hidden limit,
> > > > 
> > > >     invisible to guest, which causes a system hang with the
> > > >     following QEMU error if guest tries to exceed it:
> > > >     
> > > >     virtio: too many write descriptors in indirect table
> > > 
> > > I don't understand this point. 2.6.5 The Virtqueue Descriptor Table 
says:
> > >   The number of descriptors in the table is defined by the queue size
> > >   for
> > > 
> > > this virtqueue: this is the maximum possible descriptor chain length.
> > > 
> > > and 2.6.5.3.1 Driver Requirements: Indirect Descriptors says:
> > >   A driver MUST NOT create a descriptor chain longer than the Queue Size
> > >   of
> > > 
> > > the device.
> > > 
> > > Do you mean a broken/malicious guest driver that is violating the spec?
> > > That's not a hidden limit, it's defined by the spec.
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00781.html
> > https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00788.html
> > 
> > You can already go beyond that queue size at runtime with the indirection
> > table. The only actual limit is the currently hard coded value of 1k
> > pages.
> > Hence the suggestion to turn that into a variable.
> 
> Exceeding Queue Size is a VIRTIO spec violation. Drivers that operate
> outsided the spec do so at their own risk. They may not be compatible
> with all device implementations.

Yes, I am ware about that. And still, this practice is already done, which 
apparently is not limited to 9pfs.

> The limit is not hidden, it's Queue Size as defined by the spec :).
> 
> If you have a driver that is exceeding the limit, then please fix the
> driver.

I absolutely understand your position, but I hope you also understand that 
this violation of the specs is a theoretical issue, it is not a real-life 
problem right now, and due to lack of man power unfortunately I have to 
prioritize real-life problems over theoretical ones ATM. Keep in mind that 
right now I am the only person working on 9pfs actively, I do this voluntarily 
whenever I find a free time slice, and I am not paid for it either.

I don't see any reasonable way with reasonable effort to do what you are 
asking for here in 9pfs, and Greg may correct me here if I am saying anything 
wrong. If you are seeing any specific real-life issue here, then please tell 
me which one, otherwise I have to postpone that "specs violation" issue.

There is still a long list of real problems that I need to hunt down in 9pfs, 
afterwards I can continue with theoretical ones if you want, but right now I 
simply can't, sorry.

> > > > (3) Unfortunately not all virtio users in QEMU would currently
> > > > 
> > > >     work correctly with the new value of 32768.
> > > > 
> > > > So let's turn this hard coded global value into a runtime
> > > > variable as a first step in this commit, configurable for each
> > > > virtio user by passing a corresponding value with virtio_init()
> > > > call.
> > > 
> > > virtio_add_queue() already has an int queue_size argument, why isn't
> > > that enough to deal with the maximum queue size? There's probably a good
> > > reason for it, but please include it in the commit description.
> > 
> > [...]
> > 
> > > Can you make this value per-vq instead of per-vdev since virtqueues can
> > > have different queue sizes?
> > > 
> > > The same applies to the rest of this patch. Anything using
> > > vdev->queue_max_size should probably use vq->vring.num instead.
> > 
> > I would like to avoid that and keep it per device. The maximum size stored
> > there is the maximum size supported by virtio user (or vortio device
> > model,
> > however you want to call it). So that's really a limit per device, not per
> > queue, as no queue of the device would ever exceed that limit.
> > 
> > Plus a lot more code would need to be refactored, which I think is
> > unnecessary.
> 
> I'm against a per-device limit because it's a concept that cannot
> accurately describe reality. Some devices have multiple classes of

It describes current reality, because VIRTQUEUE_MAX_SIZE obviously is not per 
queue either ATM, and nobody ever cared.

All this series does, is allowing to override that currently project-wide 
compile-time constant to a per-driver-model compile-time constant. Which makes 
sense, because that's what it is: some drivers could cope with any transfer 
size, and some drivers are constrained to a certain maximum application 
specific transfer size (e.g. IOV_MAX).

> virtqueues and they are sized differently, so a per-device limit is
> insufficient. virtio-net has separate rx_queue_size and tx_queue_size
> parameters (plus a control vq hardcoded to 64 descriptors).

I simply find this overkill. This value semantically means "my driver model 
supports at any time and at any coincidence at the very most x * PAGE_SIZE = 
max_transfer_size". Do you see any driver that might want a more fine graded 
control over this?

As far as I can see, no other driver maintainer even seems to care to 
transition to 32k. So I simply doubt that anybody would even want a more 
fained graded control over this in practice, but anyway ...

> The specification already gives us Queue Size (vring.num in QEMU). The
> variable exists in QEMU and just needs to be used.
> 
> If per-vq limits require a lot of work, please describe why. I think
> replacing the variable from this patch with virtio_queue_get_num()
> should be fairly straightforward, but maybe I'm missing something? (If
> you prefer VirtQueue *vq instead of the index-based
> virtio_queue_get_num() API, you can introduce a virtqueue_get_num()
> API.)
> 
> Stefan

... I leave that up to Michael or whoever might be in charge to decide. I 
still find this overkill, but I will adapt this to whatever the decision 
eventually will be in v3.

But then please tell me the precise representation that you find appropriate, 
i.e. whether you want a new function for that, or rather an additional 
argument to virtio_add_queue(). Your call.

Best regards,
Christian Schoenebeck



