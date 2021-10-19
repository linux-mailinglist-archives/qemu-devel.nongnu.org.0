Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA83432F65
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:28:42 +0200 (CEST)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjY9-000479-78
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mcjUV-0008OE-VR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mcjUT-0003qU-TV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634628292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GYc3LhMkqfqj0b7yOyHB7K64vAPyTjUTXz5SfXfeU0Q=;
 b=PRgP7LJsTOHI6fWFzNSEN3C/lNkjCuUSkOiUSJFXUjx8zl1ur/HKkPODlYA6EkXIXuwwlq
 hdbaN2otnwlwGx01gJnJ9/+Vf+Ccs5aJS8CFi2gSIykAPu57W7eaGHlSg1/D4FTI7yvF2x
 Ga6C16/J1b6PQO/BBCpVVxzV1TZwpbw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-ce0bUG9LM3OMcUfGEuspcg-1; Tue, 19 Oct 2021 03:24:49 -0400
X-MC-Unique: ce0bUG9LM3OMcUfGEuspcg-1
Received: by mail-lj1-f197.google.com with SMTP id
 h5-20020a2e9005000000b00210d01099b3so538925ljg.17
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYc3LhMkqfqj0b7yOyHB7K64vAPyTjUTXz5SfXfeU0Q=;
 b=WEm/7Sw01wAjo9T9oqNLJCI6IftopSwH22pvUjY+91OnxQKVZXHTwUmbyw6PC1CfGH
 BOw2+sWeHOp+LqZUWirz3lDHahOl0i5B7eSIMkwj4eqmPxDA/k3A/ZvOmJhLZT1UwKV2
 +zSt4fms7MV3xV+ygy5a6YS2s8HA22sjh3o0lgMdoESptycvpULRLSOXyoMiE5Omy27s
 NY1JHGNQU54hySvfLczmDssCXH8MiT//UPWtt+F0tODTSvj1QjIuziY6CEYo5YLtdZAC
 JclYllTaZ1uSrnMV4WAe6Fv+fnqNlv3z4aw1axUV9kP8M/plLKmDPm2kYOWApKx6De43
 hQpQ==
X-Gm-Message-State: AOAM532xV22KWsTY14sC4nfLY1HOzMoB1ydhMLSLcygp8UD6qy3O6V6t
 GHA8SdH91U1NiJdUbaeevPzN0AzVGCKYpyV5lZd/Io9EJf1QLQR21zgAwZtH9VN36CcWzlz1n5X
 WYP0lY23bBWRyqdDUmDOVdzegEA62mmI=
X-Received: by 2002:ac2:5e78:: with SMTP id a24mr4561528lfr.348.1634628288082; 
 Tue, 19 Oct 2021 00:24:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd+N7vmkJmwzrnmkzv3YaYLeuEhzBRyGF10bCya70qtLCLBjHmU3wat0POyIWAeS2Ynlz799Im7N8DWVxrY2g=
X-Received: by 2002:ac2:5e78:: with SMTP id a24mr4561502lfr.348.1634628287847; 
 Tue, 19 Oct 2021 00:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211011042829.4159-1-jasowang@redhat.com>
 <20211019030236-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019030236-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 19 Oct 2021 15:24:36 +0800
Message-ID: <CACGkMEvEQfQwR1nN-G19XbWRanPYSydeyWGbt_4Z5XNdLajmtA@mail.gmail.com>
Subject: Re: [PATCH V4 00/10] vhost-vDPA multiqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Oct 19, 2021 at 3:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 11, 2021 at 12:28:19PM +0800, Jason Wang wrote:
> > Hi All:
> >
> > This patch implements the multiqueue support for vhost-vDPA. The most
> > important requirement si the control virtqueue support. The virtio-net
> > and vhost-net core are tweak to support control virtqueue as if what
> > data queue pairs are done: a dedicated vhost_net device which is
> > coupled with the NetClientState is intrdouced so most of the existing
> > vhost codes could be reused with minor changes. This means the control
> > virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
> > are extend to support creating and destroying multiqueue queue pairs
> > plus the control virtqueue.
> >
> > For the future, if we want to support live migration, we can either do
> > shadow cvq on top or introduce new interfaces for reporting device
> > states.
>
>
> I had to defer this due to rework I picked up.
> I pushed an experimental tree - it still has issues but
> if you rebase on top of that I can apply.

Will do. For the tree, is it
git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git next?

Thanks


>
> > Tests are done via the vp_vdpa driver in L1 guest.
> >
> > Changes since V3:
> >
> > - fix build with vhost disabled
> >
> > Changes since V2:
> >
> > - rebase to qemu master
> > - use "queue_pairs" instead of "qps"
> > - typo fixes
> >
> > Changes since V1:
> >
> > - start and stop vhost devices when all queues were setup
> > - fix the case when driver doesn't support MQ but device support
> > - correctly set the batching capability to avoid a map/unmap storm
> > - various other tweaks
> >
> > Jason Wang (10):
> >   vhost-vdpa: open device fd in net_init_vhost_vdpa()
> >   vhost-vdpa: classify one time request
> >   vhost-vdpa: prepare for the multiqueue support
> >   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
> >   net: introduce control client
> >   vhost-net: control virtqueue support
> >   virtio-net: use "queue_pairs" instead of "queues" when possible
> >   vhost: record the last virtqueue index for the virtio device
> >   virtio-net: vhost control virtqueue support
> >   vhost-vdpa: multiqueue support
> >
> >  hw/net/vhost_net-stub.c        |   4 +-
> >  hw/net/vhost_net.c             |  55 ++++++++---
> >  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
> >  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
> >  include/hw/virtio/vhost-vdpa.h |   1 +
> >  include/hw/virtio/vhost.h      |   2 +
> >  include/hw/virtio/virtio-net.h |   5 +-
> >  include/net/net.h              |   5 +
> >  include/net/vhost_net.h        |   6 +-
> >  net/net.c                      |  24 ++++-
> >  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
> >  11 files changed, 330 insertions(+), 120 deletions(-)
> >
> > --
> > 2.25.1
>


