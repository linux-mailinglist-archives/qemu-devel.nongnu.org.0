Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF4492E36
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:14:14 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tvp-0000HC-1F
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9tQl-0004ZA-MH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9tQQ-0002SG-1m
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642531300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NaYvfhmRtgKUjCJwJ+4vzFZzZ9zPrpafA2aQhSatmtE=;
 b=Ye80oeNGzAmQ9Kf2mhBY2NW69G6KoXW8e5RwtRwqL+gYU3+B1w83mXLVpA6lltZHsV4awc
 ZK8HqyxKTYAw0otQvEMFy8rrj15x9Dc1GEgm0h0UjX6/xRkz2ZqQb2SBq0SJ9sXvxLi8zJ
 Me+xFOn2MVPK6uhxvNUxsIRStFijXN0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-tj0mn5SwN0SAW2ZTodm1QA-1; Tue, 18 Jan 2022 13:41:39 -0500
X-MC-Unique: tj0mn5SwN0SAW2ZTodm1QA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso85071wmb.6
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 10:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NaYvfhmRtgKUjCJwJ+4vzFZzZ9zPrpafA2aQhSatmtE=;
 b=M8VqyYApcA+ikE5JwNJ0TmrF8sCVQ/4u+7qfjd/Ole2lVURIdKj1FQn46MprgVH5yT
 fLCJdT5/DOoPOa4txYzYRj/85CnqaqOymb64KMmPboB6ynuvWttB4v3hdtohwQNap6y/
 lxPkAh05Z+hQHhJZGC6dyW3IupYrNtfnqhiTXYtK9t9389LlEqNJTx1RR8/9CcU6o0Bq
 WNexopzVqhqWExD7a1eq0kVuua2Jgfh5y1PTfG9aL6p0JUr/so4A1tHcAxcHQyaTcPXJ
 cKP9LhQsmkKPln9gG9NBykAYyhTAP+fAnyELz2+tFfmkq8nBADosDGnk/TSU645AfPrM
 Ha9g==
X-Gm-Message-State: AOAM530JaTwGbSjrOGOxbUgnND1zrUAwsy/aZSkuPO/akTX2fGgfW9Hn
 DFRHM0qG6gAQZfzKVNMVHpfS3naUIHSSSrutn9O8xXHE8E5yRdGRSjPaXsE/HKgX/jKbNVOUdKW
 IrdVW1kca+IFrN08=
X-Received: by 2002:a5d:6e8a:: with SMTP id k10mr26241151wrz.113.1642531298078; 
 Tue, 18 Jan 2022 10:41:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz855hp2itL1JISH/4tRsldNHfSYHQgOQe/2RCwQvxTLUEAKF0x40A6ibVPlHLrbqakcBlQDw==
X-Received: by 2002:a5d:6e8a:: with SMTP id k10mr26241119wrz.113.1642531297755; 
 Tue, 18 Jan 2022 10:41:37 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f125sm3021426wmf.31.2022.01.18.10.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 10:41:37 -0800 (PST)
Date: Tue, 18 Jan 2022 18:41:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 14/23] multifd: Use normal pages array on the send side
Message-ID: <YecJ3yebH9ucslep@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-15-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-15-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We are only sending normal pages through multifd channels.
> Later on this series, we are going to also send zero pages.
> We are going to dectect if a page is zero or non zero in the multifd
                    ^ typo
> channel thread, not on the main thread.
> 
> So we receive an array of pages page->offset[N]
> 
> And we will end with:
> 
> p->normal[N - zero_pages]
> p->zero[zero_pages].
> 
> In this patch, we just copy all the pages in offset to normal.
> 
> for (i = 0; i < pages->num; i++) {
>     p->narmal[p->normal_num] = pages->offset[i];
          ^
>     p->normal_num++:
> }
> 
> Later in the series this becomes:
> 
> for (i = 0; i < pages->num; i++) {
>     if (buffer_is_zero(page->offset[i])) {
>         p->zerol[p->zero_num] = pages->offset[i];
                 ^
>         p->zero_num++:
>     } else {
>         p->narmal[p->normal_num] = pages->offset[i];
              ^
>         p->normal_num++:
>     }
> }
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 

Other than typo's:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> Improving comment (dave)
> Renaming num_normal_pages to total_normal_pages (peter)
> ---
>  migration/multifd.h      |  8 ++++++--
>  migration/multifd-zlib.c |  6 +++---
>  migration/multifd-zstd.c |  6 +++---
>  migration/multifd.c      | 30 +++++++++++++++++++-----------
>  migration/trace-events   |  4 ++--
>  5 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 7496f951a7..7823199dbe 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -104,14 +104,18 @@ typedef struct {
>      /* thread local variables */
>      /* packets sent through this channel */
>      uint64_t num_packets;
> -    /* pages sent through this channel */
> -    uint64_t num_pages;
> +    /* non zero pages sent through this channel */
> +    uint64_t total_normal_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
>      /* buffers to send */
>      struct iovec *iov;
>      /* number of iovs used */
>      uint32_t iovs_num;
> +    /* Pages that are not zero */
> +    ram_addr_t *normal;
> +    /* num of non zero pages */
> +    uint32_t normal_num;
>      /* used for compression methods */
>      void *data;
>  }  MultiFDSendParams;
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index ba90f1aaf4..7f4fbef2c9 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -106,16 +106,16 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>      int ret;
>      uint32_t i;
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          uint32_t available = z->zbuff_len - out_size;
>          int flush = Z_NO_FLUSH;
>  
> -        if (i == p->pages->num - 1) {
> +        if (i == p->normal_num - 1) {
>              flush = Z_SYNC_FLUSH;
>          }
>  
>          zs->avail_in = page_size;
> -        zs->next_in = p->pages->block->host + p->pages->offset[i];
> +        zs->next_in = p->pages->block->host + p->normal[i];
>  
>          zs->avail_out = available;
>          zs->next_out = z->zbuff + out_size;
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 757434d1ee..907d07805c 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -121,13 +121,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>      z->out.size = z->zbuff_len;
>      z->out.pos = 0;
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          ZSTD_EndDirective flush = ZSTD_e_continue;
>  
> -        if (i == p->pages->num - 1) {
> +        if (i == p->normal_num - 1) {
>              flush = ZSTD_e_flush;
>          }
> -        z->in.src = p->pages->block->host + p->pages->offset[i];
> +        z->in.src = p->pages->block->host + p->normal[i];
>          z->in.size = page_size;
>          z->in.pos = 0;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index e5b1fa5015..7b804928a2 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -89,13 +89,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>      MultiFDPages_t *pages = p->pages;
>      size_t page_size = qemu_target_page_size();
>  
> -    for (int i = 0; i < p->pages->num; i++) {
> -        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
> +    for (int i = 0; i < p->normal_num; i++) {
> +        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
>          p->iov[p->iovs_num].iov_len = page_size;
>          p->iovs_num++;
>      }
>  
> -    p->next_packet_size = p->pages->num * page_size;
> +    p->next_packet_size = p->normal_num * page_size;
>      p->flags |= MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>      packet->flags = cpu_to_be32(p->flags);
>      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> -    packet->pages_used = cpu_to_be32(p->pages->num);
> +    packet->pages_used = cpu_to_be32(p->normal_num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
>  
> @@ -270,9 +270,9 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
>      }
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          /* there are architectures where ram_addr_t is 32 bit */
> -        uint64_t temp = p->pages->offset[i];
> +        uint64_t temp = p->normal[i];
>  
>          packet->offset[i] = cpu_to_be64(temp);
>      }
> @@ -559,6 +559,8 @@ void multifd_save_cleanup(void)
>          p->packet = NULL;
>          g_free(p->iov);
>          p->iov = NULL;
> +        g_free(p->normal);
> +        p->normal = NULL;
>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -643,12 +645,17 @@ static void *multifd_send_thread(void *opaque)
>          qemu_mutex_lock(&p->mutex);
>  
>          if (p->pending_job) {
> -            uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
>              p->iovs_num = 1;
> +            p->normal_num = 0;
>  
> -            if (used) {
> +            for (int i = 0; i < p->pages->num; i++) {
> +                p->normal[p->normal_num] = p->pages->offset[i];
> +                p->normal_num++;
> +            }
> +
> +            if (p->normal_num) {
>                  ret = multifd_send_state->ops->send_prepare(p, &local_err);
>                  if (ret != 0) {
>                      qemu_mutex_unlock(&p->mutex);
> @@ -658,12 +665,12 @@ static void *multifd_send_thread(void *opaque)
>              multifd_send_fill_packet(p);
>              p->flags = 0;
>              p->num_packets++;
> -            p->num_pages += used;
> +            p->total_normal_pages += p->normal_num;
>              p->pages->num = 0;
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
>  
> -            trace_multifd_send(p->id, packet_num, used, flags,
> +            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
>                                 p->next_packet_size);
>  
>              p->iov[0].iov_len = p->packet_len;
> @@ -713,7 +720,7 @@ out:
>      qemu_mutex_unlock(&p->mutex);
>  
>      rcu_unregister_thread();
> -    trace_multifd_send_thread_end(p->id, p->num_packets, p->num_pages);
> +    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
>  
>      return NULL;
>  }
> @@ -913,6 +920,7 @@ int multifd_save_setup(Error **errp)
>          p->tls_hostname = g_strdup(s->hostname);
>          /* We need one extra place for the packet header */
>          p->iov = g_new0(struct iovec, page_count + 1);
> +        p->normal = g_new0(ram_addr_t, page_count);
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index 5172cb3b3d..171a83a55d 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -124,13 +124,13 @@ multifd_recv_sync_main_wait(uint8_t id) "channel %u"
>  multifd_recv_terminate_threads(bool error) "error %d"
>  multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
>  multifd_recv_thread_start(uint8_t id) "%u"
> -multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
> +multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u flags 0x%x next packet size %u"
>  multifd_send_error(uint8_t id) "channel %u"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
>  multifd_send_sync_main_signal(uint8_t id) "channel %u"
>  multifd_send_sync_main_wait(uint8_t id) "channel %u"
>  multifd_send_terminate_threads(bool error) "error %d"
> -multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %"  PRIu64
> +multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages) "channel %u packets %" PRIu64 " normal pages %"  PRIu64
>  multifd_send_thread_start(uint8_t id) "%u"
>  multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
>  multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


