Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FBA37509E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:16:21 +0200 (CEST)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZBE-0006tZ-VY
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1leZAH-0006Ky-Ik
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1leZAE-0004mV-Jl
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620288916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWObOGfUkxui1qSvpzaabO00Ic4WR5QraTdtQctedsU=;
 b=N82OE1NWx5vxe8aOPa3W/Qz3xqhsLiQo54enR+4VNl6GgNgiwYtF6DPQOlnI5t5t+wP598
 gFAYHb9y16dvhXDR5ewtJfg/VEr8dFmrrvBdKcGbejnI2zAnfi1tahjs3jliLnHo4LHI43
 gkSf3rWrHYH2ubRbSsAGFWdtfCCaTxI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-r1_ECbpqO92qgjlYqp381g-1; Thu, 06 May 2021 04:15:14 -0400
X-MC-Unique: r1_ECbpqO92qgjlYqp381g-1
Received: by mail-wm1-f71.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso2361489wme.7
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 01:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NWObOGfUkxui1qSvpzaabO00Ic4WR5QraTdtQctedsU=;
 b=p1IUw+If4xVxnywQElsu0rK5WQiT9QLL6zB8bhFXw/YBQaaD7xtGvUHr1Vh/s6wcfG
 Al3/xBzJvXvvWzAlaiS+IpP1V/uIJ2R3zYAW+23rxO1nE15DohAuD5oQ3J0t1sAa3gg6
 wtXoP5Mgy0sITuNpNIBWXEv2jnVj4J24Bgl3vXxokPYxLEGTEU3NKfYlF24D417K4DQg
 ZStpdxIrg2D8glSqVixA7qQz2h1o3WPDrH0MSOIXHN2cmJXihPqNrfxy9g0eLM2x4YYO
 9vpFKwCzs0i7JVnjuOTF7wLLfCSKdMSRKvy1WJdZqL958oX3utJctRzALBuSCuRnavG/
 7mVw==
X-Gm-Message-State: AOAM532Q/oW8PpZyH97AB6TFqozL2DxCrnODEfdHFIaaRcdmsluFMlOW
 8QH/j6s9LFKVe/yV0uY/jkzNSRxj54svnFy2yyFP3QrbrxPeQjpLyl0MNuSSV3HqbylDYav5rZ0
 rd8YddiJGWcJ6PSM=
X-Received: by 2002:a5d:5741:: with SMTP id q1mr3543528wrw.212.1620288913768; 
 Thu, 06 May 2021 01:15:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvupa3pOcrGE38EcsH2JdhoCYZgjfUAA5Oams6WAQmCbc5roYoiIwj08k1k8Mw2wfsLXwxVw==
X-Received: by 2002:a5d:5741:: with SMTP id q1mr3543502wrw.212.1620288913569; 
 Thu, 06 May 2021 01:15:13 -0700 (PDT)
Received: from redhat.com ([2a10:8004:640e:0:d1db:1802:5043:7b85])
 by smtp.gmail.com with ESMTPSA id k6sm8635038wmi.42.2021.05.06.01.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 01:15:13 -0700 (PDT)
Date: Thu, 6 May 2021 04:15:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 2/4] virtio-blk: Configure all host notifiers in a
 single MR transaction
Message-ID: <20210506041437-mutt-send-email-mst@kernel.org>
References: <20210407143501.244343-1-groug@kaod.org>
 <20210407143501.244343-3-groug@kaod.org>
 <YJJv/5jWOwEu92C/@stefanha-x1.localdomain>
 <20210505131551.011f5516@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210505131551.011f5516@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 01:15:51PM +0200, Greg Kurz wrote:
> On Wed, 5 May 2021 11:14:23 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > On Wed, Apr 07, 2021 at 04:34:59PM +0200, Greg Kurz wrote:
> > > This allows the virtio-blk-pci device to batch the setup of all its
> > > host notifiers. This significantly improves boot time of VMs with a
> > > high number of vCPUs, e.g. from 3m26.186s down to 0m58.023s for a
> > > pseries machine with 384 vCPUs.
> > > 
> > > Note that memory_region_transaction_commit() must be called before
> > > virtio_bus_cleanup_host_notifier() because the latter might close
> > > ioeventfds that the transaction still assumes to be around when it
> > > commits.
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  hw/block/dataplane/virtio-blk.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> > > index d7b5c95d26d9..cd81893d1d01 100644
> > > --- a/hw/block/dataplane/virtio-blk.c
> > > +++ b/hw/block/dataplane/virtio-blk.c
> > > @@ -198,19 +198,30 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
> > >          goto fail_guest_notifiers;
> > >      }
> > >  
> > > +    memory_region_transaction_begin();
> > 
> > This call is optional and an optimization. It would be nice to have a
> > comment here explaining that - otherwise people may wonder why this is
> > necessary.
> > 
> 
> Indeed. Same goes for patch 4 actually.
> 
> Michael,
> 
> Should I re-post an updated version of this series or can the
> comments be added in a followup ?


An updated version is better. Stefan did not ack anyway.

> > > +
> > >      /* Set up virtqueue notify */
> > >      for (i = 0; i < nvqs; i++) {
> > >          r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, true);
> > >          if (r != 0) {
> > > +            int j = i;
> > > +
> > >              fprintf(stderr, "virtio-blk failed to set host notifier (%d)\n", r);
> > >              while (i--) {
> > >                  virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
> > > +            }
> > > +
> > > +            memory_region_transaction_commit();
> > > +
> > > +            while (j--) {
> > >                  virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
> > >              }
> > >              goto fail_host_notifiers;
> > >          }
> > >      }
> > >  
> > > +    memory_region_transaction_commit();
> > > +
> > >      s->starting = false;
> > >      vblk->dataplane_started = true;
> > >      trace_virtio_blk_data_plane_start(s);
> > > @@ -246,8 +257,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
> > >      return 0;
> > >  
> > >    fail_aio_context:
> > > +    memory_region_transaction_begin();
> > 
> > Probably unnecessary since this is an error code path. We don't need to
> > optimize it.
> > 
> > Doesn't hurt though.
> 
> True. I can drop this if I repost.



