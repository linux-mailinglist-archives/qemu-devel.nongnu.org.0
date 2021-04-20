Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1DC365616
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:22:55 +0200 (CEST)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnWw-0004Om-Mv
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnV5-0003Q8-JT
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnV3-0002pN-7J
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5bYXPAQVVhUDCS0O99hs7b6BlpdMHRI2vkwQfHrBHM=;
 b=AEwJX9fjZaQ3VfiHWH7iYRBWp6SLqrVzu5R04V9amB1fjGoFLXUWY+ZqSCHBEI6uxw9bJb
 2JJ+Sozt6do31RkdNbJ1J7Sn/C3r2oIDD4BOYC7I45c7Ed/WF4ZmNnFEP36U4XyI7mTt4h
 5nb32gONNbH85S1tVGY1Xb1f7595Cbw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-4QO7XJFUM7ungslp_TC9vA-1; Tue, 20 Apr 2021 06:20:54 -0400
X-MC-Unique: 4QO7XJFUM7ungslp_TC9vA-1
Received: by mail-wr1-f71.google.com with SMTP id
 32-20020adf84230000b029010705438fbfso5521724wrf.21
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+5bYXPAQVVhUDCS0O99hs7b6BlpdMHRI2vkwQfHrBHM=;
 b=boWUrzklSfN33OsHkgDzlXxNMBXVP+mlb4oUT0itHAxOmhYTPfEdGEjX5R4N3a5BXW
 csuqjCa2Us2EXOKHrsCTQdEPqUfSwfBu+UZo8PIUxSts2U3kjner6RbnFqhaYFnJjYnK
 WXhDhBOJDvKz/E8ctQHOWIfcoh9MEbWwKu3J2qPyqVSc8WPW5X6T9ICax40bgIL/g338
 iQ/YRM8fIzfp5WsuE7PpBJCIKwLlA3v2JNWepZNPkWjjRGyCCMeDCfCPFVvHUaOOxkeN
 pwCevvOfBbPqefL+InUsimKD0jU7I+8KvwJEGYGukRiYYy5FNjihEBF2/TwZk3PViujO
 naZw==
X-Gm-Message-State: AOAM530kDZfV7FQwhpIK8LxW8nG+1dITcMGCkSYPQgOpDJGmEESDSJ5Y
 v+/AV5cjZme5l3hmKFhk8nVF4YPjqcAI3EF3rUaZ54rV3EE/CBwKMagsxahIp6miaF1+kea8yc2
 acrMVtVxfpMnMFUE=
X-Received: by 2002:adf:e608:: with SMTP id p8mr19976588wrm.249.1618914053159; 
 Tue, 20 Apr 2021 03:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy27HPtgBmLHODGlLNQf1GdVga3oyWck3BsQrArhRdGLY5Fm4+Uv4XCLS5eyfb7RVGpA2zqQ==
X-Received: by 2002:adf:e608:: with SMTP id p8mr19976565wrm.249.1618914053022; 
 Tue, 20 Apr 2021 03:20:53 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l5sm2765095wmh.0.2021.04.20.03.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:20:52 -0700 (PDT)
Subject: Re: [PATCH v5 05/14] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-6-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <34931ee0-1bde-16f5-d929-1c9d9157f45a@redhat.com>
Date: Tue, 20 Apr 2021 12:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-6-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's forward ram_flags instead, renaming
> memory_region_init_ram_shared_nomigrate() into
> memory_region_init_ram_flags_nomigrate(). Forward flags to
> qemu_ram_alloc() and qemu_ram_alloc_internal().
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  backends/hostmem-ram.c                        |  6 +++--
>  hw/m68k/next-cube.c                           |  4 ++--
>  include/exec/memory.h                         | 24 +++++++++----------
>  include/exec/ram_addr.h                       |  2 +-
>  .../memory-region-housekeeping.cocci          |  8 +++----
>  softmmu/memory.c                              | 20 ++++++++--------

OK up to here, but the qemu_ram_alloc_internal() changes
in softmmu/physmem.c belong to a different patch (except
the line adding "new_block->flags = ram_flags").
Do you mind splitting it?

> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cc59f05593..fdcd38ba61 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2108,12 +2108,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>                                    void (*resized)(const char*,
>                                                    uint64_t length,
>                                                    void *host),
> -                                  void *host, bool resizeable, bool share,
> +                                  void *host, uint32_t ram_flags,
>                                    MemoryRegion *mr, Error **errp)
>  {
>      RAMBlock *new_block;
>      Error *local_err = NULL;
>  
> +    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE)) == 0);
> +
>      size = HOST_PAGE_ALIGN(size);
>      max_size = HOST_PAGE_ALIGN(max_size);
>      new_block = g_malloc0(sizeof(*new_block));
> @@ -2125,15 +2127,10 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>      new_block->fd = -1;
>      new_block->page_size = qemu_real_host_page_size;
>      new_block->host = host;
> +    new_block->flags = ram_flags;
>      if (host) {
>          new_block->flags |= RAM_PREALLOC;
>      }
> -    if (share) {
> -        new_block->flags |= RAM_SHARED;
> -    }
> -    if (resizeable) {
> -        new_block->flags |= RAM_RESIZEABLE;
> -    }
>      ram_block_add(new_block, &local_err);
>      if (local_err) {
>          g_free(new_block);
> @@ -2146,15 +2143,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>  RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
>                                     MemoryRegion *mr, Error **errp)
>  {
> -    return qemu_ram_alloc_internal(size, size, NULL, host, false,
> -                                   false, mr, errp);
> +    return qemu_ram_alloc_internal(size, size, NULL, host, 0, mr, errp);
>  }
>  
> -RAMBlock *qemu_ram_alloc(ram_addr_t size, bool share,
> +RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
>                           MemoryRegion *mr, Error **errp)
>  {
> -    return qemu_ram_alloc_internal(size, size, NULL, NULL, false,
> -                                   share, mr, errp);
> +    assert((ram_flags & ~RAM_SHARED) == 0);
> +    return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags, mr, errp);
>  }
>  
>  RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
> @@ -2163,8 +2159,8 @@ RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
>                                                       void *host),
>                                       MemoryRegion *mr, Error **errp)
>  {
> -    return qemu_ram_alloc_internal(size, maxsz, resized, NULL, true,
> -                                   false, mr, errp);
> +    return qemu_ram_alloc_internal(size, maxsz, resized, NULL,
> +                                   RAM_RESIZEABLE, mr, errp);
>  }
>  
>  static void reclaim_ramblock(RAMBlock *block)
> 


