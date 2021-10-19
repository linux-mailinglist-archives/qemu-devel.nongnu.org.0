Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B3432F63
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:28:06 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjXZ-00030d-4S
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcjUe-0000AA-W2
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcjUd-0003xs-6p
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634628302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aDA8bZNV3WQktUgGeIlAt9BAzUHtqucpIRpbNIINoNQ=;
 b=GmdnN60InIv0dEvc5gxcdMC9uz/sZT7eJFvejPvz3MnR4exz2X8U5su+2DKmy0Knvm97cI
 sS7684w7Gxsff4WxIVZzets7hJikugwPPEq4DoEWDqgG5A1SnkuytRAWEo5A3v0rRRveG3
 hhm6oX8WendwLi2PKC3v0FrotUuIsIY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-SKYX1_xpPw69LaKyHNzzoQ-1; Tue, 19 Oct 2021 03:25:01 -0400
X-MC-Unique: SKYX1_xpPw69LaKyHNzzoQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso9731622wrb.23
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aDA8bZNV3WQktUgGeIlAt9BAzUHtqucpIRpbNIINoNQ=;
 b=4fhL9WrANxHzSuqMo36bcgQvY9wNvih9KunN8EPAY9OAyK0HS9Ap/vAMPrQ2OCNGMH
 klhzHwouKpExFyLYcd6wM+OEf90fBovPRaxs/Uf+DsQxS/EPiVfyyv6HJVddJZnHie8l
 Llp3yZ4RW2lkJEly6fl3Rmmv9bFAcBKsRGDUrxa209nXKfTvwzXtNfnTc+k/zo5fzwp1
 +kWNy7H+D79kKICPJAVAOr0ARIoWpCITM/BFhHYE0D4GofzENennJG+WsAmOc9GgqiRh
 GNzLe61UtxYT9yGR3y4lUgHtZi8eiwyRnfSNMUqO8O54Vz/ogbfJnryEVHVpGAjTvGJp
 o6TQ==
X-Gm-Message-State: AOAM5302WWTWTJMNEtAseE3kiUi0QCcRY97+iE8r5pttyYoHGoshOXOh
 MBuBtcYB07XpAxYhtxp/t3e85sarwXgBjuNk5NBpW88MZacqwXHFJoU6bAq/S9q8od5bKjWAC51
 4au4ni/AVegcZRoc=
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr42820886wry.87.1634628299911; 
 Tue, 19 Oct 2021 00:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY6AVEBrmLNz0NkB+3YR5AufamlZMxHXQhLQgQJfiHdJygWiV5Ph9e6sxSjAwL+kphOlfsXg==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr42820867wry.87.1634628299714; 
 Tue, 19 Oct 2021 00:24:59 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l24sm1450636wmi.3.2021.10.19.00.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:24:59 -0700 (PDT)
Date: Tue, 19 Oct 2021 03:24:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Xueming(Steven) Li" <xuemingl@nvidia.com>
Subject: Re: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20211019032437-mutt-send-email-mst@kernel.org>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-3-xuemingl@nvidia.com>
 <20211019022100-mutt-send-email-mst@kernel.org>
 <1e58a3d2b8cfd9b802e5e9422598a9217f306ee9.camel@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1e58a3d2b8cfd9b802e5e9422598a9217f306ee9.camel@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 07:21:24AM +0000, Xueming(Steven) Li wrote:
> On Tue, 2021-10-19 at 02:37 -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 08, 2021 at 03:58:05PM +0800, Xueming Li wrote:
> > > When vhost-user vdpa client restart, VQ notifier resources become
> > > invalid, no need to keep mmap, vdpa client will set VQ notifier after
> > > reconnect.
> > > 
> > > Removes VQ notifier restore and related flags.
> > > 
> > > Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> > > Cc: tiwei.bie@intel.com
> > > Cc: qemu-stable@nongnu.org
> > > Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> > > Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> > 
> > Pls fix up bisect and repost.
> > Also, can you please clarify what does "no need" mean?
> 
> mmap becomes invalid, need to unmap it.


confused even more. pls include explanation in commit log.

> > You include a Fixes tag but is there a bug? What behaviour
> > are you trying to fix? A resource leak?
> > Or are you just simplifying code?
> > If the later then no need for a Fixes tag.
> 
> Yes, just simplifying code, will remove it.
> 
> > 
> > 
> > 
> > 
> > > ---
> > >  hw/virtio/vhost-user.c         | 20 ++------------------
> > >  include/hw/virtio/vhost-user.h |  1 -
> > >  2 files changed, 2 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > index b2e948bdc7..d127aa478a 100644
> > > --- a/hw/virtio/vhost-user.c
> > > +++ b/hw/virtio/vhost-user.c
> > > @@ -22,6 +22,7 @@
> > >  #include "qemu/main-loop.h"
> > >  #include "qemu/sockets.h"
> > >  #include "sysemu/cryptodev.h"
> > > +#include "sysemu/cpus.h"
> > >  #include "migration/migration.h"
> > >  #include "migration/postcopy-ram.h"
> > >  #include "trace.h"
> > > @@ -1143,19 +1144,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
> > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
> > >  }
> > >  
> > > -static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
> > > -                                             int queue_idx)
> > > -{
> > > -    struct vhost_user *u = dev->opaque;
> > > -    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > > -    VirtIODevice *vdev = dev->vdev;
> > > -
> > > -    if (n->addr && !n->set) {
> > > -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
> > > -        n->set = true;
> > > -    }
> > > -}
> > > -
> > >  static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > >                                              int queue_idx)
> > >  {
> > > @@ -1163,7 +1151,7 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > >      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > >      VirtIODevice *vdev = dev->vdev;
> > >  
> > > -    if (n->addr && n->set) {
> > > +    if (n->addr) {
> > >          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> > >          if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
> > >              /* Wait for VM threads accessing old flatview which contains notifier. */
> > > @@ -1171,15 +1159,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > >          }
> > >          munmap(n->addr, qemu_real_host_page_size);
> > >          n->addr = NULL;
> > > -        n->set = false;
> > >      }
> > >  }
> > >  
> > >  static int vhost_user_set_vring_base(struct vhost_dev *dev,
> > >                                       struct vhost_vring_state *ring)
> > >  {
> > > -    vhost_user_host_notifier_restore(dev, ring->index);
> > > -
> > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
> > >  }
> > >  
> > > @@ -1539,7 +1524,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> > >      }
> > >  
> > >      n->addr = addr;
> > > -    n->set = true;
> > >  
> > >      return 0;
> > >  }
> > > diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> > > index a9abca3288..f6012b2078 100644
> > > --- a/include/hw/virtio/vhost-user.h
> > > +++ b/include/hw/virtio/vhost-user.h
> > > @@ -14,7 +14,6 @@
> > >  typedef struct VhostUserHostNotifier {
> > >      MemoryRegion mr;
> > >      void *addr;
> > > -    bool set;
> > >  } VhostUserHostNotifier;
> > >  
> > >  typedef struct VhostUserState {
> > > -- 
> > > 2.33.0
> > 
> 


