Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CEE40DD0C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:42:45 +0200 (CEST)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsb6-00011T-Ub
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQsYL-000861-2Q
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:39:53 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQsYJ-0001fO-Eg
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:39:52 -0400
Received: by mail-pg1-x52b.google.com with SMTP id w8so6344009pgf.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sx9U/logEqIQ/BL5QpYBK14ktb4xLvsbqieLdM4aocU=;
 b=b/9Fqxmteboz4tK5FoJ4kiKPkEJ23H8slZuOKQyYqAtwnHuealUQzXrHaVyhKxwLnu
 bydzyGrkG7J0MzsENrekdBkAwvhRPk9Fd/B/8Fb9Ac/GrcclIVfhL2Q1kbraZLq1Z+W2
 tMl798aRtz/ajIGye7UFQp1pe6PErM2MLTPr/44r4EZAILbsji7ZYaslXqawbpoK5xKB
 Ya1MpuPlyTMo5NC1imlv0G6rLzECIcQcgwCanO8u5JIJqcGu4ebrmxSRaEYd0wG/+TQA
 4JiK0S9MNVVGzMCPYYV9/z0ICHX12KaeG9NU/wOKwUZUL+8e8WBowfjpnEuXJojauHfP
 u1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sx9U/logEqIQ/BL5QpYBK14ktb4xLvsbqieLdM4aocU=;
 b=vz5r+FdEFy1YgIT8y6Kq+VFMZhQLXROrBxtW2q8WcWOwfR1ha7j3JtyKrFzLAo5Q42
 XUaMPYfBXCkvZ3LSnv1IJbHSJ7frWh+StAw9dOPL8v/IWI7n7XuRmkkr4Qr4RiR1uAWT
 LiudNYg3N3JyRVqMSxscs+2p2bc9Cg+CRfFkfpHLXD6x24f3fpyRSbo+uYuCc4gyVmTP
 WpVLy1udgOoQB0x/kF0JwPAAI4Wx4Lq/hP6EnN719UNIvGtJ1k9nGPEzmll2aiYm+SGR
 3Kg7ZMP/+zh9miFOx+JhhBfVrzkH5BTCwhieAgAGvpFk8C10TyGCI3deX+c6Qwmh8ccR
 hksQ==
X-Gm-Message-State: AOAM530M1UafmTs0FclfPCkl8EQ8vJq/1fY6CZOApZlIG923PG/pTqmP
 FDJ86rOxWILfNFMtplLgEKWvTQ==
X-Google-Smtp-Source: ABdhPJzY6maOUKxxan/1yGJyBjVf+OILiobE498ceYUja+NVpq6T41Syd2BLZ4kXMadsgfQZGplnPQ==
X-Received: by 2002:a63:1748:: with SMTP id 8mr5165969pgx.350.1631803189752;
 Thu, 16 Sep 2021 07:39:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p4sm3568093pgc.15.2021.09.16.07.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 07:39:49 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate
 forms
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
 <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
 <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
 <CAFEAcA_Xtig7iw97JURq2UnhqWdJA_Fok2=yYNBRoqfoX3M=FQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1e38e35-aba6-85e0-3551-e0ca18ecdb26@linaro.org>
Date: Thu, 16 Sep 2021 07:39:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Xtig7iw97JURq2UnhqWdJA_Fok2=yYNBRoqfoX3M=FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 3:01 AM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 16:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/21 7:21 AM, Peter Maydell wrote:
>>> On Mon, 13 Sept 2021 at 14:56, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> On 9/13/21 2:54 AM, Peter Maydell wrote:
>>>>> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
>>>>> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
>>>>> +{
>>>>> +    /*
>>>>> +     * We get here with a negated shift count, and we must handle
>>>>> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
>>>>> +     */
>>>>> +    shift = -shift;
>>>>
>>>> You've already performed the negation in do_2shift_vec.
>>>
>>> Here we are undoing the negation we did there, so as to get a
>>> "positive means shift right" shift count back again, which is what
>>> the instruction encoding has and what tcg_gen_gvic_shri() wants.
>>
>> Ah, I misinterpreted.
>>
>>>> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
>>>> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.
>>>
>>> I'm not convinced the resemblance is close enough to be worth the
>>> effort...
>>
>> Yeah, not with the negation bit above.
> 
> Could I get a reviewed-by for this patch, then, please ?

Oops, yes.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

