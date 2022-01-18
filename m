Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD50492ED2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:59:44 +0100 (CET)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9udr-0002Fj-Nu
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uAm-0006xn-I3
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:29:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uAi-0000XP-SS
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642534175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xiXnqXOZFTWBJ+nRk/RPjpQwg2uElhLAgaV4EQkffYo=;
 b=N0YYYsQkboOFLn++TTElEXZMN4TJshyZlkcgUzmSLq0+LaRZGMVXIEEzUCTViNMMa9Gd0h
 8bzvmTjmtf9igoDGlja+x+vvvgOJe7Fm+lGfmI1C15GKOtQniXm6QQKkA/loNGlTBJgncl
 NjEaR3lSF+Cd9reW7rkOjQaHFuPsDbg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-f8QpTIUhP86L9OKkcshnnQ-1; Tue, 18 Jan 2022 14:29:34 -0500
X-MC-Unique: f8QpTIUhP86L9OKkcshnnQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so2552591wme.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xiXnqXOZFTWBJ+nRk/RPjpQwg2uElhLAgaV4EQkffYo=;
 b=yh4odMonWy8r3xdT0iLjvauH5ODq4oIsx6ylNeOq/S0mrmgeem7dNhe78fCCfqRHfO
 pdqaAJeKojeqGLeC01L65BiuUQTPGH+E8r+yikA/kLkhQDzNQ4nOStsCNiUm00vRWZZ/
 ROK5DzHayyB2kC9iQuOE7XN+Bsyt8s8+QMpPp4/96BNDc2hvUo+XDKZ+gpDLPNPvqZe5
 IM2OgUkQZXPEr9Noq6J9mSM3hyJoh9fVSqorYzDLoc27Fjm3Hq/TMLBhztl7X2qvV76i
 bxJndqHj6tdM/silbLGxkoFYyTVmY/cOUfXvzhnYA7X50m2LNSHEizyW/IjrFU/omMuz
 OeCA==
X-Gm-Message-State: AOAM531fPWp2pQl0CID8VXt3MaFL5F90Wdyyao1T/j+QJjCh0JNLndkT
 BfY52qT5YEKVgPJlWZlM10IUypnjZVnlT5djvWWILHoxvJzRrBzDwH2zkxbVFUdZNkFESm1V0xi
 Ym6dmZXSpUfY13Sg=
X-Received: by 2002:adf:b60d:: with SMTP id f13mr15054143wre.225.1642534173197; 
 Tue, 18 Jan 2022 11:29:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUpi9Jxkd7gtqY88t7vX0wLuE4GImeZtnzt8pcXjP8TSrw5rgHMEe2wS2zkU8wrNZxkM+ToQ==
X-Received: by 2002:adf:b60d:: with SMTP id f13mr15054121wre.225.1642534172907; 
 Tue, 18 Jan 2022 11:29:32 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u13sm3286676wmq.41.2022.01.18.11.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:29:32 -0800 (PST)
Date: Tue, 18 Jan 2022 19:29:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 15/23] multifd: Use normal pages array on the recv side
Message-ID: <YecVGSw0ZRvG+nTx@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-16-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-16-quintela@redhat.com>
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
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> ---
> 
> Rename num_normal_pages to total_normal_pages (peter)
> ---
>  migration/multifd.h      |  8 +++++--
>  migration/multifd-zlib.c |  8 +++----
>  migration/multifd-zstd.c |  6 +++---
>  migration/multifd.c      | 45 ++++++++++++++++++----------------------
>  4 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 7823199dbe..850889c5d8 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -151,12 +151,16 @@ typedef struct {
>      uint32_t next_packet_size;
>      /* packets sent through this channel */
>      uint64_t num_packets;
> -    /* pages sent through this channel */
> -    uint64_t num_pages;
> +    /* non zero pages recv through this channel */
> +    uint64_t total_normal_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
>      /* buffers to recv */
>      struct iovec *iov;
> +    /* Pages that are not zero */
> +    ram_addr_t *normal;
> +    /* num of non zero pages */
> +    uint32_t normal_num;
>      /* used for de-compression methods */
>      void *data;
>  } MultiFDRecvParams;
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 7f4fbef2c9..8239c840d3 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -225,7 +225,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>      uint32_t in_size = p->next_packet_size;
>      /* we measure the change of total_out */
>      uint32_t out_size = zs->total_out;
> -    uint32_t expected_size = p->pages->num * qemu_target_page_size();
> +    uint32_t expected_size = p->normal_num * page_size;
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      int ret;
>      int i;
> @@ -244,16 +244,16 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>      zs->avail_in = in_size;
>      zs->next_in = z->zbuff;
>  
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          int flush = Z_NO_FLUSH;
>          unsigned long start = zs->total_out;
>  
> -        if (i == p->pages->num - 1) {
> +        if (i == p->normal_num - 1) {
>              flush = Z_SYNC_FLUSH;
>          }
>  
>          zs->avail_out = page_size;
> -        zs->next_out = p->pages->block->host + p->pages->offset[i];
> +        zs->next_out = p->pages->block->host + p->normal[i];
>  
>          /*
>           * Welcome to inflate semantics
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 907d07805c..c5ed72ddcd 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -242,7 +242,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>      uint32_t in_size = p->next_packet_size;
>      uint32_t out_size = 0;
>      size_t page_size = qemu_target_page_size();
> -    uint32_t expected_size = p->pages->num * page_size;
> +    uint32_t expected_size = p->normal_num * page_size;
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      struct zstd_data *z = p->data;
>      int ret;
> @@ -263,8 +263,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>      z->in.size = in_size;
>      z->in.pos = 0;
>  
> -    for (i = 0; i < p->pages->num; i++) {
> -        z->out.dst = p->pages->block->host + p->pages->offset[i];
> +    for (i = 0; i < p->normal_num; i++) {
> +        z->out.dst = p->pages->block->host + p->normal[i];
>          z->out.size = page_size;
>          z->out.pos = 0;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7b804928a2..e362b1bb89 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -146,11 +146,11 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>                     p->id, flags, MULTIFD_FLAG_NOCOMP);
>          return -1;
>      }
> -    for (int i = 0; i < p->pages->num; i++) {
> -        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
> +    for (int i = 0; i < p->normal_num; i++) {
> +        p->iov[i].iov_base = p->pages->block->host + p->normal[i];
>          p->iov[i].iov_len = page_size;
>      }
> -    return qio_channel_readv_all(p->c, p->iov, p->pages->num, errp);
> +    return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
>  }
>  
>  static MultiFDMethods multifd_nocomp_ops = {
> @@ -282,7 +282,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  {
>      MultiFDPacket_t *packet = p->packet;
>      size_t page_size = qemu_target_page_size();
> -    uint32_t pages_max = MULTIFD_PACKET_SIZE / page_size;
> +    uint32_t page_count = MULTIFD_PACKET_SIZE / page_size;
>      RAMBlock *block;
>      int i;
>  
> @@ -309,33 +309,25 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>       * If we received a packet that is 100 times bigger than expected
>       * just stop migration.  It is a magic number.
>       */
> -    if (packet->pages_alloc > pages_max * 100) {
> +    if (packet->pages_alloc > page_count) {
>          error_setg(errp, "multifd: received packet "
> -                   "with size %u and expected a maximum size of %u",
> -                   packet->pages_alloc, pages_max * 100) ;
> +                   "with size %u and expected a size of %u",
> +                   packet->pages_alloc, page_count) ;
>          return -1;
>      }
> -    /*
> -     * We received a packet that is bigger than expected but inside
> -     * reasonable limits (see previous comment).  Just reallocate.
> -     */
> -    if (packet->pages_alloc > p->pages->allocated) {
> -        multifd_pages_clear(p->pages);
> -        p->pages = multifd_pages_init(packet->pages_alloc);
> -    }
>  
> -    p->pages->num = be32_to_cpu(packet->pages_used);
> -    if (p->pages->num > packet->pages_alloc) {
> +    p->normal_num = be32_to_cpu(packet->pages_used);
> +    if (p->normal_num > packet->pages_alloc) {
>          error_setg(errp, "multifd: received packet "
>                     "with %u pages and expected maximum pages are %u",
> -                   p->pages->num, packet->pages_alloc) ;
> +                   p->normal_num, packet->pages_alloc) ;
>          return -1;
>      }
>  
>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>      p->packet_num = be64_to_cpu(packet->packet_num);
>  
> -    if (p->pages->num == 0) {
> +    if (p->normal_num == 0) {
>          return 0;
>      }
>  
> @@ -349,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>      }
>  
>      p->pages->block = block;
> -    for (i = 0; i < p->pages->num; i++) {
> +    for (i = 0; i < p->normal_num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
>          if (offset > (block->used_length - page_size)) {
> @@ -358,7 +350,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>                         offset, block->used_length);
>              return -1;
>          }
> -        p->pages->offset[i] = offset;
> +        p->normal[i] = offset;
>      }
>  
>      return 0;
> @@ -1022,6 +1014,8 @@ int multifd_load_cleanup(Error **errp)
>          p->packet = NULL;
>          g_free(p->iov);
>          p->iov = NULL;
> +        g_free(p->normal);
> +        p->normal = NULL;
>          multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
> @@ -1095,13 +1089,13 @@ static void *multifd_recv_thread(void *opaque)
>          flags = p->flags;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &= ~MULTIFD_FLAG_SYNC;
> -        trace_multifd_recv(p->id, p->packet_num, p->pages->num, flags,
> +        trace_multifd_recv(p->id, p->packet_num, p->normal_num, flags,
>                             p->next_packet_size);
>          p->num_packets++;
> -        p->num_pages += p->pages->num;
> +        p->total_normal_pages += p->normal_num;
>          qemu_mutex_unlock(&p->mutex);
>  
> -        if (p->pages->num) {
> +        if (p->normal_num) {
>              ret = multifd_recv_state->ops->recv_pages(p, &local_err);
>              if (ret != 0) {
>                  break;
> @@ -1123,7 +1117,7 @@ static void *multifd_recv_thread(void *opaque)
>      qemu_mutex_unlock(&p->mutex);
>  
>      rcu_unregister_thread();
> -    trace_multifd_recv_thread_end(p->id, p->num_packets, p->num_pages);
> +    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages);
>  
>      return NULL;
>  }
> @@ -1161,6 +1155,7 @@ int multifd_load_setup(Error **errp)
>          p->packet = g_malloc0(p->packet_len);
>          p->name = g_strdup_printf("multifdrecv_%d", i);
>          p->iov = g_new0(struct iovec, page_count);
> +        p->normal = g_new0(ram_addr_t, page_count);
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


