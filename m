Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F172854E81E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:52:02 +0200 (CEST)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1siv-0001sU-8Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1shb-0000pd-5a
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1shX-0000mk-JT
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U6TqkAF9Tn8+3/tsEwpurn9tA7lhy/UmRkOQiBW52io=;
 b=G5K8mKiYVk5XHfiLcZ/wiq2b4EU4ggnMUJyqtxxj569Z+IzKkqH7o/Lt/DP4FyfkLZv/+L
 mbPqnsRxFKt9mP/1O54a7eWwrCUOx0v52aS0UKB4aAM1w9T5UFgXQ5Pa3ucCjQyNh3nqlN
 /S3EKusVw1uI30y+3XVcnu9g4fzP2MA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-O2W_IGSHNKSYl5H-MaoM6g-1; Thu, 16 Jun 2022 12:50:33 -0400
X-MC-Unique: O2W_IGSHNKSYl5H-MaoM6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so862098wmr.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U6TqkAF9Tn8+3/tsEwpurn9tA7lhy/UmRkOQiBW52io=;
 b=ndkIjh/ppwruvXJKqLDaUfyrsYKsm5uwP8B/EHQ2MO+T8xGeXLYS3VgP7C3fSNkdbd
 RMCpY2rtlSchmMn7EJtnDiGk/cCyxWIdyc3qdaI2n0sC0BcJIAvVxEYodmwqqN9Bb+Ha
 +BrnF42+lOIDQXgv381S42hTYgDPFSRYC4ncoDWWUuqwr72yJdu9WlgCwM2DvhnkQVmZ
 sVqpYBAC3l6A2RoWQhvqTxs6SuUdSYr2osyhbk/3pBxQ5IKmgCHu7jRGV5q6bNiLo1KO
 UNpvzsXfsyPWg8W2WLstKVXddw6/BSRkZrwmVHaqnfO/52pPfxujAbz/O9/sJamjDvkJ
 W0XA==
X-Gm-Message-State: AJIora9qxXi4HsQSnH3BTGGHzx14FZ+pdEE7/zWBo3XX3n7qd8Fy0vS+
 3B2O4apvrq8dWU1hIkkAgfACj3OvnupvVLTUGoy0b5Ly93u6kj/+zwQetvGiHp7ajKZ9u4FECPw
 XJ0Kyaub3OpgYh6A=
X-Received: by 2002:a5d:684d:0:b0:219:e68b:55f4 with SMTP id
 o13-20020a5d684d000000b00219e68b55f4mr5501443wrw.215.1655398231597; 
 Thu, 16 Jun 2022 09:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzGxotyKKEMCqa8fneNiqOUX7UuV/uNQ/2WbHXsbGhzkXmlAkk/eGd8S72qEi8nuHxR1CVMA==
X-Received: by 2002:a5d:684d:0:b0:219:e68b:55f4 with SMTP id
 o13-20020a5d684d000000b00219e68b55f4mr5501419wrw.215.1655398231318; 
 Thu, 16 Jun 2022 09:50:31 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 r184-20020a1c2bc1000000b0039749b01ea7sm3657597wmr.32.2022.06.16.09.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:50:30 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:50:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 4/8] virtio: categorize callbacks in GS
Message-ID: <20220616125019-mutt-send-email-mst@kernel.org>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-5-eesposit@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 10:37:23AM -0400, Emanuele Giuseppe Esposito wrote:
> All the callbacks below are always running in the main loop.
> 
> The callbacks are the following:
> - start/stop_ioeventfd: these are the callbacks where
>   blk_set_aio_context(iothread) is done, so they are called in the main
>   loop.
> 
> - save and load: called during migration, when VM is stopped from the
>   main loop.
> 
> - reset: before calling this callback, stop_ioeventfd is invoked, so
>   it can only run in the main loop.
> 
> - set_status: going through all the callers we can see it is called
>   from a MemoryRegionOps callback, which always run in the main loop.
> 
> - realize: iothread is not even created yet.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/block/virtio-blk.c  | 2 ++
>  hw/virtio/virtio-bus.c | 5 +++++
>  hw/virtio/virtio-pci.c | 2 ++
>  hw/virtio/virtio.c     | 8 ++++++++
>  4 files changed, 17 insertions(+)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 29a9c53ebc..4e6421c35e 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -1032,6 +1032,8 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
>  {
>      VirtIOBlock *s = VIRTIO_BLK(vdev);
>  
> +    GLOBAL_STATE_CODE();
> +
>      if (!(status & (VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_DRIVER_OK))) {
>          assert(!s->dataplane_started);
>      }
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d7ec023adf..0891ddb2ff 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -23,6 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> @@ -223,6 +224,8 @@ int virtio_bus_start_ioeventfd(VirtioBusState *bus)
>      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>      int r;
>  
> +    GLOBAL_STATE_CODE();
> +
>      if (!k->ioeventfd_assign || !k->ioeventfd_enabled(proxy)) {
>          return -ENOSYS;
>      }
> @@ -247,6 +250,8 @@ void virtio_bus_stop_ioeventfd(VirtioBusState *bus)
>      VirtIODevice *vdev;
>      VirtioDeviceClass *vdc;
>  
> +    GLOBAL_STATE_CODE();
> +
>      if (!bus->ioeventfd_started) {
>          return;
>      }
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 0566ad7d00..6798039391 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -301,6 +301,8 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>      hwaddr pa;
>  
> +    GLOBAL_STATE_CODE();
> +
>      switch (addr) {
>      case VIRTIO_PCI_GUEST_FEATURES:
>          /* Guest does not negotiate properly?  We have to assume nothing. */
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..2650504dd4 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1977,6 +1977,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>      trace_virtio_set_status(vdev, val);
>  
> +    GLOBAL_STATE_CODE();
> +
>      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>          if (!(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) &&
>              val & VIRTIO_CONFIG_S_FEATURES_OK) {
> @@ -2025,6 +2027,8 @@ void virtio_reset(void *opaque)
>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>      int i;
>  
> +    GLOBAL_STATE_CODE();
> +
>      virtio_set_status(vdev, 0);
>      if (current_cpu) {
>          /* Guest initiated reset */
> @@ -2882,6 +2886,8 @@ int virtio_save(VirtIODevice *vdev, QEMUFile *f)
>      uint32_t guest_features_lo = (vdev->guest_features & 0xffffffff);
>      int i;
>  
> +    GLOBAL_STATE_CODE();
> +
>      if (k->save_config) {
>          k->save_config(qbus->parent, f);
>      }
> @@ -3024,6 +3030,8 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>  
> +    GLOBAL_STATE_CODE();
> +
>      /*
>       * We poison the endianness to ensure it does not get used before
>       * subsections have been loaded.
> -- 
> 2.31.1


