Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE77432EDC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:04:00 +0200 (CEST)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjAE-0000bj-17
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcj4C-00023o-GV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcj4A-00029j-5A
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634626661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHby0sdQY6z1gQFtLJJUYEUATtI3tIOfsAAHNxeZhD4=;
 b=HQEEf7qpXZDy5oIhnN9sW18vs/qSjZDV77dsZD40BASF1vFQC39RkiR+Fgv1CnMcKvehvw
 iE1iaweqqdzTfov0QcMaNq5vUk+/gbXmLnY2A/qzBKX8wRbAVJv9nIGsq7d8Zy+WZKWEGE
 GaZje85SIGHPywJ4axF78W4rGLDm4lM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-F0gEeIhkOceOzeVrApJ9cw-1; Tue, 19 Oct 2021 02:57:40 -0400
X-MC-Unique: F0gEeIhkOceOzeVrApJ9cw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso9712443wrg.16
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YHby0sdQY6z1gQFtLJJUYEUATtI3tIOfsAAHNxeZhD4=;
 b=WP047lAaqA/zWxGiVE0kbwvQOyiWnD5AvWJAnbkN4EAUtTTByEnseFSF0leTqO/Klq
 GcGpO/dtNPxabXw8DSu8gjg2GpaCJYMP3pJ57Kpkpv+uzRzSoYtfe5LgU/1tOiRhTv06
 80hXLn+gL8K14p7lQNz8Y926LFIiNS5hnTTCyBMEGzRoRkyiXFCXy5B9XX1NUA+QoD6A
 KiMh1UIdcXbDMLfBsn79r/+pjjFy/ZcGbUz8uZmuMRZxWBnhaeLECik/0SYZAHI85nNz
 +/4BGYob3Pu7KOYOEX45S/FbYVEB83sFEm1/4ilpojkja0XYAQn7m5aDyLSoo0NQ6Nsd
 w0Pg==
X-Gm-Message-State: AOAM533jzfYQDTAlqAHOz1H5WsyFinoo7ZX5nTRCYyOXraCF4TaC4Pa/
 aY0Lri/xaIAR9Diq5ph5t71hNFTpxLBsLPEdfHRTVdRY4IaNSwi21wbLzH5TkUug0io+ZGisNUy
 eQ16bDXsfA8PGPRY=
X-Received: by 2002:adf:a347:: with SMTP id d7mr43206784wrb.139.1634626659160; 
 Mon, 18 Oct 2021 23:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPcKN+k9WB1r/il4sWCLc1uhDlw7LOqPWoFiKlnHFgz6OmD0m/37xiRGcx6EOlTJA4iPFmeQ==
X-Received: by 2002:adf:a347:: with SMTP id d7mr43206777wrb.139.1634626659008; 
 Mon, 18 Oct 2021 23:57:39 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id f184sm1382288wmf.22.2021.10.18.23.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:57:38 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:57:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Xueming(Steven) Li" <xuemingl@nvidia.com>
Subject: Re: [PATCH v3 1/2] vhost-user: fix VirtQ notifier cleanup
Message-ID: <20211019025722-mutt-send-email-mst@kernel.org>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-2-xuemingl@nvidia.com>
 <20211019021457-mutt-send-email-mst@kernel.org>
 <4a1739ac3cdb895e41f7554865d5e1df4d70658c.camel@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <4a1739ac3cdb895e41f7554865d5e1df4d70658c.camel@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 06:45:19AM +0000, Xueming(Steven) Li wrote:
> On Tue, 2021-10-19 at 02:15 -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 08, 2021 at 03:58:04PM +0800, Xueming Li wrote:
> > > When vhost-user device cleanup and unmmap notifier address, VM cpu
> > > thread that writing the notifier failed with accessing invalid address.
> > > 
> > > To avoid this concurrent issue, wait memory flatview update by draining
> > > rcu callbacks, then unmap notifiers.
> > > 
> > > Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> > > Cc: tiwei.bie@intel.com
> > > Cc: qemu-stable@nongnu.org
> > > Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> > > Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> > > ---
> > >  hw/virtio/vhost-user.c | 21 ++++++++++++++-------
> > >  1 file changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > index bf6e50223c..b2e948bdc7 100644
> > > --- a/hw/virtio/vhost-user.c
> > > +++ b/hw/virtio/vhost-user.c
> > > @@ -1165,6 +1165,12 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > >  
> > >      if (n->addr && n->set) {
> > >          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> > > +        if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
> > > +            /* Wait for VM threads accessing old flatview which contains notifier. */
> > > +            drain_call_rcu();
> > > +        }
> > > +        munmap(n->addr, qemu_real_host_page_size);
> > > +        n->addr = NULL;
> > >          n->set = false;
> > >      }
> > >  }
> > 
> > 
> > ../hw/virtio/vhost-user.c: In function ‘vhost_user_host_notifier_remove’:
> > ../hw/virtio/vhost-user.c:1168:14: error: implicit declaration of function ‘qemu_in_vcpu_thread’ [-Werror=implicit-function-declaration]
> >  1168 |         if (!qemu_in_vcpu_thread()) { /* Avoid vCPU dead lock. */
> >       |              ^~~~~~~~~~~~~~~~~~~
> > ../hw/virtio/vhost-user.c:1168:14: error: nested extern declaration of ‘qemu_in_vcpu_thread’ [-Werror=nested-externs]
> > cc1: all warnings being treated as errors
> > ninja: build stopped: subcommand failed.
> > make[1]: *** [Makefile:162: run-ninja] Error 1
> > make[1]: Leaving directory '/scm/qemu/build'
> > make: *** [GNUmakefile:11: all] Error 2
> > 
> > 
> > Although the following patch fixes it, bisect is broken.
> 
> Yes, really an issue, v4 posted, thanks!

Pls address the comment on 2/2 too.

> > 
> > 
> > > @@ -1502,12 +1508,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> > >  
> > >      n = &user->notifier[queue_idx];
> > >  
> > > -    if (n->addr) {
> > > -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> > > -        object_unparent(OBJECT(&n->mr));
> > > -        munmap(n->addr, page_size);
> > > -        n->addr = NULL;
> > > -    }
> > > +    vhost_user_host_notifier_remove(dev, queue_idx);
> > >  
> > >      if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
> > >          return 0;
> > > @@ -2485,11 +2486,17 @@ void vhost_user_cleanup(VhostUserState *user)
> > >      for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> > >          if (user->notifier[i].addr) {
> > >              object_unparent(OBJECT(&user->notifier[i].mr));
> > > +        }
> > > +    }
> > > +    memory_region_transaction_commit();
> > > +    /* Wait for VM threads accessing old flatview which contains notifier. */
> > > +    drain_call_rcu();
> > > +    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> > > +        if (user->notifier[i].addr) {
> > >              munmap(user->notifier[i].addr, qemu_real_host_page_size);
> > >              user->notifier[i].addr = NULL;
> > >          }
> > >      }
> > > -    memory_region_transaction_commit();
> > >      user->chr = NULL;
> > >  }
> > >  
> > > -- 
> > > 2.33.0
> > 
> 


