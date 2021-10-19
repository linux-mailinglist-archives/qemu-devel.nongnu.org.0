Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750D433493
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:22:12 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnC7-0007wT-AF
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn7F-0005R2-6T
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn7D-0004ss-1B
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5zhz4UXPazu/R7bWpYv9SuJ8Exi96GhRPsjpfx+/COk=;
 b=LosjGbOPMDY3msZP2sOqihQeb5Qx7ZQkW+jzXDWq/vVLZtR0O6A8K0mlLonnYUaWKmitGn
 QHqn+y84jivpD58dg50g3CV8tJXFqYDwN6pge/32WSke2idqEkfR6f2oiq14983oab19wl
 KOSHfVqZ3wnWOq+eStfVCvC4MwvXoXg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-a4MmXLrKNBqGJ1SmdfXuaA-1; Tue, 19 Oct 2021 07:17:05 -0400
X-MC-Unique: a4MmXLrKNBqGJ1SmdfXuaA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso17189572edj.20
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5zhz4UXPazu/R7bWpYv9SuJ8Exi96GhRPsjpfx+/COk=;
 b=kodO6hCpkOvc+pMGurmOGNmwNweyTLANeF2CgrHGwmRbsGW1TbDBOozBdmxHDZRs8G
 SwSIrkBTAJnEk/FWToBP/CYQ+VbSiSYMUrT/Mk+RK9O2A4+jQc3wthlTncI/4in3dW8V
 40sfiZfsvuTuEgWxziX5shLzTkeCUCeLIuP3A74PKIWW+AdzW3PZLVI6gI1VGqqYIblE
 Bd7YkCeJGIJn6B8reP/2BPPPdKs5mNyZQNgq0PNE+UonbUqCQpbg+whuaO+/lhUaFrVa
 SQv5tcRk38ccL0IWM5PUSb8gZZvWMGCNlMJ0rf3W6qbaPv4yQ/ecFA7krI9d5uz06VpB
 /44w==
X-Gm-Message-State: AOAM532sWMuYCP9OcRNSq76pPb2X/aZt0mkkSp2BWmQrYB866GdhwmT8
 M6domUJwoubN/D9RHFU8BZ782ibp64OwOiAgvgjO1oVT7EQkSgFC9pYSWqegC2XENZyxehCC5Z+
 hxT23+UmQ5IjXVJw=
X-Received: by 2002:a05:6402:358d:: with SMTP id
 y13mr53850179edc.343.1634642224195; 
 Tue, 19 Oct 2021 04:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpub1kGonLMats5CWkPaCbW3nVAbf4aIeO7n3Ybi/L64iW84gchCJTpkE7sg9S8kWvs7mDbg==
X-Received: by 2002:a05:6402:358d:: with SMTP id
 y13mr53850143edc.343.1634642223966; 
 Tue, 19 Oct 2021 04:17:03 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z19sm10073935ejw.44.2021.10.19.04.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:17:03 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:17:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 00/10] vhost-vDPA multiqueue
Message-ID: <20211019071654-mutt-send-email-mst@kernel.org>
References: <20211011042829.4159-1-jasowang@redhat.com>
 <20211019030236-mutt-send-email-mst@kernel.org>
 <CACGkMEvEQfQwR1nN-G19XbWRanPYSydeyWGbt_4Z5XNdLajmtA@mail.gmail.com>
 <20211019064428-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211019064428-mutt-send-email-mst@kernel.org>
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
Cc: Cindy Lu <lulu@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>, eperezma <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 06:44:38AM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 19, 2021 at 03:24:36PM +0800, Jason Wang wrote:
> > On Tue, Oct 19, 2021 at 3:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Oct 11, 2021 at 12:28:19PM +0800, Jason Wang wrote:
> > > > Hi All:
> > > >
> > > > This patch implements the multiqueue support for vhost-vDPA. The most
> > > > important requirement si the control virtqueue support. The virtio-net
> > > > and vhost-net core are tweak to support control virtqueue as if what
> > > > data queue pairs are done: a dedicated vhost_net device which is
> > > > coupled with the NetClientState is intrdouced so most of the existing
> > > > vhost codes could be reused with minor changes. This means the control
> > > > virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
> > > > are extend to support creating and destroying multiqueue queue pairs
> > > > plus the control virtqueue.
> > > >
> > > > For the future, if we want to support live migration, we can either do
> > > > shadow cvq on top or introduce new interfaces for reporting device
> > > > states.
> > >
> > >
> > > I had to defer this due to rework I picked up.
> > > I pushed an experimental tree - it still has issues but
> > > if you rebase on top of that I can apply.
> > 
> > Will do. For the tree, is it
> > git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git next?
> > 
> > Thanks
> > 
> 
> pci

pushed now

> > >
> > > > Tests are done via the vp_vdpa driver in L1 guest.
> > > >
> > > > Changes since V3:
> > > >
> > > > - fix build with vhost disabled
> > > >
> > > > Changes since V2:
> > > >
> > > > - rebase to qemu master
> > > > - use "queue_pairs" instead of "qps"
> > > > - typo fixes
> > > >
> > > > Changes since V1:
> > > >
> > > > - start and stop vhost devices when all queues were setup
> > > > - fix the case when driver doesn't support MQ but device support
> > > > - correctly set the batching capability to avoid a map/unmap storm
> > > > - various other tweaks
> > > >
> > > > Jason Wang (10):
> > > >   vhost-vdpa: open device fd in net_init_vhost_vdpa()
> > > >   vhost-vdpa: classify one time request
> > > >   vhost-vdpa: prepare for the multiqueue support
> > > >   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
> > > >   net: introduce control client
> > > >   vhost-net: control virtqueue support
> > > >   virtio-net: use "queue_pairs" instead of "queues" when possible
> > > >   vhost: record the last virtqueue index for the virtio device
> > > >   virtio-net: vhost control virtqueue support
> > > >   vhost-vdpa: multiqueue support
> > > >
> > > >  hw/net/vhost_net-stub.c        |   4 +-
> > > >  hw/net/vhost_net.c             |  55 ++++++++---
> > > >  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
> > > >  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
> > > >  include/hw/virtio/vhost-vdpa.h |   1 +
> > > >  include/hw/virtio/vhost.h      |   2 +
> > > >  include/hw/virtio/virtio-net.h |   5 +-
> > > >  include/net/net.h              |   5 +
> > > >  include/net/vhost_net.h        |   6 +-
> > > >  net/net.c                      |  24 ++++-
> > > >  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
> > > >  11 files changed, 330 insertions(+), 120 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > >


