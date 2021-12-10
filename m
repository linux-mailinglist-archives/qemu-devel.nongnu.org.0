Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E472B470396
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:14:01 +0100 (CET)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhay-0004pS-OZ
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhZ4-0003S0-OW
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:12:04 -0500
Received: from [2607:f8b0:4864:20::1036] (port=56120
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhZ3-0005Sb-As
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:12:02 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v23so7026660pjr.5
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uytk9CbZYhrrFVCeXAsOW+dc2f3EmOXFP9cLyrouMhc=;
 b=oq64BG1SQ3CIA7I8iucaksrZACw8dZDbHfvW9rBCSQBkfondWRvs1k4lfusYFanfVR
 IEea3QQXjjl8on5r1vZ+AmqjEY6FYfKHwj73T93tMFbviXzPVI7/y4uVMGqXDG/YGprZ
 0LopwKFUCFp2USf2ZflljF45txFviExZE16k9oZ2MK8dfszt508kb+C0SNaIq1bKKdh9
 ZBSCLuXhlPbxRrSjjoYEaUq485kLvqyRHIgp+wjv39xYntD7wGfk6ffOu2BqwMt1cZIx
 53GATV1RvOuLoVGvdMbGBxYEUwSaM2SAR9hDd9YLd6rhrvNo7wvnPuZmYXwAyO4YNtGw
 xjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uytk9CbZYhrrFVCeXAsOW+dc2f3EmOXFP9cLyrouMhc=;
 b=LBH+3pb53VgQVHwQ09GD/LbndotRuDIWkRHZ2BhLLSodNMezDOkimj/7tpf/N1k4tW
 cVZPfzg3iO600jKdzeGNliEXMYR6Sw4KSdmrs2/pisvhgeoZuhBXhVHU8CfSJfxX2Dcm
 CvfNGTWl0/pavTxNkNgpWC1PKlY1mFJKpaB4LErbGjAeN1ksaIHwrVVRGVz3uY2RJv7B
 wdocFeFc1sWVUWLh5TcvvKJm+X1bKxqykQJRTbvN05Njx6KU9diTqb+n4frrxkIUms3+
 ZlxSRxtckW7PtmcigNZow7508R/uEqppH3v18djlPcIA3qejfuBjVywVsYaRYobWAjoB
 ZeKA==
X-Gm-Message-State: AOAM532sEFPlAKxmMt9YC5I1EkzfOKbyM6zcc7QQdZKyj5KG/8/Y/eiS
 5YKWT2VpTayBPLis71FuHztbIA==
X-Google-Smtp-Source: ABdhPJzeL+wQmnwFPpkeYQCMrghLHdda0qtXv7+kRYSDby5J/TijJwfY+NOUgcxzg+b6ST8z1sr9FA==
X-Received: by 2002:a17:90a:6e0c:: with SMTP id
 b12mr24069938pjk.41.1639149116238; 
 Fri, 10 Dec 2021 07:11:56 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id a18sm3332739pfn.185.2021.12.10.07.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:11:55 -0800 (PST)
Subject: Re: [PATCH 2/2] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
 <20211210062638.824672-3-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56a5e33d-bf0f-f588-d288-a302b5631fb4@linaro.org>
Date: Fri, 10 Dec 2021 07:11:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210062638.824672-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: palmer@dabbelt.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 10:26 PM, Alistair Francis wrote:
> @@ -975,7 +975,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
>       target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
>       target_ulong deleg = async ? env->mideleg : env->medeleg;
> -    bool write_tval = false;
>       target_ulong tval = 0;
>       target_ulong htval = 0;
>       target_ulong mtval2 = 0;
> @@ -1004,9 +1003,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           case RISCV_EXCP_INST_PAGE_FAULT:
>           case RISCV_EXCP_LOAD_PAGE_FAULT:
>           case RISCV_EXCP_STORE_PAGE_FAULT:
> -            write_tval  = true;
>               tval = env->badaddr;
>               break;
...
> @@ -1041,17 +1042,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           if (riscv_has_ext(env, RVH)) {
>               target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
>   
> -            if (env->two_stage_lookup && write_tval) {
> -                /*
> -                 * If we are writing a guest virtual address to stval, set
> -                 * this to 1. If we are trapping to VS we will set this to 0
> -                 * later.
> -                 */
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 1);
> -            } else {
> -                /* For other HS-mode traps, we set this to 0. */
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
> -            }
> +            env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>   
>               if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
>                   /* Trap to VS mode */
> @@ -1063,7 +1054,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                       cause == IRQ_VS_EXT) {
>                       cause = cause - 1;
>                   }
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>               } else if (riscv_cpu_virt_enabled(env)) {
>                   /* Trap into HS mode, from virt */
>                   riscv_cpu_swap_hypervisor_regs(env);
> @@ -1071,6 +1061,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                                            env->priv);
>                   env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
>                                            riscv_cpu_virt_enabled(env));
> +                if (tval) {
> +                    /*
> +                     * If we are writing a guest virtual address to stval, set
> +                     * this to 1.
> +                     */
> +                    env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 1);
> +                }

The thing that concerns me here is the very legitimate badaddr of NULL.  I think you need 
to keep some out-of-band flag for that.

In addition, the out-of-band flag should probably be called write_gva, because tval from 
ILLEGAL_INST is not a Guest Virtual Address, and so should not set GVA.

You could even push the setting of the bit down so that it's only done once, e.g.

     hstatus_gva = true;
     tval = env->badaddr;

     if (trap to vs) {
        ...
        hstatus_gva = false;
     } else if (virt enabled) {
        ...
     } else {
        trap into hs
        hstatus_gva = false;
     }
     env->hstatus(set_field(env->hstatus, HSTATUS_GVA, hstatus_gva);


The actual handling of ILLEGAL_INST looks fine.
You may well want to split the GVA handling to a separate patch.


r~

