Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5711C652
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 08:20:32 +0100 (CET)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifIlz-0007M2-U5
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 02:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifIky-0006VN-6w
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 02:19:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifIkw-0003bP-S0
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 02:19:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22066
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifIkw-0003ZV-Mc
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 02:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576135165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSnnozmY6TGAsJyu+zwEnnSEGXlEG6Xhquw/ZvkabaQ=;
 b=J8pqOShhUpyo1fIrKHttEhnGBL+eoF3Z7BN+7saZ8UH9+cphAhB1dxbcQDTfE8ngdkiVyZ
 akofzkZxzJMxgdeGfA2cHVFag3gQ3Hy87Bx00vITs+eHTpsaao40cfSCjTySkG1Lp8ZmQg
 5WViNFeqzkuh4BBnuzsJisE/bYLsf+8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-hIRslny2M2yWiUxhdl8JtQ-1; Thu, 12 Dec 2019 02:19:24 -0500
Received: by mail-wr1-f71.google.com with SMTP id f17so668321wrt.19
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 23:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OSnnozmY6TGAsJyu+zwEnnSEGXlEG6Xhquw/ZvkabaQ=;
 b=pn+B5z8EwxLLekzAeDWdk8UD66LzllDSqZy/KVGWr2ux8GiQhSE54O55uw57QJ12qP
 ROhK3zM0CQkSBO5Zc9djjEiBvdjXVPyhgvPoq1zwdhBZQJ8UcRhSJ+v+4Nuvz3TWPLp8
 pMwKUDQzwb2PRHqXRyy9z3C7SLmyKWdkzDruWPgtgBbFukrmrBi2gq/nx3Ttgvd02Lcn
 GLksNyZeqdAfSbcHlYU0rwCYq5ivgGTjYB9LXlcKRg6WJGpwqpDaNdPon4+1jOwCYoE+
 tKDkQbI92AfCCEMe8f2lb9pCRtdnGTtAlJTTqPwBUGfxBhvVwKVjzpp8cKs7VInE3Hh1
 YJhQ==
X-Gm-Message-State: APjAAAVsSNLKSAdi0U6kjeKypG1hKgc0btUXDtG/hBtmPMZVKMiiQdBW
 S+X1wDB0wP8+ibbVqwQZUgI0eM2uh2OFUxavK3KeuQhPH1qZHdbEvjBDPt5/yolQ43eMLDhA/Eg
 xcw2hF8F4EeWbH2s=
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4814721wmc.9.1576135163450;
 Wed, 11 Dec 2019 23:19:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzN6J9I+2ThOMkigfq0GiT78wOQKDK7S82mr7gPue8VD7+Sj9U8N2HYKfS/CwhTG264dN8UQ==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4814697wmc.9.1576135163183;
 Wed, 11 Dec 2019 23:19:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id e18sm5015851wrw.70.2019.12.11.23.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 23:19:22 -0800 (PST)
Subject: Re: [PATCH 08/28] target/i386: Use cpu_*_mmuidx_ra instead of
 templates
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191212040039.26546-1-richard.henderson@linaro.org>
 <20191212040039.26546-9-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dd082060-08da-5045-ea86-5bc6bfc3e2bf@redhat.com>
Date: Thu, 12 Dec 2019 08:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191212040039.26546-9-richard.henderson@linaro.org>
Content-Language: en-US
X-MC-Unique: hIRslny2M2yWiUxhdl8JtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/19 05:00, Richard Henderson wrote:
> Do not use exec/cpu_ldst_{,useronly_}template.h directly,
> but instead use the functional interface.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/seg_helper.c | 75 ++++++++++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 25 deletions(-)
> 
> diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
> index 87a627f9dc..b348569c30 100644
> --- a/target/i386/seg_helper.c
> +++ b/target/i386/seg_helper.c
> @@ -37,37 +37,62 @@
>  # define LOG_PCALL_STATE(cpu) do { } while (0)
>  #endif
>  
> -#ifdef CONFIG_USER_ONLY
> -#define MEMSUFFIX _kernel
> -#define DATA_SIZE 1
> -#include "exec/cpu_ldst_useronly_template.h"
> +static inline uint32_t cpu_ldub_kernel_ra(CPUX86State *env, abi_ptr ptr,
> +                                          uintptr_t ra)
> +{
> +    return cpu_ldub_mmuidx_ra(env, ptr, cpu_mmu_index_kernel(env), ra);
> +}
>  
> -#define DATA_SIZE 2
> -#include "exec/cpu_ldst_useronly_template.h"
> +static inline uint32_t cpu_lduw_kernel_ra(CPUX86State *env, abi_ptr ptr,
> +                                          uintptr_t ra)
> +{
> +    return cpu_lduw_mmuidx_ra(env, ptr, cpu_mmu_index_kernel(env), ra);
> +}
>  
> -#define DATA_SIZE 4
> -#include "exec/cpu_ldst_useronly_template.h"
> +static inline uint32_t cpu_ldl_kernel_ra(CPUX86State *env, abi_ptr ptr,
> +                                         uintptr_t ra)
> +{
> +    return cpu_ldl_mmuidx_ra(env, ptr, cpu_mmu_index_kernel(env), ra);
> +}
>  
> -#define DATA_SIZE 8
> -#include "exec/cpu_ldst_useronly_template.h"
> -#undef MEMSUFFIX
> -#else
> -#define CPU_MMU_INDEX (cpu_mmu_index_kernel(env))
> -#define MEMSUFFIX _kernel
> -#define DATA_SIZE 1
> -#include "exec/cpu_ldst_template.h"
> +static inline uint64_t cpu_ldq_kernel_ra(CPUX86State *env, abi_ptr ptr,
> +                                         uintptr_t ra)
> +{
> +    return cpu_ldq_mmuidx_ra(env, ptr, cpu_mmu_index_kernel(env), ra);
> +}
>  
> -#define DATA_SIZE 2
> -#include "exec/cpu_ldst_template.h"
> +static inline void cpu_stb_kernel_ra(CPUX86State *env, target_ulong ptr,
> +                                     uint32_t val, uintptr_t ra)
> +{
> +    cpu_stb_mmuidx_ra(env, ptr, val, cpu_mmu_index_kernel(env), ra);
> +}
>  
> -#define DATA_SIZE 4
> -#include "exec/cpu_ldst_template.h"
> +static inline void cpu_stw_kernel_ra(CPUX86State *env, target_ulong ptr,
> +                                     uint32_t val, uintptr_t ra)
> +{
> +    cpu_stw_mmuidx_ra(env, ptr, val, cpu_mmu_index_kernel(env), ra);
> +}
>  
> -#define DATA_SIZE 8
> -#include "exec/cpu_ldst_template.h"
> -#undef CPU_MMU_INDEX
> -#undef MEMSUFFIX
> -#endif
> +static inline void cpu_stl_kernel_ra(CPUX86State *env, target_ulong ptr,
> +                                     uint32_t val, uintptr_t ra)
> +{
> +    cpu_stl_mmuidx_ra(env, ptr, val, cpu_mmu_index_kernel(env), ra);
> +}
> +
> +static inline void cpu_stq_kernel_ra(CPUX86State *env, target_ulong ptr,
> +                                     uint64_t val, uintptr_t ra)
> +{
> +    cpu_stq_mmuidx_ra(env, ptr, val, cpu_mmu_index_kernel(env), ra);
> +}
> +
> +#define cpu_ldub_kernel(e, p)    cpu_ldub_kernel_ra(e, p, 0)
> +#define cpu_lduw_kernel(e, p)    cpu_lduw_kernel_ra(e, p, 0)
> +#define cpu_ldl_kernel(e, p)     cpu_ldl_kernel_ra(e, p, 0)
> +#define cpu_ldq_kernel(e, p)     cpu_ldq_kernel_ra(e, p, 0)
> +#define cpu_stb_kernel(e, p, v)  cpu_stb_kernel_ra(e, p, v, 0)
> +#define cpu_stw_kernel(e, p, v)  cpu_stw_kernel_ra(e, p, v, 0)
> +#define cpu_stl_kernel(e, p, v)  cpu_stl_kernel_ra(e, p, v, 0)
> +#define cpu_stq_kernel(e, p, v)  cpu_stq_kernel_ra(e, p, v, 0)
>  
>  /* return non zero if error */
>  static inline int load_segment_ra(CPUX86State *env, uint32_t *e1_ptr,
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


