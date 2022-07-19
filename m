Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0757A1BE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:37:12 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoLX-0000LI-N9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDoIv-0005f8-B6
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDoIr-0001l2-UA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658241265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bs53Y/Ugpt1LZb3jl+qbKY4H7UllEsiEgz1/k1ghgLo=;
 b=W9ewrBGr/czsdAUHyrmlY6engdNjCAOWZ14C6viPQPAY0VEtpSqIRHyNfxzcRoFFSpR1hF
 vU+X7QFvLRrUd6xstqIVBAbLVz2+L86fXLTs3TWqZ1FPHFu4LjGPICm8BWcg7ih5AmWCrd
 L0q3BNddSnw2mtf1Eb/mURN758gZ664=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-4U1WE3dJNa2LkdQOChmXug-1; Tue, 19 Jul 2022 10:34:23 -0400
X-MC-Unique: 4U1WE3dJNa2LkdQOChmXug-1
Received: by mail-wm1-f70.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so10337336wmq.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bs53Y/Ugpt1LZb3jl+qbKY4H7UllEsiEgz1/k1ghgLo=;
 b=jrVDe5/YOmPY/bMSJ8HvsRHBxTCI+N+7mUySsdI/k3kXOVMHjHSxnS4wbVGMw7kSKB
 +8Ovrp5qE+Udcn454KY3hq0TPvlNfPIRRFy2MskEty4HK6PYxVWxx5AqvBvTjtfLdkry
 De1jNkBMfuNtfAyjcq5R+Ykrtn4mGVfo2F20BQdEqnr9StCq/hzosmQZcDPOBwua9ArH
 Q+6sAt+xuIM80WOp8gxTal5YNv983kt+vKmZBpXvc1f291LP8S+6xcDqEEND0EFCGOYE
 0b5jEEg2bm5A4nB3JR+6hKS/RhxEXyMHGvIZcYk6DDppHTKzk/vIViIYnw7fj+1Q4iB2
 F9bA==
X-Gm-Message-State: AJIora9pl+jlP8lROCh/jHqZwTGnCMfvHigPh7rR1/P8x24fanpZkgKM
 KFuev5VY68Aqg/0gufMgO484Z9uSsCle0xOqMie/l0fSgAJ+50iP0PtnjIH9a/idRyfe0/fKDNv
 WT3ZLXxjYXgR6to8=
X-Received: by 2002:a05:6000:1841:b0:21d:b6ca:2e19 with SMTP id
 c1-20020a056000184100b0021db6ca2e19mr27668827wri.599.1658241262231; 
 Tue, 19 Jul 2022 07:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2pIO6Q5JCDcbdORBEySlFGeF3Gf/xG9jPs68FmMThHTfULaBlJDaRAzuu8/hAiQ7ERi8PjA==
X-Received: by 2002:a05:6000:1841:b0:21d:b6ca:2e19 with SMTP id
 c1-20020a056000184100b0021db6ca2e19mr27668811wri.599.1658241261957; 
 Tue, 19 Jul 2022 07:34:21 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a3200bc788sm5288180wmq.33.2022.07.19.07.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 07:34:21 -0700 (PDT)
Date: Tue, 19 Jul 2022 15:34:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 02/13] multifd: Create page_size fields into both
 MultiFD{Recv, Send}Params
Message-ID: <YtbA6xaARIxbU3NT@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-3-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Juan Quintela (quintela@redhat.com) wrote:
> We were calling qemu_target_page_size() left and right.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

This needs rebasing.

Dave

> ---
>  migration/multifd.h      |  4 ++++
>  migration/multifd-zlib.c | 12 +++++-------
>  migration/multifd-zstd.c | 12 +++++-------
>  migration/multifd.c      | 18 ++++++++----------
>  4 files changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 345cfdb50c..9e07dd00f4 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -80,6 +80,8 @@ typedef struct {
>      bool registered_yank;
>      /* packet allocated len */
>      uint32_t packet_len;
> +    /* guest page size */
> +    uint32_t page_size;
>      /* multifd flags for sending ram */
>      int write_flags;
>  
> @@ -143,6 +145,8 @@ typedef struct {
>      QIOChannel *c;
>      /* packet allocated len */
>      uint32_t packet_len;
> +    /* guest page size */
> +    uint32_t page_size;
>  
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 3a7ae44485..28349ff2e0 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -100,7 +100,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>  static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct zlib_data *z = p->data;
> -    size_t page_size = qemu_target_page_size();
>      z_stream *zs = &z->zs;
>      uint32_t out_size = 0;
>      int ret;
> @@ -114,7 +113,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>              flush = Z_SYNC_FLUSH;
>          }
>  
> -        zs->avail_in = page_size;
> +        zs->avail_in = p->page_size;
>          zs->next_in = p->pages->block->host + p->normal[i];
>  
>          zs->avail_out = available;
> @@ -220,12 +219,11 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
>  static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      struct zlib_data *z = p->data;
> -    size_t page_size = qemu_target_page_size();
>      z_stream *zs = &z->zs;
>      uint32_t in_size = p->next_packet_size;
>      /* we measure the change of total_out */
>      uint32_t out_size = zs->total_out;
> -    uint32_t expected_size = p->normal_num * page_size;
> +    uint32_t expected_size = p->normal_num * p->page_size;
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      int ret;
>      int i;
> @@ -252,7 +250,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>              flush = Z_SYNC_FLUSH;
>          }
>  
> -        zs->avail_out = page_size;
> +        zs->avail_out = p->page_size;
>          zs->next_out = p->host + p->normal[i];
>  
>          /*
> @@ -266,8 +264,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>          do {
>              ret = inflate(zs, flush);
>          } while (ret == Z_OK && zs->avail_in
> -                             && (zs->total_out - start) < page_size);
> -        if (ret == Z_OK && (zs->total_out - start) < page_size) {
> +                             && (zs->total_out - start) < p->page_size);
> +        if (ret == Z_OK && (zs->total_out - start) < p->page_size) {
>              error_setg(errp, "multifd %u: inflate generated too few output",
>                         p->id);
>              return -1;
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index d788d309f2..f4a8e1ed1f 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -113,7 +113,6 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
>  static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct zstd_data *z = p->data;
> -    size_t page_size = qemu_target_page_size();
>      int ret;
>      uint32_t i;
>  
> @@ -128,7 +127,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>              flush = ZSTD_e_flush;
>          }
>          z->in.src = p->pages->block->host + p->normal[i];
> -        z->in.size = page_size;
> +        z->in.size = p->page_size;
>          z->in.pos = 0;
>  
>          /*
> @@ -241,8 +240,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t in_size = p->next_packet_size;
>      uint32_t out_size = 0;
> -    size_t page_size = qemu_target_page_size();
> -    uint32_t expected_size = p->normal_num * page_size;
> +    uint32_t expected_size = p->normal_num * p->page_size;
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      struct zstd_data *z = p->data;
>      int ret;
> @@ -265,7 +263,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>  
>      for (i = 0; i < p->normal_num; i++) {
>          z->out.dst = p->host + p->normal[i];
> -        z->out.size = page_size;
> +        z->out.size = p->page_size;
>          z->out.pos = 0;
>  
>          /*
> @@ -279,8 +277,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>          do {
>              ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
>          } while (ret > 0 && (z->in.size - z->in.pos > 0)
> -                         && (z->out.pos < page_size));
> -        if (ret > 0 && (z->out.pos < page_size)) {
> +                         && (z->out.pos < p->page_size));
> +        if (ret > 0 && (z->out.pos < p->page_size)) {
>              error_setg(errp, "multifd %u: decompressStream buffer too small",
>                         p->id);
>              return -1;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9282ab6aa4..7505aa3412 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -87,15 +87,14 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
>  static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      MultiFDPages_t *pages = p->pages;
> -    size_t page_size = qemu_target_page_size();
>  
>      for (int i = 0; i < p->normal_num; i++) {
>          p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
> -        p->iov[p->iovs_num].iov_len = page_size;
> +        p->iov[p->iovs_num].iov_len = p->page_size;
>          p->iovs_num++;
>      }
>  
> -    p->next_packet_size = p->normal_num * page_size;
> +    p->next_packet_size = p->normal_num * p->page_size;
>      p->flags |= MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -139,7 +138,6 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
>  static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
> -    size_t page_size = qemu_target_page_size();
>  
>      if (flags != MULTIFD_FLAG_NOCOMP) {
>          error_setg(errp, "multifd %u: flags received %x flags expected %x",
> @@ -148,7 +146,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>      }
>      for (int i = 0; i < p->normal_num; i++) {
>          p->iov[i].iov_base = p->host + p->normal[i];
> -        p->iov[i].iov_len = page_size;
> +        p->iov[i].iov_len = p->page_size;
>      }
>      return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
>  }
> @@ -281,8 +279,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  {
>      MultiFDPacket_t *packet = p->packet;
> -    size_t page_size = qemu_target_page_size();
> -    uint32_t page_count = MULTIFD_PACKET_SIZE / page_size;
> +    uint32_t page_count = MULTIFD_PACKET_SIZE / p->page_size;
>      RAMBlock *block;
>      int i;
>  
> @@ -344,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>      for (i = 0; i < p->normal_num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
> -        if (offset > (block->used_length - page_size)) {
> +        if (offset > (block->used_length - p->page_size)) {
>              error_setg(errp, "multifd: offset too long %" PRIu64
>                         " (max " RAM_ADDR_FMT ")",
>                         offset, block->used_length);
> @@ -433,8 +430,7 @@ static int multifd_send_pages(QEMUFile *f)
>      p->packet_num = multifd_send_state->packet_num++;
>      multifd_send_state->pages = p->pages;
>      p->pages = pages;
> -    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
> -                + p->packet_len;
> +    transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
>      qemu_file_update_transfer(f, transferred);
>      ram_counters.multifd_bytes += transferred;
>      ram_counters.transferred += transferred;
> @@ -939,6 +935,7 @@ int multifd_save_setup(Error **errp)
>          /* We need one extra place for the packet header */
>          p->iov = g_new0(struct iovec, page_count + 1);
>          p->normal = g_new0(ram_addr_t, page_count);
> +        p->page_size = qemu_target_page_size();
>  
>          if (migrate_use_zero_copy_send()) {
>              p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1186,6 +1183,7 @@ int multifd_load_setup(Error **errp)
>          p->name = g_strdup_printf("multifdrecv_%d", i);
>          p->iov = g_new0(struct iovec, page_count);
>          p->normal = g_new0(ram_addr_t, page_count);
> +        p->page_size = qemu_target_page_size();
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


