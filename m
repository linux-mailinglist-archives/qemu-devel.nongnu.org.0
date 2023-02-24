Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA5D6A18C0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:28:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUMr-0000nU-Gx; Fri, 24 Feb 2023 04:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVUMa-0000kg-Lw
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:27:37 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVUMY-000429-Q8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:27:36 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17235c8dab9so14985354fac.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uPEENlQOtL8mO+Xc/6XKS+UtRwsD+eWVH6qGqLTNjr0=;
 b=iyknjZqyZxVdoN4w0dRV4T8dpLKvOA/OuAXDYkYi8E6mC4N8J+H5hrAZsNsICFzl+b
 lqDKGCX8gIikZ3X3/RLS2AGE36ZGmEZVDlFiolxC+97BlAG0CUCCT8C6V6GoW3FhNsRs
 /j0BJSfw08I1XgaH8TW4TR+5R7ileCjGPlLXV7+zLaiPX6aeNZiQMlgA2pgjfQa1RBxZ
 G/xMv4nO3EvCugin/JoPRmA+ZwwpVb9UxjrjgJ6aHKvgnEIC7iWVCjFabe1YhzJrgUg9
 bOYl+lJh+hKLZjAwuZ8l6lUzJjclDRBJXns6q8UR4B94ZK+lHEWNCqke2Ri5B2IbxLUu
 Q/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPEENlQOtL8mO+Xc/6XKS+UtRwsD+eWVH6qGqLTNjr0=;
 b=7Md+R9OgcOjeydfTF00MUj1nX9SMpM8qzNH5js1XR5SQtDFEUbFGuPF8/+rXFdCOUX
 AwYN9Uzk63JZcRsiiDHPs3U2RcP3McCekVM6napq03wOQcIvKzU881hmgp9k9DZvKB0h
 2r+6bi13xdhQRRk5vKjTXr+OL6z6TpX6qN/gRrTtjBp14BASwlsNlGbyQhTG0/gVUyLd
 VYlytt+gwYkpTqxroe5fQ9MNq67sFbmZx6gr46491IP6Tovh1cywS5Gf4qD+eDYC6sbJ
 SZyOHS3urU15XvYacQUQW5i8fJR2x3nsxuHcpbpu/tDjO+26O3PXvvGvpNkkmZDlydQV
 sk2Q==
X-Gm-Message-State: AO0yUKU29RDDShMAwotLWZ2wFJ0BACdvSdsBKhMhQwgHam7ADTl5hNoA
 tGmxsbJ7nqVK0h+oA5iZxSBKRvxTX7nO9cRs
X-Google-Smtp-Source: AK7set/hB7gGx1hifJCHMz0CSVBXHTPKqLOt/v3r8e0nIj9gZh2btCQ4FDqRPE77j3Ioq5uhpZJ8ng==
X-Received: by 2002:a05:6871:29c:b0:172:6cfc:6ff4 with SMTP id
 i28-20020a056871029c00b001726cfc6ff4mr4228196oae.41.1677230853505; 
 Fri, 24 Feb 2023 01:27:33 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a056870e28100b0015f4d1b195bsm8002275oad.36.2023.02.24.01.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:27:33 -0800 (PST)
Message-ID: <11bc1eaa-4065-4d08-adcc-2018a94bd490@ventanamicro.com>
Date: Fri, 24 Feb 2023 06:27:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] accel/tcg: Add 'size' param to probe_access_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230224004558.1313614-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224004558.1313614-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 2/23/23 21:45, Richard Henderson wrote:
> Change to match the recent change to probe_access_flags.
> All existing callers updated to supply 0, so no change in behaviour.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/exec/exec-all.h              | 2 +-
>   accel/tcg/cputlb.c                   | 4 ++--
>   target/arm/mte_helper.c              | 4 ++--
>   target/arm/ptw.c                     | 2 +-
>   target/arm/sve_helper.c              | 2 +-
>   target/arm/translate-a64.c           | 2 +-
>   target/i386/tcg/sysemu/excp_helper.c | 4 ++--
>   7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 165b050872..b631832e17 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -475,7 +475,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
>    * and must be consumed or copied immediately, before any further
>    * access or changes to TLB @mmu_idx.
>    */
> -int probe_access_full(CPUArchState *env, target_ulong addr,
> +int probe_access_full(CPUArchState *env, target_ulong addr, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool nonfault, void **phost,
>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index fc27e34457..008ae7a66d 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1589,12 +1589,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>       return flags;
>   }
>   
> -int probe_access_full(CPUArchState *env, target_ulong addr,
> +int probe_access_full(CPUArchState *env, target_ulong addr, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool nonfault, void **phost, CPUTLBEntryFull **pfull,
>                         uintptr_t retaddr)
>   {
> -    int flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
> +    int flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
>                                         nonfault, phost, pfull, retaddr);
>   
>       /* Handle clean RAM pages.  */
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 98bcf59c22..fee3c7eb96 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -118,7 +118,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>        * valid.  Indicate to probe_access_flags no-fault, then assert that
>        * we received a valid page.
>        */
> -    flags = probe_access_full(env, ptr, ptr_access, ptr_mmu_idx,
> +    flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
>                                 ra == 0, &host, &full, ra);
>       assert(!(flags & TLB_INVALID_MASK));
>   
> @@ -154,7 +154,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>        */
>       in_page = -(ptr | TARGET_PAGE_MASK);
>       if (unlikely(ptr_size > in_page)) {
> -        flags |= probe_access_full(env, ptr + in_page, ptr_access,
> +        flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
>                                      ptr_mmu_idx, ra == 0, &host, &full, ra);
>           assert(!(flags & TLB_INVALID_MASK));
>       }
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 1ecefb2027..d92cdc9733 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -258,7 +258,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>           int flags;
>   
>           env->tlb_fi = fi;
> -        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
> +        flags = probe_access_full(env, addr, 0, MMU_DATA_LOAD,
>                                     arm_to_core_mmu_idx(s2_mmu_idx),
>                                     true, &ptw->out_host, &full, 0);
>           env->tlb_fi = NULL;
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 51909c44ac..9a8951afa4 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -5356,7 +5356,7 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
>                                  &info->host, retaddr);
>   #else
>       CPUTLBEntryFull *full;
> -    flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
> +    flags = probe_access_full(env, addr, 0, access_type, mmu_idx, nofault,
>                                 &info->host, &full, retaddr);
>   #endif
>       info->flags = flags;
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index da9f877476..67e9c4ee79 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14651,7 +14651,7 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
>        * that the TLB entry must be present and valid, and thus this
>        * access will never raise an exception.
>        */
> -    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
> +    flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
>                                 false, &host, &full, 0);
>       assert(!(flags & TLB_INVALID_MASK));
>   
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> index 55bd1194d3..e87f90dbe3 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -64,7 +64,7 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
>       int flags;
>   
>       inout->gaddr = addr;
> -    flags = probe_access_full(inout->env, addr, MMU_DATA_STORE,
> +    flags = probe_access_full(inout->env, addr, 0, MMU_DATA_STORE,
>                                 inout->ptw_idx, true, &inout->haddr, &full, 0);
>   
>       if (unlikely(flags & TLB_INVALID_MASK)) {
> @@ -428,7 +428,7 @@ do_check_protect_pse36:
>           CPUTLBEntryFull *full;
>           int flags, nested_page_size;
>   
> -        flags = probe_access_full(env, paddr, access_type,
> +        flags = probe_access_full(env, paddr, 0, access_type,
>                                     MMU_NESTED_IDX, true,
>                                     &pte_trans.haddr, &full, 0);
>           if (unlikely(flags & TLB_INVALID_MASK)) {

