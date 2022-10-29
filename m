Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD3612170
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:32:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohGr-0007wr-Ta; Sat, 29 Oct 2022 04:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oohGY-0007wB-4I
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oohGW-0003zj-F8
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667032346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=szD0faTdM6n5oFFlRz2/v6ThU5+n8Df+HO5YcRlzs+4=;
 b=SZ+nLaFE268xIOh3hCi4xb5g57qU9VENgsQ+dY6m7clweYsY1wp04RAWgK7PVXuWh/Zl+8
 o986kgNeVt8dlefCMBPax+hoi2GQVh8esgfCHN+XqyJclUTSBjEwz1Wx675Z96ipPoXjpd
 imdsTG4y20cU8GW+26kzc3D2hA2+hfQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-r4goLHyPME6PssTGJjBqcQ-1; Sat, 29 Oct 2022 04:32:21 -0400
X-MC-Unique: r4goLHyPME6PssTGJjBqcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso1959286wmh.5
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 01:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szD0faTdM6n5oFFlRz2/v6ThU5+n8Df+HO5YcRlzs+4=;
 b=s+VuCrAx+hhnbxQrCkmDR1haMaQLtAx5FeyVoMyVgYdD5ERU7h+MEjx1DQRnS6FCkE
 ORzUUq4dL2rqGhdbOZiCcW01xJAbm+6mbsKFZn2X9ydLgSH9qW+D2j6I6gtmwJFIGdI/
 K8wakoJ/hdDkStm0K24rvNxw2YlYN5iGHuCtWtD/sdL85ms9uoOSFcMEDzCKSCbXU60E
 PEHCHBplnNY53FApbnA6dCdE+3vGo1+5bBRsK0gRhLAAOEwqFshHnK4V2kTu02wD/tl+
 9J505IVN6eZUPGHPtNC9OTO3w6DIcjt82QS4y8zh0dxk+EBh11DNrW4UEJG4Cl0Ql41p
 AhLA==
X-Gm-Message-State: ACrzQf1a7jjwtYSS7pMzUR5Iqr2J9Q79gkFHi1Ny1Qv0B7kf6equ8H4B
 KZReR1tQmPF6eYtG/Diagttct5/wIfJbCwdsxweDzIkJsuhzH/D1qOybIHy2rfnQOnk6bWOvccD
 eaQchu6gqMAw8Bos=
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id
 f17-20020adfe911000000b0023673b7e668mr1785188wrm.96.1667032339789; 
 Sat, 29 Oct 2022 01:32:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7862vFnS/fFL4F0XHvx/EYvTun+3qY+N9B7yjNU14TbRdFjY0c9K7hkgtYOa/wsc3Dep/0Kw==
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id
 f17-20020adfe911000000b0023673b7e668mr1785176wrm.96.1667032339570; 
 Sat, 29 Oct 2022 01:32:19 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q1-20020a05600c040100b003c4ecff4e25sm1050826wmb.9.2022.10.29.01.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:32:19 -0700 (PDT)
Date: Sat, 29 Oct 2022 04:32:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, kraxel@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v18 00/10] vhost-vdpa: add support for configure interrupt
Message-ID: <20221029043057-mutt-send-email-mst@kernel.org>
References: <20221029082755.1265144-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029082755.1265144-1-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 04:27:45PM +0800, Cindy Lu wrote:
> These patches introduced the support for configure interrupt 
> 
> These codes are tested on x86_64 and aarch64 platforms.  
> the test scenario is based on vp-vdpa/vdpa_sim /virtio net device, with
> the irqfd and without irqfd.

Given this caused failures in vhost-user, I'd like to see vhost and
vhost-user tested too.

> Tested in virtio-pci bus and virtio-mmio bus
> 
> 
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
> decouple vq from interrupt setting and misc process
> fix the bug in virtio_net_handle_rx
> 
> Change in v7
> misc fixes from v6
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move config_notifier and masked_config_notifier to VirtIODevice
> fix the bug in virtio_net_handle_rx, add more information
> add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt 
> 
> Change in v8
> misc fixes from v7
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move the vhost configure interrupt to vhost_net
> 
> Change in v9
> misc fixes from v8
> address the comments from v8
> 
> Change in v10
> fix the hang issue in qtest
> address the comments from v9
> 
> Change in v11
> fix the crash in aarch64 plateform.
> fix the crash upstream reported
> 
> Change in v12
> fix the typo and the comments
> 
> changes in v13
> re-send the patches by git-publish
> 
> changes in v14
> rebased the code based on upstream
> 
> changes in v15
> rebased the code based on upstream
> 
> changes in v16
> resend the patch, seems there not send successfully
> 
> changes in v18
> fix the crash in qtest
> Because hw/virtio/vhost-user-gpio.c is a new device,So I missed 
> to add the VIRTIO_CONFIG_IRQ_IDX check in notifier_mask
> 
> Cindy Lu (10):
>   virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
>   virtio-pci: decouple notifier from interrupt process
>   virtio-pci: decouple the single vector from the interrupt process
>   vhost: introduce new VhostOps vhost_set_config_call
>   vhost-vdpa: add support for config interrupt
>   virtio: add support for configure interrupt
>   vhost: add support for configure interrupt
>   virtio-net: add support for configure interrupt
>   virtio-mmio: add support for configure interrupt
>   virtio-pci: add support for configure interrupt
> 
>  hw/display/vhost-user-gpu.c       |  18 ++
>  hw/net/vhost_net.c                |   9 +
>  hw/net/virtio-net.c               |  22 ++-
>  hw/virtio/trace-events            |   1 +
>  hw/virtio/vhost-user-fs.c         |  18 ++
>  hw/virtio/vhost-user-gpio.c       |  10 ++
>  hw/virtio/vhost-vdpa.c            |   8 +
>  hw/virtio/vhost-vsock-common.c    |  18 ++
>  hw/virtio/vhost.c                 |  78 +++++++-
>  hw/virtio/virtio-crypto.c         |  18 ++
>  hw/virtio/virtio-mmio.c           |  27 +++
>  hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------
>  hw/virtio/virtio.c                |  29 +++
>  include/hw/virtio/vhost-backend.h |   3 +
>  include/hw/virtio/vhost.h         |   4 +
>  include/hw/virtio/virtio-pci.h    |   4 +-
>  include/hw/virtio/virtio.h        |   7 +
>  include/net/vhost_net.h           |   2 +
>  18 files changed, 472 insertions(+), 87 deletions(-)
> 
> -- 
> 2.34.3


