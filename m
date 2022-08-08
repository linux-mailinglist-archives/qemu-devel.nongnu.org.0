Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058558CFFC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:02:05 +0200 (CEST)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAp1-0006am-I4
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLAly-0004AD-Ff
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLAlu-0004qE-FT
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659995929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5+AuLd72abn2g3yNlC12FWOgovgePecFJBnOVnifGo=;
 b=K6QlswCbDGbkOa1fWOIB498M2sx6ev8EEPpuaBmAzhRtV6oNQje8iN88F1jM9qtpvNF+36
 iwR2UZHn+865Ix8UPygxWdUE9A9eOjhPrX/RvVvx44O22ko5vWSj0+YFvWqQsLV+OVuPC4
 HUqodOU8qqhQsNA3QgKDJa9uadSAHMg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-ph2pGdAlN8Sy8qX9dnOR1Q-1; Mon, 08 Aug 2022 17:58:48 -0400
X-MC-Unique: ph2pGdAlN8Sy8qX9dnOR1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 r5-20020a1c4405000000b003a534ec2570so2072322wma.7
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=c5+AuLd72abn2g3yNlC12FWOgovgePecFJBnOVnifGo=;
 b=yeVgR7+BOGAMolIKYCfFrSuYMz3o0UW46Bk6haPpsx9whis78Ie7JPNyhRO5aJADlW
 sVJU1BkIXod25SX1J3gCEsLrYg/7+NdloAnvo0dq6/3MpnfSSd4Ll9AZFuxzAE7Bp9jF
 ByB8ip+BB6nyDyYWQ4Ir7w3Sea0MXPb1MEbdQGGoDxZRb2GfYpGQXKouXUTrei0Huwzu
 3fbpy6OKpfLCw1fsTmmCaFX1WR3ATw0YkWxQjcJAjbONrl3KFjGLU0ptspqXRxLDNXzY
 j+Xxr9xmDEwgecNHbMYlpXITKGdZ9BaNC7zC6ciQEGZWWrTKG4pTmEC//SWsDMVtWWnd
 /P/Q==
X-Gm-Message-State: ACgBeo3JTMMRrIO1PkCOKCT/wLdXAN09OXikYbDjTOz3YzCQlFkIVRbO
 dv0xmJh9J9X+6gP8AgFGtgFPHHISfl7R/NPdZ7uPpRlfrmvH1s16n5ly/R7ManRqF5dPDCAonzp
 0QWwfvxNzXTEBpIc=
X-Received: by 2002:adf:d1e4:0:b0:221:6c37:277e with SMTP id
 g4-20020adfd1e4000000b002216c37277emr10848302wrd.498.1659995926940; 
 Mon, 08 Aug 2022 14:58:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7BtFl6flzQuN9caHpdHantjf6F22bz3dHjdRVC+WyvN4/q1dE2q3tPyf/AwZADhTubVpQkZw==
X-Received: by 2002:adf:d1e4:0:b0:221:6c37:277e with SMTP id
 g4-20020adfd1e4000000b002216c37277emr10848290wrd.498.1659995926629; 
 Mon, 08 Aug 2022 14:58:46 -0700 (PDT)
Received: from redhat.com ([2.52.21.123]) by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003a2cf1ba9e2sm6460094wmi.6.2022.08.08.14.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:58:46 -0700 (PDT)
Date: Mon, 8 Aug 2022 17:58:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, pbonzini@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, kwolf@redhat.com,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH v2] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Message-ID: <20220808175806-mutt-send-email-mst@kernel.org>
References: <20220808162134.240405-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808162134.240405-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Aug 08, 2022 at 12:21:34PM -0400, Stefan Hajnoczi wrote:
> As soon as virtio_scsi_data_plane_start() attaches host notifiers the
> IOThread may start virtqueue processing. There is a race between
> IOThread virtqueue processing and virtio_scsi_data_plane_start() because
> it only assigns s->dataplane_started after attaching host notifiers.
> 
> When a virtqueue handler function in the IOThread calls
> virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
> attempt to start dataplane even though we're already in the IOThread:
> 
>   #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa257c)
>   #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
>   #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
>   #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
>   #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
>   #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x67511b)
>   #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
>   #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b5836)
>   #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f14e)
>   #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
>   #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
>   #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
>   #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x646902)
>   #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
>   #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
>   #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
>   #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)
> 
> This patch assigns s->dataplane_started before attaching host notifiers
> so that virtqueue handler functions that run in the IOThread before
> virtio_scsi_data_plane_start() returns correctly identify that dataplane
> does not need to be started. This fix is taken from the virtio-blk
> dataplane code and it's worth adding a comment in virtio-blk as well to
> explain why it works.
> 
> Note that s->dataplane_started does not need the AioContext lock because
> it is set before attaching host notifiers and cleared after detaching
> host notifiers. In other words, the IOThread always sees the value true
> and the main loop thread does not modify it while the IOThread is
> active.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099541
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> v2:
> - Switch to a smaller fix inspired by virtio-blk and document why
>   virtio-blk works [Paolo]
> 
>  hw/block/dataplane/virtio-blk.c |  5 +++++
>  hw/scsi/virtio-scsi-dataplane.c | 11 ++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index 49276e46f2..26f965cabc 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -219,6 +219,11 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>  
>      memory_region_transaction_commit();
>  
> +    /*
> +     * These fields are visible to the IOThread so we rely on implicit barriers
> +     * in aio_context_acquire() on the write side and aio_notify_accept() on
> +     * the read side.
> +     */
>      s->starting = false;
>      vblk->dataplane_started = true;
>      trace_virtio_blk_data_plane_start(s);
> diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
> index 8bb6e6acfc..20bb91766e 100644
> --- a/hw/scsi/virtio-scsi-dataplane.c
> +++ b/hw/scsi/virtio-scsi-dataplane.c
> @@ -136,6 +136,14 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>  
>      memory_region_transaction_commit();
>  
> +    /*
> +     * These fields are visible to the IOThread so we rely on implicit barriers
> +     * in aio_context_acquire() on the write side and aio_notify_accept() on
> +     * the read side.
> +     */
> +    s->dataplane_starting = false;
> +    s->dataplane_started = true;
> +
>      aio_context_acquire(s->ctx);
>      virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
>      virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
> @@ -143,9 +151,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>      for (i = 0; i < vs->conf.num_queues; i++) {
>          virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
>      }
> -
> -    s->dataplane_starting = false;
> -    s->dataplane_started = true;
>      aio_context_release(s->ctx);
>      return 0;
>  
> -- 
> 2.37.1


