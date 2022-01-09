Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B74488AFF
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:24:11 +0100 (CET)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bvO-0000e6-Tn
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6beh-0006RM-8o
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:06:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6bee-0005V3-ND
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641748011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTL9evJyWN9GZCsKdkBQGNTzJ3RGgunRYAwyD7sIrI4=;
 b=MOwNA63mTo/WsNNKqa/aWY/e2nULBUOns6/B2XjacyG7CNrGRGoTq9LGthxpW4QJnHMZLI
 jEa3Hb4WmKTmJpA6DAtzM4iXnBbB49T3U5FA4V7X7W7VzG6NWTVanzZIsT5fyLL35URbGr
 jnd+KjJ1rMJvie0MgF8b4xuLmGQKDlE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-30amgFWEOXKwiaomhR0-7Q-1; Sun, 09 Jan 2022 12:06:50 -0500
X-MC-Unique: 30amgFWEOXKwiaomhR0-7Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 j19-20020adfa553000000b001a375e473d8so3600935wrb.4
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 09:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZTL9evJyWN9GZCsKdkBQGNTzJ3RGgunRYAwyD7sIrI4=;
 b=pb3o0dKUBjwlpNcHwlTxVHhk7HK/1IF+s38OtmcU3F/Jitkbe+X22TLeUKOxq2tUOs
 1bWAPxqpU+Ok5sfxzcLa4KCP5Vf+1g6kSfMO+p1U6gjkvOs3Ijuzz2X8oBkg4V0HPetJ
 hzHDhKJkuv++0aUbIPt74Zex8ypMHhVUFDFtQyDxRglwv5DAagHITzwj1bmzwsmlCQ7k
 4LU5zlDlEq9fXTkwHu+vj3h6L8lYaSJk1mbFYrPlfa2P6LKlV0dJ0e39Bz3UiEwwPTlH
 WAPty7mb9CM5mCgxgefgbrJRn0Up71aFLCROe31mjFPT81EjKheMMPHFrHk3mBYAlE5Y
 lmDw==
X-Gm-Message-State: AOAM532splLA5Qfce99fkVZFAJULUVUC4wJet0Ai1ArjhmEH7Wwjadvr
 ATU0NYSZJlBqBK6wtrwS7pjIk5VSMyYVlEfxMaZXPpSeqQlYWgXtU4+nw9/ufA0it8BU/LWYLGX
 6PK4ygr9IhEmqJCA=
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr61869835wry.447.1641748008856; 
 Sun, 09 Jan 2022 09:06:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm928YRLLRlGKiMcLC9vgNKENsfMC8XY88HjuZjz7Uv1UNcDpJf025MJdkaz2sjbZevPW4vw==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr61869824wry.447.1641748008660; 
 Sun, 09 Jan 2022 09:06:48 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id l4sm4973505wry.85.2022.01.09.09.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:47 -0800 (PST)
Date: Sun, 9 Jan 2022 12:06:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
Message-ID: <20220109120313-mutt-send-email-mst@kernel.org>
References: <20211104164827.21911-1-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104164827.21911-1-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I am thinking maybe we should revert patches 9,10 for now.
E.g. I'm starting to worry this will make us run out of eventfds.
Can we limit the impact allocating these to only vdpa?

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


