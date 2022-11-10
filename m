Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD502624261
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6fD-0003rQ-Cs; Thu, 10 Nov 2022 07:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ot6fB-0003rG-CF
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ot6f9-0004yC-CU
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668083286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6hWBhgQpwh/Iq4iKTeQ4c3vNvhrkwOsFmFT2/EIxC9M=;
 b=VvKH31fhoOH0BG3x6E+gPhYVbSRjrUBn3xNnFG9FozPlhHSS2guP+vf+r8D0qWdI2k6QLT
 1gJOVxEIDOwbg6g8cPGhvC60ZP6PWmqwPnbd1mUfHy6T5unToDn59vJopRYTZtw9B3eQeC
 cZTlfMl8klScecs0HY5ixVF6BGZAZuA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-JGjszcEPPzK9UCQjBTMdAA-1; Thu, 10 Nov 2022 07:28:05 -0500
X-MC-Unique: JGjszcEPPzK9UCQjBTMdAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so2586685wmb.8
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hWBhgQpwh/Iq4iKTeQ4c3vNvhrkwOsFmFT2/EIxC9M=;
 b=lLSTrYYhMhYALxcGkC0rhL8sIg8LLiRxefmK6KyCjcgPIOeVvUfO0bMZ1K6iUBIatB
 mxYhkXa0yCjBuNQJyA/GuGC2TJAJH+3l3Lf/sZTiu+Rjj/Lom43Zjy7IPYLTeR8XuUtu
 81WWp697DVXlRL6TD/a815lAnVEpJhiZn/L0AfO//Iox1waM3bHpSCzM9TFS4i0Hd+Xd
 gaLIQjINw6JXlLfSL2iTo99Ep1bSWu/b40I+7bSBfrByU5ke7qCAVK9G5BoIL4N2X+7V
 henPAn5CvFFI0DOyocYBeaJZ82pdYH5PGdJ50kcA1uw+q1aY/dtCnmngCkGD3R3onlEI
 AMSQ==
X-Gm-Message-State: ACrzQf2XzsFi9qgy32GTMtRy+HDp38nxwEsMtn3ItGHB11Zywm+5hHOC
 eZgp165+vbn+XdCLprgte7WPakolG6xme170CzR1STUO9bquezYnBtOYyKqHgD48E/DPbxfXpI+
 RZWme53TDWRf69kw=
X-Received: by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr33626805wrm.17.1668083283637; 
 Thu, 10 Nov 2022 04:28:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5NaPHxytXkyQHaSmpG2E+S/22ttGTG6nhAezw5vPw0drPBs2yy+rooi4JAchBVdliLpCZ8ZQ==
X-Received: by 2002:adf:e78d:0:b0:236:debd:f681 with SMTP id
 n13-20020adfe78d000000b00236debdf681mr33626795wrm.17.1668083283396; 
 Thu, 10 Nov 2022 04:28:03 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003cfa26c410asm5646430wmq.20.2022.11.10.04.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 04:28:02 -0800 (PST)
Date: Thu, 10 Nov 2022 07:27:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] virtio-blk: simplify virtio_blk_dma_restart_cb()
Message-ID: <20221110072742-mutt-send-email-mst@kernel.org>
References: <20221102182337.252202-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102182337.252202-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 02, 2022 at 02:23:37PM -0400, Stefan Hajnoczi wrote:
> virtio_blk_dma_restart_cb() is tricky because the BH must deal with
> virtio_blk_data_plane_start()/virtio_blk_data_plane_stop() being called.
> 
> There are two issues with the code:
> 
> 1. virtio_blk_realize() should use qdev_add_vm_change_state_handler()
>    instead of qemu_add_vm_change_state_handler(). This ensures the
>    ordering with virtio_init()'s vm change state handler that calls
>    virtio_blk_data_plane_start()/virtio_blk_data_plane_stop() is
>    well-defined. Then blk's AioContext is guaranteed to be up-to-date in
>    virtio_blk_dma_restart_cb() and it's no longer necessary to have a
>    special case for virtio_blk_data_plane_start().
> 
> 2. Only blk_drain() waits for virtio_blk_dma_restart_cb()'s
>    blk_inc_in_flight() to be decremented. The bdrv_drain() family of
>    functions do not wait for BlockBackend's in_flight counter to reach
>    zero. virtio_blk_data_plane_stop() relies on blk_set_aio_context()'s
>    implicit drain, but that's a bdrv_drain() and not a blk_drain().
>    Note that virtio_blk_reset() already correctly relies on blk_drain().
>    If virtio_blk_data_plane_stop() switches to blk_drain() then we can
>    properly wait for pending virtio_blk_dma_restart_bh() calls.
> 
> Once these issues are taken care of the code becomes simpler. This
> change is in preparation for multiple IOThreads in virtio-blk where we
> need to clean up the multi-threading behavior.
> 
> I ran the reproducer from commit 49b44549ace7 ("virtio-blk: On restart,
> process queued requests in the proper context") to check that there is
> no regression.
> 
> Cc: Sergio Lopez <slp@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

block tree I presume?


> ---
>  include/hw/virtio/virtio-blk.h  |  2 --
>  hw/block/dataplane/virtio-blk.c | 17 +++++-------
>  hw/block/virtio-blk.c           | 46 ++++++++++++++-------------------
>  3 files changed, 26 insertions(+), 39 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
> index 7f589b4146..dafec432ce 100644
> --- a/include/hw/virtio/virtio-blk.h
> +++ b/include/hw/virtio/virtio-blk.h
> @@ -55,7 +55,6 @@ struct VirtIOBlock {
>      VirtIODevice parent_obj;
>      BlockBackend *blk;
>      void *rq;
> -    QEMUBH *bh;
>      VirtIOBlkConf conf;
>      unsigned short sector_mask;
>      bool original_wce;
> @@ -93,6 +92,5 @@ typedef struct MultiReqBuffer {
>  } MultiReqBuffer;
>  
>  void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
> -void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh);
>  
>  #endif
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index 26f965cabc..b28d81737e 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -237,9 +237,6 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>          goto fail_aio_context;
>      }
>  
> -    /* Process queued requests before the ones in vring */
> -    virtio_blk_process_queued_requests(vblk, false);
> -
>      /* Kick right away to begin processing requests already in vring */
>      for (i = 0; i < nvqs; i++) {
>          VirtQueue *vq = virtio_get_queue(s->vdev, i);
> @@ -272,11 +269,6 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>    fail_host_notifiers:
>      k->set_guest_notifiers(qbus->parent, nvqs, false);
>    fail_guest_notifiers:
> -    /*
> -     * If we failed to set up the guest notifiers queued requests will be
> -     * processed on the main context.
> -     */
> -    virtio_blk_process_queued_requests(vblk, false);
>      vblk->dataplane_disabled = true;
>      s->starting = false;
>      vblk->dataplane_started = true;
> @@ -325,8 +317,13 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
>      aio_context_acquire(s->ctx);
>      aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
>  
> -    /* Drain and try to switch bs back to the QEMU main loop. If other users
> -     * keep the BlockBackend in the iothread, that's ok */
> +    /* Wait for virtio_blk_dma_restart_bh() and in flight I/O to complete */
> +    blk_drain(s->conf->conf.blk);
> +
> +    /*
> +     * Try to switch bs back to the QEMU main loop. If other users keep the
> +     * BlockBackend in the iothread, that's ok
> +     */
>      blk_set_aio_context(s->conf->conf.blk, qemu_get_aio_context(), NULL);
>  
>      aio_context_release(s->ctx);
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f717550fdc..1762517878 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -806,8 +806,10 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>      virtio_blk_handle_vq(s, vq);
>  }
>  
> -void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
> +static void virtio_blk_dma_restart_bh(void *opaque)
>  {
> +    VirtIOBlock *s = opaque;
> +
>      VirtIOBlockReq *req = s->rq;
>      MultiReqBuffer mrb = {};
>  
> @@ -834,43 +836,27 @@ void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
>      if (mrb.num_reqs) {
>          virtio_blk_submit_multireq(s, &mrb);
>      }
> -    if (is_bh) {
> -        blk_dec_in_flight(s->conf.conf.blk);
> -    }
> +
> +    /* Paired with inc in virtio_blk_dma_restart_cb() */
> +    blk_dec_in_flight(s->conf.conf.blk);
> +
>      aio_context_release(blk_get_aio_context(s->conf.conf.blk));
>  }
>  
> -static void virtio_blk_dma_restart_bh(void *opaque)
> -{
> -    VirtIOBlock *s = opaque;
> -
> -    qemu_bh_delete(s->bh);
> -    s->bh = NULL;
> -
> -    virtio_blk_process_queued_requests(s, true);
> -}
> -
>  static void virtio_blk_dma_restart_cb(void *opaque, bool running,
>                                        RunState state)
>  {
>      VirtIOBlock *s = opaque;
> -    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(s)));
> -    VirtioBusState *bus = VIRTIO_BUS(qbus);
>  
>      if (!running) {
>          return;
>      }
>  
> -    /*
> -     * If ioeventfd is enabled, don't schedule the BH here as queued
> -     * requests will be processed while starting the data plane.
> -     */
> -    if (!s->bh && !virtio_bus_ioeventfd_enabled(bus)) {
> -        s->bh = aio_bh_new(blk_get_aio_context(s->conf.conf.blk),
> -                           virtio_blk_dma_restart_bh, s);
> -        blk_inc_in_flight(s->conf.conf.blk);
> -        qemu_bh_schedule(s->bh);
> -    }
> +    /* Paired with dec in virtio_blk_dma_restart_bh() */
> +    blk_inc_in_flight(s->conf.conf.blk);
> +
> +    aio_bh_schedule_oneshot(blk_get_aio_context(s->conf.conf.blk),
> +            virtio_blk_dma_restart_bh, s);
>  }
>  
>  static void virtio_blk_reset(VirtIODevice *vdev)
> @@ -1213,7 +1199,13 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
> +    /*
> +     * This must be after virtio_init() so virtio_blk_dma_restart_cb() gets
> +     * called after ->start_ioeventfd() has already set blk's AioContext.
> +     */
> +    s->change =
> +        qdev_add_vm_change_state_handler(dev, virtio_blk_dma_restart_cb, s);
> +
>      blk_ram_registrar_init(&s->blk_ram_registrar, s->blk);
>      blk_set_dev_ops(s->blk, &virtio_block_ops, s);
>  
> -- 
> 2.38.1


