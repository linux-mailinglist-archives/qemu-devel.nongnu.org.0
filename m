Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1F409CF8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:28:21 +0200 (CEST)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPrcq-0002xy-2N
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mPrZg-0000F5-TN; Mon, 13 Sep 2021 15:25:04 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mPrZe-0006XC-OJ; Mon, 13 Sep 2021 15:25:04 -0400
Received: by mail-qk1-x731.google.com with SMTP id y144so11875494qkb.6;
 Mon, 13 Sep 2021 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=46guwNeUQWjJCaiBh9vJl+iK6heRY55Gz0ijmG7c0y4=;
 b=RzOEDuDAXRHiv6ltgEN5c6ua6P3OYM5KbqlpcrBJi03RsEdWxuA3jZDtamhzlElS0w
 lHy0e0rR9dHPWQU3+QlEmJ2L8Y8aem/inHZDt2phEEMloJtmHdJEMO3kDhAYj2SbBFXn
 2mMeMnmoBL6ZJFRT9mkar7usnWCIv/yrL1oiVMIXN86eNpbJYdSJkq1zp88hGyCCsqqb
 avTWeOlW9BC59d4E2gFM/twSvpGefvTcdUaTc5XLCwg8D4pqSjq+9QiSYgE4uwE7tYBk
 VfWSsQCNzslwGB4q7Est6aKTCOHz2TDM/RmO7oBwqD6s01eMZBA7VxqQt1ZE84UjdiOU
 Vu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=46guwNeUQWjJCaiBh9vJl+iK6heRY55Gz0ijmG7c0y4=;
 b=vVkKToZR6DqS8LArQfbafc5ZYprH3ItbdnkCMIh9f/Xtc6lnrXNrqf9gQEzrAVLMly
 FoTWNIvyiAi6GvXqmfBxAOaQIdYudrDwVgSaEFTEt0PufzLMbkpTSiRTBD/VncdzYZNU
 Wfb7WWEhZ41MMxUmRyHSAAJqfpLN7SjvG/W6sI1q91RE2uG64ukudNDvGE/wubGMw5rI
 3IabqVD63jIc84mW7S1AIiFkGWQdOCxzjuxkcY7tVZFwXzfGaMwJ2lXo+Hm5DSwBYVMg
 CXM1MJtgkern8EjRaBuEFYwzrAhpPX2j2vcXj6Np50c5z8jsPS1LoQOKqPkmurRAugAu
 tpLw==
X-Gm-Message-State: AOAM532F5Xd+zqVDzjd2SZECH5bKaXvif5WShjy/sWJkr1oM8Ybm38JA
 OJVnHfqaN0SVSHn5c8HHSj8=
X-Google-Smtp-Source: ABdhPJwoRy2l0LthRGfcLm1vC19yey9Mfr1f/h0fj2YLgMV+XjOomBE37WcdTv1zlIPZku5sTiG6Bw==
X-Received: by 2002:a05:620a:4514:: with SMTP id
 t20mr1282260qkp.114.1631561100694; 
 Mon, 13 Sep 2021 12:25:00 -0700 (PDT)
Received: from [192.168.10.222] ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id l7sm5934452qki.99.2021.09.13.12.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 12:25:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/ppc: add LPCR[HR] to DisasContext and hflags
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
 <20210909203439.4114179-2-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <1822d290-9ff7-9239-bc6a-351949861f41@gmail.com>
Date: Mon, 13 Sep 2021 16:24:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909203439.4114179-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, leandro.lupori@eldorado.org.br,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/9/21 5:34 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Add a Host Radix field (hr) in DisasContext with LPCR[HR] value to allow
> us to decide between Radix and HPT while validating instructions
> arguments. Note that PowerISA v3.1 does not require LPCR[HR] and PATE.HR
> to match if the thread is in ultravisor/hypervisor real addressing mode,
> so ctx->hr may be invalid if ctx->hv and ctx->dr are set.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/cpu.h         | 1 +
>   target/ppc/helper_regs.c | 3 +++
>   target/ppc/translate.c   | 2 ++
>   3 files changed, 6 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c..e1b8d343cd 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -600,6 +600,7 @@ enum {
>       HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
>       HFLAGS_GTSE = 3, /* computed from SPR_LPCR[GTSE] */
>       HFLAGS_DR = 4,   /* MSR_DR */
> +    HFLAGS_HR = 5,   /* computed from SPR_LPCR[HR] */
>       HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
>       HFLAGS_TM = 8,   /* computed from MSR_TM */
>       HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 405450d863..1bfb480ecf 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -106,6 +106,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>       if (env->spr[SPR_LPCR] & LPCR_GTSE) {
>           hflags |= 1 << HFLAGS_GTSE;
>       }
> +    if (env->spr[SPR_LPCR] & LPCR_HR) {
> +        hflags |= 1 << HFLAGS_HR;
> +    }
>   
>   #ifndef CONFIG_USER_ONLY
>       if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 171b216e17..909a092fde 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -175,6 +175,7 @@ struct DisasContext {
>       bool spe_enabled;
>       bool tm_enabled;
>       bool gtse;
> +    bool hr;
>       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>       int singlestep_enabled;
>       uint32_t flags;
> @@ -8539,6 +8540,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
>       ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
>       ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
> +    ctx->hr = (hflags >> HFLAGS_HR) & 1;
>   
>       ctx->singlestep_enabled = 0;
>       if ((hflags >> HFLAGS_SE) & 1) {
> 

