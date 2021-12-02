Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43744466277
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 12:38:24 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mskPu-0005Lm-RO
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 06:38:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mskOa-0003we-Ot
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:37:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mskOW-0001l6-1y
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638445014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WRJ4u/5gFGBpdJ2D4GbGcNO1+qNQv2YuE2D4KudAY7Y=;
 b=YNWDKOlfr7XSRzqdhmZC1MKbrUBzjCTJsNrbhJfUZSMaaNtVxwFm4qH9OUJGEDTe//n45d
 pyx0CR2LxTWW7pxzPdialRqBDFCWGHnHgd6FhQlIfBYfOV+8JiFS7echqugdAzF9jfNICk
 7jV0bvw9SXBH6qNlC75rghEdthyJ7WI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-deFM_3BbPVqXHL0yzJAO2w-1; Thu, 02 Dec 2021 06:36:53 -0500
X-MC-Unique: deFM_3BbPVqXHL0yzJAO2w-1
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so4952597wro.19
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 03:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WRJ4u/5gFGBpdJ2D4GbGcNO1+qNQv2YuE2D4KudAY7Y=;
 b=bJNKRf2kfVaffHIfPFMYZODhL7iRz4tM1H+sSyLpT4SoOqKIw5e1svG/Ee05QtnmgA
 /AbJGMo7vUMu2Tuz7srSx1i6iCMMIlRiFoH88UsAh5i9lYt0Z4IE6Sw/A8/Jfr4I/T1+
 RNia1vpvQjG1la7fLQaVs787Puuu7JL6+THh9m9Rlr/GUzNS1R7TiE+eleVHSB1XLY/Y
 a4Sit4MoueQAwkHUT69K8+MWZ1INLkIpZ7DAF4Yl0it92P/uQSf4lqj+bEz2omFivelz
 GZkThguzMyfXjo9HVrWwvvIdn7BbVpLGppbZidoVgy1fvvAmUEGDGAEI2NeMCeVpt2TP
 Lc8g==
X-Gm-Message-State: AOAM531VQW9eKK9kenPtfAya43xWif+CtXVm+hxgc50KT2V7seUSDFyC
 hjsFGXaxrBrFk+jABtJBOwy3rXmJAgTKkrTSultDR3UIH2QzIv1DbG9QR/4mmJQj9hKDyL4C8TX
 o1KfQIi0PSGw2e+k=
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr5947037wmj.30.1638445011877; 
 Thu, 02 Dec 2021 03:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtm7EtKm/Ym2ybKRCjzkVeC0gjwGK88JIzNxW5VeZ8tFty+7LwK0XLD7sXe9WVhidichr16g==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr5947017wmj.30.1638445011638; 
 Thu, 02 Dec 2021 03:36:51 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id j18sm2365178wmq.44.2021.12.02.03.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 03:36:50 -0800 (PST)
Date: Thu, 2 Dec 2021 11:36:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 21/23] multifd: Support for zero pages transmission
Message-ID: <Yaiv0PazlhLdsf0O@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-22-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-22-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> This patch adds counters and similar.  Logic will be added on the
> following patch.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h    | 13 ++++++++++++-
>  migration/multifd.c    | 22 +++++++++++++++++++---
>  migration/trace-events |  2 +-
>  3 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 39e55d7f05..973315b545 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -49,7 +49,10 @@ typedef struct {
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      uint64_t packet_num;
> -    uint64_t unused[4];    /* Reserved for future use */
> +    /* zero pages */
> +    uint32_t zero_pages;

Had you considered just adding a flag, MULTIFD_FLAG_ZERO to the packet?

> +    uint32_t unused32[1];    /* Reserved for future use */
> +    uint64_t unused64[3];    /* Reserved for future use */
>      char ramblock[256];
>      uint64_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
> @@ -117,6 +120,10 @@ typedef struct {
>      ram_addr_t *normal;
>      /* num of non zero pages */
>      uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>      /* used for compression methods */
>      void *data;
>  }  MultiFDSendParams;
> @@ -162,6 +169,10 @@ typedef struct {
>      ram_addr_t *normal;
>      /* num of non zero pages */
>      uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>      /* used for de-compression methods */
>      void *data;
>  } MultiFDRecvParams;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index d1ab823f98..2e4dffd6c6 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -265,6 +265,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>      packet->normal_pages = cpu_to_be32(p->normal_num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
> +    packet->zero_pages = cpu_to_be32(p->zero_num);
>  
>      if (p->pages->block) {
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
> @@ -327,7 +328,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>      p->packet_num = be64_to_cpu(packet->packet_num);
>  
> -    if (p->normal_num == 0) {
> +    p->zero_num = be32_to_cpu(packet->zero_pages);
> +    if (p->zero_num > packet->pages_alloc - p->normal_num) {
> +        error_setg(errp, "multifd: received packet "
> +                   "with %d zero pages and expected maximum pages are %d",
> +                   p->normal_num, packet->pages_alloc - p->zero_num) ;

should that be p->zero_num, packet->pages_alloc - p->normal_num ?
(and be %u)

Dave

> +        return -1;
> +    }
> +
> +    if (p->normal_num == 0 && p->zero_num == 0) {
>          return 0;
>      }
>  
> @@ -550,6 +559,8 @@ void multifd_save_cleanup(void)
>          p->iov = NULL;
>          g_free(p->normal);
>          p->normal = NULL;
> +        g_free(p->zero);
> +        p->zero = NULL;
>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -638,6 +649,7 @@ static void *multifd_send_thread(void *opaque)
>              uint32_t flags = p->flags;
>              p->iovs_num = 1;
>              p->normal_num = 0;
> +            p->zero_num = 0;
>  
>              for (int i = 0; i < p->pages->num; i++) {
>                  p->normal[p->normal_num] = p->pages->offset[i];
> @@ -659,8 +671,8 @@ static void *multifd_send_thread(void *opaque)
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
>  
> -            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
> -                               p->next_packet_size);
> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
> +                               flags, p->next_packet_size);
>  
>              p->iov[0].iov_len = p->packet_len;
>              p->iov[0].iov_base = p->packet;
> @@ -910,6 +922,7 @@ int multifd_save_setup(Error **errp)
>          /* We need one extra place for the packet header */
>          p->iov = g_new0(struct iovec, page_count + 1);
>          p->normal = g_new0(ram_addr_t, page_count);
> +        p->zero = g_new0(ram_addr_t, page_count);
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
>  
> @@ -1011,6 +1024,8 @@ int multifd_load_cleanup(Error **errp)
>          p->iov = NULL;
>          g_free(p->normal);
>          p->normal = NULL;
> +        g_free(p->zero);
> +        p->zero = NULL;
>          multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
> @@ -1150,6 +1165,7 @@ int multifd_load_setup(Error **errp)
>          p->name = g_strdup_printf("multifdrecv_%d", i);
>          p->iov = g_new0(struct iovec, page_count);
>          p->normal = g_new0(ram_addr_t, page_count);
> +        p->zero = g_new0(ram_addr_t, page_count);
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> diff --git a/migration/trace-events b/migration/trace-events
> index af8dee9af0..608decbdcc 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -124,7 +124,7 @@ multifd_recv_sync_main_wait(uint8_t id) "channel %d"
>  multifd_recv_terminate_threads(bool error) "error %d"
>  multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %" PRIu64
>  multifd_recv_thread_start(uint8_t id) "%d"
> -multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " normal pages %d flags 0x%x next packet size %d"
> +multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t zero, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " normal pages %d zero pages %d flags 0x%x next packet size %d"
>  multifd_send_error(uint8_t id) "channel %d"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
>  multifd_send_sync_main_signal(uint8_t id) "channel %d"
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


