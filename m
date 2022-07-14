Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F1574A22
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:07:25 +0200 (CEST)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvki-00042k-VL
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBvbr-0003eg-Dn
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBvbn-0002UV-Nn
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657792691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gZKs5TELztHuVx9/RkUzEig6Uocq2RiIKNtfmSeBc78=;
 b=RSV5DDw3k/nbCZuNSP4KgChDf61BkOkzZZ9qyjTinIIPjvv0euy2Nw+J/p/zgs/6t3USHE
 /EzloCul+jaDi2BMd1cageGtX3cWmUsXplBwHlg58iNJrXvaikyHt7iatvwUJd1z8WT6Le
 LDUhxJh4aCgorE60NJAoFbM51ysapDw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-iphRgGJgNtqSxwHOVSMhQg-1; Thu, 14 Jul 2022 05:58:09 -0400
X-MC-Unique: iphRgGJgNtqSxwHOVSMhQg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso1234047wmb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gZKs5TELztHuVx9/RkUzEig6Uocq2RiIKNtfmSeBc78=;
 b=SpKPOniKoQ6GqJSLtO0zTsPgAuc3dqxMCi1B3mBOS70rMm6QPJc5oUufEt7cqazLbd
 KHw/zunO3joQrrjr6q1EiS8yLreLUV2S3j5xQTYaXAivrBT+KrTuXvW4RXTuMvEAxO/V
 hDm/MxDxw5bWfgnNDVI9ydpmmtnZsHP8rh8p5ACl2S7RD2MtVrgwUuCiyyJNHWI4vuQU
 RFjl2n2/kA7yL4uiMIhGb0cVC77vwcWCMPTAP71zmV8NBOVdKaQJyHHHi6JWaMcaufoS
 v9SRcCnNkQXVhoekbjwI86kVdANdW6FIJyPlPUWjIvEQStnbzh2duwwp93x11Nj8l/8s
 XWcQ==
X-Gm-Message-State: AJIora+E6SgQNMJHDNLVhlhmEaOEt3JTQ3KtHmFtPO4HFFw5GKZXtV7H
 UP0DLOXLfH3z/miy6J5ckAJ6D1ASHNHHHv1VlmftaZ8PZqSSR+gfID6pjAW/LcsVn7nuQP+PKjG
 fHQxWI4lqnS6M55k=
X-Received: by 2002:a5d:5087:0:b0:21d:9925:e15a with SMTP id
 a7-20020a5d5087000000b0021d9925e15amr7213028wrt.43.1657792688445; 
 Thu, 14 Jul 2022 02:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1seLz3WiEowshMeT7ASxlsgQlPHpef/h3bwUt5Jw/Z2ABJswIXqOJNUe/7AufA9dzen+TFIrg==
X-Received: by 2002:a5d:5087:0:b0:21d:9925:e15a with SMTP id
 a7-20020a5d5087000000b0021d9925e15amr7213006wrt.43.1657792688143; 
 Thu, 14 Jul 2022 02:58:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b003a305c0ab06sm276003wmq.31.2022.07.14.02.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:58:07 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:58:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 02/13] multifd: Create page_size fields into both
 MultiFD{Recv,Send}Params
Message-ID: <Ys/orSxmBRVfgRIO@work-vm>
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

Yeh, I still suspect the right answer is to make qemu_target_page_size()
trivially fast, but for now;


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Juan Quintela <quintela@redhat.com>
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
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


