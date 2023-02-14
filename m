Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53D69648F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:23:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvFY-0008GQ-CG; Tue, 14 Feb 2023 08:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvFP-0008Ee-Vw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:21:28 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvFM-0005ep-2Y
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:21:27 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 x24-20020a9d4598000000b00690bf2011b2so200687ote.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SR4hpjofavkRpILzrdxX4rJrMw98WfBm0lbuzcqR8io=;
 b=AyJWWjWOimR+ABqxHYlEfA964hn1rVaa12RgHnik5ynmPH5RYgskGPUKFpmMMxwCI5
 mACv3hv/ihESmfY+UBCAEtaChu3JLlR3m2/oYtrWL3HSCgp/OklRgfnasg5XoYzp9WQs
 Qz41BN6QazjUhFRgC40elPXwna1bABfeB5qadgsCUBqNpVNL68H2mwiPZLwcmh4wFBvH
 Wq+//jSJd60rdZuB3vePrWZtAu9NFDdbLTv7SPkvQ9mGkgpUvOcm8hMNPHDT7yfcynuu
 vCp56j0S8uM9z+AhpfxRkeO8X8L8MMrgISsLdtDrutlZuxxLTD139ZT3qcQWOBNqEu2G
 Emug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SR4hpjofavkRpILzrdxX4rJrMw98WfBm0lbuzcqR8io=;
 b=NE9zC0c388uyJCOxokSFnq8B5oNtE+iOrTp8vjUjfnSdgfLv6Sh7HGtRnRtbMFcCJi
 8jx8fELwBwe376PSI8G/F7nd9r4VYSkI1acCJATNAPTIruPfCZvtgq1vNB+mPdwXVnyn
 gJINvkifiK3ueHFBNW5fX7LNuuxkSbetNdQmNnQCNGHPeouDdBUmWv0KK5gDMGiXG+EW
 K/QUWO2iyqKlvpZo/KBCREn+IZwLTM2ca6ahO3RityD06BD2kb+4A1johdjBLbFXWoPe
 fS9a9Zki97bNSe8Gb75HmOAg/qPMOo4hWI0Qs9CrQoEc0fDWM+OKzlU1Awera7WGbDg0
 dwjQ==
X-Gm-Message-State: AO0yUKUkn7iIJAWJEyBP8+tQyDzpdKznwlVgBk7A7uCJCL5d6SQMMcQG
 iq/bKwyNlANtLept+C2TlOLpng==
X-Google-Smtp-Source: AK7set/lwm/fjhJNuaUnJ2ZCR+r1Ob/Dvrc+s6YSd+op24YONl2CQAti9It2S8YPfs/MkFfKwIQsUw==
X-Received: by 2002:a9d:5d13:0:b0:68b:906b:178a with SMTP id
 b19-20020a9d5d13000000b0068b906b178amr929713oti.2.1676380868882; 
 Tue, 14 Feb 2023 05:21:08 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a9d628e000000b006863ccbf067sm6261869otk.74.2023.02.14.05.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:21:08 -0800 (PST)
Message-ID: <78ccde8a-4bbb-d000-de5b-dcb00a65a070@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:21:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 05/14] target/riscv: Fix relationship between V, Zve*, F
 and D
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-6-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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



On 2/14/23 05:38, Weiwei Li wrote:
> Add dependence chain:
> *  V => Zve64d => Zve64f => Zve32f => F
> *  V => Zve64d => D
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9a89bea2a3..4797ef9c42 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -743,12 +743,27 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> -        error_setg(errp, "V extension requires D extension");
> +    /* The V vector extension depends on the Zve64d extension */
> +    if (cpu->cfg.ext_v) {
> +        cpu->cfg.ext_zve64d = true;
> +    }
> +
> +    /* The Zve64d extension depends on the Zve64f extension */
> +    if (cpu->cfg.ext_zve64d) {
> +        cpu->cfg.ext_zve64f = true;
> +    }
> +
> +    /* The Zve64f extension depends on the Zve32f extension */
> +    if (cpu->cfg.ext_zve64f) {
> +        cpu->cfg.ext_zve32f = true;
> +    }
> +
> +    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
> +        error_setg(errp, "Zve64d extensions require D extension");
>           return;

I'll be honest and confess that I wrote a short essay about the problems I have
with this code. I gave up because in the end it's all stuff that we've been doing
for a long time in riscv_cpu_validate_set_extensions(). I'll see if I can work in
a redesign of that function and in how we're setting extensions automatically
without checking user input and so on.

For now I'll say that this error message seems weird because Zve64d was set to true
without user input. So this ends up happening:

$ ./qemu-system-riscv64 -M virt -cpu rv64,v=true,d=false
qemu-system-riscv64: Zve64d extensions require D extension

It's weird because the user didn't enabled Zve64d but the error message is complaining
about it. Given that the root cause is that ext_v was set, and then we've set other
extensions under the hood, a saner error message in this case would be "V extension
requires D extension".


Thanks,


Daniel



>       }
>   
> -    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
>           error_setg(errp, "Zve32f/Zve64f extensions require F extension");
>           return;
>       }

