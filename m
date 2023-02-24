Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F46A1BA1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:53:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVWcd-0001hd-PQ; Fri, 24 Feb 2023 06:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWcb-0001gy-TX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:52:17 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWcS-0000b3-S9
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:52:17 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 c2-20020a9d6842000000b0068bc93e7e34so3630577oto.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NztIuqCrmnJbgk5PLl4VI6hgopNK7qDKF7v5qYxbxHU=;
 b=aoIjFJQGN0KeroXatSrkUX1PVdXl+QjJYKonheNVd5pWATWYEY3qIs66ooKOekyrKX
 EpFk4IMsyBam99n8E0P1GCwPaD9qlq6lx265vg1PZLINqk3JYBxAj3oybcL/RENPnx4i
 4diCo/14V86iM9QNrcDouZzf6hE+9nKI9sadtr7DZIv6jHW1KSWt6sOdqy0jP/I0gZNe
 6Z0nFfljVAQydhXidx1ZHzkMUkWR6t3Jt/8NZjP0A6cshdTrskWEHYBndgHk8TF4aFTp
 kPdO2TEVpRu2M12Gm1dbmG8+MU0PLkoTzY7CQhXxXFoJgMnvjhiU++XX2Xld2Y4P1Ufx
 cdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NztIuqCrmnJbgk5PLl4VI6hgopNK7qDKF7v5qYxbxHU=;
 b=5KkvYL8JoolOfQ//mgnhBC10ZfNojBo3RkS+BoRQ5Pvl5NRRglBzOIcywrX9/wqRTd
 dmv4WhllTQo8RmAH6Rl77ci0JFo1Rip5vE4hx+Z4YFDqiMb/sV+9yzyFfKQQnKY3w0ef
 PbLjPrj9KWgM+K7fqe/RIbS35Eu/iywrJ5XrYpZqDhzPlMMQ98J3d9ibzMkIF0MmPwpd
 c/X6I2OCUcbShxeSUzsF5+7V4K8KwQ81JL2GHhWpHma8NwS9Wj9zZbgCWX0+PF1m1rPF
 IaGLN0yJfu4PN/Ku5FujrcLrE4IlU5C1tNRCSL0NLdZGTOszDR7QfzYDLRD5bX4ZVtEm
 OHaw==
X-Gm-Message-State: AO0yUKVVZyRMiD+nb/oiEZ1EveDIK9hvlyaQzJTo4/dOWnJfwwFlCLQ8
 IY6eeofNapqG7ZFcpQJw7ygaPw==
X-Google-Smtp-Source: AK7set8phahpZzX7jXdP+cKOAlGo62AtrdOy602z/aAv9LKuSRRCKadPZrclzBSL29LhN6A9w3MDSA==
X-Received: by 2002:a05:6830:2656:b0:693:c3bb:8392 with SMTP id
 f22-20020a056830265600b00693c3bb8392mr5332140otu.7.1677239527222; 
 Fri, 24 Feb 2023 03:52:07 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f?
 ([2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a9d6007000000b00690dd5e7345sm3528005otj.26.2023.02.24.03.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:52:06 -0800 (PST)
Message-ID: <2e762081-ca31-641c-6b96-4a4abd7852ad@ventanamicro.com>
Date: Fri, 24 Feb 2023 08:52:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/6] target/riscv: Add *envcfg.PBMTE related check in
 address translation
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-5-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224040852.37109-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/24/23 01:08, Weiwei Li wrote:
> menvcfg.PBMTE bit controls whether the Svpbmt extension is available
> for use in S-mode and G-stage address translation.
> 
> henvcfg.PBMTE bit controls whether the Svpbmt extension is available
> for use in VS-stage address translation.
> 
> Set *envcfg.PBMTE default true for backward compatibility.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c        |  3 +++
>   target/riscv/cpu_helper.c | 10 ++++++++--
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..2d99679f2f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -613,6 +613,9 @@ static void riscv_cpu_reset_hold(Object *obj)
>       env->bins = 0;
>       env->two_stage_lookup = false;
>   
> +    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0);
> +    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0);
> +
>       /* Initialized default priorities of local interrupts. */
>       for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
>           iprio = riscv_cpu_default_priority(i);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index ad8d82662c..552c0f0b58 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -936,9 +936,15 @@ restart:
>               return TRANSLATE_FAIL;
>           }
>   
> +        bool pbmte = env->menvcfg & MENVCFG_PBMTE;
> +
> +        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
> +            pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
> +        }
> +
>           if (riscv_cpu_sxl(env) == MXL_RV32) {
>               ppn = pte >> PTE_PPN_SHIFT;
> -        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> +        } else if (pbmte || cpu->cfg.ext_svnapot) {
>               ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>           } else {
>               ppn = pte >> PTE_PPN_SHIFT;
> @@ -950,7 +956,7 @@ restart:
>           if (!(pte & PTE_V)) {
>               /* Invalid PTE */
>               return TRANSLATE_FAIL;
> -        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
> +        } else if (!pbmte && (pte & PTE_PBMT)) {
>               return TRANSLATE_FAIL;
>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>               /* Inner PTE, continue walking */

