Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0128447236
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 09:37:49 +0100 (CET)
Received: from localhost ([::1]:56908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjdgS-0002lN-Ch
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 03:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdfP-00020E-Aj
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdfL-0002wP-BQ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636274197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a9Xg9z8l3wSuMgLbaUgAn3v3YSBidewK3hVnTpSHzX4=;
 b=iOjFGvAps+4Shi+wXobFBAwSfDy4aloftgO2xiVjTWRT6ZsQpCLO+kxPhHxOXtIAK9jFNg
 /1/bAdSOAEzQHavEtrXQzLWbu1OzzQBM3czPJY127oI1Rahg7XNzM5kzu/2Nniqc2JiUzq
 TrR6TwWNDFXTFO1sbfjQR5OI74ZWImc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-z_yw43LUMBen4l2hkdyI3g-1; Sun, 07 Nov 2021 03:36:34 -0500
X-MC-Unique: z_yw43LUMBen4l2hkdyI3g-1
Received: by mail-ed1-f71.google.com with SMTP id
 w12-20020a056402268c00b003e2ab5a3370so12451566edd.0
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 01:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a9Xg9z8l3wSuMgLbaUgAn3v3YSBidewK3hVnTpSHzX4=;
 b=k3TshWvA5JiyIC6SKW6t0vzhSBfr1n7juPBZlmlqvSa00jJJ/C+fVu1Y7YOkv4NAqL
 QAIvAaQya6aBJ9KiCFyGmT8i9CG24IOY4YVhop5/8fmvuZ4G0dXE4BU1jYiVsMj3MxXD
 KcYunS1PXsxCX3h4u1kDvD3uNg2dbX4jpVmt/IPGH+f2405iqZb97rLrcftWByd/GWXk
 NrgyKy6tGVmgqP0HxjWAz6COtDYRinL/U8cmC7K7QphYj4XBV/yd3XOeLYrcdNcmJIs3
 HFmqqbcY0ZsXIST/ZC+WfB3NBBqN39ummOkyLJDXNrp/UVU1tORUbOotzarD97ekA6yX
 iOow==
X-Gm-Message-State: AOAM531rqTneHARqUB9HoCivBtEwfbiLFTEPVwLkZKOuTyL8USlyURn0
 hl2aHImyzDj/8GHnLFbY29stfnsWRkIZRK5SdZ24ru3eibA5GvQXkPzS7QZ7YS9fa7eecspkAi2
 lQon+ay1WHP5asoE=
X-Received: by 2002:a17:907:7ba4:: with SMTP id
 ne36mr46610073ejc.227.1636274192957; 
 Sun, 07 Nov 2021 01:36:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydvlIrm4XAB0e0uoCbSIMeM802Zb1Gx1xbUujIRlKbW54SNNclQ3TiGHe9lGeZNukcDLoFyg==
X-Received: by 2002:a17:907:7ba4:: with SMTP id
 ne36mr46610047ejc.227.1636274192755; 
 Sun, 07 Nov 2021 01:36:32 -0700 (PDT)
Received: from redhat.com ([2.55.155.32])
 by smtp.gmail.com with ESMTPSA id f18sm7884304edd.10.2021.11.07.01.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:36:32 -0700 (PDT)
Date: Sun, 7 Nov 2021 03:36:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
Message-ID: <20211107033459-mutt-send-email-mst@kernel.org>
References: <20211104164827.21911-1-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104164827.21911-1-lulu@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
> these patches add the support for configure interrupt
> 
> These codes are all tested in vp-vdpa (support configure interrupt)
> vdpa_sim (not support configure interrupt), virtio tap device
> 
> test in virtio-pci bus and virtio-mmio bus

Thanks! Given we are in freeze, I can't merge this now.
Will queue it until after release, if possible please
ping me after the release to help make sure it's not lost then.

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
> use -1 as the queue number to identify if the interrupt is configure interrupt
> 
> Change in v7
> misc fixes from v6
> decouple vq from interrupt setting and misc process
> decouple vq from vector use/release process
> decouple vq from set notifier fd handler process
> move config_notifier and masked_config_notifier to VirtIODevice
> fix the bug in virtio_net_handle_rx, add more information
> add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the interrupt is configure interrupt
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
> Cindy Lu (10):
>   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
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
>  hw/display/vhost-user-gpu.c       |   6 +
>  hw/net/vhost_net.c                |   9 +
>  hw/net/virtio-net.c               |  10 +-
>  hw/virtio/trace-events            |   1 +
>  hw/virtio/vhost-user-fs.c         |   6 +
>  hw/virtio/vhost-vdpa.c            |   7 +
>  hw/virtio/vhost-vsock-common.c    |   6 +
>  hw/virtio/vhost.c                 |  76 +++++++++
>  hw/virtio/virtio-crypto.c         |   6 +
>  hw/virtio/virtio-mmio.c           |  27 +++
>  hw/virtio/virtio-pci.c            | 269 +++++++++++++++++++++---------
>  hw/virtio/virtio-pci.h            |   4 +-
>  hw/virtio/virtio.c                |  29 ++++
>  include/hw/virtio/vhost-backend.h |   3 +
>  include/hw/virtio/vhost.h         |   4 +
>  include/hw/virtio/virtio.h        |   7 +
>  include/net/vhost_net.h           |   2 +
>  17 files changed, 389 insertions(+), 83 deletions(-)
> 
> -- 
> 2.21.3


