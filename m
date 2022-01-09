Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8A488B79
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:58:19 +0100 (CET)
Received: from localhost ([::1]:33476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6cSQ-0005Iz-Dy
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6cR1-0004dj-2Z
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:56:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6cQu-0004An-C3
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641750999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yeIrokjj6KbIv6RBwjWx5yRhWDyWJRreNn9YjknU+Ms=;
 b=Zm+xaKJRIE3khMwnPy3S3UtUa4H+y8y8CcmF5MXVBiYS+HU6d7YconiH3JebYNwXdvHvIJ
 MDM6b7pGWwPqUC6YHMJ4S6T8Z9IAPnpI9JLCWT9V9LBZD4pPrVzp1JIeEvoMlaYW7IM1GT
 zHMeKvi3v8U63azmw4Le5/NNnooi7A4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-gz7wxJsVOXCqo0peCKOQ0Q-1; Sun, 09 Jan 2022 12:56:37 -0500
X-MC-Unique: gz7wxJsVOXCqo0peCKOQ0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so7444441wma.2
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 09:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yeIrokjj6KbIv6RBwjWx5yRhWDyWJRreNn9YjknU+Ms=;
 b=HNj/HFONjr75q6dW6Af6TL/E/2ecgUK1sR1vSxribIvifVqRmWrxFkH6YFZ2N8bhkb
 5dZk6n49bKVw6Z9e788IAqyut7eai46kQLqdd86+0atg0CGqdBcsnaT5aN2aPytJ7kGE
 uAyRPD/KxU+Jd43V0LzGlKuO95j+crSjN92N3j6f2rjvD7XNA3oPbEY8YKHrvynD+TT7
 0oGo4hGiATK5F/lJHC/C+4FIWXgwWHx0fWjHkbLTgijmqKIBZ6I305bHozBldCIe9gCq
 csXRUD5xy+SWlgwEMeJx4BJmOD7ief0vjix5zhoZl2hfwgk3pYnI9hXZbWd+0hxNajx7
 k0FQ==
X-Gm-Message-State: AOAM532onsnvwE8FCEpVcF1eDvPAGza4zl+G2ufXMMuvv0RC75XXK1rW
 ryuF+WQ0iiVx1hOEc+ePJJJLftSiWDAEa0LHowwsyQs1hqz9CoyH0LXE0MSX3GxAP18Ayohh3uX
 YW3ubuKdNHSf1z+E=
X-Received: by 2002:a05:600c:4854:: with SMTP id
 j20mr13414400wmo.151.1641750996737; 
 Sun, 09 Jan 2022 09:56:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwN2G66jgJlCYfVdE5GuC39qGnq9GVNuyq5vzOCERE95SvDz/1otvGuKeXlX/Phnd+NafXCUg==
X-Received: by 2002:a05:600c:4854:: with SMTP id
 j20mr13414382wmo.151.1641750996524; 
 Sun, 09 Jan 2022 09:56:36 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id p23sm4584712wms.3.2022.01.09.09.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:56:35 -0800 (PST)
Date: Sun, 9 Jan 2022 12:56:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
Message-ID: <20220109125240-mutt-send-email-mst@kernel.org>
References: <20211104164827.21911-1-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104164827.21911-1-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

So I just realized something. The spec says:

The device MUST set the Device Configuration Interrupt bit
in \field{ISR status} before sending a device configuration
change notification to the driver.

and I don't see how these patches achieve this: it requires
that config interrupts go through userspace.

Revert, and think more about it? Or did I miss something?


> -- 
> 2.21.3


