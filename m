Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2494367165
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 19:33:57 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZGjc-0002DJ-Ps
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 13:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZGhf-0001Oa-8b
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZGhd-00026g-AB
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619026311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pnco1Ou8JbUniCF9MrcEO49EYc3wdHKRwibGO/cCX8o=;
 b=NBM6W2qs2h/1fIs0zJmnchFREUeGBBIwY25YJcpu3vGSKb62x5OB4mbQ4aeGC9shQf2CHk
 2hPnGa3HgC8H2sO5gCX9qj+SOuzgBzjeCloxDO33EVqqsiMJ0As1Tyd0WCbjh/t8H1uuG1
 mB1DuukcbTY2wH0uNQlEhGEi88YnDno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-n2QjkFDBMjWpdiXQpaJWAA-1; Wed, 21 Apr 2021 13:31:39 -0400
X-MC-Unique: n2QjkFDBMjWpdiXQpaJWAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E136B107ACC7;
 Wed, 21 Apr 2021 17:31:38 +0000 (UTC)
Received: from work-vm (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30DA160939;
 Wed, 21 Apr 2021 17:31:20 +0000 (UTC)
Date: Wed, 21 Apr 2021 18:31:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH v2 01/25] DAX: vhost-user: Rework slave
 return values
Message-ID: <YIBhZcVtk83wAn3+@work-vm>
References: <20210414155137.46522-1-dgilbert@redhat.com>
 <20210414155137.46522-2-dgilbert@redhat.com>
 <20210416125917.02c4e915@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210416125917.02c4e915@bahia.lan>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Wed, 14 Apr 2021 16:51:13 +0100
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > All the current slave handlers on the qemu side generate an 'int'
> > return value that's squashed down to a bool (!!ret) and stuffed into
> > a uint64_t (field of a union) to be returned.
> > 
> > Move the uint64_t type back up through the individual handlers so
> > that we can make one actually return a full uint64_t.
> > 
> > Note that the definition in the interop spec says most of these
> > cases are defined as returning 0 on success and non-0 for failure,
> > so it's OK to change from a bool to another non-0.
> > 
> > Vivek:
> > This is needed because upcoming patches in series will add new functions
> > which want to return full error code. Existing functions continue to
> > return true/false so, it should not lead to change of behavior for
> > existing users.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> 
> LGTM
> 
> Just an indentation nit...
> 
> >  hw/virtio/vhost-backend.c         |  6 +++---
> >  hw/virtio/vhost-user.c            | 31 ++++++++++++++++---------------
> >  include/hw/virtio/vhost-backend.h |  2 +-
> >  3 files changed, 20 insertions(+), 19 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > index 31b33bde37..1686c94767 100644
> > --- a/hw/virtio/vhost-backend.c
> > +++ b/hw/virtio/vhost-backend.c
> > @@ -401,8 +401,8 @@ int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
> >      return -ENODEV;
> >  }
> >  
> > -int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > -                                          struct vhost_iotlb_msg *imsg)
> > +uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > +                                        struct vhost_iotlb_msg *imsg)
> >  {
> >      int ret = 0;
> >  
> > @@ -429,5 +429,5 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> >          break;
> >      }
> >  
> > -    return ret;
> > +    return !!ret;
> >  }
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index ded0c10453..3e4a25e108 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -1405,24 +1405,25 @@ static int vhost_user_reset_device(struct vhost_dev *dev)
> >      return 0;
> >  }
> >  
> > -static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
> > +static uint64_t vhost_user_slave_handle_config_change(struct vhost_dev *dev)
> >  {
> >      int ret = -1;
> >  
> >      if (!dev->config_ops) {
> > -        return -1;
> > +        return true;
> >      }
> >  
> >      if (dev->config_ops->vhost_dev_config_notifier) {
> >          ret = dev->config_ops->vhost_dev_config_notifier(dev);
> >      }
> >  
> > -    return ret;
> > +    return !!ret;
> >  }
> >  
> > -static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> > -                                                       VhostUserVringArea *area,
> > -                                                       int fd)
> > +static uint64_t vhost_user_slave_handle_vring_host_notifier(
> > +                struct vhost_dev *dev,
> > +               VhostUserVringArea *area,
> > +               int fd)
> 
> ... here.

I've reworked that to:
+static uint64_t vhost_user_slave_handle_vring_host_notifier(
+                    struct vhost_dev *dev,
+                    VhostUserVringArea *area,
+                    int fd)

the function name is getting too hideously long to actually put the
arguments in line with the bracket.

> Anyway,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks.

Dave

> 
> >  {
> >      int queue_idx = area->u64 & VHOST_USER_VRING_IDX_MASK;
> >      size_t page_size = qemu_real_host_page_size;
> > @@ -1436,7 +1437,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> >      if (!virtio_has_feature(dev->protocol_features,
> >                              VHOST_USER_PROTOCOL_F_HOST_NOTIFIER) ||
> >          vdev == NULL || queue_idx >= virtio_get_num_queues(vdev)) {
> > -        return -1;
> > +        return true;
> >      }
> >  
> >      n = &user->notifier[queue_idx];
> > @@ -1449,18 +1450,18 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> >      }
> >  
> >      if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
> > -        return 0;
> > +        return false;
> >      }
> >  
> >      /* Sanity check. */
> >      if (area->size != page_size) {
> > -        return -1;
> > +        return true;
> >      }
> >  
> >      addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED,
> >                  fd, area->offset);
> >      if (addr == MAP_FAILED) {
> > -        return -1;
> > +        return true;
> >      }
> >  
> >      name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
> > @@ -1471,13 +1472,13 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> >  
> >      if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
> >          munmap(addr, page_size);
> > -        return -1;
> > +        return true;
> >      }
> >  
> >      n->addr = addr;
> >      n->set = true;
> >  
> > -    return 0;
> > +    return false;
> >  }
> >  
> >  static void close_slave_channel(struct vhost_user *u)
> > @@ -1498,7 +1499,7 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
> >      VhostUserPayload payload = { 0, };
> >      Error *local_err = NULL;
> >      gboolean rc = G_SOURCE_CONTINUE;
> > -    int ret = 0;
> > +    uint64_t ret = 0;
> >      struct iovec iov;
> >      g_autofree int *fd = NULL;
> >      size_t fdsize = 0;
> > @@ -1539,7 +1540,7 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
> >          break;
> >      default:
> >          error_report("Received unexpected msg type: %d.", hdr.request);
> > -        ret = -EINVAL;
> > +        ret = true;
> >      }
> >  
> >      /*
> > @@ -1553,7 +1554,7 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
> >          hdr.flags &= ~VHOST_USER_NEED_REPLY_MASK;
> >          hdr.flags |= VHOST_USER_REPLY_MASK;
> >  
> > -        payload.u64 = !!ret;
> > +        payload.u64 = ret;
> >          hdr.size = sizeof(payload.u64);
> >  
> >          iovec[0].iov_base = &hdr;
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> > index 8a6f8e2a7a..64ac6b6444 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -186,7 +186,7 @@ int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> >  int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
> >                                                   uint64_t iova, uint64_t len);
> >  
> > -int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > +uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> >                                            struct vhost_iotlb_msg *imsg);
> >  
> >  int vhost_user_gpu_set_socket(struct vhost_dev *dev, int fd);
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


