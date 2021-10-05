Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E84227A2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:18:47 +0200 (CEST)
Received: from localhost ([::1]:50360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkLG-0002Aj-Or
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXkIE-0008QE-Dx; Tue, 05 Oct 2021 09:15:40 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXkI8-0007G6-EP; Tue, 05 Oct 2021 09:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=hdlGHdLFsTLrEs0ug5auof9JDB8L0ieyKazTitvR/18=; b=UcttY6MTtY0GKOlsc8Vp2x6CqL
 a7m4ziC3xA1qOngR8+6oGc0WQ8mMfWxCMecp8FaKvzcXuQHKq7lWoibrfQo6m7l7yLrqLIO+0ZmEm
 3s00MAXGYOLap2vgDNfnhFSjrrdkezgUl1iktvyrwnvXEo5XhjqW0ARJ8DmzsQaTTDaTHY5N0HmHM
 0xwZWf0Y/55cczDfEgKFZgCFZUcqob65nt/9X63HtWdyQd55tl4Wx9s81zivu31THf4E4hZ/ZUxt6
 cdz261zIWjlZx/E4mvlOWW7rUNoz5xePQkVtJ6DisGTSGliW4m24KC6pSap3dmRiyW/3ZxvYyzdJy
 W3THdfWDVIWght/6xwNFxpA5Suh+9W/+5fHePSyzJsv4+moCC7lzDtMCbU6603y16mqXCI1s8xCe9
 QZUSADL0XHLX19ArIsEFNVTGtfqI+qq28BNfwNLjKvWkG20+Cnffii0bC9Q9C4ocyprEvnxFiV08L
 4WbnCgdKBCt66cBtVLjldMWmtGtEPt6DlacYB1AeI3bW+u92XrXsa03IrZ50OlSdKpeYLfNdaOcZ7
 wKwybLo8KyL3QgLNpNUPeo8F2dg7kMyT/vOCepGGr1NRpVyU7h5RFA0ZQJjaZGIpcx8ioZnLcZ8ma
 8ga7EgX0MZS5PQL0X+kJ6Bjn2zK5rFsHjae/p6bck=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kurz <groug@kaod.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 virtio-fs@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/3] virtio: turn VIRTQUEUE_MAX_SIZE into a variable
Date: Tue, 05 Oct 2021 15:15:26 +0200
Message-ID: <14205148.YOBg3JvQBA@silver>
In-Reply-To: <YVxJBKqsytKlos6M@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633376313.git.qemu_oss@crudebyte.com>
 <YVxJBKqsytKlos6M@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Dienstag, 5. Oktober 2021 14:45:56 CEST Stefan Hajnoczi wrote:
> On Mon, Oct 04, 2021 at 09:38:04PM +0200, Christian Schoenebeck wrote:
> > Refactor VIRTQUEUE_MAX_SIZE to effectively become a runtime
> > variable per virtio user.
> 
> virtio user == virtio device model?

Yes

> > Reasons:
> > 
> > (1) VIRTQUEUE_MAX_SIZE should reflect the absolute theoretical
> > 
> >     maximum queue size possible. Which is actually the maximum
> >     queue size allowed by the virtio protocol. The appropriate
> >     value for VIRTQUEUE_MAX_SIZE would therefore be 32768:
> >     
> >     https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.h
> >     tml#x1-240006
> >     
> >     Apparently VIRTQUEUE_MAX_SIZE was instead defined with a
> >     more or less arbitrary value of 1024 in the past, which
> >     limits the maximum transfer size with virtio to 4M
> >     (more precise: 1024 * PAGE_SIZE, with the latter typically
> >     being 4k).
> 
> Being equal to IOV_MAX is a likely reason. Buffers with more iovecs than
> that cannot be passed to host system calls (sendmsg(2), pwritev(2),
> etc).

Yes, that's use case dependent. Hence the solution to opt-in if it is desired 
and feasible.

> > (2) Additionally the current value of 1024 poses a hidden limit,
> > 
> >     invisible to guest, which causes a system hang with the
> >     following QEMU error if guest tries to exceed it:
> >     
> >     virtio: too many write descriptors in indirect table
> 
> I don't understand this point. 2.6.5 The Virtqueue Descriptor Table says:
> 
>   The number of descriptors in the table is defined by the queue size for
> this virtqueue: this is the maximum possible descriptor chain length.
> 
> and 2.6.5.3.1 Driver Requirements: Indirect Descriptors says:
> 
>   A driver MUST NOT create a descriptor chain longer than the Queue Size of
> the device.
> 
> Do you mean a broken/malicious guest driver that is violating the spec?
> That's not a hidden limit, it's defined by the spec.

https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00781.html
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00788.html

You can already go beyond that queue size at runtime with the indirection 
table. The only actual limit is the currently hard coded value of 1k pages. 
Hence the suggestion to turn that into a variable.

> > (3) Unfortunately not all virtio users in QEMU would currently
> > 
> >     work correctly with the new value of 32768.
> > 
> > So let's turn this hard coded global value into a runtime
> > variable as a first step in this commit, configurable for each
> > virtio user by passing a corresponding value with virtio_init()
> > call.
> 
> virtio_add_queue() already has an int queue_size argument, why isn't
> that enough to deal with the maximum queue size? There's probably a good
> reason for it, but please include it in the commit description.
[...]
> Can you make this value per-vq instead of per-vdev since virtqueues can
> have different queue sizes?
> 
> The same applies to the rest of this patch. Anything using
> vdev->queue_max_size should probably use vq->vring.num instead.

I would like to avoid that and keep it per device. The maximum size stored 
there is the maximum size supported by virtio user (or vortio device model, 
however you want to call it). So that's really a limit per device, not per 
queue, as no queue of the device would ever exceed that limit.

Plus a lot more code would need to be refactored, which I think is 
unnecessary.

Best regards,
Christian Schoenebeck



