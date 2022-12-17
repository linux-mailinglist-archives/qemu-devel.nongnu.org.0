Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95C64F667
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:40:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LFZ-0000Qm-PT; Fri, 16 Dec 2022 19:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LFK-0000Nb-0p
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:40:10 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LFH-0005e9-05
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:40:08 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 130so2834738pfu.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jghR/KN8Mxstogtc1na7VoaWWs7m/MAHQG9pSqMvyL4=;
 b=Rv/mOyw7Ah8LF6nR6IQXyfaVfNdPkMUjID6JUw7mzNS8huYc6nELsImhDR4oP5B41g
 tQnbV3XAWiB45Y2fpEy3WrZL5jtb0b6uaBBVVdr458T9/LXN6SvubEyQFOTZVKCSdnfK
 9KUTEbzMSUiwfHkw0jRVeOSY/8A+vrQKFG7dtY38vUWfvqapH5lkg/VQGO4F7g78S7B2
 q60r43W9vRK/Zcz09B1ko6qn1kTnvoxCA/sgvc90BJ5eTWfv9Mr4v2PfNzukgidsWCfs
 5XziQdLT/616w1s802Jw/51cRCvNkUyNNfKz2lKg0AVKWlkUqqu8xQ7k0p+M2REfwcRq
 MAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jghR/KN8Mxstogtc1na7VoaWWs7m/MAHQG9pSqMvyL4=;
 b=cd1O5IVsNtpZZU8HQoNlV9uGHBGrvzXXYLWzSE7GZXUSoSu9QvOhuZGP1icqT1WyHW
 eiiELOC4+ehbbwB9PynJ3bvU7hcsvpxOOSrGjT8bAjwWurNjo2vUolv7D4UpIQ9AsmnH
 X56E5xWdz6wqUUQMENEECt2L7er9wCrbfpFtP7m/Cg/n9tvWAcBBKopUrKnN70BNAT1i
 7mzgVhdNivm15cicx677kJpjS2mdC1869CRB2FfHXXNWE2L920G1T3eh5icp89x7Wx1I
 4/bpNwQvQ8v14XFbqdmTfGXA5mg9CaUF79mNmDm5wzxrmsnMr627QNplG/NCoGyjS8qH
 PmCA==
X-Gm-Message-State: AFqh2kqc8ppu2sfCF3X/f+bfkMAuRKlQ7055dkKFJAW1B9IlMQ0dFBOT
 OSmW39cZw8PZ56cg2D2C5MajfA==
X-Google-Smtp-Source: AMrXdXt0BN5omY/y2JUnMKWZX9iGWkWdY15VO889Yol5mIsNQOWnG0q4NS3c0416bLxpvRxnxBFm8w==
X-Received: by 2002:a62:4ecd:0:b0:57a:69d1:c15b with SMTP id
 c196-20020a624ecd000000b0057a69d1c15bmr389828pfb.21.1671237605594; 
 Fri, 16 Dec 2022 16:40:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 y184-20020a6264c1000000b00576d4d69909sm2067625pfb.8.2022.12.16.16.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:40:05 -0800 (PST)
Message-ID: <b4a14228-2f7c-e53b-30aa-3833d5d80992@linaro.org>
Date: Fri, 16 Dec 2022 16:40:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/10] target/riscv/cpu: Restrict sysemu-specific fields
 from CPUArchState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is only available / meaningful on system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu.h | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fc1f72e5c3..bd4e16d946 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,16 +368,6 @@ struct CPUArchState {
>       uint64_t menvcfg;
>       target_ulong senvcfg;
>       uint64_t henvcfg;
> -#endif
> -    target_ulong cur_pmmask;
> -    target_ulong cur_pmbase;
> -
> -    float_status fp_status;
> -
> -    /* Fields from here on are preserved across CPU reset. */
> -    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> -    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> -    bool vstime_irq;
>   
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
> @@ -388,6 +378,16 @@ struct CPUArchState {
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +#endif
> +    target_ulong cur_pmmask;
> +    target_ulong cur_pmbase;
> +
> +    float_status fp_status;
> +
> +    /* Fields from here on are preserved across CPU reset. */
> +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;
>   };

Except for fp_status, all of the other fields that you move are sysemu specific.


r~

