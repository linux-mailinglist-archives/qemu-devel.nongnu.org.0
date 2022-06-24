Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CE55A02E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 20:07:51 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4nig-00040c-9X
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 14:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nfN-0001cC-Ho
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 14:04:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:32769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nfL-0006Wx-I5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 14:04:25 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 i8-20020a17090aee8800b001ecc929d14dso6109550pjz.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bY9oA4EaB11tYsRhr3ohUTdYalVWQGhYUamyU87YuoM=;
 b=OMyPOKTxlD4Pb6bc74jGRpU77NeNM2l3eNimaI72Rc2JZyeRsXK0habLUkKFvvfW+b
 I4Eytmqqzr0KEf3ZEc17Ft3otGS2SOa8JHKiIp7nHpuwO2HtztelnU9rFKZQKy3w5/SW
 nrkeuZxoHlCvbxsJdyTfWbDd4nben9EixGjO2REua2KfkesqF0t6uBoBygm9ooND4xA2
 p0TZRnz7l3h8xWLWhGXXBdngzq6Wf0k95wcZlN7vSNjuPPTJn/HAS5wGYZ3GJejxS2cE
 d+574LLgqsfU8lHC1MBn6uc13j0JXqtka8WRwKdvWjpp+0n68yFSrGNxWMXWtYjHE6E7
 N4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bY9oA4EaB11tYsRhr3ohUTdYalVWQGhYUamyU87YuoM=;
 b=R/I0jnGM5VZUA7pIXt3BCUgVFV45cvzmqusTqj2JRuSNBf0fzZpbuyWOdLCOtRGj+N
 c+5EFVn3APlI4JzjrpnX2Hz5923mMItcSWk2K5wMXYHSLanhi6NZiFnndQrNbvSAbfLy
 W+zbAVkXtqBbQWvFH10WQqmfsXTWhzIeVlW3Qmx6bsDpJrS8j8NYuv5xh9LU1TjD4wE8
 bISg+k8L+txazkE2ryJpcsngAK9ibFONVcCjKfUqgBfzItzwj5h1CCK7ZFqUn5iOjKk3
 qvsVd6vI2drW7ZlJu6dauYpf31dQzPuTNkE4QXdTKiBE6Hu+oBvFRxRHzjKt5fhN8eKm
 N0TQ==
X-Gm-Message-State: AJIora831xbjIKKgw7jTUUTMMi/kDxJpwY376RVPmKbpzXMf5pPB3eSI
 u5Q2yR6btwtZPWnX/YxPc7k/RA==
X-Google-Smtp-Source: AGRyM1t3rfEDjAQe7mc2Yzi+GrCOlp/9Atgej+gWk8VKlxY53m5kzQUfymSLh5J9dqhuqsdm50M6ew==
X-Received: by 2002:a17:90b:1247:b0:1ec:7e21:c2d9 with SMTP id
 gx7-20020a17090b124700b001ec7e21c2d9mr5382787pjb.240.1656093861865; 
 Fri, 24 Jun 2022 11:04:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 x188-20020a6263c5000000b0052513c1c4bbsm2043518pfb.38.2022.06.24.11.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 11:04:21 -0700 (PDT)
Message-ID: <1228a7e9-4c25-bd43-68d6-53225fc30384@linaro.org>
Date: Fri, 24 Jun 2022 11:04:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] target/ppc: Check page dir/table base alignment
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
 <20220624171653.143740-4-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624171653.143740-4-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/24/22 10:16, Leandro Lupori wrote:
> Check if each page dir/table base address is properly aligned and
> log a guest error if not, as real hardware behave incorrectly in
> this case.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/mmu-radix64.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 339cf5b4d8..1e7d932893 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -280,6 +280,14 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>       *psize -= *nls;
>       if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>           *nls = pde & R_PDE_NLS;
> +
> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
> +                " page dir size: 0x"TARGET_FMT_lx"\n",
> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3));
> +        }
> +
>           index = eaddr >> (*psize - *nls);       /* Shift */
>           index &= ((1UL << *nls) - 1);           /* Mask */
>           *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));

In your response to my question on v1, you said that it appears that the cpu ignores bits 
*nls+3. This isn't ignoring them -- it's including [nls+2 : nls] into pte_addr.

It would be better to compute this as

     index = ...
     index &= ...
     *pte_addr = ...
     if (*pte_addr & 7) {
         qemu_log(...);
     }


r~

