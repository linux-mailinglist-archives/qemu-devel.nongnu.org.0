Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE824D3F5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:30:21 +0200 (CEST)
Received: from localhost ([::1]:59032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95FU-0004NH-KX
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k94J1-0005HS-OU
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k94Iz-0002cG-VU
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4pnbSrDnlxCt/KbRjsiXp4SKG8HWNOhQT+5aGwvJLE=;
 b=HqddCTD/wU0JlxWi0jKfiPx/ljosFKtsNR2Oo0DFbW3nllH2196ddtuC3FHGrA3Cf555qC
 q2evJ3OSdtDPnBMVbnKe5vgcd+crSnvjUHcsiO8Op/BC+RwPRWahLfxWDYUCVlqotICTP5
 2g6o2X4fCD6g6OMzZzm5O4UNUu5Isro=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-cZXfWzkKOkmz-senmdTyiQ-1; Fri, 21 Aug 2020 06:29:49 -0400
X-MC-Unique: cZXfWzkKOkmz-senmdTyiQ-1
Received: by mail-wm1-f72.google.com with SMTP id h7so649440wmm.7
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 03:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Tb60Up/BUBy/IR/p7cv54uNslKqKIns3yFa/SV4TQBs=;
 b=ftCzC6zWP0wEssXUUbaq1R/ngrqyrkS8tMtnEpSErupLepyyAnofoPxGYRFJVatBrK
 FMcUIh51LI2w+dZXG3gG4Q8xfkkDXA/xa2qMpW5QK6Nu51HcEHhpAjHfDgxBaLUmIo4E
 K7nm024nSwozxoWYkbo25bMWuUIwDJuefAjxnxnRHdwYCgme/8d8SkTOy2Jl3m6wzPv0
 GNK0HTSCEMVWEZgnR0aM+iXMf4RYPhloDESLfC2yQS7T6C1vp8Nf0dQN3frAydmkpMHK
 fxpTMnpygs8WclwbVzslMC6pkgDC+4NLznrKEEkFARW41tEYsepJ+BWxuNYhBl4T7+Nm
 5MzQ==
X-Gm-Message-State: AOAM531wg04K/2CSLEsiEo20G/iK5q5SloLaUitd8+mXYtQNwwhWbWIw
 v+VaKEFn4wkkuK/TGdDy0qjX51gvs2ZYFv8sjpajcvep6EoU9VSlY8rSqLJwgho7J3wmnE9xXbW
 SkSbqn7aJDaMYkuM=
X-Received: by 2002:a1c:2646:: with SMTP id m67mr3255545wmm.137.1598005788466; 
 Fri, 21 Aug 2020 03:29:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMB3DFWY6UyjEMn+SE/g+0d/YSurueZ30CAvkwJBlv3Vr5A8UtAz9T8IFjG+kF4M8FGKGSjg==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr3255520wmm.137.1598005788187; 
 Fri, 21 Aug 2020 03:29:48 -0700 (PDT)
Received: from steredhat (host-79-33-191-244.retail.telecomitalia.it.
 [79.33.191.244])
 by smtp.gmail.com with ESMTPSA id x11sm3449636wrl.28.2020.08.21.03.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:29:47 -0700 (PDT)
Date: Fri, 21 Aug 2020 12:29:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 15/15] block/nvme: Use an array of EventNotifier
Message-ID: <20200821102937.bartqudtcfesdmzr@steredhat>
References: <20200820165901.1139109-1-philmd@redhat.com>
 <20200820165901.1139109-16-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820165901.1139109-16-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 02:43:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 06:59:01PM +0200, Philippe Mathieu-Daudé wrote:
> In preparation of using multiple IRQ (thus multiple eventfds)
> make BDRVNVMeState::irq_notifier an array (for now of a single
> element, the admin queue notifier).
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/nvme.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index a61e86a83eb..fe8a40b7ede 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -106,6 +106,12 @@ QEMU_BUILD_BUG_ON(offsetof(NVMeRegs, doorbells) != 0x1000);
>  #define INDEX_ADMIN     0
>  #define INDEX_IO(n)     (1 + n)
>  
> +/* This driver shares a single MSIX IRQ for the admin and I/O queues */
> +enum {
> +    MSIX_SHARED_IRQ_IDX = 0,
> +    MSIX_IRQ_COUNT = 1
> +};
> +
>  struct BDRVNVMeState {
>      AioContext *aio_context;
>      QEMUVFIOState *vfio;
> @@ -120,7 +126,7 @@ struct BDRVNVMeState {
>      /* How many uint32_t elements does each doorbell entry take. */
>      size_t doorbell_scale;
>      bool write_cache_supported;
> -    EventNotifier irq_notifier;
> +    EventNotifier irq_notifier[MSIX_IRQ_COUNT];
>  
>      uint64_t nsze; /* Namespace size reported by identify command */
>      int nsid;      /* The namespace id to read/write data. */
> @@ -631,7 +637,8 @@ static bool nvme_poll_queues(BDRVNVMeState *s)
>  
>  static void nvme_handle_event(EventNotifier *n)
>  {
> -    BDRVNVMeState *s = container_of(n, BDRVNVMeState, irq_notifier);
> +    BDRVNVMeState *s = container_of(n, BDRVNVMeState,
> +                                    irq_notifier[MSIX_SHARED_IRQ_IDX]);
>  
>      trace_nvme_handle_event(s);
>      event_notifier_test_and_clear(n);
> @@ -683,7 +690,8 @@ out_error:
>  static bool nvme_poll_cb(void *opaque)
>  {
>      EventNotifier *e = opaque;
> -    BDRVNVMeState *s = container_of(e, BDRVNVMeState, irq_notifier);
> +    BDRVNVMeState *s = container_of(e, BDRVNVMeState,
> +                                    irq_notifier[MSIX_SHARED_IRQ_IDX]);
>  
>      trace_nvme_poll_cb(s);
>      return nvme_poll_queues(s);
> @@ -705,7 +713,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
>      s->device = g_strdup(device);
>      s->nsid = namespace;
>      s->aio_context = bdrv_get_aio_context(bs);
> -    ret = event_notifier_init(&s->irq_notifier, 0);
> +    ret = event_notifier_init(&s->irq_notifier[MSIX_SHARED_IRQ_IDX], 0);
>      if (ret) {
>          error_setg(errp, "Failed to init event notifier");
>          return ret;
> @@ -784,12 +792,13 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
>          }
>      }
>  
> -    ret = qemu_vfio_pci_init_irq(s->vfio, &s->irq_notifier,
> +    ret = qemu_vfio_pci_init_irq(s->vfio, s->irq_notifier,

Maybe we can use '&s->irq_notifier[MSIX_SHARED_IRQ_IDX]' to match the other
changes.

>                                   VFIO_PCI_MSIX_IRQ_INDEX, errp);
>      if (ret) {
>          goto out;
>      }
> -    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
> +    aio_set_event_notifier(bdrv_get_aio_context(bs),
> +                           &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
>                             false, nvme_handle_event, nvme_poll_cb);
>  
>      nvme_identify(bs, namespace, &local_err);
> @@ -872,9 +881,10 @@ static void nvme_close(BlockDriverState *bs)
>          nvme_free_queue_pair(s->queues[i]);
>      }
>      g_free(s->queues);
> -    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
> +    aio_set_event_notifier(bdrv_get_aio_context(bs),
> +                           &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
>                             false, NULL, NULL);
> -    event_notifier_cleanup(&s->irq_notifier);
> +    event_notifier_cleanup(&s->irq_notifier[MSIX_SHARED_IRQ_IDX]);
>      qemu_vfio_pci_unmap_bar(s->vfio, 0, (void *)s->regs, 0, NVME_BAR_SIZE);
>      qemu_vfio_close(s->vfio);
>  
> @@ -1381,7 +1391,8 @@ static void nvme_detach_aio_context(BlockDriverState *bs)
>          q->completion_bh = NULL;
>      }
>  
> -    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
> +    aio_set_event_notifier(bdrv_get_aio_context(bs),
> +                           &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
>                             false, NULL, NULL);
>  }
>  
> @@ -1391,7 +1402,7 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
>      BDRVNVMeState *s = bs->opaque;
>  
>      s->aio_context = new_context;
> -    aio_set_event_notifier(new_context, &s->irq_notifier,
> +    aio_set_event_notifier(new_context, &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
>                             false, nvme_handle_event, nvme_poll_cb);
>  
>      for (int i = 0; i < s->nr_queues; i++) {
> -- 
> 2.26.2
> 
> 


