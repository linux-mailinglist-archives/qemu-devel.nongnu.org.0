Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1696184CB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:36:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdBk-0003PE-GR; Thu, 03 Nov 2022 12:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqdBf-0003Ox-3d
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqdBZ-0002i0-NF
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667493320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kcisoo72epPDerapbBMMaN50+Xq5XjwF/Y1YllVarBs=;
 b=bqXUYKXb9peKcLqwGsb1Ll30d3zkImjBHnM1g8Q+nL9PIHoA/e5xA9wWI3+TRHutnFAS1v
 7z0einefrCT/RbVU6Cgh76Ix+llBBtnIhJ0gXu2zgommwB7ErLqV72eYYY37onRC2u0FVF
 BF+F0aEe/TwjBxgIXLhZp8Ltfm2qe4M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-Se6kwzT_OxKbNXtMig8QUQ-1; Thu, 03 Nov 2022 12:35:16 -0400
X-MC-Unique: Se6kwzT_OxKbNXtMig8QUQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so665882wra.23
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kcisoo72epPDerapbBMMaN50+Xq5XjwF/Y1YllVarBs=;
 b=B3NaXUgh39OEMROHDaoEoRXaojuJkiVtEsLhn5CA5WMueZPbpIRkYu2W9iQJs4CiGw
 Y2YnZclh6+uGWllfn5XpmUlN2S9K/9wKE6bgmaLm55WX9NhWnHJvZYyi76DDi13SRt+Q
 IF93ayNQgM71HGJLN8T+/Y/35RFpcSG78mP7d6D3t0fYjYK2Ffh0vWhDxH32TTwf/J/7
 ytf7S8oWLvY6EcUhTIyMTFDN05lPNJoUM0+E7NXbXBOmrh455eCa6rFJ4wotDy/L6Jrj
 kxlt8bmQAHQkOCFhUBvkbb27TBP3+mIWHw3n7MULJQNUFtQUkzqJoib8eumIBmIqDS21
 A+rw==
X-Gm-Message-State: ACrzQf1hVFcN4LzwLxJVOkZ7jkX41nedE0bauCb2r4zp5G7aV/tjTtCp
 s4PRhNyLrK45EFPKjcj4hJXF59f9k7kdjLrB+4tW0f6Jct0QAn8doilQRf63rNxi5TtcF4gRk+M
 qyOpIXwKIWy4nTZk=
X-Received: by 2002:a5d:4c43:0:b0:236:547f:bd3c with SMTP id
 n3-20020a5d4c43000000b00236547fbd3cmr19909666wrt.380.1667493314749; 
 Thu, 03 Nov 2022 09:35:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6JfQ8k4i/aV/CNr78C4Qy6/UeylJMOB3Pua4V8AZMtr3KqyMwHpjIoPcs3tZw8dp514V9Msg==
X-Received: by 2002:a5d:4c43:0:b0:236:547f:bd3c with SMTP id
 n3-20020a5d4c43000000b00236547fbd3cmr19909647wrt.380.1667493314505; 
 Thu, 03 Nov 2022 09:35:14 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6b84000000b0022e653f5abbsm1252096wrx.69.2022.11.03.09.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 09:35:13 -0700 (PDT)
Message-ID: <460d26c4-39ac-0fc7-dc50-70b655c3588e@redhat.com>
Date: Thu, 3 Nov 2022 17:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] virtio-blk: simplify virtio_blk_dma_restart_cb()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sergio Lopez <slp@redhat.com>
References: <20221102182337.252202-1-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221102182337.252202-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 02/11/2022 um 19:23 schrieb Stefan Hajnoczi:
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

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

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
> 


