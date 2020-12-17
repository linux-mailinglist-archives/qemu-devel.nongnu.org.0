Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3672DD66E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:40:26 +0100 (CET)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxGB-0005Dl-Kq
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpx0a-0000fM-5k
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:24:08 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:35426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpx0Y-0007OB-DN
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:24:07 -0500
Received: by mail-oi1-x22a.google.com with SMTP id s2so33031167oij.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pk8pZlSDtOlQHyoU32LLSVOGAqbZDAz9MqpHi2igKTg=;
 b=GivMsj2rh7Sscp74kWIpcs5y3Vy+G9tMe5NMDqxutHUSn+BmU1uL9Nrn/pUpVefRV0
 9RPm4iOZMqTVd8Gue/inUmgnTfamvFCcFF92NlBA71U0Y4ClPZf4Wl5k2fM9SblvnDDM
 3hEMptu7HkgHcJJ5mlR2LXGsoZ1Pkq93DqDdlvNKdTgEjiqv6/9sxi0GgcWY92rPJamC
 UfOQpQ2KJp4a1nLeE5S5P1vA0ziPQ5AKoI2tx1ndSqaa65pbaf9C0osBF7P5VBl2WKxk
 ObQ7igJS0u3JphxFgF1bRzPQJKBuuOou5KOqB8Utw08JQM/d9+ByLnegxVI7vqK5p4r6
 sg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pk8pZlSDtOlQHyoU32LLSVOGAqbZDAz9MqpHi2igKTg=;
 b=e/Zp0Q7Mj2tylarGKUuf5/CQwHeT9FiaWRvuh8buViKzoDQPDpOcRrwYfkmH2LC+o3
 JQ58UXjtrPP07rhvg7g0wzJ0PC7mCoTvjz3diOcg4xQBei88PyFSeCKHqA/ky6Yev8QW
 WvWdKqdd1Iqpstks+gjsw6aojy35t3VjsdRwKmRFuxY/gwhTaWrtFj6Xqjt2fHXpd/U6
 Vr9+455D4rm1gD0y693TVw8CTD7BE2bwfZyb+bp7y8vjS/a8Iy4UAlHaLM37gbGK+QkX
 RH4MruPoMgAi/3P2u5oPutZk5jLlYeqi+pDPbuWW3I+eeEsko61qxiEsMII/ypNKhZdl
 AyxQ==
X-Gm-Message-State: AOAM532B5vIcWuSM/tP6/BIzH97F7PVgp0OI8udgZhQS+1VldBMevtcy
 /74nqcvQRsfduBga8eVwnnANWw==
X-Google-Smtp-Source: ABdhPJxWyvaMuZrzAwPQcChUiqR4ElwLdO+0ZVuOLGG9icAoq3zOy2+/eZFOXAg30hZYQzC7KQiY7g==
X-Received: by 2002:a54:400d:: with SMTP id x13mr95922oie.81.1608225844643;
 Thu, 17 Dec 2020 09:24:04 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q77sm1357441ooq.15.2020.12.17.09.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 09:24:04 -0800 (PST)
Subject: Re: [PATCH v2 10/17] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-11-richard.henderson@linaro.org>
 <CAFEAcA8fAB_DDrBjjVCCKwiE_n=05q1KYyWMR_2EuhOa0+EKww@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <817d21f6-6494-e7c7-5eca-037b04b64f9f@linaro.org>
Date: Thu, 17 Dec 2020 11:24:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8fAB_DDrBjjVCCKwiE_n=05q1KYyWMR_2EuhOa0+EKww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/20 11:50 AM, Peter Maydell wrote:
> On Fri, 5 Jun 2020 at 05:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These prctl fields are required for the function of MTE.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This API doesn't seem to be in the upstream kernel yet, right?

It has finally landed in 5.10.
Thus the long delay since my last revision.

>> +                    /*
>> +                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
>> +                     * Note that the syscall values are consistent with hw.
>> +                     */
>> +                    env->cp15.sctlr_el[1] =
>> +                        deposit64(env->cp15.sctlr_el[1], 38, 2,
>> +                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
> 
> This actually will be per-thread since each linux-user thread has
> its own CPU. You probably need to do something to make it be
> inherited across clone and fork, though (assuming those are
> the required semantics).

FWIW, these are a per-thread quantities.

>From arch/arm64/kernel/mte.c:
> void mte_thread_switch(struct task_struct *next)
> {
>         if (!system_supports_mte())
>                 return;
> 
>         /* avoid expensive SCTLR_EL1 accesses if no change */
>         if (current->thread.sctlr_tcf0 != next->thread.sctlr_tcf0)
>                 update_sctlr_el1_tcf0(next->thread.sctlr_tcf0);
>         update_gcr_el1_excl(next->thread.gcr_user_incl);
> }

I don't think I have to do anything special wrt fork/clone, as env->cp15 will
get copied by our own cpu_copy().


r~

