Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6434A9967
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:33:57 +0100 (CET)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxml-0001IP-Ot
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:33:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFxfF-0002YE-Rs
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFxf9-00032U-L1
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643977563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fd5uEldKv+fpXgXUuEIma8udoZMAbLJJdTXm++Dgj0o=;
 b=RpnKc9ESLX3pT7zWofYmTZofJ9Q9b9zREOW9s+3jsIq9PM0zg9FDIJNRZj1fSnXktl9E6H
 7Y2UuNQZSbFB1kAyOuqTtVSEJxuy1UgGW925Xo1bLFWTGLeTBuojjSJdGsdZadbsXvvPrT
 eK6o22tPLjFPlVY3BHAKAzw5W8JH7Fw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-pp5lb492N_-3VHghKdZ0hw-1; Fri, 04 Feb 2022 07:26:02 -0500
X-MC-Unique: pp5lb492N_-3VHghKdZ0hw-1
Received: by mail-wr1-f72.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so1958577wrd.22
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fd5uEldKv+fpXgXUuEIma8udoZMAbLJJdTXm++Dgj0o=;
 b=0O0cwGnvOUM+gMeCSVVcrmBagZPNhMyaMJzKm6wv9z9kcurFhl4AQNAhDCsostE5nf
 EJkBQAFg9/cTsaVK/AA3m1rm+OtoaOfDe9W9kAtos93LxIppPt28y0OyZ2nTHDb1wwxE
 1x9fA4AgUT1XBqvWOit/tm2Xo9gbT2LYxHcmc1fa9AHup+mjyHG9dJmTjyNjFaF2jjto
 d9v8mPL7fA38yWQhzikW+fHnEynLC3GYFl2Fp5Rx8tjYpYTnbNa/Llx1Dyni8ohz0TiV
 rxzz7O/hlQnVJte97xOoM8MqRCTEEX/vpJEz3DqawKU0pXHWPjroFGzflgRebGxjqU6C
 HfmA==
X-Gm-Message-State: AOAM530QTgHADWs41cOCEkOKpxsudGa3P63WSJy3CBUiVpOaZ2O3gJte
 NpVckw6n106WdKp0Xb94loLMJn70N7K0fPVs1+dfWGgu4ENT7jUTRFzGh7X5qEw9alPDzD3lbxj
 LB1SSo5cJqYCdgvs=
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr2375973wrn.498.1643977560943; 
 Fri, 04 Feb 2022 04:26:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2mO3GfLPOvnixCveVg/nuIE8oh3uob2fX3auKt1KcHHiBOHn76CTc2KPp9/N68GT8grWQAA==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr2375956wrn.498.1643977560736; 
 Fri, 04 Feb 2022 04:26:00 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id g9sm1958019wri.95.2022.02.04.04.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:26:00 -0800 (PST)
Date: Fri, 4 Feb 2022 07:25:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Xueming(Steven) Li" <xuemingl@nvidia.com>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20220204072503-mutt-send-email-mst@kernel.org>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
 <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
 <20211102024742-mutt-send-email-mst@kernel.org>
 <87c14dc604e49b2ae85e9dcf1de4e813106fad6b.camel@nvidia.com>
 <20211103162840-mutt-send-email-mst@kernel.org>
 <84ad13760fbd1857b91e49ee6af5a8b516c35b15.camel@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <84ad13760fbd1857b91e49ee6af5a8b516c35b15.camel@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I dropped this for now as I'm a bit lost with this patchset.
Cc Raphael maybe he'll understand it better.

On Wed, Jan 12, 2022 at 03:05:15PM +0000, Xueming(Steven) Li wrote:
> On Wed, 2021-11-03 at 16:30 -0400, Michael S. Tsirkin wrote:
> > On Wed, Nov 03, 2021 at 02:48:41PM +0000, Xueming(Steven) Li wrote:
> > > On Tue, 2021-11-02 at 02:49 -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Nov 02, 2021 at 06:08:39AM +0000, Xueming(Steven) Li wrote:
> > > > > On Mon, 2021-11-01 at 17:06 -0400, Michael S. Tsirkin wrote:
> > > > > > On Mon, Nov 01, 2021 at 04:38:12PM +0800, Xueming Li wrote:
> > > > > > > When vhost-user vdpa client suspend, backend may close all resources,
> > > > > > > VQ notifier mmap address become invalid, restore MR which contains
> > > > > > > the invalid address is wrong. vdpa client will set VQ notifier after
> > > > > > > reconnect.
> > > > > > > 
> > > > > > > This patch removes VQ notifier restore and related flags to avoid reusing
> > > > > > > invalid address.
> > > > > > > 
> > > > > > > Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> > > > > > > Cc: qemu-stable@nongnu.org
> > > > > > > Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> > > > > > > Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> > > > > > > ---
> > > > > > >  hw/virtio/vhost-user.c         | 19 +------------------
> > > > > > >  include/hw/virtio/vhost-user.h |  1 -
> > > > > > >  2 files changed, 1 insertion(+), 19 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > > > > > index bf6e50223c..c671719e9b 100644
> > > > > > > --- a/hw/virtio/vhost-user.c
> > > > > > > +++ b/hw/virtio/vhost-user.c
> > > > > > > @@ -1143,19 +1143,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
> > > > > > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
> > > > > > >  }
> > > > > > >  
> > > > > > > -static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
> > > > > > > -                                             int queue_idx)
> > > > > > > -{
> > > > > > > -    struct vhost_user *u = dev->opaque;
> > > > > > > -    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > > > > > > -    VirtIODevice *vdev = dev->vdev;
> > > > > > > -
> > > > > > > -    if (n->addr && !n->set) {
> > > > > > > -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
> > > > > > > -        n->set = true;
> > > > > > > -    }
> > > > > > > -}
> > > > > > > -
> > > > > > >  static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > > > > > >                                              int queue_idx)
> > > > > > >  {
> > > > > > > @@ -1163,17 +1150,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > > > > > >      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > > > > > >      VirtIODevice *vdev = dev->vdev;
> > > > > > >  
> > > > > > > -    if (n->addr && n->set) {
> > > > > > > +    if (n->addr) {
> > > > > > >          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> > > > > > > -        n->set = false;
> > > > > > >      }
> > > > > > >  }
> > > > > > > 
> > > > > > 
> > > > > > So on vq stop we still remove the notifier...
> > > > > >   
> > > > > > >  static int vhost_user_set_vring_base(struct vhost_dev *dev,
> > > > > > >                                       struct vhost_vring_state *ring)
> > > > > > >  {
> > > > > > > -    vhost_user_host_notifier_restore(dev, ring->index);
> > > > > > > -
> > > > > > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
> > > > > > >  }
> > > > > > >  
> > > > > > 
> > > > > > but on vq start we do not reinstate it? Does this not mean that
> > > > > > notifiers won't work after stop then start?
> > > > > 
> > > > > 
> > > > > Yes, backend initially work w/o host notifier, request VM driver to
> > > > > install notifier if needed - call this function through slave socket.
> > > > 
> > > > I think it's cleaner if qemu handles this itself like it did before, it
> > > > knows vm is stopped without getting called.
> > > 
> > > If vhost play as server, there are 2 scenario that remove the notifier:
> > > 1. VM suspend: backend still there, it's okay to keep mmap address.
> > > 2. vhost backend stopped or process killed: resources from backend
> > > should be released. That's why patch 2/2 munmap in notifier remove
> > > function. Then the restore function get nothing to restore, maybe I
> > > shouldn't reverse patch order.
> > 
> > I can't say I understand what you mean here. Do you plan to change
> > the patchset in some way?
> > When you do, pls include a cover letter with a changelog and
> > Cc all people you include on patches on the cover letter too. 
> 
> Here is the detail of the problem I encountered, my vhost backend is
> DPDK vdpa user space application. Notifier address is set when vdpa ask
> qemu to mmap a FD and an offset from vdpa, see function
> vhost_user_slave_handle_vring_host_notifier(). If the vdpa application
> restart of get killed for some reason,
> vhost_user_host_notifier_remove() is called and notifier MR is
> uninstalled, the notifier address that retrieved from mmap is
> referencing to an invalid FD, not released. This will cause HW
> resources on kernel side still referenced, most important, when vdpa
> connection restored, this invalid notifier will be be restored as
> notifier MR.
> 
> To resolve it, have to remove the notifer restore mechanism, vDPA
> application will issue client socket request again to install notifier
> to VM, so no concern that the notifier will be lost after resume.
> 
> Since vdpa might be killed, no chance to notify qemu to remove
> notifier. An alternative solution is to detect sock disconnection and
> unmmap notifier, but it looks more complex to me. How do you think?
> 
> 
> > 
> > > > 
> > > > > > 
> > > > > > 
> > > > > > > @@ -1538,7 +1522,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> > > > > > >      }
> > > > > > >  
> > > > > > >      n->addr = addr;
> > > > > > > -    n->set = true;
> > > > > > >  
> > > > > > >      return 0;
> > > > > > >  }
> > > > > > > diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> > > > > > > index a9abca3288..f6012b2078 100644
> > > > > > > --- a/include/hw/virtio/vhost-user.h
> > > > > > > +++ b/include/hw/virtio/vhost-user.h
> > > > > > > @@ -14,7 +14,6 @@
> > > > > > >  typedef struct VhostUserHostNotifier {
> > > > > > >      MemoryRegion mr;
> > > > > > >      void *addr;
> > > > > > > -    bool set;
> > > > > > >  } VhostUserHostNotifier;
> > > > > > >  
> > > > > > >  typedef struct VhostUserState {
> > > > > > > -- 
> > > > > > > 2.33.0
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> 


