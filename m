Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF70409D45
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:39:44 +0200 (CEST)
Received: from localhost ([::1]:46666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPrnr-00071k-AB
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mPrmN-000688-Mx; Mon, 13 Sep 2021 15:38:11 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mPrmK-0006Q7-Lr; Mon, 13 Sep 2021 15:38:11 -0400
Received: by mail-qk1-x731.google.com with SMTP id a10so11896544qka.12;
 Mon, 13 Sep 2021 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MSJ0aFWnETmb7HfWXkWR63r0EqdJQN6ZBWznHab8dTk=;
 b=OsUq809qELJV8uXm32H4x+JO2sx5ZHuRJ9gBzFA+kVclsHYiFAa5uSmYarsHqgqUUA
 RWHxBaUgnAi70DWCydF5YTuaenqboM2SnZD78732mS8mNch995tQ+Jeliyn7nLSHVWtN
 yuifBNAAkx2vyHjaUJhEDBfkPWkB5AN0lgqVEhTHLgGPBK+0c8Yr0UChDaAqDrVPc5pH
 +IA4HHxPMkvE1y802Fb0u5vSNRVSfpqsrFlIv9iCItwRKItzqOJcE1K3hcv3mKP28Voa
 zEjvAqDRYBLiiZxkmOeDrrYB27wg1ihZ0wKejnz9yqEidl7Uhy8q5qLZPnhBEQv0zGFD
 vc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MSJ0aFWnETmb7HfWXkWR63r0EqdJQN6ZBWznHab8dTk=;
 b=PtunyVs3ThCus8SCydh9CPaFt9KkTE4LtR4pM6kHrofixtptipEKQQmPxNL0TIndH1
 oFFUp7rPbm67KE/hacw3XU+PGiAaMPKLgsJJh2HFkjZG3UEZe0nwiJ84VKiLDFfnNz/0
 /JUs4xlsfl9m6tBarqPWeE16JA7RIsP+XHnoTB+HxzF7YpiA8oAUHaZaDEf/Gzozh7Qi
 dCEda0Adeeq8/2T6o4X/nCTW2pRMJEib8BKNvFe96sepWTWvBwzN1oxoKYgME2tiA23l
 8NDusSxXqv1YU3GBJ+wjxIeUMtNUhYek614Vc4TSaQPHf5VlmqCzlTtwnV6JSCCLTqsi
 Xv6w==
X-Gm-Message-State: AOAM532o5dWrSj3CeHGbbJ2lrKbKnF0ffF3kbnWfaNuP0jOQ24qLf2p/
 zziTriOCiX0Ai7rUJ9fBfWU=
X-Google-Smtp-Source: ABdhPJw3Q4OwbHJ4C5pC/z2nzzOxgIBZzIstCP9zKvEDcHx4AGgmvDapbaLCJUuphevnKEWT99/44A==
X-Received: by 2002:ae9:d611:: with SMTP id r17mr1224414qkk.517.1631561887374; 
 Mon, 13 Sep 2021 12:38:07 -0700 (PDT)
Received: from [192.168.10.222] ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id 90sm4681857qte.89.2021.09.13.12.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 12:38:07 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/ppc: Check privilege level based on PSR and
 LPCR[HR] in tlbie[l]
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210909203439.4114179-1-matheus.ferst@eldorado.org.br>
 <20210909203439.4114179-3-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <5c143f6d-dd0e-54a8-682f-0810cfaef955@gmail.com>
Date: Mon, 13 Sep 2021 16:38:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909203439.4114179-3-matheus.ferst@eldorado.org.br>
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
> PowerISA v3.0B made tlbie[l] hypervisor privileged when PSR=0 and HR=1.
> To allow the check at translation time, we'll use the HR bit of LPCR to
> check the MMU mode instead of the PATE.HR.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---




>   target/ppc/translate.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 909a092fde..154ab26872 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5517,7 +5517,15 @@ static void gen_tlbiel(DisasContext *ctx)
>   #if defined(CONFIG_USER_ONLY)
>       GEN_PRIV;
>   #else
> -    CHK_SV;
> +    bool psr = (ctx->opcode >> 17) & 0x1;
> +
> +    if (ctx->pr) {
> +        GEN_PRIV;
> +    } else if (!ctx->hv) {
> +        if (!psr && ctx->hr) {
> +            GEN_PRIV;
> +        }
> +    }

You can avoid the third 'if' clause by adding all the conditions of the
second GEN_PRIV in the second if:


> +    if (ctx->pr) {
> +        GEN_PRIV;
> +    } else if (!ctx->hv && !psr && ctx->hr) {
> +        GEN_PRIV;
> +    }

Or, since all the code is doing is executing GEN_PRIV anyways:

> + if (ctx->pr || (!ctx->hv && !psr && ctx->hr)) {
> +     GEN_PRIV;
> + }


I think this is clearer than chaining 'if' clauses.

>   
>       gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
>   #endif /* defined(CONFIG_USER_ONLY) */
> @@ -5529,12 +5537,15 @@ static void gen_tlbie(DisasContext *ctx)
>   #if defined(CONFIG_USER_ONLY)
>       GEN_PRIV;
>   #else
> +    bool psr = (ctx->opcode >> 17) & 0x1;
>       TCGv_i32 t1;
>   
> -    if (ctx->gtse) {
> -        CHK_SV; /* If gtse is set then tlbie is supervisor privileged */
> -    } else {
> -        CHK_HV; /* Else hypervisor privileged */
> +    if (ctx->pr) {
> +        GEN_PRIV;
> +    } else if (!ctx->hv) {
> +        if (!ctx->gtse || (!psr && ctx->hr)) {
> +            GEN_PRIV;
> +        }
>       }

The same idea I mentioned above could be done here as well, but these are
not straightforward conditions to be done in a single IF clause and will
impact code reading. This is fine as is.


Thanks,


Daniel


>   
>       if (NARROW_MODE(ctx)) {
> 

