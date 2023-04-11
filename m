Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66C6DD4B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:58:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm8t1-00072o-I8; Tue, 11 Apr 2023 03:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pm8sz-00072e-JP
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pm8sx-0000I1-Vg
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681199870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEm4mryFRimzW4jg98zFvUV1R5o7/rtvBwr8g4FSpR4=;
 b=hQm9YPJLLwwbqewXyhEoN8Lp1R1RZf1huVavu/Zq5f7mxvlqxD29bKi6ga4bJrQtSCgGfo
 4D50sKlJAy+/ZS4eAQZZ6xmXRrsHZQVOczLztB+sWgoaIJY4q9eJwgIlI7dkIarJNFHNOr
 MFgTBeiOlvPYB9w7g10pfPY+nq+r0b4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-iTmrww-6ObWvCQ7NWjnwUw-1; Tue, 11 Apr 2023 03:57:49 -0400
X-MC-Unique: iTmrww-6ObWvCQ7NWjnwUw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v24-20020adf8b58000000b002efb0d72c77so1152450wra.16
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681199868; x=1683791868;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEm4mryFRimzW4jg98zFvUV1R5o7/rtvBwr8g4FSpR4=;
 b=zPNCo3FvXb3bB/6uL3BSv3HaFCxicjBIBrTCwEOp9ij0rMxqtQlZpuTz8izaAex1j4
 eovpJ7mds0AE/AvPG2fZu7KtQLhM2pg4aZimFPFcOgkDTUl+iEZ+ZDbNzaQRPmwVRu3l
 sgEOC46QjnoRp23PU3VevpnaKNp9PZQTtuZ7ibXca5iamz+Eoc9ICR954Vv8qp5Pd5gL
 xT11H3MuXAuiZpYYDX31r/b55G6RWKpncz5eyPCIZzDp1g8q5ISrw8YPcNk4hMzbFU4h
 D5y8AvWnug91Nj8nuLqr4c6b21M53nErarEqqwMWFuKCVRWYfafb7IbSV6yINuBPx5JD
 4s+A==
X-Gm-Message-State: AAQBX9dstEW/HMc7ZkqBBC+7vTh3ET4ceSCLPlb5r6AZt9j21C4BEdQu
 iFDtRYOp8ydLPorA5Gk20x7Kl9WDlY/jkrCj9YnJJpOnim8VvfPpb0SukjFfM4EeH4/XEIslZzM
 ryM8tPbYXjdgMA5Q=
X-Received: by 2002:a5d:6dcd:0:b0:2ef:24de:4299 with SMTP id
 d13-20020a5d6dcd000000b002ef24de4299mr7820660wrz.67.1681199868315; 
 Tue, 11 Apr 2023 00:57:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aK6CurndUskyQV6p3GkquoOBlm4Q48uK7LZzJjlsUCFAX+Pl7yynn5zh+H/SWBq1ktlMPmew==
X-Received: by 2002:a5d:6dcd:0:b0:2ef:24de:4299 with SMTP id
 d13-20020a5d6dcd000000b002ef24de4299mr7820643wrz.67.1681199867955; 
 Tue, 11 Apr 2023 00:57:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:1300:6f08:1748:eba7:b2a9?
 (p200300cbc70613006f081748eba7b2a9.dip0.t-ipconnect.de.
 [2003:cb:c706:1300:6f08:1748:eba7:b2a9])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a5d5308000000b002ce9f0e4a8fsm13927234wrv.84.2023.04.11.00.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 00:57:47 -0700 (PDT)
Message-ID: <5657e1e4-ab20-f0e9-a9d5-7b91aece1459@redhat.com>
Date: Tue, 11 Apr 2023 09:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Gavin Shan <gshan@redhat.com>
References: <1681141583-87816-1-git-send-email-steven.sistare@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] util/mmap: optimize qemu_ram_mmap() alignment
In-Reply-To: <1681141583-87816-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10.04.23 17:46, Steve Sistare wrote:
> Guest RAM created with memory-backend-memfd is aligned to a
> QEMU_VMALLOC_ALIGN=2M boundary, and memory-backend-memfd does not support
> the "align" parameter to change the default.  This is sub-optimal on
> aarch64 kernels with a 64 KB page size and 512 MB huge page size, as the
> range will not be backed by huge pages.  Moreover, any shared allocation
> using qemu_ram_mmap() will be sub-optimal on such a system if the align
> parameter is less than 512 MB.
> 
> The kernel is smart enough to return a hugely aligned pointer for MAP_SHARED
> mappings when /sys/kernel/mm/transparent_hugepage/shmem_enabled allows it.
> However, the qemu function qemu_ram_mmap() mmap's twice to perform its own
> alignment:
> 
>      guardptr = mmap(0, total, PROT_NONE, flags, ...
>      flags |= shared ? MAP_SHARED : MAP_PRIVATE;
>      ptr = mmap(guardptr + offset, size, prot, flags | map_sync_flags, ...
> 
> On the first call, flags has MAP_PRIVATE, hence the kernel does not apply
> its shared memory policy, and returns a non-huge-aligned guardptr.
> 
> To fix, for shared mappings, pass MAP_SHARED to both mmap calls.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   util/mmap-alloc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5ed7d29..37a0d1e 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -121,7 +121,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
>    * Reserve a new memory region of the requested size to be used for mapping
>    * from the given fd (if any).
>    */
> -static void *mmap_reserve(size_t size, int fd)
> +static void *mmap_reserve(size_t size, int fd, int final_flags)
>   {
>       int flags = MAP_PRIVATE;
>   
> @@ -144,6 +144,7 @@ static void *mmap_reserve(size_t size, int fd)
>   #else
>       fd = -1;
>       flags |= MAP_ANONYMOUS;
> +    flags |= final_flags & MAP_SHARED;

Setting both, MAP_PRIVATE and MAP_SHARED sure sounds very wrong.

The traditional way to handle that is via QEMU_VMALLOC_ALIGN.

I think you'd actually want to turn QEMU_VMALLOC_ALIGN into a function 
that is able to special-case like 
hw/virtio/virtio-mem.c:virtio_mem_default_thp_size() does for 
"qemu_real_host_page_size() == 64 * KiB".

If you set QEMU_VMALLOC_ALIGN properly, you'll also have any DIMMs get 
that alignment in guest physical address space.

-- 
Thanks,

David / dhildenb


