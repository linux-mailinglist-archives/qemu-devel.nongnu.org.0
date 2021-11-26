Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85645ECA2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:29:09 +0100 (CET)
Received: from localhost ([::1]:42782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZPg-0003aD-AM
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZMd-0001Pe-FF
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:26:02 -0500
Received: from [2a00:1450:4864:20::431] (port=33288
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZMY-0003Ju-6j
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:25:57 -0500
Received: by mail-wr1-x431.google.com with SMTP id d24so18015518wra.0
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 03:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yr9jOC1pGsGdgIenzCxYIJ8jAVDiQvpRdloz/KzY1IM=;
 b=lk4BQXqXHgQHLqSrjrX81TrzRtorPMdWhSuY7Q1l1tSzMuNGRE+dRTSePyo1sBRwKY
 ACfoyFU5ldB7ozmfv9J9pQ0b3nTZhyGIuKfoewDvkEVFOMj6xJ2hUpzD3LcGvv0W4elD
 3kAD0JshZinja2CgQh2eH/tmHfGuVj388H7DMpODQ366s9iJbm49Y2KEy9/6XvVG7XEi
 lKutXUJ9HQY6CmMwnbD3+0V12IFmNppBUPbLxf0l9yov7ojRL68y4eioBvgwp8TnkdnK
 41eFX+ZpMz8QNDq6IFeDpNhYCQEOSc/2v/Q9e/2P/KZV6zcDkAqoi6cJS7tATJS7dhWG
 BVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yr9jOC1pGsGdgIenzCxYIJ8jAVDiQvpRdloz/KzY1IM=;
 b=OmnJG7Us8osroy+8nlkcBzaNyzV2KCxl23Rilxa0Rmixrn9UP0QSCWmceKD1Lu4/Tc
 W86f1F9GoSHfQpRn4G7li9qHejaSk0iSGnD/vNCIFr6waRljkExDcomIueovaKO/rPOv
 8w97UBTCKd+tNert+KnM4MCQHQ2tY3WfKUrHtrVQAIUPgyOnkAsFpIsHp8b3nhUoV7Hc
 YH2LvgUuwcKpizUGTy4Mhnk5cMkKx5D+WcnNfsa4r0BDYZ3/85OKRU5xEbAAvRmx4mSZ
 MTz2/HCrzpVkI89nYjpayjOsOu3oe2MxkVZPoeRMM7UuEsrf1wC1vVWdSsFXug2w7qrq
 HGEg==
X-Gm-Message-State: AOAM5304PP7xiGnscm6EggrDi83wQIGS11Os7Anp62VgrL0JKfezx+FP
 TmoKJDnhLXkMgqiK57DchaWTfg==
X-Google-Smtp-Source: ABdhPJzaRwY8oag20f2IB0KQkQBgeKqT+lWECLiqRidOpzzg+3FCHPxYoCX8JEN9qqdAfuy1N6GMWw==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr13439327wrv.13.1637925952348; 
 Fri, 26 Nov 2021 03:25:52 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k13sm5226274wri.6.2021.11.26.03.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:25:51 -0800 (PST)
Subject: Re: [PATCH v5 04/22] target/riscv: Create xl field in env
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
 <20211125073951.57678-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de83d72e-6637-7237-e299-09765f5ed3b1@linaro.org>
Date: Fri, 26 Nov 2021 12:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125073951.57678-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 8:39 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.c        | 1 +
>   target/riscv/cpu.h        | 3 +++
>   target/riscv/cpu_helper.c | 3 ++-
>   target/riscv/csr.c        | 2 ++
>   target/riscv/machine.c    | 5 +++--
>   5 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..5c757ce33a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -377,6 +377,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>       /* mmte is supposed to have pm.current hardwired to 1 */
>       env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>   #endif
> +    env->xl = riscv_cpu_mxl(env);
>       cs->exception_index = RISCV_EXCP_NONE;
>       env->load_res = -1;
>       set_default_nan_mode(1, &env->fp_status);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..412339dbad 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -138,6 +138,7 @@ struct CPURISCVState {
>       uint32_t misa_mxl_max;  /* max mxl for this cpu */
>       uint32_t misa_ext;      /* current extensions */
>       uint32_t misa_ext_mask; /* max ext for this cpu */
> +    uint32_t xl;            /* current xlen */
>   
>       uint32_t features;
>   
> @@ -420,6 +421,8 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>   }
>   #endif
>   
> +RISCVMXL cpu_get_xl(CPURISCVState *env);

Probably this name should be a define/inline function, just like riscv_cpu_mxl.  The 
proper function should probably be renamed cpu_recompute_xl, or something.

>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>           VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -183,6 +183,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT32(env.misa_ext, RISCVCPU),
>           VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
> +        VMSTATE_UINT32(env.xl, RISCVCPU),

Do not save this.  We prefer to only save architectural state (which is of course 
required), and recompute anything else (which is qemu internal) from that in the post_load 
hook.  This allows qemu internals to change without breaking compatibility.


r~

