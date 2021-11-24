Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5545845CCA7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:00:31 +0100 (CET)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxVO-0005bR-1Y
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:00:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpxNm-00009o-8g
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpxNe-0003YZ-Un
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637779950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b99NS0wRKHNZKP31RpjSTR7mBC1bD8sA4PlwudFIVEY=;
 b=JNghAWwquIT+tsDs43z5yRA2SVGCEKgI2v8j/HLGd4dqAIBjh7wshljI678i42iTpcJaWk
 O7+3X4jTeKwJfqJhiHDXwsI6PPwfFWbs/iZd2VPYn5R4w+BrQ2WUJVVbeceJiSXVyLzaec
 BrfuqWSnzcOdBCSmJ86Mq4jj2O87tfM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-JiN5BmPeOdeZAivQ2OrMHw-1; Wed, 24 Nov 2021 13:52:29 -0500
X-MC-Unique: JiN5BmPeOdeZAivQ2OrMHw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so715405wrc.22
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b99NS0wRKHNZKP31RpjSTR7mBC1bD8sA4PlwudFIVEY=;
 b=IuXjRCd1bD10af5VH8s1vGbW/5rpNNmzIqBv9q2j4CQjRXeQdnBDc28u4PewcyRmC6
 hc2ZUc1iVdXYoIMe+gJ5wQMNm+3ycfprfO5WT/JX4saghcN9iQ2+zYwpIxATTy6mFBGH
 ZEaDnVwc3D4g4YjNq4D1f0lWbEeqW+2p4X0qWQsx5lsOfpT/euSIyWP035BMyK5ab47k
 HFGI2v51HUZQdt+9raTlzqeYSesMaPHf4tKn4eEnu0NTGlaFGhG41Oy61FTRvkahUlCI
 HUcGWOEOWT6/v3JyIb6J7FYmoHks9iuZUoB9u9RC/EPhwiFEySHKDkNV90H/dl9aFJ1Q
 2MhA==
X-Gm-Message-State: AOAM532Vo7bEdRQu8PjNsnMez+xgkyNl27sKavrBlj3xBpf3Tz150R2S
 2zsSWAUVogsh7p+BWtNiPWgBQ69jn/lUJXlCSSORAvWQ+KO+PempWlM9MrLvXqKvs5fJTR5gB72
 5OMkIfVfFqLeRCeY=
X-Received: by 2002:adf:f001:: with SMTP id j1mr21154438wro.351.1637779947409; 
 Wed, 24 Nov 2021 10:52:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW5xRfS91ZjSD/Q+wwesbogWavmTPS5g/9Th84iO2ZRJYmRVQx4X+W2OnVC3/O+F81tsLLsg==
X-Received: by 2002:adf:f001:: with SMTP id j1mr21154411wro.351.1637779947189; 
 Wed, 24 Nov 2021 10:52:27 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l5sm5921700wms.16.2021.11.24.10.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 10:52:26 -0800 (PST)
Date: Wed, 24 Nov 2021 18:52:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 02/23] migration: Never call twice
 qemu_target_page_size()
Message-ID: <YZ6J6DIhNRheL+OO@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-3-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-3-quintela@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

OK, not much difference

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 7 ++++---
>  migration/multifd.c   | 7 ++++---
>  migration/savevm.c    | 5 +++--
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 2c1edb2cb9..3de11ae921 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -996,6 +996,8 @@ static void populate_time_info(MigrationInfo *info, MigrationState *s)
>  
>  static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>  {
> +    size_t page_size = qemu_target_page_size();
> +
>      info->has_ram = true;
>      info->ram = g_malloc0(sizeof(*info->ram));
>      info->ram->transferred = ram_counters.transferred;
> @@ -1004,12 +1006,11 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>      /* legacy value.  It is not used anymore */
>      info->ram->skipped = 0;
>      info->ram->normal = ram_counters.normal;
> -    info->ram->normal_bytes = ram_counters.normal *
> -        qemu_target_page_size();
> +    info->ram->normal_bytes = ram_counters.normal * page_size;
>      info->ram->mbps = s->mbps;
>      info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
>      info->ram->postcopy_requests = ram_counters.postcopy_requests;
> -    info->ram->page_size = qemu_target_page_size();
> +    info->ram->page_size = page_size;
>      info->ram->multifd_bytes = ram_counters.multifd_bytes;
>      info->ram->pages_per_second = s->pages_per_second;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7c9deb1921..8125d0015c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -289,7 +289,8 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  {
>      MultiFDPacket_t *packet = p->packet;
> -    uint32_t pages_max = MULTIFD_PACKET_SIZE / qemu_target_page_size();
> +    size_t page_size = qemu_target_page_size();
> +    uint32_t pages_max = MULTIFD_PACKET_SIZE / page_size;
>      RAMBlock *block;
>      int i;
>  
> @@ -358,14 +359,14 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>      for (i = 0; i < p->pages->used; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
> -        if (offset > (block->used_length - qemu_target_page_size())) {
> +        if (offset > (block->used_length - page_size)) {
>              error_setg(errp, "multifd: offset too long %" PRIu64
>                         " (max " RAM_ADDR_FMT ")",
>                         offset, block->used_length);
>              return -1;
>          }
>          p->pages->iov[i].iov_base = block->host + offset;
> -        p->pages->iov[i].iov_len = qemu_target_page_size();
> +        p->pages->iov[i].iov_len = page_size;
>      }
>  
>      return 0;
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d59e976d50..0bef031acb 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1685,6 +1685,7 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
>  {
>      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_ADVISE);
>      uint64_t remote_pagesize_summary, local_pagesize_summary, remote_tps;
> +    size_t page_size = qemu_target_page_size();
>      Error *local_err = NULL;
>  
>      trace_loadvm_postcopy_handle_advise();
> @@ -1741,13 +1742,13 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
>      }
>  
>      remote_tps = qemu_get_be64(mis->from_src_file);
> -    if (remote_tps != qemu_target_page_size()) {
> +    if (remote_tps != page_size) {
>          /*
>           * Again, some differences could be dealt with, but for now keep it
>           * simple.
>           */
>          error_report("Postcopy needs matching target page sizes (s=%d d=%zd)",
> -                     (int)remote_tps, qemu_target_page_size());
> +                     (int)remote_tps, page_size);
>          return -1;
>      }
>  
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


