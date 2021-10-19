Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB7432EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:59:24 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcj5n-0003V8-FW
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcj3D-0000Tf-25
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcj3A-0001C3-4x
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634626599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Acokz86RgTPKd5JmmvvxNuropEqMwsCGGd1q9A8L3Vs=;
 b=B2Y7fljCBDP9a6wVTNq8JEXz8qGD8aK76kV2H8g6SHgQU+yJF+JFrvg12DIM2gehQD5HLL
 fxEsRDI/rpHUEagO5PINJl7DNzcJkmplo6GqA1t3+qlvf1cGdtr/zrwLRMZ7fbwxCu8EWv
 3u4EUXf+CEC7lBBSELs7XaHVNb62NjI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-8dTsvctHN12JRL8VkMIuyw-1; Tue, 19 Oct 2021 02:56:38 -0400
X-MC-Unique: 8dTsvctHN12JRL8VkMIuyw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso9756319wrb.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Acokz86RgTPKd5JmmvvxNuropEqMwsCGGd1q9A8L3Vs=;
 b=Y9F0FzlSzEQkZExOSXfxSrORl5vTsMkdC14uhP4CYlVdE4McKDtiPVBuUKlxx7Jq0C
 FVAiO1yayjl9FO7WLhyhw8WcCXRP6h81QIYvze29nXliwYy+g3T/ZwICY2wWJrOm7ONT
 0DWyjQnwnN2VQHxxanm5znUXazvn14038qbpvnKEs/VOXkvwaHAUqBQYKwNlX8f1PPaJ
 O/PFQ6Ewvox7xR01HgOHvBbC7VfJ+YWwGnr8EtjDhflx9DU6pzmc9VrOFjQAQshGt9O6
 9C0qzJbzNi/grXWbQkQ4CBXt4LAdeJ88KN1lVPzPy0TjMLFPHsSRwoohQpOs/yzC8D52
 yoIw==
X-Gm-Message-State: AOAM533KH+9mKr/H+XLKYD6gouD9gpEzxW5S6xks4he1ip/6tGswy922
 y1VOCgUvgfoextwEs8efCtdeMGlqJv7DGge+i5z61t168Lreq1CRw3S8cdvtSKQVgTeUJlgdymf
 EDb09aHDlluOfigA=
X-Received: by 2002:adf:ee42:: with SMTP id w2mr35313635wro.227.1634626596937; 
 Mon, 18 Oct 2021 23:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytX+ly6V+xmqoo4L7fUhas8PkdZ9dEvTFWfirTSotPUeopW7Z1Y8Uc/N5KBuIfUkmYLgYDuw==
X-Received: by 2002:adf:ee42:: with SMTP id w2mr35313608wro.227.1634626596627; 
 Mon, 18 Oct 2021 23:56:36 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id n12sm1500594wms.27.2021.10.18.23.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:56:36 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:56:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v9 00/10] vhost-vdpa: add support for configure interrupt
Message-ID: <20211019025504-mutt-send-email-mst@kernel.org>
References: <20210930023348.17770-1-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930023348.17770-1-lulu@redhat.com>
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
Cc: jasowang@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:33:38AM +0800, Cindy Lu wrote:
> these patches add the support for configure interrupt
> 
> These codes are all tested in vp-vdpa (support configure interrupt)
> vdpa_sim (not support configure interrupt), virtio tap device
> 
> test in virtio-pci bus and virtio-mmio bus


I was inclined to let it slide but it hangs make check
so needs more work.
Meanwhile please go over how the patchset is structured,
and over description of each patch.
I sent some comments but same applied to everything.

Also, pls document the index == -1 hack in more detail.
how does it work and why it's helpful.

Thanks!

> Change in v2:
> Add support for virtio-mmio bus
> active the notifier while the backend support configure interrupt
> misc fixes from v1
> 
> Change in v3
> fix the coding style problems
> 
> Change in v4
> misc fixes from v3
> merge the set_config_notifier to set_guest_notifier
> when vdpa start, check the feature by VIRTIO_NET_F_STATUS
> 
> Change in v5
> misc fixes from v4
> split the code to introduce configure interrupt type and the callback function
> will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
> only active while using vhost-vdpa driver
> 
> Change in v6
> misc fixes from v5
> decouple virtqueue from interrupt setting and misc process
> fix the bug in virtio_net_handle_rx
> use -1 as the queue number to identify if the interrupt is configure interrupt
> 
> Change in v7
> misc fixes from v6
> decouple virtqueue from interrupt setting and misc process
> decouple virtqueue from vector use/release process
> decouple virtqueue from set notifier fd handler process
> move config_notifier and masked_config_notifier to VirtIODevice
> fix the bug in virtio_net_handle_rx, add more information
> add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the interrupt is configure interrupt
> 
> Change in v8
> misc fixes from v7
> decouple virtqueue from interrupt setting and misc process
> decouple virtqueue from vector use/release process
> decouple virtqueue from set notifier fd handler process
> move the vhost configure interrupt to vhost_net
> 
> Change in v9
> misc fixes from v8
> address the comments for v8
> 
> Cindy Lu (10):
>   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
>   virtio-pci: decouple notifier from interrupt process
>   virtio-pci: decouple the single vector from the interrupt process
>   vhost: add new call back function for config interrupt
>   vhost-vdpa: add support for config interrupt call back
>   virtio: add support for configure interrupt
>   virtio-net: add support for configure interrupt
>   vhost: add support for configure interrupt
>   virtio-mmio: add support for configure interrupt
>   virtio-pci: add support for configure interrupt
> 
>  hw/display/vhost-user-gpu.c       |   6 +
>  hw/net/vhost_net.c                |  10 ++
>  hw/net/virtio-net.c               |  16 +-
>  hw/virtio/trace-events            |   2 +
>  hw/virtio/vhost-user-fs.c         |   9 +-
>  hw/virtio/vhost-vdpa.c            |   7 +
>  hw/virtio/vhost-vsock-common.c    |   6 +
>  hw/virtio/vhost.c                 |  76 +++++++++
>  hw/virtio/virtio-crypto.c         |   6 +
>  hw/virtio/virtio-mmio.c           |  27 ++++
>  hw/virtio/virtio-pci.c            | 260 ++++++++++++++++++++----------
>  hw/virtio/virtio-pci.h            |   4 +-
>  hw/virtio/virtio.c                |  29 ++++
>  include/hw/virtio/vhost-backend.h |   3 +
>  include/hw/virtio/vhost.h         |   4 +
>  include/hw/virtio/virtio.h        |   6 +
>  include/net/vhost_net.h           |   3 +
>  17 files changed, 386 insertions(+), 88 deletions(-)
> 
> -- 
> 2.21.3


