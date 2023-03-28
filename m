Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E776CC9F9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 20:20:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDvC-0000ze-5w; Tue, 28 Mar 2023 14:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDv6-0000xU-Ew
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:19:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDv4-0007Af-JP
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:19:44 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so4701795wmq.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680027579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VktV9LDaI0Wt5DLuKjRK3hoTsUpzSGfwRsxbs4euC5M=;
 b=pZ6HsxO1q5rMuLkh3i2vG3HkryiiZUHxmqA7VG6ybNtICi0OQmuQqnvM2kJysvXo9w
 PBk/A+DTYiRe5iA9y4S/m8eS+Tv31Gy5zfa9e7/Eb2BtH1QvZbNC9eXNGQc2i/A+cicM
 Bx5K1yrPWmwUbWvRp4RJ+23xIIGef7EwV7EudQTJgAkajtSjoOUM6nAbDoIh48GUNZWs
 YJAgwSs9CJKD1xz/Y4waSECdtadCoZde5bCHZ49+KY7RyUCRKUXDWL1O8NJNE6PnhijH
 lqU/ArSkjhQgovj0k1HuOFtf8PrRhlSSnEcDtuLf3msafmiREyF/CLtBVlxaETS2oqoe
 NjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680027579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VktV9LDaI0Wt5DLuKjRK3hoTsUpzSGfwRsxbs4euC5M=;
 b=E8MTSgHmsOdIn+047yX1ByrNJdb7fk+lFxhwd18HUHgCZu+EPuJdT/YWL9WcpEaevn
 Pru5dTsIyypGplyBl0eeJ/MIA+RucUjOoZE8rz2I8V3HeHqiAtsMQZEd9Rv00MjRvn4E
 lURSpHfg5+d++oWzcgVwmCtOv1Rw3GxpeE9mgmXKWl3Z/uQN4E2sWS/FSpu87n89EPCg
 iL0ZXcnVId8sk9gisG81dQCzkVVfKS0Q4EhfOi2w/Xi2ObFpXFi8FDmbW1rLITDabF9/
 /R+Nq8uJd9HaJ7RQX5AMtYD6OKj1POFw3ZC3YmnIhI1J904sstyieIhPGnwCPFl/FB+V
 bFAw==
X-Gm-Message-State: AO0yUKWUI24lOX+19Kz2kI2oxbehiLlbChaENqRaLfLJZybV0urZCcS0
 jBilft7MaL8ldTfejBV10Fuvtw==
X-Google-Smtp-Source: AK7set9Yu6n8ckWojA5Fk8LGLughKfreb2ERGPQeTmXOkdKvAzoa+GfTW/Xipay8NxWo0z/WWHQmZQ==
X-Received: by 2002:a1c:7406:0:b0:3ee:18e:a1ef with SMTP id
 p6-20020a1c7406000000b003ee018ea1efmr12494141wmc.1.1680027579735; 
 Tue, 28 Mar 2023 11:19:39 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a1c7308000000b003e20cf0408esm17930751wmb.40.2023.03.28.11.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 11:19:39 -0700 (PDT)
Message-ID: <0e937a8d-17ad-5985-bacc-8896fe1c9736@linaro.org>
Date: Tue, 28 Mar 2023 20:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2 12/12] linux-user/arm: Take more care
 allocating commpage
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
 <20230327211824.1785547-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230327211824.1785547-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 27/3/23 23:18, Richard Henderson wrote:
> User setting of -R reserved_va can lead to an assertion
> failure in page_set_flags.  Sanity check the value of
> reserved_va and print an error message instead.  Do not
> allocate a commpage at all for m-profile cpus.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 37 +++++++++++++++++++++++++++----------
>   1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index f1370a7a8b..b96b3e566b 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -423,12 +423,32 @@ enum {
>   
>   static bool init_guest_commpage(void)
>   {
> -    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
> -    void *want = g2h_untagged(commpage);
> -    void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
> -                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> +    ARMCPU *cpu = ARM_CPU(thread_cpu);
> +    abi_ptr want = HI_COMMPAGE & TARGET_PAGE_MASK;
> +    abi_ptr addr;
>   
> -    if (addr == MAP_FAILED) {
> +    /*
> +     * M-profile allocates maximum of 2GB address space, so can never
> +     * allocate the commpage.  Skip it.
> +     */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
> +        return true;
> +    }
> +
> +    /*
> +     * If reserved_va does not cover the commpage, we get an assert
> +     * in page_set_flags.  Produce an intelligent error instead.
> +     */
> +    if (reserved_va != 0 && want + TARGET_PAGE_SIZE - 1 > reserved_va) {
> +        error_report("Allocating guest commpage: -R 0x%" PRIx64 " too small",
> +                     (uint64_t)reserved_va + 1);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    addr = target_mmap(want, TARGET_PAGE_SIZE, PROT_READ | PROT_WRITE,
> +                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> +
> +    if (addr == -1) {
>           perror("Allocating guest commpage");
>           exit(EXIT_FAILURE);
>       }
> @@ -437,15 +457,12 @@ static bool init_guest_commpage(void)
>       }
>   
>       /* Set kernel helper versions; rest of page is 0.  */
> -    __put_user(5, (uint32_t *)g2h_untagged(0xffff0ffcu));
> +    put_user_u32(5, 0xffff0ffcu);
>   
> -    if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
> +    if (target_mprotect(addr, qemu_host_page_size, PROT_READ | PROT_EXEC)) {
>           perror("Protecting guest commpage");
>           exit(EXIT_FAILURE);
>       }
> -
> -    page_set_flags(commpage, commpage | ~qemu_host_page_mask,
> -                   PAGE_READ | PAGE_EXEC | PAGE_VALID);

Included in target_mprotect(PROT_EXEC), OK.

>       return true;
>   }
>   

LGTM. As a future cleanup, I'd rather see all init_guest_commpage()
use the same API: either mmap/mprotect/page_set_flags or the target_XXX
equivalent. The latter is preferred, since the logic is simplified.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


