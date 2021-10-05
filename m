Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2F4226EA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:39:59 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjji-0000Gy-49
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXjby-0001BJ-AS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXjbw-0007Oj-9N
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633437115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SASpVioujqbx2i6GpsWhjUe7lMzPIPi3ANU0cnew+LA=;
 b=SpSz/6aZXB1gKCgecCNGwbK72oBH5zU7mwcp/URl2tmsHW4wS3cyZVaSoJchUcg0gkW5eD
 t9t7HGusOeOGHzrOPmDHk2HysYMkSH7oZIJGnBOPTkGeteSTplqKrRqUuFB+uE517cn/MJ
 IG8uz5XNImwrWLcVrsa4+N+OGDg0jlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Ob7vW6JeOWSptvOn2Y0-5Q-1; Tue, 05 Oct 2021 08:31:54 -0400
X-MC-Unique: Ob7vW6JeOWSptvOn2Y0-5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4440456FA7;
 Tue,  5 Oct 2021 12:31:52 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C3389AA2B;
 Tue,  5 Oct 2021 12:31:52 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6D28D220BDB; Tue,  5 Oct 2021 08:31:51 -0400 (EDT)
Date: Tue, 5 Oct 2021 08:31:51 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 08/13] virtiofsd: Create a notification queue
Message-ID: <YVxFt3MFgSWOJe35@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-9-vgoyal@redhat.com>
 <YVsQDkoNPyvC/Uoo@stefanha-x1.localdomain>
 <YVtrk6/sWwoUfXs+@redhat.com>
 <YVwJVlRFUaw+W+lo@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVwJVlRFUaw+W+lo@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 09:14:14AM +0100, Stefan Hajnoczi wrote:
> On Mon, Oct 04, 2021 at 05:01:07PM -0400, Vivek Goyal wrote:
> > On Mon, Oct 04, 2021 at 03:30:38PM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Sep 30, 2021 at 11:30:32AM -0400, Vivek Goyal wrote:
> > > > Add a notification queue which will be used to send async notifications
> > > > for file lock availability.
> > > > 
> > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > > Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-user-fs-pci.c     |  4 +-
> > > >  hw/virtio/vhost-user-fs.c         | 62 +++++++++++++++++++++++++--
> > > >  include/hw/virtio/vhost-user-fs.h |  2 +
> > > >  tools/virtiofsd/fuse_i.h          |  1 +
> > > >  tools/virtiofsd/fuse_virtio.c     | 70 +++++++++++++++++++++++--------
> > > >  5 files changed, 116 insertions(+), 23 deletions(-)
> > > > 
> > > > diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> > > > index 2ed8492b3f..cdb9471088 100644
> > > > --- a/hw/virtio/vhost-user-fs-pci.c
> > > > +++ b/hw/virtio/vhost-user-fs-pci.c
> > > > @@ -41,8 +41,8 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> > > >      DeviceState *vdev = DEVICE(&dev->vdev);
> > > >  
> > > >      if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> > > > -        /* Also reserve config change and hiprio queue vectors */
> > > > -        vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
> > > > +        /* Also reserve config change, hiprio and notification queue vectors */
> > > > +        vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 3;
> > > >      }
> > > >  
> > > >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > > index d1efbc5b18..6bafcf0243 100644
> > > > --- a/hw/virtio/vhost-user-fs.c
> > > > +++ b/hw/virtio/vhost-user-fs.c
> > > > @@ -31,6 +31,7 @@ static const int user_feature_bits[] = {
> > > >      VIRTIO_F_NOTIFY_ON_EMPTY,
> > > >      VIRTIO_F_RING_PACKED,
> > > >      VIRTIO_F_IOMMU_PLATFORM,
> > > > +    VIRTIO_FS_F_NOTIFICATION,
> > > >  
> > > >      VHOST_INVALID_FEATURE_BIT
> > > >  };
> > > > @@ -147,7 +148,7 @@ static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > >       */
> > > >  }
> > > >  
> > > > -static void vuf_create_vqs(VirtIODevice *vdev)
> > > > +static void vuf_create_vqs(VirtIODevice *vdev, bool notification_vq)
> > > >  {
> > > >      VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > >      unsigned int i;
> > > > @@ -155,6 +156,15 @@ static void vuf_create_vqs(VirtIODevice *vdev)
> > > >      /* Hiprio queue */
> > > >      fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
> > > >                                       vuf_handle_output);
> > > > +    /*
> > > > +     * Notification queue. Feature negotiation happens later. So at this
> > > > +     * point of time we don't know if driver will use notification queue
> > > > +     * or not.
> > > > +     */
> > > > +    if (notification_vq) {
> > > > +        fs->notification_vq = virtio_add_queue(vdev, fs->conf.queue_size,
> > > > +                                               vuf_handle_output);
> > > > +    }
> > > >  
> > > >      /* Request queues */
> > > >      fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
> > > > @@ -163,8 +173,12 @@ static void vuf_create_vqs(VirtIODevice *vdev)
> > > >                                            vuf_handle_output);
> > > >      }
> > > >  
> > > > -    /* 1 high prio queue, plus the number configured */
> > > > -    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
> > > > +    /* 1 high prio queue, 1 notification queue plus the number configured */
> > > > +    if (notification_vq) {
> > > > +        fs->vhost_dev.nvqs = 2 + fs->conf.num_request_queues;
> > > > +    } else {
> > > > +        fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
> > > > +    }
> > > >      fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> > > >  }
> > > >  
> > > > @@ -176,6 +190,11 @@ static void vuf_cleanup_vqs(VirtIODevice *vdev)
> > > >      virtio_delete_queue(fs->hiprio_vq);
> > > >      fs->hiprio_vq = NULL;
> > > >  
> > > > +    if (fs->notification_vq) {
> > > > +        virtio_delete_queue(fs->notification_vq);
> > > > +    }
> > > > +    fs->notification_vq = NULL;
> > > > +
> > > >      for (i = 0; i < fs->conf.num_request_queues; i++) {
> > > >          virtio_delete_queue(fs->req_vqs[i]);
> > > >      }
> > > > @@ -194,9 +213,43 @@ static uint64_t vuf_get_features(VirtIODevice *vdev,
> > > >  {
> > > >      VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > >  
> > > > +    virtio_add_feature(&features, VIRTIO_FS_F_NOTIFICATION);
> > > > +
> > > >      return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
> > > >  }
> > > >  
> > > > +static void vuf_set_features(VirtIODevice *vdev, uint64_t features)
> > > > +{
> > > > +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > > +
> > > > +    if (virtio_has_feature(features, VIRTIO_FS_F_NOTIFICATION)) {
> > > > +        fs->notify_enabled = true;
> > > > +        /*
> > > > +         * If guest first booted with no notification queue support and
> > > > +         * later rebooted with kernel which supports notification, we
> > > > +         * can end up here
> > > > +         */
> > > > +        if (!fs->notification_vq) {
> > > > +            vuf_cleanup_vqs(vdev);
> > > > +            vuf_create_vqs(vdev, true);
> > > > +        }
> > > 
> > > I would simplify things by unconditionally creating the notification vq
> > > for the device and letting the vhost-user device backend decide whether
> > > it wants to handle the vq or not.
> > > If the backend doesn't implement the
> > > vq then it also won't advertise VIRTIO_FS_F_NOTIFICATION so the guest
> > > driver won't submit virtqueue buffers.
> > 
> > I think I am did not understand the idea. This code deals with that
> > both qemu and vhost-user device can deal with notification queue. But
> > driver can't deal with it. 
> > 
> > So if we first booted into a guest kernel which does not support
> > notification queue, then we will not have instantiated notification
> > queue. But later we reboot guest into a newer kernel and now it
> > has capability to deal with notification queues, so we create it
> > now.
> > 
> > IIUC, you are suggesting that somehow keep notification queue
> > instantiated even if guest driver does not support notifications, so
> > that we will not have to get into the exercise of cleaning up queues
> > and re-instantiating these?
> 
> Yes.
> 
> > But I think we can't keep notification queue around if driver does
> > not support it. Because it changes queue index. queue index 1 will
> > belong to request queue if notifications are not enabled otherwise
> > it will belong to notification queue. So If I always instantiate
> > notification queue, then guest and qemu/virtiofsd will have
> > different understanding of which queue index belongs to what
> > queue.
> 
> The meaning of the virtqueue doesn't matter. That only matters to
> virtiofsd when processing virtqueues. Since QEMU's -device
> vhost-user-fs doesn't process virtqueues there's no difference between
> hipri, request, and notification virtqueues.

Ok, I will think more about it and look at the code and see if this
is feasible. First question I have is that vhost-user device will
have to know whether driver supports notification or not so that
it can adjust its internal view of virtqueue mapping.

BTW, complexity aside, is my current implementation of reconfiguring
queues broken?

Vivek

> 
> I'm not 100% sure that the vhost-user code is set up to work smoothly in
> this fashion, but I think it should be possible to make this work and
> the end result will be simpler.
> 
> Stefan



