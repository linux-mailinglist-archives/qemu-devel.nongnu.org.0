Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F153752ED
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 13:19:10 +0200 (CEST)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lec28-00043v-SU
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 07:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lebyu-0002L2-LF
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lebyp-0006R6-La
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620299741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdpuG0d1ZM0qdYrRtdM1nNbCvGwEaGx2TzMDg/t8AQY=;
 b=ABNM9sIw9yOXR8JF94DA0hohRiS3ltA0kL8J+rn6rSUHjRkZnEzyaVDibW8Q3JTgQ5MrvC
 UPFspRrR80LZ3zwyXNsInAK3SrTEZw3qph+I7dFb6BCi3LY7GulxmUWjfyZTHuJ0lkjJwR
 GO8Le+pNCqVsBeQthe/pnsdEUkl+muU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-ub3LEGCGOAeKgTHlxJvlzA-1; Thu, 06 May 2021 07:15:38 -0400
X-MC-Unique: ub3LEGCGOAeKgTHlxJvlzA-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk30-20020a170906d9deb02903916754e1b6so1562129ejb.2
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 04:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vdpuG0d1ZM0qdYrRtdM1nNbCvGwEaGx2TzMDg/t8AQY=;
 b=kKwWeJxD3ByDjFiJyStn/7pQM4hGXvrAFM+zyLDddtdKYxwz+lleJaO0WNkeq5rvIe
 VFEwsr73jhUclG3OhviFNrbfl4TMHYgMhNYdyUDpzAxIdk7L49grd7a3xW8ES4EoBuRD
 oWDTZa1J6B1WqEBpGpjBhxW6WWNHTUijY8c1c6BvrinfXj/BeYOyyMNFUczm3KZ7rJbB
 ZrBrWdShqWg9chyDGQ/y00iWWAMZbzjee1R0Mb510c09GW4Ik8ULn3159+o5yBvYTd27
 eKQ7jdUuiugrt6BO8gHQhZV/J+08InPhM5t6EALdSMZ8yBySn1ZWg52IhHbsFHOjEf4i
 eQwQ==
X-Gm-Message-State: AOAM532wQvgMq5c6N5mc92tGMTxUyYGmgwBjW3SPd1vDx5u6KlD1kELC
 efUymixvH2mNAV0vtjXKeu+aVK5cYPSyus35grsA+MFyw59fVnYaiXNqOZHLkERIwOcmGkLwyJQ
 TtVm97PqzN7nmhOU=
X-Received: by 2002:a17:906:3c4e:: with SMTP id
 i14mr3722415ejg.245.1620299737155; 
 Thu, 06 May 2021 04:15:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw96sVUlqDhg22y8aLJMGAcwKMeIiHDBNCn0S8x2TNCwyWBbcmTyuiNouktZx98eDtPAR8+cA==
X-Received: by 2002:a17:906:3c4e:: with SMTP id
 i14mr3722394ejg.245.1620299736909; 
 Thu, 06 May 2021 04:15:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id s2sm1382621edu.89.2021.05.06.04.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 04:15:36 -0700 (PDT)
Subject: Re: [PATCH v3 01/16] tcg/s390x: Rename from tcg/s390
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
 <20210503183541.2014496-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <7ec746b0-8d25-3a76-88c5-f7c1aec0c058@redhat.com>
Date: Thu, 6 May 2021 13:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503183541.2014496-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.05.21 20:35, Richard Henderson wrote:
> This emphasizes that we don't support s390, only 64-bit s390x hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build                              | 2 --
>   tcg/{s390 => s390x}/tcg-target-con-set.h | 0
>   tcg/{s390 => s390x}/tcg-target-con-str.h | 0
>   tcg/{s390 => s390x}/tcg-target.h         | 0
>   tcg/{s390 => s390x}/tcg-target.c.inc     | 0
>   5 files changed, 2 deletions(-)
>   rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target.h (100%)
>   rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)
> 
> diff --git a/meson.build b/meson.build
> index d8bb1ec5aa..7ce0bf5dfd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -248,8 +248,6 @@ if not get_option('tcg').disabled()
>       tcg_arch = 'tci'
>     elif config_host['ARCH'] == 'sparc64'
>       tcg_arch = 'sparc'
> -  elif config_host['ARCH'] == 's390x'
> -    tcg_arch = 's390'
>     elif config_host['ARCH'] in ['x86_64', 'x32']
>       tcg_arch = 'i386'
>     elif config_host['ARCH'] == 'ppc64'
> diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
> similarity index 100%
> rename from tcg/s390/tcg-target-con-set.h
> rename to tcg/s390x/tcg-target-con-set.h
> diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
> similarity index 100%
> rename from tcg/s390/tcg-target-con-str.h
> rename to tcg/s390x/tcg-target-con-str.h
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
> similarity index 100%
> rename from tcg/s390/tcg-target.h
> rename to tcg/s390x/tcg-target.h
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> similarity index 100%
> rename from tcg/s390/tcg-target.c.inc
> rename to tcg/s390x/tcg-target.c.inc
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


