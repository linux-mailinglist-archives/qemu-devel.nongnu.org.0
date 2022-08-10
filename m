Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E158E7E8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 09:37:14 +0200 (CEST)
Received: from localhost ([::1]:53208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLgHA-0004WT-GE
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 03:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLgCs-0002n6-8F
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 03:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLgCe-00026C-DE
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 03:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660116748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOVN/T2443JoXaARYPcEa6/0PQ7MIIjUArAhKW5dsWk=;
 b=ioxcSXYqHItTwcgayk6m2OFsON40DvlD4BL42YhWAHkAewLBera1wsWJC/KizHO/5NloGD
 xOAib6SKH0v7nfnjCQpt6/np7b2EnYgMh4REuK1LmbXy5nqK8ygLlBxb/8PclbO5Fp+gWz
 YXCpZrG8hngE/OUPuL82jmt8STZlNT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-4a_COjPnM4yuK_RNArywfQ-1; Wed, 10 Aug 2022 03:32:27 -0400
X-MC-Unique: 4a_COjPnM4yuK_RNArywfQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i203-20020a1c3bd4000000b003a537064611so120937wma.4
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 00:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=ZOVN/T2443JoXaARYPcEa6/0PQ7MIIjUArAhKW5dsWk=;
 b=CQroFlTnex6CbKjliKUB/BoDcP3XennjhsNnNgOBpu2n27/VjUSayFw4YOehIBTCo1
 5BN6zcl094R2E75XEf5z8sTOGUZeZnYbcRw9sxFxkWX5nC8PsiljQdp9r70mnc3AEIqP
 L8LFGwS80PqET4v+VMKurfMfrt9WOuPyeTrDRDsIcKEQB7Shy9nv3n3vNAuYy5L0NS9O
 jf+9MY5gGL2CGogmS6XuFzInkcd742G4et5HpNfaRlf9B8sHecjO4iJtaJf8tGKIqX7b
 k8tn+ex95ocZ1+tpKo1tix++vSAkftm3WdRyQW/8tpTElj3zxHHWrfJCgPm1cDUJsnQG
 xBRA==
X-Gm-Message-State: ACgBeo0YTjG/rPKv4qvH87inCCZhsc6q+8gVKZGa0ZRoqmXZaNcHA2ou
 Z29aaEcJxrXy3CbsSLGi6xv0dRG+tdGed/Mt9h8qbtOeVRHoPn9Yxe4xibu9Rwg0tbTDJFMDrro
 uN+24Nr9nVFXTryU=
X-Received: by 2002:a5d:4dc4:0:b0:21f:abb:fcef with SMTP id
 f4-20020a5d4dc4000000b0021f0abbfcefmr16227652wru.486.1660116745327; 
 Wed, 10 Aug 2022 00:32:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6YkazAGLgzH50NK43LV356CDSViQ+VLQmj8Tva/qSJzoeGAN8Ibu9i37g/dP03kl267eEGGw==
X-Received: by 2002:a5d:4dc4:0:b0:21f:abb:fcef with SMTP id
 f4-20020a5d4dc4000000b0021f0abbfcefmr16227635wru.486.1660116745059; 
 Wed, 10 Aug 2022 00:32:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1600:a3ce:b459:ef57:7b93?
 (p200300cbc7071600a3ceb459ef577b93.dip0.t-ipconnect.de.
 [2003:cb:c707:1600:a3ce:b459:ef57:7b93])
 by smtp.gmail.com with ESMTPSA id
 ba5-20020a0560001c0500b0021efc75914esm16356165wrb.79.2022.08.10.00.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 00:32:24 -0700 (PDT)
Message-ID: <e1eb8579-079b-fe81-b2df-a342d7ad667a@redhat.com>
Date: Wed, 10 Aug 2022 09:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] backends/hostmem: Fix support of memory-backend-memfd in
 qemu_maxrampagesize()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220810063204.3589543-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220810063204.3589543-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 10.08.22 08:32, Thomas Huth wrote:
> It is currently not possible yet to use "memory-backend-memfd" on s390x
> with hugepages enabled. This problem is caused by qemu_maxrampagesize()
> not taking memory-backend-memfd objects into account yet, so the code
> in s390_memory_init() fails to enable the huge page support there via
> s390_set_max_pagesize(). Fix it by looking at the memory-backend-memfd
> in the host_memory_backend_pagesize() function, too.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/sysemu/hostmem.h |  8 +++++++-
>  backends/hostmem-memfd.c |  2 --
>  backends/hostmem.c       | 27 +++++++++++++++++----------
>  3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
> index 9ff5c16963..d983ae6c01 100644
> --- a/include/sysemu/hostmem.h
> +++ b/include/sysemu/hostmem.h
> @@ -34,10 +34,16 @@ OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
>  /* hostmem-file.c */
>  /**
>   * @TYPE_MEMORY_BACKEND_FILE:
> - * name of backend that uses mmap on a file descriptor
> + * name of backend that uses mmap on a file
>   */
>  #define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
>  
> +/* hostmem-memfd.c */
> +/**
> + * @TYPE_MEMORY_BACKEND_MEMFD:
> + * name of backend that uses mmap on a memfd file descriptor
> + */
> +#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
>  
>  /**
>   * HostMemoryBackendClass:
> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> index 3fc85c3db8..1ab2085e49 100644
> --- a/backends/hostmem-memfd.c
> +++ b/backends/hostmem-memfd.c
> @@ -18,8 +18,6 @@
>  #include "qapi/error.h"
>  #include "qom/object.h"
>  
> -#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
> -
>  OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD)
>  
>  
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 624bb7ecd3..ebce887105 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -306,22 +306,29 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
>      return backend->is_mapped;
>  }
>  
> -#ifdef __linux__
>  size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
>  {
> +    size_t pagesize = 0;
> +
> +#ifdef __linux__
>      Object *obj = OBJECT(memdev);
> -    char *path = object_property_get_str(obj, "mem-path", NULL);
> -    size_t pagesize = qemu_mempath_getpagesize(path);
>  
> -    g_free(path);
> +    if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_FILE)) {
> +        char *path = object_property_get_str(obj, "mem-path", NULL);
> +        pagesize = qemu_mempath_getpagesize(path);
> +        g_free(path);
> +    } else if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_MEMFD) &&
> +               object_property_get_bool(obj, "hugetlb", &error_abort)) {
> +        pagesize = object_property_get_int(obj, "hugetlbsize", &error_abort);
> +    }
> +#endif

Why can't we simply rely on

qemu_ram_pagesize(memdev->mr.ram_block);

?

-- 
Thanks,

David / dhildenb


