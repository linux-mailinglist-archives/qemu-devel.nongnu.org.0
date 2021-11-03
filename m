Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EF444990
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:32:50 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miMwD-000449-Hg
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1miMuT-0002Vc-Gd
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1miMuP-0000ZE-SP
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635971456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G75XtRhXftC1EyMbq1dg3cOgrIfbNhzzuWfPPpgq6Z0=;
 b=YW3/QnDsuzUw8+muJQH1NHhSeWMKNGajVN8Is4nM4b1jvFDwS1EgZyPzTX80cYghcbzhw6
 7cNlyrbsr79BVCeAECrVY+uOj2/sR8m5dB1vhUSUVFdelH2ZQg/yJNPO9+Si8aiuYt0FU+
 F4u+f6mglTlZUgpVym4ybAdGfTfuJxg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-fTo0zvhMPGidezeLnBchjw-1; Wed, 03 Nov 2021 16:30:55 -0400
X-MC-Unique: fTo0zvhMPGidezeLnBchjw-1
Received: by mail-ed1-f71.google.com with SMTP id
 u10-20020a50d94a000000b003dc51565894so3617569edj.21
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G75XtRhXftC1EyMbq1dg3cOgrIfbNhzzuWfPPpgq6Z0=;
 b=rnj/M5g9MVyIdn5MPYxlUHHVQEeKcEhlqiTz3jTH1GYhxv444qNS657ltKRnGn12KZ
 OF1S23j7+QqPFeDKDRbGOkwC3wVVqZJGvac1koU5OL6jgYTu0YlviH512pPhdZ6M328y
 AfdWiy7a+fnxLkpA3LIsUBOVRlkbrWK9GzY5LxnpEP5dk6zhvuywhLOjRlPimoB3imUm
 b8GYOxlYyclEop0t4pBHQoc2+I9qZZjzeWk7Ren6bpFreXsWCnJp17MBeY+GRDbc55V5
 g9YsRmTgYZtzHNffj4/IsL/JcxyKj+a8LdGfwE39SmcKbqGdnsNFmV5MCwZw9ZlFPclo
 nRSA==
X-Gm-Message-State: AOAM532+ETBN4+bdIKISnN44OuVoD4ly5s8x3BhTBDwRhPw6a11lO1BP
 0QlAEYTe3EH4scTjlGUVoZfrZqR+YXAvFT9pYvrQZaYZAff604g7vNa7+FGYXp6oTA4Ub5ogQdz
 lhdFECQFFDRBBHGg=
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr51687390eds.194.1635971453811; 
 Wed, 03 Nov 2021 13:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSZnzVf4W3+zL/Z2BnliubnNDSvZy58Q14fqdqg/Pyz+M02lr23x+isw8fJ7AJB7EKGhCc4w==
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr51687354eds.194.1635971453551; 
 Wed, 03 Nov 2021 13:30:53 -0700 (PDT)
Received: from redhat.com ([2.55.17.31])
 by smtp.gmail.com with ESMTPSA id ho17sm1596733ejc.111.2021.11.03.13.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:30:52 -0700 (PDT)
Date: Wed, 3 Nov 2021 16:30:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Xueming(Steven) Li" <xuemingl@nvidia.com>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20211103162840-mutt-send-email-mst@kernel.org>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
 <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
 <20211102024742-mutt-send-email-mst@kernel.org>
 <87c14dc604e49b2ae85e9dcf1de4e813106fad6b.camel@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <87c14dc604e49b2ae85e9dcf1de4e813106fad6b.camel@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 02:48:41PM +0000, Xueming(Steven) Li wrote:
> On Tue, 2021-11-02 at 02:49 -0400, Michael S. Tsirkin wrote:
> > On Tue, Nov 02, 2021 at 06:08:39AM +0000, Xueming(Steven) Li wrote:
> > > On Mon, 2021-11-01 at 17:06 -0400, Michael S. Tsirkin wrote:
> > > > On Mon, Nov 01, 2021 at 04:38:12PM +0800, Xueming Li wrote:
> > > > > When vhost-user vdpa client suspend, backend may close all resources,
> > > > > VQ notifier mmap address become invalid, restore MR which contains
> > > > > the invalid address is wrong. vdpa client will set VQ notifier after
> > > > > reconnect.
> > > > > 
> > > > > This patch removes VQ notifier restore and related flags to avoid reusing
> > > > > invalid address.
> > > > > 
> > > > > Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> > > > > Cc: qemu-stable@nongnu.org
> > > > > Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> > > > > Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> > > > > ---
> > > > >  hw/virtio/vhost-user.c         | 19 +------------------
> > > > >  include/hw/virtio/vhost-user.h |  1 -
> > > > >  2 files changed, 1 insertion(+), 19 deletions(-)
> > > > > 
> > > > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > > > index bf6e50223c..c671719e9b 100644
> > > > > --- a/hw/virtio/vhost-user.c
> > > > > +++ b/hw/virtio/vhost-user.c
> > > > > @@ -1143,19 +1143,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
> > > > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
> > > > >  }
> > > > >  
> > > > > -static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
> > > > > -                                             int queue_idx)
> > > > > -{
> > > > > -    struct vhost_user *u = dev->opaque;
> > > > > -    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > > > > -    VirtIODevice *vdev = dev->vdev;
> > > > > -
> > > > > -    if (n->addr && !n->set) {
> > > > > -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
> > > > > -        n->set = true;
> > > > > -    }
> > > > > -}
> > > > > -
> > > > >  static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > > > >                                              int queue_idx)
> > > > >  {
> > > > > @@ -1163,17 +1150,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > > > >      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > > > >      VirtIODevice *vdev = dev->vdev;
> > > > >  
> > > > > -    if (n->addr && n->set) {
> > > > > +    if (n->addr) {
> > > > >          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> > > > > -        n->set = false;
> > > > >      }
> > > > >  }
> > > > > 
> > > > 
> > > > So on vq stop we still remove the notifier...
> > > >   
> > > > >  static int vhost_user_set_vring_base(struct vhost_dev *dev,
> > > > >                                       struct vhost_vring_state *ring)
> > > > >  {
> > > > > -    vhost_user_host_notifier_restore(dev, ring->index);
> > > > > -
> > > > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
> > > > >  }
> > > > >  
> > > > 
> > > > but on vq start we do not reinstate it? Does this not mean that
> > > > notifiers won't work after stop then start?
> > > 
> > > 
> > > Yes, backend initially work w/o host notifier, request VM driver to
> > > install notifier if needed - call this function through slave socket.
> > 
> > I think it's cleaner if qemu handles this itself like it did before, it
> > knows vm is stopped without getting called.
> 
> If vhost play as server, there are 2 scenario that remove the notifier:
> 1. VM suspend: backend still there, it's okay to keep mmap address.
> 2. vhost backend stopped or process killed: resources from backend
> should be released. That's why patch 2/2 munmap in notifier remove
> function. Then the restore function get nothing to restore, maybe I
> shouldn't reverse patch order.

I can't say I understand what you mean here. Do you plan to change
the patchset in some way?
When you do, pls include a cover letter with a changelog and
Cc all people you include on patches on the cover letter too.

> > 
> > > > 
> > > > 
> > > > > @@ -1538,7 +1522,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> > > > >      }
> > > > >  
> > > > >      n->addr = addr;
> > > > > -    n->set = true;
> > > > >  
> > > > >      return 0;
> > > > >  }
> > > > > diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> > > > > index a9abca3288..f6012b2078 100644
> > > > > --- a/include/hw/virtio/vhost-user.h
> > > > > +++ b/include/hw/virtio/vhost-user.h
> > > > > @@ -14,7 +14,6 @@
> > > > >  typedef struct VhostUserHostNotifier {
> > > > >      MemoryRegion mr;
> > > > >      void *addr;
> > > > > -    bool set;
> > > > >  } VhostUserHostNotifier;
> > > > >  
> > > > >  typedef struct VhostUserState {
> > > > > -- 
> > > > > 2.33.0
> > > > 
> > > 
> > 
> 


