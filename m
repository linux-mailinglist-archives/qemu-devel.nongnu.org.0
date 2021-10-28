Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB0243E552
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:39:46 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7VJ-000827-CW
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7SL-0003qL-Bz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:36:41 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7SJ-0003St-9V
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:36:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gn3so5019595pjb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CNwwVDPT3qWpGG8s/oTdYFHMqmFnWNbIvTQkUCzmu6M=;
 b=aXE/pVYO6TSoP2UEPkaFP4kYXc71XoBKsWUA5d7YDTLITtp4wGxjIiuxwny4ftY69E
 h9Nk+CiQEGU3iSYgYM/715iSNyyJGwV1WwHO6DZoisv6dCpVr9lYJsXT+o/G96uNzQgn
 HZ7coaQCmN++KeN3x4bXqhL5nZdj6YPpRqBiVkdbWVftL3bHuAOLJJmsJCpReTDsaeAe
 z7bAgXfLH+uB94URAkm+f5tBkpl2mBtpYv/+Q3E67FzJm1wRAe+oKXDaYuPb1KU1FQut
 AEXQF2Jd2fKqjZ34bqUcyYoHNPEK+Ku4NgCwkUl9FEoc7VhbVvDabbJuOtBzF1LG8Uzv
 1L4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CNwwVDPT3qWpGG8s/oTdYFHMqmFnWNbIvTQkUCzmu6M=;
 b=ZPQdzxh3EDWLDU8cmkTy/9AzhKGx+TQEcy1L1MgVlWmu8dcZ+V81BdsaHrBgi/FEWf
 c9WZJ0mOKx5A2XTM7kJGGfiWwmXa60IeTUQye10G4b8btJ1v1cnBkOtJnXr6msH8FZhF
 lyPgKgd5WlpUnUfjO3Dq2YemGzD2DnMSn/5utmnT+4YuoYpZxWmf7oUkt1gHIhK1NPMQ
 92xP1fMiqxEwaGahIjgRh+k/hp8wOMtodI0OmkGcGmmAKCqGh+c4dM1Rm8Quxqx1uyad
 QrQb5/fxOmSEDxNA8U3jB1duNBguOGZ+n0yQWLs9IlkJLSodc4SfaKSEwK59yAAG4dz8
 l4mw==
X-Gm-Message-State: AOAM5330jZnuI8UESs2gxya8zdsrI+XIPnRNLRv6wocFJGd/kCaeDymb
 CZPO3louUa7/MS6ZhqVvsRZftg==
X-Google-Smtp-Source: ABdhPJwm4+eDJ8/AyayoK3taGuD5dVQk9gvPEP4V5leN15YnDIcuCquBkmvqgRxLZ+1OhS0sOWhj/A==
X-Received: by 2002:a17:90a:2904:: with SMTP id
 g4mr5308356pjd.122.1635435397779; 
 Thu, 28 Oct 2021 08:36:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y6sm4101635pfi.154.2021.10.28.08.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:36:37 -0700 (PDT)
Subject: Re: [PATCH 10/24] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb661e52-c7a4-d906-beeb-8e27a18d2133@linaro.org>
Date: Thu, 28 Oct 2021 08:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement the register copying routines to extract registers from the
> cpu for core dump generation.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static inline void target_copy_regs(target_reg_t *regs, const CPUARMState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < 13; i++) {
> +        regs->r[i] = tswapreg(env->regs[i + 1]);
> +    }
> +    regs->r_sp = tswapreg(env->regs[13]);
> +    regs->r_lr = tswapreg(env->regs[14]);
> +    regs->r_pc = tswapreg(env->regs[15]);
> +    regs->r_cpsr = tswapreg(cpsr_read((CPUARMState *)env));

I guess we could do with a bit of const-ification in target/arm/...


r~

