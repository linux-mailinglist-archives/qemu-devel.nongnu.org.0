Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98C4333D1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:47:40 +0200 (CEST)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmeh-0004Hb-6e
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmbw-0003Hj-Qv
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmbp-0003oZ-Da
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634640280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KG/BVGOJi8W4bopf4+o/s3YsoU9woMs6y/PVzsiRNEA=;
 b=MtZsT9+iF9YB2xqfA5sgVv2irqEf4/YkPKquU7V5MTy8fLq1TlL2VD5WWf1uqaZn81JaJl
 2o+4LnlDcE5Y7AbDuShTCef93kAoH/jWKoYH+6PM9W9oYeFkmJ7xyJ+MduW4EYMZVo82lw
 kG7SpvsZHTzEJ5zDs6r3V+4gXbT2N+Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-B3eYECZLPSKqyNWYDV0CnA-1; Tue, 19 Oct 2021 06:44:39 -0400
X-MC-Unique: B3eYECZLPSKqyNWYDV0CnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so996939wmr.4
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KG/BVGOJi8W4bopf4+o/s3YsoU9woMs6y/PVzsiRNEA=;
 b=YBzHO6f0f6I+xgbbuvmxoJ18o9ldjFuO7LhqLo4ut/h47t/SY2zbPgVY/5wesmnmar
 RMaiVdRjuIcxxNJGb5y0vnCPpVTODy926Vsraq5msd44J8hI/xXJpLbb4AEOQceM8E9u
 aIovr7k1//Owa4xQRsQ02g9i7iRD4kDU8k2AShni5E4q8xSQ4KeNJvbYNu5Hq0l40fm2
 ijM2wyrJ2kiqrC5yqhTBV765ESbKhGMfvXs2+ABWXVbP285wMofv1gwfOaxUgj8qHSH8
 cH8WgA2GkYH9tkanVVQso+2L4si11utd1qUwSVwp+eIQ5gflVRNioJbRLDAxScAGLBDq
 g45g==
X-Gm-Message-State: AOAM5326VdACdGHvTrT3dNWmwWcvCv5cNvSaLeFFMI4PQZclKsPLjOYr
 8D88uZR28L3i4EmBOn4xVvu8jkN03LA2gpBqZ5jVKfidFToRvQVOV87BVs95zpWHbCzqlR6ACb5
 HgufKwkyHT++Xw90=
X-Received: by 2002:a1c:f609:: with SMTP id w9mr5236015wmc.24.1634640278060;
 Tue, 19 Oct 2021 03:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNWuOEBRbUJVld18cke9rNqoqAY7NzSpbPXR+eGXv7G22IYpFDOQ38Gx9GZk8hRPpRWGRIGQ==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr5235990wmc.24.1634640277813;
 Tue, 19 Oct 2021 03:44:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id v185sm1858849wme.35.2021.10.19.03.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:44:37 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:44:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 00/10] vhost-vDPA multiqueue
Message-ID: <20211019064428-mutt-send-email-mst@kernel.org>
References: <20211011042829.4159-1-jasowang@redhat.com>
 <20211019030236-mutt-send-email-mst@kernel.org>
 <CACGkMEvEQfQwR1nN-G19XbWRanPYSydeyWGbt_4Z5XNdLajmtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvEQfQwR1nN-G19XbWRanPYSydeyWGbt_4Z5XNdLajmtA@mail.gmail.com>
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
Cc: Cindy Lu <lulu@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>, eperezma <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 03:24:36PM +0800, Jason Wang wrote:
> On Tue, Oct 19, 2021 at 3:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 11, 2021 at 12:28:19PM +0800, Jason Wang wrote:
> > > Hi All:
> > >
> > > This patch implements the multiqueue support for vhost-vDPA. The most
> > > important requirement si the control virtqueue support. The virtio-net
> > > and vhost-net core are tweak to support control virtqueue as if what
> > > data queue pairs are done: a dedicated vhost_net device which is
> > > coupled with the NetClientState is intrdouced so most of the existing
> > > vhost codes could be reused with minor changes. This means the control
> > > virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
> > > are extend to support creating and destroying multiqueue queue pairs
> > > plus the control virtqueue.
> > >
> > > For the future, if we want to support live migration, we can either do
> > > shadow cvq on top or introduce new interfaces for reporting device
> > > states.
> >
> >
> > I had to defer this due to rework I picked up.
> > I pushed an experimental tree - it still has issues but
> > if you rebase on top of that I can apply.
> 
> Will do. For the tree, is it
> git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git next?
> 
> Thanks
> 

pci

> >
> > > Tests are done via the vp_vdpa driver in L1 guest.
> > >
> > > Changes since V3:
> > >
> > > - fix build with vhost disabled
> > >
> > > Changes since V2:
> > >
> > > - rebase to qemu master
> > > - use "queue_pairs" instead of "qps"
> > > - typo fixes
> > >
> > > Changes since V1:
> > >
> > > - start and stop vhost devices when all queues were setup
> > > - fix the case when driver doesn't support MQ but device support
> > > - correctly set the batching capability to avoid a map/unmap storm
> > > - various other tweaks
> > >
> > > Jason Wang (10):
> > >   vhost-vdpa: open device fd in net_init_vhost_vdpa()
> > >   vhost-vdpa: classify one time request
> > >   vhost-vdpa: prepare for the multiqueue support
> > >   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
> > >   net: introduce control client
> > >   vhost-net: control virtqueue support
> > >   virtio-net: use "queue_pairs" instead of "queues" when possible
> > >   vhost: record the last virtqueue index for the virtio device
> > >   virtio-net: vhost control virtqueue support
> > >   vhost-vdpa: multiqueue support
> > >
> > >  hw/net/vhost_net-stub.c        |   4 +-
> > >  hw/net/vhost_net.c             |  55 ++++++++---
> > >  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
> > >  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
> > >  include/hw/virtio/vhost-vdpa.h |   1 +
> > >  include/hw/virtio/vhost.h      |   2 +
> > >  include/hw/virtio/virtio-net.h |   5 +-
> > >  include/net/net.h              |   5 +
> > >  include/net/vhost_net.h        |   6 +-
> > >  net/net.c                      |  24 ++++-
> > >  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
> > >  11 files changed, 330 insertions(+), 120 deletions(-)
> > >
> > > --
> > > 2.25.1
> >


