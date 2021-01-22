Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B0300E78
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:06:09 +0100 (CET)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33dA-00077S-9h
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33bA-0005xE-5A
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:04:04 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33b8-0001mS-9y
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:04:03 -0500
Received: by mail-pf1-x435.google.com with SMTP id w18so4639193pfu.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AAHy1uMJGiVlNpinZYj+PwLiWg6ARFYfX/L4uZdflyo=;
 b=v/JSrYXF63sAjf6coqaTSlooBGtcQplV8ROVvj8ULSV6FuRiCtz0fxKr89yRYZGyE2
 rx2gLFbfXrNUmuBaPqz9YiPj6Ho4iuaNIpdcPU4gGCBivbH5KwJQ/ucG4nj02Wk6VCCA
 agzCRNgEwU/aSkBqOkBL788WNVdNicA3cDQ960zZZlpsCORag1I5BisQLyBZNG5O8BK4
 5anqS74rOCeWuY6q7gMcTTMHA8r0IeQh1QgZSJUo5R1bB7D4pVsPWmGm4JCHgNcE7/5j
 kAUYJ542pALD9DD3JmNorUmfe0IaNTGSuojePs9+SSfQkqBSnMX8J+hHsInQaSPzkLu1
 fp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AAHy1uMJGiVlNpinZYj+PwLiWg6ARFYfX/L4uZdflyo=;
 b=SsLnWBvgdbm37ZKjTLK8PZwztYdnOGXLdvhlF/41+uNi7KxE2sRN+PaXj1bWQmemH2
 G7XYYGb23m5RZrjPh6dGEexDPXfcObAQtw+sxY4JjI6D3bgW5MfdvPuYURs/bOLOCMaC
 fnQxl+OJ21zv/gXw7/ua1bp04FC0WxyxFUbU/FcQ7uRWR9L+LKnxVS0o2hFDLVUOo3bu
 NVWMNj8404g9fjWlDraOfr5lBRy/UpZAMHTuww3rgENkBpXRUOtoYHED9JL4meZZuGlM
 60ue0N8Cq4Q1DLhjLZf1rcUT8WtjzzpaZxHi9QMedj7wcPYtBmscBS+3IL1kBOoypCbH
 SPfw==
X-Gm-Message-State: AOAM531KQoP7UJO4JxibwOOo05IXT8tcJoPNawU9UsMpI5Mw8oZ9ZGa8
 jKtUCjxWmEw1tR0i4DWLGLaryw==
X-Google-Smtp-Source: ABdhPJxV8FEjoKrFgd5PZPLet1Sa6HsVIDCynXq6FbNDxYLxrxXg6aEkhzTonhCyT0ewC+xDM9J91w==
X-Received: by 2002:a63:cf43:: with SMTP id b3mr6251078pgj.387.1611349440721; 
 Fri, 22 Jan 2021 13:04:00 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id o1sm9315985pgq.1.2021.01.22.13.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:04:00 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Remove PSTATE_SS from cpsr and move it
 into env->pstate.
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210122044537.1823-1-rebecca@nuviainc.com>
 <20210122044537.1823-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2a1c4ed-cac9-4bb9-9c13-e47132df3af9@linaro.org>
Date: Fri, 22 Jan 2021 11:03:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122044537.1823-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.221,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 6:45 PM, Rebecca Cran wrote:
> cpsr has been treated as being the same as spsr, but it isn't.
> Since PSTATE_SS isn't in cpsr, remove it and move it into env->pstate.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/helper-a64.c | 4 +---
>  target/arm/helper.c     | 4 ++--
>  target/arm/op_helper.c  | 9 +--------
>  3 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index c426c23d2c4e..0d2ac7bb7ee3 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -1000,9 +1000,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
>           */
>          mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
>          cpsr_write(env, spsr, mask, CPSRWriteRaw);
> -        if (!arm_singlestep_active(env)) {
> -            env->uncached_cpsr &= ~PSTATE_SS;
> -        }
> +        env->pstate &= ~PSTATE_SS;

Why are you removing the singlestep check?

>          aarch64_sync_64_to_32(env);
>  
>          if (spsr & CPSR_T) {
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d2ead3fcbdbd..01b50316046b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9402,8 +9402,8 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>       * For exceptions taken to AArch32 we must clear the SS bit in both
>       * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
>       */
> -    env->uncached_cpsr &= ~PSTATE_SS;
> -    env->spsr = cpsr_read(env);
> +    env->pstate &= ~PSTATE_SS;
> +    env->spsr &= ~PSTATE_SS;

This loses the saving of cpsr into spsr.


r~

