Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE8678559
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 19:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK1vI-00051R-EW; Mon, 23 Jan 2023 13:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pK1vG-000515-Qq
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 13:52:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pK1vF-0002t2-2n
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 13:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674499918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UjjT4J9HxHMveIDbMaJsTI9aPu2k4ZORdssrc63odAI=;
 b=ASQUA7TAaDbm6Vb5aoU/+Lbpjede1cKHJgI3WTO6zGU73WYl+gsKFEdeaQFpA5mPoQKfPx
 yWaPO2AIx8Q413nC5B/DTw8sXkgTbJPqnhS2YYCBLkWG4xsTAWB4gDZ0S45Q28Z9hWPTr6
 AUepPsNpsczlGs2f786I1aoDYqe3h98=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-7Gl2wWdoMLSh68hXaXpWIQ-1; Mon, 23 Jan 2023 13:51:55 -0500
X-MC-Unique: 7Gl2wWdoMLSh68hXaXpWIQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 t4-20020adfe444000000b002be53a83610so1748019wrm.15
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 10:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjjT4J9HxHMveIDbMaJsTI9aPu2k4ZORdssrc63odAI=;
 b=Hk+fv2BoXi+tnIwYC5U4FwiND1xrc9WIOKnEFK9VmklH6PiASXnInMchYjTXTq7+t4
 Y7yntGk0wP7j+OWhz5/S+ouewWd5dQW+UJUU4KgfO3UYc1joDMzknsIjE+1+g9sgTX9s
 NgB4xsnnlJu3mCwtMvD3lYZ7IQC/BiDCcUI/2bc/0bgTZfae/TFazH43hYhQKyzHWHIJ
 FhWvBsHQqD86+vpgeZL+xvSzSCLmU2mGucc1oy/Qi4NehzPqDF/voZlV7MpDtI7RTTYf
 J9zu0b+WXZy4jhcLFRjcqIpEOh+vqLTQzPEzwOhVV2vLu1d9mOkl4oMihHFAW3U4Shib
 Dhrw==
X-Gm-Message-State: AFqh2kosaGrij+TgtXZ0bM7PQiUWXWN6K8OzmhAE8WCSgPPVfoDTL7Xb
 Oot194oFI9kHZ39es7TKqaqFuFpc6cZpb64+J6+I6dd7CaxaRrazsNFQSMtD8aG3CqFwd6xQX/E
 7uCGlCg+uJrlLOVk=
X-Received: by 2002:adf:cd8f:0:b0:244:48b3:d12b with SMTP id
 q15-20020adfcd8f000000b0024448b3d12bmr22265849wrj.45.1674499914246; 
 Mon, 23 Jan 2023 10:51:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsR9+iGojZYfpWdMGNd8XN5foDOeib2nBKXoYyaGuulZNwNomRU9i3qZWM0BXOMn4i9kKeYCw==
X-Received: by 2002:adf:cd8f:0:b0:244:48b3:d12b with SMTP id
 q15-20020adfcd8f000000b0024448b3d12bmr22265834wrj.45.1674499914037; 
 Mon, 23 Jan 2023 10:51:54 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d624b000000b002be5bdbe40csm109359wrv.27.2023.01.23.10.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:51:53 -0800 (PST)
Date: Mon, 23 Jan 2023 18:51:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 08/21] ramblock: Cache the length to do file mmap()
 on ramblocks
Message-ID: <Y87XR8U1FaQVVJO+@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-9-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-9-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> We do proper page size alignment for file backed mmap()s for ramblocks.
> Even if it's as simple as that, cache the value because it'll be used in
> multiple places.
> 
> Since at it, drop size for file_ram_alloc() and just use max_length because
> that's always true for file-backed ramblocks.

Having a length previously called 'memory' was a bit odd!

> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/exec/ramblock.h |  2 ++
>  softmmu/physmem.c       | 14 +++++++-------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> index 76cd0812c8..3f31ce1591 100644
> --- a/include/exec/ramblock.h
> +++ b/include/exec/ramblock.h
> @@ -32,6 +32,8 @@ struct RAMBlock {
>      ram_addr_t offset;
>      ram_addr_t used_length;
>      ram_addr_t max_length;
> +    /* Only used for file-backed ramblocks */
> +    ram_addr_t mmap_length;
>      void (*resized)(const char*, uint64_t length, void *host);
>      uint32_t flags;
>      /* Protected by iothread lock.  */
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index aa1a7466e5..b5be02f1cb 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1533,7 +1533,6 @@ static int file_ram_open(const char *path,
>  }
>  
>  static void *file_ram_alloc(RAMBlock *block,
> -                            ram_addr_t memory,
>                              int fd,
>                              bool readonly,
>                              bool truncate,
> @@ -1563,14 +1562,14 @@ static void *file_ram_alloc(RAMBlock *block,
>      }
>  #endif
>  
> -    if (memory < block->page_size) {
> +    if (block->max_length < block->page_size) {
>          error_setg(errp, "memory size 0x" RAM_ADDR_FMT " must be equal to "
>                     "or larger than page size 0x%zx",
> -                   memory, block->page_size);
> +                   block->max_length, block->page_size);
>          return NULL;
>      }
>  
> -    memory = ROUND_UP(memory, block->page_size);
> +    block->mmap_length = ROUND_UP(block->max_length, block->page_size);
>  
>      /*
>       * ftruncate is not supported by hugetlbfs in older
> @@ -1586,7 +1585,7 @@ static void *file_ram_alloc(RAMBlock *block,
>       * those labels. Therefore, extending the non-empty backend file
>       * is disabled as well.
>       */
> -    if (truncate && ftruncate(fd, memory)) {
> +    if (truncate && ftruncate(fd, block->mmap_length)) {
>          perror("ftruncate");
>      }
>  
> @@ -1594,7 +1593,8 @@ static void *file_ram_alloc(RAMBlock *block,
>      qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
>      qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
>      qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
> -    area = qemu_ram_mmap(fd, memory, block->mr->align, qemu_map_flags, offset);
> +    area = qemu_ram_mmap(fd, block->mmap_length, block->mr->align,
> +                         qemu_map_flags, offset);
>      if (area == MAP_FAILED) {
>          error_setg_errno(errp, errno,
>                           "unable to map backing store for guest RAM");
> @@ -2100,7 +2100,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
>      new_block->used_length = size;
>      new_block->max_length = size;
>      new_block->flags = ram_flags;
> -    new_block->host = file_ram_alloc(new_block, size, fd, readonly,
> +    new_block->host = file_ram_alloc(new_block, fd, readonly,
>                                       !file_size, offset, errp);
>      if (!new_block->host) {
>          g_free(new_block);
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


