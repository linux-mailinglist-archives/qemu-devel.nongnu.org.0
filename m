Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F36794C7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 11:08:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKGCu-0006EK-Px; Tue, 24 Jan 2023 05:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKGCq-0006Cn-B1
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKGCc-0008BZ-Lr
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674554813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJra4aSxaCadB2LeTx1Hkub9h0gKJ8k6pRFeR4b21ss=;
 b=Z3HPEVfaCMkQG+5B9h5vIDu7/m1mMhGCrvVuj3NKASBZVVWXs2zieOm0dfWfGGsBEf/iyr
 cF0ywMeuBoXTpv2RdN8wIZ8vvro1Iib/GUSEmSBRjmWtN7uwuJAHeYZ+z4S9rL8Zb7kQam
 erEK5+G9bZTtFE2s94PCFlRnH4D37jA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-R9M8Z_FMOWW8os-w6AoeIw-1; Tue, 24 Jan 2023 05:06:52 -0500
X-MC-Unique: R9M8Z_FMOWW8os-w6AoeIw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z22-20020a7bc7d6000000b003daf671f7b2so3728562wmk.9
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 02:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJra4aSxaCadB2LeTx1Hkub9h0gKJ8k6pRFeR4b21ss=;
 b=s28gZ0zwJHR1gjHGJZZpCXYxcKe+ag/jC3yH246W3FFJhcFYD1lbZUB1i5I+M6AmnC
 uSf0WfMnWLFwg4eXinB2BPYValqlcIsiXWu+OKxWUIMWIGY6kuXWliDcVB9Hgtp1Grk0
 7FIoi1FDZUvuXRFc9MuBhe0dqBGxX4eeS7UAwex2jVby46j6uiBtBGoQn5Dd75xdi5l5
 ahj1RK7bUtpnrU5dA9YVf4qiYyRUO3ACstssOu8GoNiusMYF5N7+DGm0MqR3aryvZHaB
 EV9sCFWhYQJF+oYJ/P/lP9Y6F7Nei1CiONxlysUz/6c0wuMFaY+Q5QDSaihq6FcN9cwf
 UiHw==
X-Gm-Message-State: AFqh2krfpeQoBTTEat3BX2U/IFe3gZFggb6Yz6KAAB8IK/tfMc4kGlIh
 sgf9OPpSrQt1uI7QLIgRGEqyavVSl5D1jybymEkXTpfYPX5OsAqwJBgCUp/Ka5Hhj2GYvVKnqeU
 TBSCvyfhoFUf1BcM=
X-Received: by 2002:a7b:c8cc:0:b0:3d1:ee6c:f897 with SMTP id
 f12-20020a7bc8cc000000b003d1ee6cf897mr25988890wml.3.1674554811163; 
 Tue, 24 Jan 2023 02:06:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyeQKbH5tZMHcmYjeToH0x2REKBBiR4lq1idedw6ydB3GeTIH3T6a/YF8rH5G0FRohpeX6Ww==
X-Received: by 2002:a7b:c8cc:0:b0:3d1:ee6c:f897 with SMTP id
 f12-20020a7bc8cc000000b003d1ee6cf897mr25988868wml.3.1674554810905; 
 Tue, 24 Jan 2023 02:06:50 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003dafadd2f77sm14326576wms.1.2023.01.24.02.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 02:06:50 -0800 (PST)
Date: Tue, 24 Jan 2023 10:06:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 10/21] ramblock: Add ramblock_file_map()
Message-ID: <Y8+tuN1t9EWMIuzk@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-11-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-11-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> Add a helper to do mmap() for a ramblock based on the cached informations.
> 
> A trivial thing to mention is we need to move ramblock->fd setup to be
> earlier, before the ramblock_file_map() call, because it'll need to
> reference the fd being mapped.  However that should not be a problem at
> all, majorly because the fd won't be freed if successful, and if it failed
> the fd will be freeed (or to be explicit, close()ed) by the caller.
> 
> Export it - prepare to be used outside this file.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/exec/ram_addr.h |  1 +
>  softmmu/physmem.c       | 25 +++++++++++++++++--------
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 0bf9cfc659..56db25009a 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -98,6 +98,7 @@ bool ramblock_is_pmem(RAMBlock *rb);
>  
>  long qemu_minrampagesize(void);
>  long qemu_maxrampagesize(void);
> +void *ramblock_file_map(RAMBlock *block);
>  
>  /**
>   * qemu_ram_alloc_from_file,
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 6096eac286..cdda7eaea5 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1532,17 +1532,31 @@ static int file_ram_open(const char *path,
>      return fd;
>  }
>  
> +/* Do the mmap() for a ramblock based on information already setup */
> +void *ramblock_file_map(RAMBlock *block)
> +{
> +    uint32_t qemu_map_flags;
> +
> +    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
> +    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
> +    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
> +    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
> +
> +    return qemu_ram_mmap(block->fd, block->mmap_length, block->mr->align,
> +                         qemu_map_flags, block->file_offset);
> +}
> +
>  static void *file_ram_alloc(RAMBlock *block,
>                              int fd,
>                              bool truncate,
>                              off_t offset,
>                              Error **errp)
>  {
> -    uint32_t qemu_map_flags;
>      void *area;
>  
>      /* Remember the offset just in case we'll need to map the range again */

Note that this comment is now wrong; you need to always set that for the
map call.

Other than that,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      block->file_offset = offset;
> +    block->fd = fd;
>      block->page_size = qemu_fd_getpagesize(fd);
>      if (block->mr->align % block->page_size) {
>          error_setg(errp, "alignment 0x%" PRIx64
> @@ -1588,19 +1602,14 @@ static void *file_ram_alloc(RAMBlock *block,
>          perror("ftruncate");
>      }
>  
> -    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
> -    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
> -    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
> -    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
> -    area = qemu_ram_mmap(fd, block->mmap_length, block->mr->align,
> -                         qemu_map_flags, offset);
> +    area = ramblock_file_map(block);
> +
>      if (area == MAP_FAILED) {
>          error_setg_errno(errp, errno,
>                           "unable to map backing store for guest RAM");
>          return NULL;
>      }
>  
> -    block->fd = fd;
>      return area;
>  }
>  #endif
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


