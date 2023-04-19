Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B26E7FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:32:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAiL-0002ct-Nj; Wed, 19 Apr 2023 12:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ppAiJ-0002b2-Ux
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ppAiI-0002c4-4Q
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gh0Uo+MPPrAnsc17EhJE3bDf423/ID9/gQUG6YxNt3c=;
 b=OrZukaE8Y5bQJhxlby3YJWSD1yF4VzH5UiT0Irjod01783Jximj5kztyDqzPbWTPNFLSKT
 ucyijoYcSmvrFe3/tPgPbsWpd20tSHrDVPfefYIzGVD20vaVSrkHu0kI01vFLVlsAsoJW8
 G8ly+fI8WsJv6ZRdZx446Dmy2w8P3p0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-FiAFGrltNiqbpQYjhSZyJA-1; Wed, 19 Apr 2023 12:31:20 -0400
X-MC-Unique: FiAFGrltNiqbpQYjhSZyJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg10-20020a05600c3c8a00b003ef7b61e2fdso1023357wmb.4
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921879; x=1684513879;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gh0Uo+MPPrAnsc17EhJE3bDf423/ID9/gQUG6YxNt3c=;
 b=VIlj+Biajud80gAtqT3HxNvYPMXgcu/BDS8eY8HbotAhmWJESaO96BCHwqDMAd5rml
 WUjZJZ7rPttCxbzfnpTajGENJZQmaVn4SQVw66QhjQi4Kq9PzAeqTfAsAIdro9qGTuXy
 WUqMyhG1NNF9cLjIZdD442+19iBl4Gp+bqVcck2k+07PZWKV7u20rzrOsSaOcoi8bjYK
 fOGTOch3g7BN4pEUvDZ/1OqItsupHipwJ4/82opW63BSzDf3jQ8BMwQ0dWeLP1WHxBUY
 CATkRloTmj6rpK5vHIFsDOD5HlTC0mxeGajmjn6kx7vWYln8+dYxHt2h3aOm8h+3aImW
 wZmA==
X-Gm-Message-State: AAQBX9dEFX5tTLYNbj32t+/X+4n3EALLy5qb2n6Abhz3SEUwABlXiw0b
 M5Hv6ONZ1GC8H2z5xlDFRMPnTlqW68FQbDv3cuPvsr93tQGu1UCm4I+FKWP+TrU+/hzEhKb5UK0
 1FTQLHLXL3V+tSEI=
X-Received: by 2002:a1c:7207:0:b0:3f1:72fb:461a with SMTP id
 n7-20020a1c7207000000b003f172fb461amr9596296wmc.2.1681921879212; 
 Wed, 19 Apr 2023 09:31:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQvcibjB8flhjj7Kg2Kt8n0TJ1JrQ0zzrzQM0suG1nZgSqfaq0R05IqAwxGvRDU2MFf4yoBw==
X-Received: by 2002:a1c:7207:0:b0:3f1:72fb:461a with SMTP id
 n7-20020a1c7207000000b003f172fb461amr9596277wmc.2.1681921878854; 
 Wed, 19 Apr 2023 09:31:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:7b00:7c52:a5fa:8004:96fd?
 (p200300cbc70b7b007c52a5fa800496fd.dip0.t-ipconnect.de.
 [2003:cb:c70b:7b00:7c52:a5fa:8004:96fd])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b003f17b96793dsm2632820wmk.37.2023.04.19.09.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 09:31:18 -0700 (PDT)
Message-ID: <56d70da4-c3ae-1abc-3004-94787039b004@redhat.com>
Date: Wed, 19 Apr 2023 18:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] util/mmap-alloc: qemu_fd_getfs()
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230419161739.1129988-2-peterx@redhat.com>
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

On 19.04.23 18:17, Peter Xu wrote:
> This new helper fetches file system type for a fd.  Only Linux is
> implemented so far.  Currently only tmpfs and hugetlbfs is defined, but it
> can grow per need.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   include/qemu/mmap-alloc.h |  7 +++++++
>   util/mmap-alloc.c         | 28 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> index 2825e231a7..8344daaa03 100644
> --- a/include/qemu/mmap-alloc.h
> +++ b/include/qemu/mmap-alloc.h
> @@ -1,8 +1,15 @@
>   #ifndef QEMU_MMAP_ALLOC_H
>   #define QEMU_MMAP_ALLOC_H
>   
> +typedef enum {
> +    QEMU_FS_TYPE_UNKNOWN = 0,
> +    QEMU_FS_TYPE_TMPFS,
> +    QEMU_FS_TYPE_HUGETLBFS,
> +    QEMU_FS_TYPE_NUM,
> +} QemuFsType;
>   
>   size_t qemu_fd_getpagesize(int fd);
> +QemuFsType qemu_fd_getfs(int fd);
>   
>   /**
>    * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5ed7d29183..ed14f9c64d 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -27,8 +27,36 @@
>   
>   #ifdef CONFIG_LINUX
>   #include <sys/vfs.h>
> +#include <linux/magic.h>
>   #endif
>   
> +QemuFsType qemu_fd_getfs(int fd)
> +{
> +#ifdef CONFIG_LINUX
> +    struct statfs fs;
> +    int ret;
> +
> +    if (fd < 0) {
> +        return QEMU_FS_TYPE_UNKNOWN;
> +    }
> +
> +    do {
> +        ret = fstatfs(fd, &fs);
> +    } while (ret != 0 && errno == EINTR);
> +
> +    switch (fs.f_type) {
> +    case TMPFS_MAGIC:
> +        return QEMU_FS_TYPE_TMPFS;
> +    case HUGETLBFS_MAGIC:
> +        return QEMU_FS_TYPE_HUGETLBFS;
> +    default:
> +        return QEMU_FS_TYPE_UNKNOWN;
> +    }
> +#else
> +    return QEMU_FS_TYPE_UNKNOWN;
> +#endif
> +}

I guess you could do

#ifdef CONFIG_LINUX
...
     default:
         break
     }
#endif
     return QEMU_FS_TYPE_UNKNOWN;

To avoid duplicating the default handling. Whatever you prefer:


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


