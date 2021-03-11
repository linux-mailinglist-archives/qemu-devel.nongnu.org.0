Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2CF337A78
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:08:09 +0100 (CET)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOnA-0001Vr-Mu
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKOhb-00052J-3l
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:02:23 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKOhT-0002D0-Cm
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:02:22 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id 30so2870850qva.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TBNymcUWr7Rxhk0UUnifI12+om5eUZG4GkzmdLfbfck=;
 b=XQZuZqiBhS9O9XUIr5gykYr3gPULjJSeVfwywBGDUapGkZAUbImT05PnZORnSYB5em
 dc6KL7lii3jNn674a6k72tgAmj2WKdOqKd+INgGzK1VPCnABRgo3fXatWS2WNgPnp5Zg
 lUF+0bBkVO0iWHL7bQ0ru8DybertJkHKMsCIbvqYfn2/7L62Hpf2+z+5WvikGNk2cIKl
 TDno+9NNkEe1JSR8csBJKfDW/R3Aa1dn9QAqhG0Io6HAdwlI1Kt64bCIZoRRJWHlNw6k
 rvtpAgjMMs0utW48LMLiTy9V/C0EENgQ4AgLHJ6vFsab7u6Hu8HpvySv8l41IGnZyhks
 5jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TBNymcUWr7Rxhk0UUnifI12+om5eUZG4GkzmdLfbfck=;
 b=Dc6CRpoZLkTXg4bUGoKak7TSQoMQax+9InepYAVu7jgIZGwjn+HBKyQCqFtQKIS57T
 zjLhrISPJiTOdNZVcM2i15eF84zHO0AbjqM8jixf7+u3KEENDk0SNImBTtiON+18GhCk
 0gaLM3EREvn1NaY9u30vTNj9mrEXVZb1MSmwqQdqS4zYNRMB1HNrC0HDIKx1hgEEwmZx
 mBYU5C4X0RAA6O7c/HPmem/cTWDHvSY3CSNCXzhdP0VIKAumbtWMN/lG/HcYSVqNUJhP
 IJrsKpn3IS1r045BGz2cWJuB5bblScf1ghEk8LvaDT4puKLbcujQ7/7hbbU+kJSbwPTT
 b3vg==
X-Gm-Message-State: AOAM53194ExLgXDj4oF/4AOmajBtkfGvq0MExy3+dDA7x4iN3uo8SMVI
 RkI5mqqGNRYqK9dje/WFi01Xog==
X-Google-Smtp-Source: ABdhPJxmMQC7G6ZAspBzrtfgQpCEapfghGjsg2wZDzZrO0VtZaKtbZyTKu8ao46QZ/dIZ+gj/NSEdQ==
X-Received: by 2002:a0c:b495:: with SMTP id c21mr8304109qve.19.1615482133980; 
 Thu, 11 Mar 2021 09:02:13 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m90sm2125016qte.44.2021.03.11.09.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:02:13 -0800 (PST)
Subject: Re: [PATCH v5 1/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210311161747.129834-1-david@redhat.com>
 <20210311161747.129834-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <594f6840-2dad-89a2-9103-098e5f465ed4@linaro.org>
Date: Thu, 11 Mar 2021 11:02:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311161747.129834-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 10:17 AM, David Hildenbrand wrote:
> +#if !defined(CONFIG_USER_ONLY)
> +    if (env->tlb_fill_exc) {
> +        return env->tlb_fill_exc;
> +    }
> +#else
> +    if (!haddr1) {
> +        env->__excp_addr = vaddr1;
> +        return PGM_ADDRESSING;
> +    }
> +#endif

For user-only, we can rely on TLB_INVALID_MASK, and check once for both pages.


> @@ -858,13 +925,26 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
>       /*
>        * TODO:
>        * - Access key handling
> -     * - CC-option with surpression of page-translation exceptions
>        * - Store r1/r2 register identifiers at real location 162
>        */
> -    srca = access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, mmu_idx,
> -                          ra);
> -    desta = access_prepare(env, r1, TARGET_PAGE_SIZE, MMU_DATA_STORE, mmu_idx,
> -                           ra);
> +    exc = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
> +                            MMU_DATA_LOAD, mmu_idx, ra);
> +    if (exc) {
> +        return 2;
> +    }
> +    exc = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
> +                            MMU_DATA_STORE, mmu_idx, ra);
> +    if (exc) {
> +#if !defined(CONFIG_USER_ONLY)
> +        if (exc == PGM_PROTECTION) {
> +            stq_phys(env_cpu(env)->as,
> +                     env->psa + offsetof(LowCore, trans_exc_code),
> +                     env->tlb_fill_tec);
> +            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
> +        }
> +#endif
> +        return 1;
> +    }
>       access_memmove(env, &desta, &srca, ra);
>       return 0; /* data moved */
>   }

If we're going to have an ifdef at all here, it should be around the entire 
helper -- this is a privileged operation.


r~

