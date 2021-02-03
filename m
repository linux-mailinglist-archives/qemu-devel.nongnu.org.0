Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76530E0E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:25:35 +0100 (CET)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LuI-0000rN-Ed
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7LoV-00040p-55
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:38 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7LoN-0003on-Ir
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:31 -0500
Received: by mail-pj1-x102d.google.com with SMTP id lw17so3687046pjb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Rjo9F7NYNOjMYVi19kTzo000+0RFd/XghNH/qUQdIE=;
 b=sIrcXGPYuIM0O00SRF/NMMoJwpSaf8j5sqaeWUFkqaBmFKWJaQj1Bh4tUFO+R2/aJW
 HQIsJVh/sdjeYCLwiXCRplyQT7csqgY7cAC/Ad1qlaDY9viylOe2eAdc4keXc0CArSl2
 1EPJgNUUuxnusr3YWFwP6nxDSvxXraW92vMBvuTpCtzvMTwTYP0QG/c19Jh1q5cchLp6
 3tyZrOVAe1VkLqbgp0NKZx7iEt5Eg9/V5wWD9xKnMt9T4UUbdTNnrXt0fF0QmwJlIiOF
 eMljYiLBk67xHYks4fg3AK2YrwIOpKq+QKpbfVAP/DZjVYC/mVT/fVELiwByZ/FW4qVY
 NW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Rjo9F7NYNOjMYVi19kTzo000+0RFd/XghNH/qUQdIE=;
 b=VnzQ8pFZXyVjMtqTx+aNiw1Uma077St08SlwgYIPlglqy5+erU68TRTX9JsXU6GM7L
 CcmjDDFXfHO7yZfRDGbtBRjQhCaKz6Rl8E3Uwt7KkFEm5PTdyJYs0TI09hcCRUIz6Tzf
 28+cfCd+gKHpjU5FYUCP5SAfEKjrKpnYyqKyV67uUAlyp6dlpYohyCIZmfaNyg2i0VEM
 SXU8O17y0X/C4mcX/LyAAgtty4OqUOpzZvOC1/fmmuf3wDbJ/2xNR/n16MAxjMiK4sDW
 oP0a0ayGyl8OTGNyD//CI5e5zxKKrm/7hinm0zTqsI96rKibCvhy5piF3U/RawBhHVWu
 +PqQ==
X-Gm-Message-State: AOAM531BsSai2H5Jbk7iGntviFw6HKuKxvhwbtEJRoGWZr9ZHvnGqKup
 W/DKqMTsD6AjQLcIViu3x2X8Jw==
X-Google-Smtp-Source: ABdhPJzmQyNPbg9gxMsI1iUMrRX3Cp7TlJiCEtPfFAu2Re7/G2FrX5HH1ZC0CDICE+HDr60+dHl0QQ==
X-Received: by 2002:a17:902:cecc:b029:e1:268e:2286 with SMTP id
 d12-20020a170902ceccb02900e1268e2286mr3954672plg.62.1612372765059; 
 Wed, 03 Feb 2021 09:19:25 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id r14sm3609610pgi.27.2021.02.03.09.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:19:24 -0800 (PST)
Subject: Re: [PATCH v4 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS
 from cpsr into env->pstate
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210203045816.10953-1-rebecca@nuviainc.com>
 <20210203045816.10953-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a85fa6f0-d6ee-5811-4c7f-d2830b8eafb9@linaro.org>
Date: Wed, 3 Feb 2021 07:19:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203045816.10953-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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

On 2/2/21 6:58 PM, Rebecca Cran wrote:
> @@ -9433,8 +9448,9 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>       * For exceptions taken to AArch32 we must clear the SS bit in both
>       * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
>       */
> -    env->uncached_cpsr &= ~PSTATE_SS;
> -    env->spsr = cpsr_read(env);
> +    env->pstate &= ~PSTATE_SS;
> +    env->spsr = cpsr_read_for_spsr_elx(env);
> +

Again, this is the aarch32 exception path, and should not use
cpsr_read_for_spsr_elx.


r~

