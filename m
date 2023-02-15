Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E469869C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:54:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOmy-0005TY-8J; Wed, 15 Feb 2023 15:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSOmw-0005OL-H3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:54:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSOmu-0002bu-CX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676494439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5D5m0sJSvNJ0qca/D0XUxrbQEf5E96FxWey45o/29V8=;
 b=SslLfwsxySUq7akppvACv6X6UQJZqIwsGNmnUkoTfdpgzplC9prnufFKGRQt/FOwpIqoNS
 2sQqIW5nmehk8D09Z8o60RYZnxzbD9orddJ0udj5nwcbmuwH52pGbplJzFiyasNFj1EsqW
 qbtHczJjr9V12b+zqhGSC5fw2u5LPDw=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-c0b1WYRHMh2QacPYheOYWA-1; Wed, 15 Feb 2023 15:53:58 -0500
X-MC-Unique: c0b1WYRHMh2QacPYheOYWA-1
Received: by mail-io1-f72.google.com with SMTP id
 g6-20020a6b7606000000b007297c4996c7so12729488iom.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5D5m0sJSvNJ0qca/D0XUxrbQEf5E96FxWey45o/29V8=;
 b=SRn7gnHTDAe7aCY0JiMO+LCcHeetKDSVh0fBH/rd4TleImMOMZs6tYRe89Qw9DzzY1
 ng6rBovRbv4d32JqEq/2LXbZUB7FVIHYn1igbGNdgisQmpqwhjsijEe+zjMWvIT0Y0Sx
 tlxHp5cbWHN3bZyMvFzmn2wyOL4Pb2FHzZYKrhdL3ZbG7+gIqxvVPre/KGsTEzs6Pi5W
 1CMqhINun9G4APAV/zWCOWJFCMY4JcQaq0ir9ipFoiKxGBpZ36a2W+s3wAEFJoO1Wq3Q
 JPFB9AmMtpbj7MN/ogauki9+vvglINQf6QP2Yxs5SAAz21Pf5D3TcFJ0+AnNPhlDNVxa
 wqhw==
X-Gm-Message-State: AO0yUKVe5aqd0tWqMvtkTIJGFJd+/YXgSD//KU3Uz2up5alFARqGR8YL
 Grvr80f5P+IbmsyUPPokJUtnMgymFglYbEsPWvgO0XO7wYV9YDYxuCl119CiUSD96B3twdPUz+c
 qsee88j+4vREy+04=
X-Received: by 2002:a5d:9284:0:b0:721:90c5:7d0e with SMTP id
 s4-20020a5d9284000000b0072190c57d0emr2863478iom.9.1676494437925; 
 Wed, 15 Feb 2023 12:53:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9qHggmv3WubmH1+PwnvmK8pVMf79GL3AgTXQWJJFpdEEUx23lM5pbGE9C7bLCcFeD0ib6qpw==
X-Received: by 2002:a5d:9284:0:b0:721:90c5:7d0e with SMTP id
 s4-20020a5d9284000000b0072190c57d0emr2863463iom.9.1676494437635; 
 Wed, 15 Feb 2023 12:53:57 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t5-20020a028785000000b003acfdc75a53sm6115403jai.48.2023.02.15.12.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:53:57 -0800 (PST)
Date: Wed, 15 Feb 2023 13:53:56 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, =?UTF-8?B?Q8OpZHJpYw==?=
 Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao
 Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 09/12] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20230215135356.585781c2.alex.williamson@redhat.com>
In-Reply-To: <0b423cd8-229a-c303-b61a-d84ae5423398@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-10-avihaih@nvidia.com>
 <87pmab2ic4.fsf@secure.mitica>
 <0b423cd8-229a-c303-b61a-d84ae5423398@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 15 Feb 2023 20:23:12 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 15/02/2023 15:01, Juan Quintela wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > Avihai Horon <avihaih@nvidia.com> wrote:  
> >> Implement the basic mandatory part of VFIO migration protocol v2.
> >> This includes all functionality that is necessary to support
> >> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
> >>
> >> The two protocols, v1 and v2, will co-exist and in the following patches
> >> v1 protocol code will be removed.
> >>
> >> There are several main differences between v1 and v2 protocols:
> >> - VFIO device state is now represented as a finite state machine instead
> >>    of a bitmap.
> >>
> >> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
> >>    ioctl and normal read() and write() instead of the migration region.
> >>
> >> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
> >>    added later on.
> >>
> >> Detailed information about VFIO migration protocol v2 and its difference
> >> compared to v1 protocol can be found here [1].
> >>
> >> [1]
> >> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> +/*
> >> + * Migration size of VFIO devices can be as little as a few KBs or as big as
> >> + * many GBs. This value should be big enough to cover the worst case.
> >> + */
> >> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)  
> > Wow O:-)
> >  
> >> +
> >> +/*
> >> + * Only exact function is implemented and not estimate function. The reason is
> >> + * that during pre-copy phase of migration the estimate function is called
> >> + * repeatedly while pending RAM size is over the threshold, thus migration
> >> + * can't converge and querying the VFIO device pending data size is useless.
> >> + */  
> > You can do it after this is merge, but I think you can do better than
> > this.  Something in the lines of:
> >
> >
> > // I put it in a global variable, but it really needs to be in
> > VFIODevice to be // able to support several devices.  You get the idea
> > O:-)
> >
> > static uint64_t cached_size = -1;
> >
> > static void vfio_state_pending_exact(void *opaque, uint64_t *res_precopy_only,
> >                                       uint64_t *res_compatible,
> >                                       uint64_t *res_postcopy_only)
> > {
> >      VFIODevice *vbasedev = opaque;
> >      uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
> >
> >      /*
> >       * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
> >       * reported so downtime limit won't be violated.
> >       */
> >      vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> >      *res_precopy_only += stop_copy_size;
> >      cached_size = stop_copy_size;
> >
> >      trace_vfio_state_pending_exact(vbasedev->name, *res_precopy_only,
> >                                     *res_postcopy_only, *res_compatible,
> >                                     stop_copy_size);
> > }
> >
> >
> > static void vfio_state_pending_estimate(void *opaque, uint64_t *res_precopy_only,
> >                                          uint64_t *res_compatible,
> >                                          uint64_t *res_postcopy_only)
> > {
> >      VFIODevice *vbasedev = opaque;
> >      uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
> >
> >      if (cached_size == -1) {
> >          uint64_t res_precopy;
> >          uint64_t res_compatible;
> >          uint64_t res_postcopy;
> >          vfio_state_pending_exact(opaque, &res_precopy, &res_compatible, &res_postcopy);
> >      }
> >      *res_precopy_only += cached_size;
> > }  
> 
> In the next series, which will add pre-copy support to VFIO migration 
> (v1 was sent [1] but isn't rebased on your pull reqs yet), I am going to 
> do something similar to what you suggested.
> It will be like you did here but with pre-copy data size (data which can 
> be transferred during pre-copy phase) instead of the stop_copy_size.
> 
> Plus, I don't think caching the stop_copy_size and reporting the cached 
> value in the estimate handler fits the best here,
> because stop_copy_size doesn't decrease by pre-copy iterations as 
> opposed to RAM pre-copy data, for example.
> 
> So I would rather keep things as they are and add something similar to 
> your suggestion in the pre-copy series.

Assuming Juan is on board with this, please re-base your series on
Juan's latest pull request.  At the time of writing, this is:

https://lore.kernel.org/all/20230215200554.1365-1-quintela@redhat.com/

The kernel headers need an update (you might as well pick up v6.2-rc8
at this point to be as close as possible to what lands in v6.2), Juan's
pull request includes qemu_file_get_to_fd(), so we can drop it here, and
there are some conflicts that need to be ironed out relative to
24beea4efe6e ("migration: Rename res_{postcopy,precopy}_only").  Thanks,

Alex


