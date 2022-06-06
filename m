Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358053EDF6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 20:39:03 +0200 (CEST)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyHd0-0006CA-A5
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 14:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyHaZ-0004ns-R1
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:36:31 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyHaY-0005p2-0f
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:36:31 -0400
Received: by mail-pf1-x42b.google.com with SMTP id g205so13360673pfb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OjOOGVLnPH2vWP2wTHBhloqMc7lXhV+RIAhsYXRiH3U=;
 b=ak5z4z5Gl0ym0KDnaQnsxgdChTOrh7bgT6VbYIXlbcNfeqTS8pG/ViqZvJToToKBv8
 rZVojbqermoAktYyA8kVzTLdQZMwh15vJPvaEiW0BfiB2SznhZ76RuSCJTmbcKs0rpez
 9xQb7+MP9c1/NvkLNUuFl/lkrBdjYnX9mhx0vnCKLNwTGI/AXgDWigGkeDge5OnUenwH
 4ZI2GXXE6FF7ZaGs94NATvv50r7tHSrIFkYz1eCmwlSu01IYP9dzzSmdL2vx0tULRO8m
 /FHfT7m3wGNtOtb7Q75gAgJ0dcEnjsoQVJf+qaayyilDJIFzEN82SG36v7k2oRXu3p9j
 pY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OjOOGVLnPH2vWP2wTHBhloqMc7lXhV+RIAhsYXRiH3U=;
 b=r6ikxIFE5RnKrzIaSTQFi3Lz9SyhF3j0jOflbwQ+9zJ9UL+0spLOmhDi9Xk5rFAJes
 2KAuEiDrkJzbmYh0tlNXrCD28vMU99SXnVtxIY9tPc5h8N98a2e+RhERzxDFrzL6Jt90
 60VIGrIj5vI16V7K7XMgEHJbokmfvD3JGbqNvqInmUcQF4f/Vh7BdDHWydz804Hu+31O
 OdUuIf3ACkn26utMROi1Cdp/J/3k0fU8GfxToES/yGx0JLg1+Oy008BFQ89PT3qmXWbR
 4uF12czBGQMCXIZtMfHNhH/fSlZ2Bk9UPFZX0jFyIpFRkDX/swlvKCFha5/+sBZj2RYz
 8H3Q==
X-Gm-Message-State: AOAM531HMy87mb7Y54gPFPZ9p7Wyo/6GqcWReGdEk9Rb5tnRUPwZTE1R
 xbwWQmlZ/X08o8Qwu2yhJk1fnA==
X-Google-Smtp-Source: ABdhPJzdAc2ZphveGz9cx1/Erk5gB6OZB0UecQVCTuAbbxYNWkHT2yzOruQ7JJxoPhOVbEigaOsHYg==
X-Received: by 2002:aa7:88cc:0:b0:51c:319e:772c with SMTP id
 k12-20020aa788cc000000b0051c319e772cmr1378035pff.41.1654540588513; 
 Mon, 06 Jun 2022 11:36:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a1709027e4400b00163ac8673edsm10865885pln.35.2022.06.06.11.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 11:36:28 -0700 (PDT)
Message-ID: <16e44159-089c-8967-6746-906649ae2f91@linaro.org>
Date: Mon, 6 Jun 2022 09:50:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 28/71] target/arm: Add PSTATE.{SM,ZA} to TB flags
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-29-richard.henderson@linaro.org>
 <CAFEAcA_+-xbJkN8uBCL0UyJUmu+wrU1i5EMnwSu6pjC++gjg5Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_+-xbJkN8uBCL0UyJUmu+wrU1i5EMnwSu6pjC++gjg5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/6/22 08:58, Peter Maydell wrote:
>> +        if (FIELD_EX64(env->svcr, SVCR, SM)) {
>> +            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
>> +        }
>> +        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
> 
> Why did you write these two differently? Don't they do the same
> thing (set the tb flag to the value of the bit in env->svcr) ?

A later patch adds to the IF.

r~

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


