Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5045123BA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 22:14:08 +0200 (CEST)
Received: from localhost ([::1]:54536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njo34-0000qA-Ps
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 16:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1njo27-0008RH-5p
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1njo22-0000X7-2V
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 16:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651090381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRtx6LrUUULsLk+vSSACwtsTZTlhNeL/P6fQDDSaHoo=;
 b=JOAs9Q3MGwfUMZglMXnefHhyKmgCHXjxbeSeOFEKoIqSu05NhApD9yVRXwp6Rjg3TSTQSE
 T0QL+zzfrlXwftp4HtNV/Uk/4yGXqn6Dt4O8QLtkC1343JboSzi1XXjCqpr+6u6jksz2Qz
 qFJOBi7LYxA7l1S7nos34itTCgClEkA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-BY05nqdlMkmqeM1wJr5PXA-1; Wed, 27 Apr 2022 16:12:52 -0400
X-MC-Unique: BY05nqdlMkmqeM1wJr5PXA-1
Received: by mail-lj1-f198.google.com with SMTP id
 u19-20020a2e8553000000b0024f222a942aso1156436ljj.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 13:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CRtx6LrUUULsLk+vSSACwtsTZTlhNeL/P6fQDDSaHoo=;
 b=Omi3jXj/+gMPYQZ9j8xxGjifZcjZ7ZJxwfsuOB9gG/93X6cN3x5ZebKmrDKsz11Rhq
 NMfupz5XFk5hsIqa0CDrR5M6NDTNrOvwTQ1vE9EsHYo1V6pItUX1lSQPF/tII4grDSoh
 D82KtF6gdj7dSBMXeQBUGh4ooprXzrd8cCh6zKTjn4DeR6aKLIzLjM9Xfl6mz7Uf/nIz
 kzzYDniXnpyfoeJAVERD5OIJALbiE3WIVdf4iXLPXtsw6GlDycpPiEdkcbEp4TONJIz4
 4kgUpaH6Eg+PPshRhuCKcPGy1AE0FYpTcAMnv8BaMohBHtTEPeMH6B8/RxTQUe2bou3g
 +1WA==
X-Gm-Message-State: AOAM533fiK9wG7xHUiHgr8t4oggEESEhxKhGAx2zVPj1mtVgvOqD1tq2
 wkwI5j1P6NjgUi4xB5+buRNEkZwkawMhNUPpKV/xOa78TBue3YywZazo7BUMpKEx5wwkKQ7v+o+
 GPKcxyac0D4xLgK8Yz9sVznlkuTCxnDc=
X-Received: by 2002:a2e:9c07:0:b0:249:6388:333d with SMTP id
 s7-20020a2e9c07000000b002496388333dmr20174891lji.160.1651090370248; 
 Wed, 27 Apr 2022 13:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZWHx+MCIvwkr5Kvl5vqJfi01YdoVZ9I8Lkeo6RuyjFaATyZ6tzRr6X8c/CHKNigHUfloilz8Fs+TbqqUZS+E=
X-Received: by 2002:a2e:9c07:0:b0:249:6388:333d with SMTP id
 s7-20020a2e9c07000000b002496388333dmr20174879lji.160.1651090369993; Wed, 27
 Apr 2022 13:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-3-stefanha@redhat.com>
In-Reply-To: <20220427143541.119567-3-stefanha@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 27 Apr 2022 23:12:34 +0300
Message-ID: <CAMRbyyuQMstTZ75bwdb64wEf1oM3iYpKHTaBpPdnpHMnZ8+zDQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] virtio-scsi: don't waste CPU polling the event
 virtqueue
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 5:35 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The virtio-scsi event virtqueue is not emptied by its handler function.
> This is typical for rx virtqueues where the device uses buffers when
> some event occurs (e.g. a packet is received, an error condition
> happens, etc).
>
> Polling non-empty virtqueues wastes CPU cycles. We are not waiting for
> new buffers to become available, we are waiting for an event to occur,
> so it's a misuse of CPU resources to poll for buffers.
>
> Introduce the new virtio_queue_aio_attach_host_notifier_no_poll() API,
> which is identical to virtio_queue_aio_attach_host_notifier() except
> that it does not poll the virtqueue.
>
> Before this patch the following command-line consumed 100% CPU in the
> IOThread polling and calling virtio_scsi_handle_event():
>
>   $ qemu-system-x86_64 -M accel=kvm -m 1G -cpu host \
>       --object iothread,id=iothread0 \
>       --device virtio-scsi-pci,iothread=iothread0 \
>       --blockdev file,filename=test.img,aio=native,cache.direct=on,node-name=drive0 \
>       --device scsi-hd,drive=drive0
>
> After this patch CPU is no longer wasted.
>
> Reported-by: Nir Soffer <nsoffer@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio.h      |  1 +
>  hw/scsi/virtio-scsi-dataplane.c |  2 +-
>  hw/virtio/virtio.c              | 13 +++++++++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b31c4507f5..b62a35fdca 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -317,6 +317,7 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
>  void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
>  void virtio_queue_host_notifier_read(EventNotifier *n);
>  void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx);
> +void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx);
>  void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
>  VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
>  VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
> diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
> index 29575cbaf6..8bb6e6acfc 100644
> --- a/hw/scsi/virtio-scsi-dataplane.c
> +++ b/hw/scsi/virtio-scsi-dataplane.c
> @@ -138,7 +138,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>
>      aio_context_acquire(s->ctx);
>      virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
> -    virtio_queue_aio_attach_host_notifier(vs->event_vq, s->ctx);
> +    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
>
>      for (i = 0; i < vs->conf.num_queues; i++) {
>          virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 9d637e043e..67a873f54a 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3534,6 +3534,19 @@ void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
>                                  virtio_queue_host_notifier_aio_poll_end);
>  }
>
> +/*
> + * Same as virtio_queue_aio_attach_host_notifier() but without polling. Use
> + * this for rx virtqueues and similar cases where the virtqueue handler
> + * function does not pop all elements. When the virtqueue is left non-empty
> + * polling consumes CPU cycles and should not be used.
> + */
> +void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx)
> +{
> +    aio_set_event_notifier(ctx, &vq->host_notifier, true,
> +                           virtio_queue_host_notifier_read,
> +                           NULL, NULL);
> +}
> +
>  void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
>  {
>      aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
> --
> 2.35.1
>

I tested patches 1 and 2 on top of 34723f59371f3fd02ea59b94674314b875504426
and it solved the issue.

Tested-by: Nir Soffer <nsoffer@redhat.com>

Nir


