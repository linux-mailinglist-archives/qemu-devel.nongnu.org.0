Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9C5F6FDA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:00:35 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXyr-0001fw-Nk
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogXx5-0008PW-ID
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:58:46 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogXx3-0001IL-RP
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 16:58:43 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s206so2916065pgs.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pq1msKz+wIDW/rYUGOrF9YdCo02fAvSjM7c0uxTtfMw=;
 b=SuzGv2PZWF73WKtucEOyCJ1cogYPsoPfasP3sjjWrKZILvNDMQwwP47rgqmHNMomjZ
 6aCBKMRmcrogRgs5nYxCYLzylwbtANXqCGVq9RZLNrlA4JogwLYPui6HUtPiMgLa+B4F
 NksmSXyzW+9Fh0rN5Ue4QxtSiGCRZeDikpZuJ0zhrATnlSkBVhw3RvUFCu8vgvd/56GQ
 Yukwd16xmgfLGh8ghn2POB4GL4JElZBu2j+qDcHy+z4XxAhVDjFsZ4b/yYFOmvrYFPlf
 xnRu3BqOgOoplUjnXbS7v/T4dfu/Xh7MWjIHupV6GaDpsk6nwVRlb4NyYM1MMQD1GuLg
 tf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pq1msKz+wIDW/rYUGOrF9YdCo02fAvSjM7c0uxTtfMw=;
 b=XNj1TCp9A+Lvl1nxTeglbduqNKNkkYnEzSdAQdJigtBGtnHUmag50F7CJnFY3Xtx65
 t3ZUxVLlXg5M0SSqSEHqSPysgXjDrCbjdB0UBv0pAp3D5YGuq6k8vFaK7hWWj1gmesoy
 Os6OTJgmuFVsoyZVo2A2vVwf/tIzO9WBFkrv0BdSzxNMAU1q+65gsBT2LH2oa3O+5UKJ
 A1OCmKN3vNVZ+OngGmOFYjAZ86TSA5KqWraC/+P8vNh1K0i7S5dCl+F/0v7ikEwPpWNb
 EiaMzBO/+z/ReEU1v+jV/MiTpEE1jDRmd9EO0Jnz1o4mMljw74U/Ct2YN40HKUM8jn1h
 Ah8Q==
X-Gm-Message-State: ACrzQf1egNQBtfzlKcV0STWIzN4s0pZ8FmimUclYYX6Jcjmr1cZVey4f
 bvTcLZOuQdZAoC9bWZl2x3E92Q==
X-Google-Smtp-Source: AMsMyM5S2LNmOKy9GaMyT+W8mpXfAu4F+HTwH7PFe/YhfxQKyOe7jDfXQtaNGFUpmWAppxdgshxHSg==
X-Received: by 2002:a05:6a00:1592:b0:562:b7a9:5c69 with SMTP id
 u18-20020a056a00159200b00562b7a95c69mr19692pfk.80.1665089919067; 
 Thu, 06 Oct 2022 13:58:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a17090a8b8900b001f8c532b93dsm172157pjn.15.2022.10.06.13.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 13:58:38 -0700 (PDT)
Message-ID: <cbae421e-906a-6d33-8480-a3f103c119b1@linaro.org>
Date: Thu, 6 Oct 2022 13:58:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
 <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
 <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
 <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/22 11:55, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 19:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/6/22 08:22, Peter Maydell wrote:
>>> Yeah, cleared-at-start is fine. But here we're also relying on
>>> the stage 2 call to get_phys_addr_lpae() not setting it to 1,
>>> because we pass that the same 'result' pointer, not a fresh one.
>>
>> I clear it first: that patch is already merged:
>>
>>               memset(result, 0, sizeof(*result));
>>               ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
>>                                        is_el0, result, fi);
> 
> Yes, but that doesn't help if this ^^^ get_phys_addr_lpae()
> call sets result->attrs.secure = true.

Ok, sure, let's make the write to .secure be unconditional.
I've split this out into a new patch 2 for clarity.


r~

