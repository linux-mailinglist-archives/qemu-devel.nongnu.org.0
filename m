Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8067F780
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 12:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLjEo-0000Up-8D; Sat, 28 Jan 2023 06:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjEm-0000U0-70
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:19:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLjEk-0004Uk-E5
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 06:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674904749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+kApOH39KWGgEI4OumPMgAM39KwNFnoreiz5z3Ag5I=;
 b=IGUSn9JtspwInkaIg8pg1mW92Ot5na1OOTUSaQsKaOIMQ7okKp+mBA3wcuS78t6YjhSOc2
 zUu4jV+FqzWE+TPeYHjbLYIpFzX0YszDkvSRYpBCdX4I56KTVKED5icBwjJLkUxkwgJke9
 vRH12nmygELT7dF79WH1Pf/vueTrwL4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-OQCGxBifOF2RJIyVaJm44g-1; Sat, 28 Jan 2023 06:19:06 -0500
X-MC-Unique: OQCGxBifOF2RJIyVaJm44g-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a1ccc09000000b003db1c488826so6200729wmb.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 03:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+kApOH39KWGgEI4OumPMgAM39KwNFnoreiz5z3Ag5I=;
 b=m1o1faQe4Jpfp3WoxX3KNojRW9C2LOf1gSUpr4KFo/K3c1UIMhFPaqI7HTpP5SeuHT
 YjqzS7ubry4yuX7EbNjt4LhidsaqpBb8smZeZpX0pf5lGHwZhUKEQfFjQky881lS09m1
 h/+i7gxR9kLJ1HknxMeXBYT1KTfE07m7OqHGBkO4VB9GzY8Fr7MymbmbcsUKSu5E2VrL
 Bp1Vj6wygRpGWQKCD5He9JzevN4OJLKWKdUdvbHT0RcvlokdoVVqODtseFJJ+4O64ySP
 1zdq2I6vJy7hvpWtTxAnHKGpcb2NJfO0ThW8hTeA+us85+l4chEi6sp/z7sdZYeYTbef
 eRCw==
X-Gm-Message-State: AFqh2kra18lAFHxmAdOm89wRMN0GVUIAvyEfos6oUXVHKM7RqtHsh/uE
 4fSFKj3UM3BWcJt3EbvCaIJFLYzxnPtM4rUdb8TNHtzbu6mN0JAXp4BcoOl2vXW9/b7eFecZuMK
 2PHlJG38Zv6aafRg=
X-Received: by 2002:a05:600c:c12:b0:3da:28a9:a900 with SMTP id
 fm18-20020a05600c0c1200b003da28a9a900mr40848117wmb.41.1674904744529; 
 Sat, 28 Jan 2023 03:19:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsywxNmvfGwBRPLzcmC7vssP0ZsINOaSKGFpCB2hi6pA6vHF9kqvIg//hPQmOWUWromS8N6rA==
X-Received: by 2002:a05:600c:c12:b0:3da:28a9:a900 with SMTP id
 fm18-20020a05600c0c1200b003da28a9a900mr40848099wmb.41.1674904744226; 
 Sat, 28 Jan 2023 03:19:04 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003b47b80cec3sm11600364wmq.42.2023.01.28.03.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 03:19:03 -0800 (PST)
Date: Sat, 28 Jan 2023 06:19:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/3]  virtio: struct VirtQueue introduce reset
Message-ID: <20230128061558-mutt-send-email-mst@kernel.org>
References: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
 <20230128071724.33677-3-xuanzhuo@linux.alibaba.com>
 <20230128050411-mutt-send-email-mst@kernel.org>
 <1674902469.9566288-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674902469.9566288-2-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sat, Jan 28, 2023 at 06:41:09PM +0800, Xuan Zhuo wrote:
> On Sat, 28 Jan 2023 05:22:05 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Sat, Jan 28, 2023 at 03:17:23PM +0800, Xuan Zhuo wrote:
> > >  In the current design, we stop the device from operating on the vring
> > >  during per-queue reset by resetting the structure VirtQueue.
> > >
> > >  But before the reset operation, when recycling some resources, we should
> > >  stop referencing new vring resources. For example, when recycling
> > >  virtio-net's asynchronous sending resources, virtio-net should be able
> > >  to perceive that the current queue is in the per-queue reset state, and
> > >  stop sending new packets from the tx queue.
> > >
> > >  Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >  hw/virtio/virtio.c         | 8 ++++++++
> > >  include/hw/virtio/virtio.h | 3 +++
> > >  2 files changed, 11 insertions(+)
> > >
> > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > index 03077b2ecf..907d5b8bde 100644
> > > --- a/hw/virtio/virtio.c
> > > +++ b/hw/virtio/virtio.c
> > > @@ -2030,6 +2030,12 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > >  {
> > >      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > >
> > > +    /*
> > > +     * Mark this queue is per-queue reset status. The device should release the
> > > +     * references of the vring, and not refer more new vring item.
> > > +     */
> > > +    vdev->vq[queue_index].reset = true;
> > > +
> > >      if (k->queue_reset) {
> > >          k->queue_reset(vdev, queue_index);
> > >      }
> > > @@ -2053,6 +2059,8 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > >      }
> > >      */
> > >
> > > +    vdev->vq[queue_index].reset = false;
> > > +
> > >      if (k->queue_enable) {
> > >          k->queue_enable(vdev, queue_index);
> > >      }
> > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > index 1c0d77c670..b888538d09 100644
> > > --- a/include/hw/virtio/virtio.h
> > > +++ b/include/hw/virtio/virtio.h
> > > @@ -251,6 +251,9 @@ struct VirtQueue {
> > >      /* Notification enabled? */
> > >      bool notification;
> > >
> > > +    /* Per-Queue Reset status */
> > > +    bool reset;
> > > +
> > >      uint16_t queue_index;
> > >
> >
> > Reset state makes no sense. It seems to imply queue_reset
> > in the spec. And for extra fun there's "reset" in the pci
> > proxy which means "virtio_queue_reset is in progress" - I have no
> > idea what uses it though - it is not guest visible.  First what is it?
> > It actually means "queue has been reset and not has not been enabled since".
> > So disabled_by_reset maybe?
> 
> 
> In fact, when reading this, the queue has not been reset,
> so prepare_for_reset?

Makes it sound like it's some kind of temporary state where
it is not - it will stay like this until enabled.
As this makes no practical difference that it is set to
early, just set it later for consistency.

> >
> > Second this hack helps make the change minimal
> > so it's helpful for stable, but it's ugly in that it
> > duplicates the reverse of enabled value - we don't really
> > care what disabled it in practice.
> >
> > With the fixups above I can apply so it's easier to backport, but later
> > a patch on top should clean it all up, perhaps by adding
> > "enabled" in VirtQueue. We should also get rid of "reset" in the proxy
> > unless there's some way it's useful which I don't currently see.
> >
> 
> I have some confusion, I don't understand what you mean.
> 
> Why did we remove the "reset" in the proxy?

We did not but we should.
Why we should remove "reset" in the proxy?
Because guest can never read it as != 0:

    case VIRTIO_PCI_COMMON_Q_RESET:
        if (val == 1) {
            proxy->vqs[vdev->queue_sel].reset = 1;

            virtio_queue_reset(vdev, vdev->queue_sel);

            proxy->vqs[vdev->queue_sel].reset = 0;
            proxy->vqs[vdev->queue_sel].enabled = 0;
        }
        break;

from guest's POV reset is atomic and so does not need
a variable to track state.


> I agree to rename the "reset".
> 
> Thanks.
> 
> >
> >
> > >      unsigned int inuse;
> > > --
> > > 2.32.0.3.g01195cf9f
> >


