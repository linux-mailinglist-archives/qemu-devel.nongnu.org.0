Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B36E4E44
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:26:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRfx-0004gh-H8; Mon, 17 Apr 2023 12:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poRfr-0004eg-UR
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:25:52 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poRfl-0006no-98
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:25:46 -0400
Received: by mail-oi1-x233.google.com with SMTP id f4so3015469oiw.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681748744; x=1684340744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tbrk/rcmXHDC2DCUwpMDvvq/0IVos/imWukQX+WgPzs=;
 b=RtnjtNIIVrqT1NxcBx1Irnd7ajJ/2zWmlYHTyE6jM7BZSGbvOtNoidiSPLNauZTnqL
 K49ktM/eCMorX7uF21VTtDEBG+kIVnpQO29nYVrLD5GG+BI3uFncVXYvLmdBXt5grnt6
 XzailczfDqd41+CoZlLDWv4zOUlMBHfcwnDHaEJ5KQP1IAdc1p7HTf4h3i9mq0TK4Kch
 AVMnnKookZcsQlzWxO4PTPfaRiS5D1Xu6aZN61//3aIp1vl/OZIo6lbfJRMUXq+XqF9q
 qiax9cdwnAD6KIjsKrRSKgcyVq0LRjYs6cBOkWPqSYFjQszCMNInuXISWmHqwLGzLewG
 MEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681748744; x=1684340744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbrk/rcmXHDC2DCUwpMDvvq/0IVos/imWukQX+WgPzs=;
 b=Pux0TI518xc+Urm0vBFUAioXzZqhd2/HIHtbkWSoFMWpOJ8Flx/6NgplbeavTXQgGU
 RxsfGGWPtQhMRmnEpSj4UQNANl3vzUvzZ783MlaxaWxUjztzuIzxQ3/laYNzB+qJkavG
 TKU0i8kPr5DAz5F/PF3C33nSjYyIfsrLsWJZBxuJluXZnyJYEXce9ZrFTXcWMcpJhdw+
 r3nfwzmkNKXWq81+FhkU3nUbSMzgoPz+8csdJPjhTMNNMgADH0sy7pC5S7s5lifFeroj
 ce8ZNzh8fiJp3qlmoHAy5q1vQ7Ohjrg2uv7Ry2fbp0ldDj6jAE+PEi2rceH7UfFQrR7P
 JOuA==
X-Gm-Message-State: AAQBX9eh36EOpxKXZr3vuc1VQtyf4EyQnVk3CIaRjQr4AQAFCS1l/OLL
 1TsQzjhBhsWs43/ktkgEdR7Y7A==
X-Google-Smtp-Source: AKy350YJl0BEobHA945/cbrQWRwCgCuDYoLDRNy4IxWSC8Q1dXD9ROjkomtzTPuzOxv78LsjOzOb3w==
X-Received: by 2002:a05:6808:1797:b0:38c:66d3:67bf with SMTP id
 bg23-20020a056808179700b0038c66d367bfmr4014107oib.4.1681748744032; 
 Mon, 17 Apr 2023 09:25:44 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 i205-20020acaead6000000b00383ce81c186sm520896oih.32.2023.04.17.09.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 09:25:43 -0700 (PDT)
Message-ID: <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
Date: Mon, 17 Apr 2023 13:25:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] accel/tcg: Remain TLB_INVALID_MASK in the address
 when TLB is re-filled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-7-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230413090122.65228-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/13/23 06:01, Weiwei Li wrote:
> When PMP entry overlap part of the page, we'll set the tlb_size to 1, and
> this will make the address set with TLB_INVALID_MASK to make the page
> un-cached. However, if we clear TLB_INVALID_MASK when TLB is re-filled, then
> the TLB host address will be cached, and the following instructions can use
> this host address directly which may lead to the bypass of PMP related check.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

For this commit I believe it's worth mentioning that it's partially reverting
commit c3c8bf579b431b6b ("accel/tcg: Suppress auto-invalidate in
probe_access_internal") that was made to handle a particularity/quirk that was
present in s390x code.

At first glance this patch seems benign but we must make sure that no other
assumptions were made with this particular change in probe_access_internal().


Thanks,

Daniel

>   accel/tcg/cputlb.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e984a98dc4..d0bf996405 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1563,13 +1563,6 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>               /* TLB resize via tlb_fill may have moved the entry.  */
>               index = tlb_index(env, mmu_idx, addr);
>               entry = tlb_entry(env, mmu_idx, addr);
> -
> -            /*
> -             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
> -             * to force the next access through tlb_fill.  We've just
> -             * called tlb_fill, so we know that this entry *is* valid.
> -             */
> -            flags &= ~TLB_INVALID_MASK;
>           }
>           tlb_addr = tlb_read_ofs(entry, elt_ofs);
>       }

