Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899F432F57
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:25:21 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjUu-0007aC-Mc
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcjRj-0001mN-EX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcjRe-0001TT-Sf
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634628118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOGrRb+k1QQ90ojzGZiJtXvSGvWQuo14+DP3c3P1zOk=;
 b=YWxJTsKwWIx+1lznyZO2jAPaWvxBRT554xH7eLprnSoAzFqCnhl8W4MXIljWcsmb0trR4I
 MhmQ+LF+FpGuvMFrm/3iQRAQDjFwsMjgSjnLl0PDz/wrn7/+7URkLNl3ayn7V5xkjdQSPc
 ZMDwLWNF+CQ1k9LggoV3UTDhMpKBP+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-gEFfZzmnN_6da8scyiiFFA-1; Tue, 19 Oct 2021 03:21:55 -0400
X-MC-Unique: gEFfZzmnN_6da8scyiiFFA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c69-20020a1c9a48000000b0030d95485d90so439044wme.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iOGrRb+k1QQ90ojzGZiJtXvSGvWQuo14+DP3c3P1zOk=;
 b=YHNk7T/zJwJ/TnSN5Zy3XbDlXCnbbo3+sbDYlIfNGSN1xZsj0wPTslS31Jjjsv1d5U
 267ezncQ9LS8Flzfjg416wd+g8j8F/EP8GgjbR9CHCLWjv0zN2CCn/bvUq5o2Sce45k2
 m2UlQaBloKmYH3WGUWWmleT4gph7LUDgHGZZRpHQC3nYV/+IgXHuoKXFPLAuFm4+fdHR
 //3WenBlEp6byNLU4egf7RHhiyWvfvwSTsmQqi3OZ48ftnt7+Km/jbxUhGtArzDOyhVz
 sZIk4NjvGgr6dMMqPLJpJ7wAbIqnHT0ksp63lGKiUJRMbrvXALzywGfhTTrwhI0BGvwu
 vo+w==
X-Gm-Message-State: AOAM530ozhdCzvl4ZSmopUUwEjyB4/y3l6vkmWS5oyCFjWRtNcyiKWK+
 NW2i0TpD1z7GcjGMOAfD7hwUs3k6NeJ6U13BhWEFwi7U0abLYNTvuOqiHacAc1tgcxIqizkQvKo
 8SdxwY25laDup358=
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr31452267wrr.69.1634628113904; 
 Tue, 19 Oct 2021 00:21:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwmGcO4WDzIXJLuv3AcVwcJm8Z6+LHUjNNIhig1iUo2onojRUzVqinIfDj2Um+2WwqFxOplA==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr31452245wrr.69.1634628113687; 
 Tue, 19 Oct 2021 00:21:53 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l2sm1912919wmi.1.2021.10.19.00.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:21:53 -0700 (PDT)
Date: Tue, 19 Oct 2021 03:21:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 00/10] vhost-vDPA multiqueue
Message-ID: <20211019030236-mutt-send-email-mst@kernel.org>
References: <20211011042829.4159-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011042829.4159-1-jasowang@redhat.com>
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
Cc: lulu@redhat.com, qemu-devel@nongnu.org, gdawar@xilinx.com,
 eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 12:28:19PM +0800, Jason Wang wrote:
> Hi All:
> 
> This patch implements the multiqueue support for vhost-vDPA. The most
> important requirement si the control virtqueue support. The virtio-net
> and vhost-net core are tweak to support control virtqueue as if what
> data queue pairs are done: a dedicated vhost_net device which is
> coupled with the NetClientState is intrdouced so most of the existing
> vhost codes could be reused with minor changes. This means the control
> virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
> are extend to support creating and destroying multiqueue queue pairs
> plus the control virtqueue.
> 
> For the future, if we want to support live migration, we can either do
> shadow cvq on top or introduce new interfaces for reporting device
> states.


I had to defer this due to rework I picked up.
I pushed an experimental tree - it still has issues but
if you rebase on top of that I can apply.

> Tests are done via the vp_vdpa driver in L1 guest.
> 
> Changes since V3:
> 
> - fix build with vhost disabled
> 
> Changes since V2:
> 
> - rebase to qemu master
> - use "queue_pairs" instead of "qps"
> - typo fixes
> 
> Changes since V1:
> 
> - start and stop vhost devices when all queues were setup
> - fix the case when driver doesn't support MQ but device support
> - correctly set the batching capability to avoid a map/unmap storm
> - various other tweaks
> 
> Jason Wang (10):
>   vhost-vdpa: open device fd in net_init_vhost_vdpa()
>   vhost-vdpa: classify one time request
>   vhost-vdpa: prepare for the multiqueue support
>   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>   net: introduce control client
>   vhost-net: control virtqueue support
>   virtio-net: use "queue_pairs" instead of "queues" when possible
>   vhost: record the last virtqueue index for the virtio device
>   virtio-net: vhost control virtqueue support
>   vhost-vdpa: multiqueue support
> 
>  hw/net/vhost_net-stub.c        |   4 +-
>  hw/net/vhost_net.c             |  55 ++++++++---
>  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
>  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
>  include/hw/virtio/vhost-vdpa.h |   1 +
>  include/hw/virtio/vhost.h      |   2 +
>  include/hw/virtio/virtio-net.h |   5 +-
>  include/net/net.h              |   5 +
>  include/net/vhost_net.h        |   6 +-
>  net/net.c                      |  24 ++++-
>  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
>  11 files changed, 330 insertions(+), 120 deletions(-)
> 
> -- 
> 2.25.1


