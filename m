Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73254D283
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 22:27:06 +0200 (CEST)
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ZbU-0007YA-TY
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 16:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o1ZaA-0006qE-TX
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 16:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o1Za7-0005Qy-CG
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 16:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655324737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cucIW3RxV5BEBs3++cwiXAC6w8aPjWzwpuvLxGKzddo=;
 b=QG/2s5Kx9qK7JGAiA1GapWNJrs9tQDP8m+U3bgjj54ntj4MjiSdxVt2wCa4ciC/6h+/sPT
 INfBkc0mHFlBDq3busmphyRrKKOMUssSs83sgZeRYkol+34LKabgMcfD6Hus0cL1+/aAx/
 PBkRzaHuRgqz/9VjbuOQNHGVOY8v0TA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-9Y-Bst8eMieITOhD5rLCpQ-1; Wed, 15 Jun 2022 16:25:36 -0400
X-MC-Unique: 9Y-Bst8eMieITOhD5rLCpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v184-20020a1cacc1000000b0039c7efa3e95so5495252wme.3
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 13:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=cucIW3RxV5BEBs3++cwiXAC6w8aPjWzwpuvLxGKzddo=;
 b=YOcSdkD5LHjECYFiBNg5BKTI/Wb0sgYd3ABkrtlja1HzNPVPJbKpLVF9nfhyX3SyCT
 DFMjVNpaF5lXaImG0xReETHpdwvOiEzZi1qZ5YIclZW3ThTCQaPfhG/WP8j/gLLxfOtJ
 +qau0Swmq5d8p5ZHJYdvboVOuUDKWz/3po/bW8wOSgSaHAeg0Y4rwumqGXQ/jsDEyfe9
 AwfYUcRd4GtYN2O8Btlp/SMrLEWxvqcyeIV8r+xUZAfY2xUBP10sJZhduWnydg9PGaYX
 vHUCRsvcxLm+uWsxpgdpK5nehMEF23YjSpGcJRciZfU+AERbhlHVNis5Gnb/FWaX/ioq
 ok2Q==
X-Gm-Message-State: AOAM533g0EUx1uXvyZhFzsG2VPySPmhyDLiujHON/RJJIJy+ACXh0j8m
 R4v3TBys3s7xK40YoDyCxdSatBz+DuqNxGo9aerqze3nr0ntsYpnD6XdNpVxf3qz8Bq7x1ma4Az
 HPTwLOTFEarmyQ4Q=
X-Received: by 2002:a05:600c:3794:b0:39c:61f6:d0f1 with SMTP id
 o20-20020a05600c379400b0039c61f6d0f1mr11991410wmr.206.1655324735364; 
 Wed, 15 Jun 2022 13:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSrk9VEJZo91S56aY+HdUupoLiktBdmeoAkDylUuNmwBV/+kbeVACGeLD1jhl4FHat28YxUQ==
X-Received: by 2002:a05:600c:3794:b0:39c:61f6:d0f1 with SMTP id
 o20-20020a05600c379400b0039c61f6d0f1mr11991379wmr.206.1655324735070; 
 Wed, 15 Jun 2022 13:25:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:2700:1d28:26c3:b272:fcc6?
 (p200300cbc70a27001d2826c3b272fcc6.dip0.t-ipconnect.de.
 [2003:cb:c70a:2700:1d28:26c3:b272:fcc6])
 by smtp.gmail.com with ESMTPSA id
 az3-20020adfe183000000b0020fcaba73bcsm15852647wrb.104.2022.06.15.13.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 13:25:34 -0700 (PDT)
Message-ID: <cfe42f45-25ef-a3f5-318f-a1f0cd99890e@redhat.com>
Date: Wed, 15 Jun 2022 22:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-5-git-send-email-steven.sistare@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH V8 04/39] memory: RAM_ANON flag
In-Reply-To: <1655304746-102776-5-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15.06.22 16:51, Steve Sistare wrote:
> A memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
> flag set is not migrated when migrate_ignore_shared() is true, but this
> is wrong, because it has no named backing store, and its contents will be
> lost.  Define a new flag RAM_ANON to distinguish this case.  Cpr will also
> test this flag, for similar reasons.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  backends/hostmem-epc.c   |  2 +-
>  backends/hostmem-memfd.c |  1 +
>  backends/hostmem-ram.c   |  1 +
>  include/exec/memory.h    |  3 +++
>  include/exec/ram_addr.h  |  1 +
>  migration/ram.c          |  3 ++-
>  softmmu/physmem.c        | 12 +++++++++---
>  7 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
> index 037292d..cb06255 100644
> --- a/backends/hostmem-epc.c
> +++ b/backends/hostmem-epc.c
> @@ -37,7 +37,7 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>      }
>  
>      name = object_get_canonical_path(OBJECT(backend));
> -    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED;
> +    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED | MAP_ANON;

I'm pretty sure that doesn't compile. -> RAM_ANON

>      memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
>                                     name, backend->size, ram_flags,
>                                     fd, 0, errp);
> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> index 3fc85c3..c9d8001 100644
> --- a/backends/hostmem-memfd.c
> +++ b/backends/hostmem-memfd.c
> @@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>      name = host_memory_backend_get_name(backend);
>      ram_flags = backend->share ? RAM_SHARED : 0;
>      ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
> +    ram_flags |= RAM_ANON;
>      memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
>                                     backend->size, ram_flags, fd, 0, errp);
>      g_free(name);
> diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
> index b8e55cd..5e80149 100644
> --- a/backends/hostmem-ram.c
> +++ b/backends/hostmem-ram.c
> @@ -30,6 +30,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>      name = host_memory_backend_get_name(backend);
>      ram_flags = backend->share ? RAM_SHARED : 0;
>      ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
> +    ram_flags |= RAM_ANON;
>      memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
>                                             backend->size, ram_flags, errp);
>      g_free(name);
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index f1c1945..0daddd7 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -203,6 +203,9 @@ typedef struct IOMMUTLBEvent {
>  /* RAM that isn't accessible through normal means. */
>  #define RAM_PROTECTED (1 << 8)
>  
> +/* RAM has no name outside the qemu process. */
> +#define RAM_ANON (1 << 9)

That name is a bit misleading because it mangles anonymous memory with
an anonymous file, which doesn't provide anonymous memory in "kernel
speak". Please find a better name, some idea below ...

I think what you actual want to know is: is this from a real file,
instead of from an anonymous file or anonymous memory. A real file can
be re-opened and remapped after closing QEMU. Further, you need
MAP_SHARED semantics.


/* RAM maps a real file instead of an anonymous file or no file/fd. */
#define RAM_REAL_FILE (1 << 9)

bool ramblock_maps_real_file(RAMBlock *rb)
{
    return rb->flags & RAM_REAL_FILE;
}


Maybe we can come up with a better name for "real file".


Set the flag from applicable callsites. When setting the flag
internally, assert that we don't have a fd -- that cannot possibly make
sense.

At applicable callsites check for ramblock_maps_real_file() and that
it's actually a shared mapping. If not, it cannot be preserved by
restarting QEMU (easily, there might be ways for memfd involving other
processes).


Make sense?

-- 
Thanks,

David / dhildenb


