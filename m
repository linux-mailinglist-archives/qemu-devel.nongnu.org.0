Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097A6E7405
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 09:30:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp2Ex-0004ap-SN; Wed, 19 Apr 2023 03:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pp2Ev-0004ah-Ox
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pp2Eu-0007Lo-25
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681889305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRXpVVFEnZrCbc3gOWo/GQIkkvY9/f9iPR0OAwMqLBk=;
 b=KWapKrrIHEP/DeDHxopWbjedQfHZ+G9aylnvFJCl2a+GXbCeE/eO2qKiCosjwRnLgziPPF
 Ubly/Fq2lWSs8oMHYFjkyoL4oMmSljajSLlTdax/eU8k8XKs6+2mi0489Zzp7zlJ5Prsw7
 XievWTpql80kUUncjW1jOQigwqiKfY4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-U6ntHa98N4-IUyjC-ZwVUw-1; Wed, 19 Apr 2023 03:28:24 -0400
X-MC-Unique: U6ntHa98N4-IUyjC-ZwVUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f16ef3be6eso15595505e9.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 00:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681889303; x=1684481303;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRXpVVFEnZrCbc3gOWo/GQIkkvY9/f9iPR0OAwMqLBk=;
 b=Nl2znZDhVMjFXygrfzkSe7EUBMpxWbJ9gzaRAwA8NBJg2cxfhnzO8IZpvn61lQxYu1
 gR4q9RyrQcAjtJ9DDcFd7NaqRsV8XmhGwPBB2DpSzBrIfOwAPAJB1jNdvWQOjb/69a1N
 /vtBKl1xQqmZFTk4RlsqQsbb5/ucTUsMaM2XQaAR0IyF1jEnuZDuGPWuOmA/IFmwvg5u
 QBaaeCT82AEUQC+bsXuqd73l+lQCCEPzmDm1lTzgua/YFOrI6LFWPxK5xDZCiuQ7OYyn
 rroA3iBX25n1Ow13nOvIW59wbi5jYY6vqG9EnAGpSB2v7kujwLgfro5esqfKcc8u0qDu
 BFMw==
X-Gm-Message-State: AAQBX9cb4td8FhByLxlk+pOxFugwopNt9kYiHfkAXxRv8abpsGu9yRJL
 adsQU/suuhCKq/yADNOTFJBCyiel3cKg4vLgFf+p7MVp9/kTlrGtrR6bxqu8yxmpoXuUo7InLlY
 OQcACX1ugTUoiRD0=
X-Received: by 2002:a05:6000:144:b0:2fb:44d0:584b with SMTP id
 r4-20020a056000014400b002fb44d0584bmr4135518wrx.48.1681889302930; 
 Wed, 19 Apr 2023 00:28:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350b7f4Y2Yaw4jeupff2mFVb9obJDNr2vXzrcep6b9wsZAtV1KDFPB1wW8fmkVniklzxAvelrZQ==
X-Received: by 2002:a05:6000:144:b0:2fb:44d0:584b with SMTP id
 r4-20020a056000014400b002fb44d0584bmr4135501wrx.48.1681889302583; 
 Wed, 19 Apr 2023 00:28:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:7b00:7c52:a5fa:8004:96fd?
 (p200300cbc70b7b007c52a5fa800496fd.dip0.t-ipconnect.de.
 [2003:cb:c70b:7b00:7c52:a5fa:8004:96fd])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfde03000000b002efb2d861dasm15020696wrm.77.2023.04.19.00.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 00:28:22 -0700 (PDT)
Message-ID: <cdec800a-80ab-18f7-2667-9bc7a8917f09@redhat.com>
Date: Wed, 19 Apr 2023 09:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] hostmem: Detect and cache fs type for file hostmem
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
References: <20230418225749.1049185-1-peterx@redhat.com>
 <20230418225749.1049185-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230418225749.1049185-2-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19.04.23 00:57, Peter Xu wrote:
> Detect the file system for a memory-backend-file object and cache it within
> the object if possible when CONFIG_LINUX (using statfs).
> 
> Only support the two important types of memory (tmpfs, hugetlbfs) and keep
> the rest as "unknown" for now.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   backends/hostmem-file.c  | 37 ++++++++++++++++++++++++++++++++++++-
>   include/sysemu/hostmem.h |  1 +
>   2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index 25141283c4..2484e45a11 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -18,13 +18,17 @@
>   #include "sysemu/hostmem.h"
>   #include "qom/object_interfaces.h"
>   #include "qom/object.h"
> +#ifdef CONFIG_LINUX
> +#include <sys/vfs.h>
> +#include <linux/magic.h>
> +#endif
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendFile, MEMORY_BACKEND_FILE)
>   
>   
>   struct HostMemoryBackendFile {
>       HostMemoryBackend parent_obj;
> -
> +    __fsword_t fs_type;
>       char *mem_path;
>       uint64_t align;
>       bool discard_data;
> @@ -52,6 +56,15 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>           return;
>       }
>   
> +#ifdef CONFIG_LINUX
> +    struct statfs fs;
> +    if (!statfs(fb->mem_path, &fs)) {
> +        fb->fs_type = fs.f_type;
> +    } else {
> +        fb->fs_type = 0;
> +    }
> +#endif
> +


Instead of using statfs, why not implement something like 
qemu_fd_getpagesize(), that also relies on HUGETLBFS_MAGIC already, meaning

	size_t qemu_fd_type(int fd)

which uses fstatfs() instead? As an abstraction, as Daniel suggests, use 
a new enum to return the type -- "0" meaning "unknown".

Then you can even avoid the caching in hostmem code and simply call it 
directly from uffd code.

-- 
Thanks,

David / dhildenb


