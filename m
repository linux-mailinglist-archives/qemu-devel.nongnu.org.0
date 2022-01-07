Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F3486FBF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 02:39:49 +0100 (CET)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5eEM-0005Ri-T6
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 20:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5eCS-0004MJ-J5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 20:37:48 -0500
Received: from [2607:f8b0:4864:20::102f] (port=39804
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5eCR-0007Nh-2f
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 20:37:48 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso8953146pjm.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 17:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j4zZ0sgD3zfmvR+R75RLirx1u1AWNR7jFVos5MAwEfs=;
 b=UE2SI8A/wTvcFzXHrP8tjRm2XA+KjR/Ome5YQSX+SMzWuXffB8nhlbdkmFcRLF33Fr
 oZ7yd1xaC5ucc3zzKVHlBr/pGr8Rkzqh/kWidpvfd0J6pCFzqUjtkpR3g53cdFjYQsLT
 Z/1+5SY9U67KOHwa9wNTN8g0SI9yxsIbQtfNLJTqfcKZH361ZV1pfCMTpOdPlHjQuwn3
 xknr6BVf43tK9Jri/HNJ/HmnW+Ank6HQ/ilEkP8yHwrBrjo8W7bWWKlgk5wh7VvAVDAt
 bO6EdOTA6ura+IzzgI+Pb7rErVEef13agOcpHE6SFCpfPts/iPUbNJ4PHtNH/4pMR785
 UeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4zZ0sgD3zfmvR+R75RLirx1u1AWNR7jFVos5MAwEfs=;
 b=3RI60R14M51HbaNXUj42BsB6/j3TxTXb87hPnHJvw6fJdexiAyuFXNrwFiEC5eKBBT
 JwuybngHMO0y4WNJTJWT2+8Dy+J29GmnTLr3KA/9uQDtW55OgYoDCfZEoF24cyEPLUsZ
 omW3y5cFzokAVqdjyGgVZ9KkfRyYBk8TqnqrvfOAI9ofWVAzg4qDuTEboswQ/O4wNtii
 JZKP+IrOXM13jZvR6gpaXDAoSef0kpVslSCIN0BgfzHRYGwxPbE6zSG0nwPwRif4SX66
 kLYbUexgduFzGO95NNJn9KYiITKLg8yqTFaUAptxNRrOFktkclH6j9gj/YQGIbwepTV0
 laeA==
X-Gm-Message-State: AOAM533bd2AAN3FAQzupiQgko9akJR2XryMr6gA603auURKFe9kHzGhS
 wfETs26sfBSH+HkizT8WwIJnYg==
X-Google-Smtp-Source: ABdhPJxrcTZQLvh5/T81fBDIUrslWzsDsz+Hfb0h4J0LILfd/JQkh/PDzXhe8J5rjlPCGAUy/lROKg==
X-Received: by 2002:a17:902:c10d:b0:149:8b16:ee0e with SMTP id
 13-20020a170902c10d00b001498b16ee0emr45657890pli.107.1641519465279; 
 Thu, 06 Jan 2022 17:37:45 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f12sm3735267pfe.127.2022.01.06.17.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 17:37:44 -0800 (PST)
Subject: Re: [PATCH v2 1/7] target/ppc: powerpc_excp: Extract software TLB
 logging into a function
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-2-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <967e2323-934d-dc37-cd65-5ecddb1bfffb@linaro.org>
Date: Thu, 6 Jan 2022 17:37:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105204029.4058500-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 12:40 PM, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 63 +++++++++++++++++++++++-----------------
>   1 file changed, 36 insertions(+), 27 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a779dc936a..2c5d5470de 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -135,6 +135,41 @@ static void dump_hcall(CPUPPCState *env)
>                     env->nip);
>   }
>   
> +static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
> +{
> +#if defined(DEBUG_SOFTWARE_TLB)
> +    const char *es;
> +    target_ulong *miss, *cmp;
> +    int en;
> +
> +    if (!qemu_log_enabled()) {
> +        return;
> +    }
> +

Because code movement,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Better is qemu_loglevel_mask(CPU_LOG_MMU)
and perhaps then you can remove the ifdef.


r~

