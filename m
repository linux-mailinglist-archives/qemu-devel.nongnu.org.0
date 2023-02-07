Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4D68D076
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIE0-0004fW-0Q; Tue, 07 Feb 2023 02:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIDa-0004as-9X
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:16:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIDY-00021B-Aq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:16:41 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12445730wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 23:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SdsC98/4SZ9Xjl/L0JXgqoOonlZ4/JUVP1q1NWmwnx0=;
 b=ANp+xL4p3I6dUYZIeAq2JVznQR476VWs6tu4e7Uhk1na3KYo+uroF4b0vGaSJAWu/G
 GEWfKq8sx28kKi9TEanHNNJTKES8fRjDZCGxMhM1vbCYtJZUu8kVkm8d9iKfDcWFfV8K
 UM8Vd9ElchTjbVY+FAv7zgzhi/L6paMz89LNNGa+310JcWe3fpI02LtRJnpsD7VrOG0f
 a8GLZB5Y1Rw8z4zoFfUesviB+hMxxqmBGLP4Lt5NLA7Yt3wQsqjAbqT9St8bf70HiiEd
 vXKcx2+w2TbCHu5ucw1EhhUkalqgDrUp30qOYkogml3wbE8AKqAlU+896kZI0CkXYFcP
 hFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SdsC98/4SZ9Xjl/L0JXgqoOonlZ4/JUVP1q1NWmwnx0=;
 b=kENckE8kzQ11dCCFUr5FyOkZ3rLNsP3ukqX02xbWpbpNylhgQFhIwPnxUYBWWGrFwL
 Hw7LA2ompoXFm/Gzxk6Qwnc+1NA2t4D91BuG9mLKCY/iTGI2XLbt0xcVK276yENq6m6J
 0YTXVkUzvsjczpE/X01XncZvrtM6RdqMi27PBVY8myO4TTMRGTSVUef3utzpb/NC12wJ
 99eAYhhczVIB0693lGCaYAvmZqO+IexleoPS3FWYP6k7R59j9hnpQMWuCflcxwjx1yzF
 r5Ytj6VlcMxpcH25h8KE3fsUMZ+3EsmYoseD/LsPo7VzuCjc7gI4vVEFHYGn4ZfvBBDf
 IGNQ==
X-Gm-Message-State: AO0yUKW7P1FAfioKcuJ+JVDQN82bWL9s0SLzB1xi4MUasXvOqTK8k70i
 gG3hZOOoi4zD6fLVlHVtPxGMfA==
X-Google-Smtp-Source: AK7set9DLALWUVGncjqGPewaG73b9nt4qwa7JqUKN/5AVzA3+bU8WX8k+tPtRUQqpAngyjXJgDajOw==
X-Received: by 2002:a05:600c:3287:b0:3d9:e5f9:984c with SMTP id
 t7-20020a05600c328700b003d9e5f9984cmr2853223wmp.2.1675754198819; 
 Mon, 06 Feb 2023 23:16:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002bdda9856b5sm10532127wrz.50.2023.02.06.23.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 23:16:38 -0800 (PST)
Message-ID: <71f8e94b-f66c-099f-cc3d-2cd431ced9ba@linaro.org>
Date: Tue, 7 Feb 2023 08:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com,
 joe.jin@oracle.com
References: <20230206234220.8414-1-dongli.zhang@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206234220.8414-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 00:42, Dongli Zhang wrote:
> The cpu_dump_state() does not print the cpu index. When the
> cpu_dump_state() is invoked due to the KVM failure, we are not able to tell
> from which CPU the state is. The below is an example.
> 
> KVM internal error. Suberror: 764064
> RAX=0000000000000002 RBX=ffff8a9e57c38400 RCX=00000000ffffffff RDX=ffff8a9cc00ba8a0
> RSI=0000000000000003 RDI=ffff8a9e57c38400 RBP=ffffb6120c5b3c50 RSP=ffffb6120c5b3c40
> R8 =0000000000000000 R9 =ffff8a9cc00ba8a0 R10=ffffffff8e467350 R11=0000000000000007
> R12=000000000000000a R13=ffffffff8f987e25 R14=ffffffff8f988a01 R15=0000000000000000
> RIP=ffffffff8e51bb04 RFL=00010046 [---Z-P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
> ES =0000 0000000000000000 ffffffff 00c00000
> CS =0010 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
> SS =0000 0000000000000000 ffffffff 00c00000
> DS =0000 0000000000000000 ffffffff 00c00000
> FS =0000 0000000000000000 ffffffff 00c00000
> GS =0000 ffff8ac27fcc0000 ffffffff 00c00000
> LDT=0000 0000000000000000 ffffffff 00c00000
> TR =0040 fffffe0000096000 0000206f 00008b00 DPL=0 TSS64-busy
> GDT=     fffffe0000094000 0000007f
> IDT=     fffffe0000000000 00000fff
> CR0=80050033 CR2=0000000000000000 CR3=00000010ca40a001 CR4=003606e0
> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 DR3=0000000000000000
> DR6=00000000fffe0ff0 DR7=0000000000000400
> EFER=0000000000000d01
> Code=0f 1f ... ...
> 
> Print the cpu->cpu_index in cpu_dump_state() and remove it from the caller.
> 
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>   hw/core/cpu-common.c      | 1 +
>   monitor/hmp-cmds-target.c | 2 --
>   softmmu/cpus.c            | 1 -
>   3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 5ccc3837b6..d2503f2d09 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -105,6 +105,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>   
>       if (cc->dump_state) {
>           cpu_synchronize_state(cpu);

Should we check for:

           if (cpu->cpu_index != -1) {

> +        qemu_fprintf(f, "\nCPU#%d\n", cpu->cpu_index);

           }

?

>           cc->dump_state(cpu, f, flags);
>       }
>   }
> diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
> index 0d3e84d960..f7dd354d2a 100644
> --- a/monitor/hmp-cmds-target.c
> +++ b/monitor/hmp-cmds-target.c
> @@ -99,7 +99,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
>   
>       if (all_cpus) {
>           CPU_FOREACH(cs) {
> -            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>               cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>           }


