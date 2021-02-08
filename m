Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0CA314530
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:01:32 +0100 (CET)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HPC-0007po-5V
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9F0b-0007sk-U4
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:27:53 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9F0X-0000Rs-ER
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:27:53 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gb24so402156pjb.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 14:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x4/AFSMXCRttZnb+XcJyMrvdoP6y4aaZvWKIPPl9Iy4=;
 b=a0ABdZhthBZPSA2Fj67f/z4E15VVViwZPg7Hv1bXTv07qRu/wQvYpl57olYu3/q2Su
 VMivtsOvW69cp3nEQz1VjzBgsZefwak5o1K+OK/mO1oTvhs2/8PiSLxbiuMm7lXAJfUT
 r6qt8Y+Ld4lQg00+6t/lU8GnDDz9SKezFqxUheRHsf/n5uqTwKkqBYQ4wzPvIDXF2Z3K
 S//U+6Bb7I8Y0XjjXS9X4YIX5DGEDZdn8fBsl7HZOKiar7koOlV6tstTS20UhnPgsw9Y
 y3Jvx9EYEl/uZN2fZGkVDbjvYNPxFG8aS5cgqMN37GinHHCbUSXOAY7S1MDbSk5zOQDQ
 aiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x4/AFSMXCRttZnb+XcJyMrvdoP6y4aaZvWKIPPl9Iy4=;
 b=Od2PHwEnqNZSJmKxF4nelnzBUelhm0cLGsfG2qJckLhVBaJ/GH+7XshbWVI2tanm0/
 L6iE8i6B44Bx3D5+9E52IgpgSWtHvE2mBsqFOFAFt0ow+6AggLd2G9OnKkBdDxvdXOa5
 B0Ej+SpvA4pD+WGIrE5zFCm6SZqxldJ4Gxdu3OMM2WWul5dMOBy2LfzzRq9OjdJ6JQrJ
 DHml+sHViZle9T+OUq1aWa3s5FNQCadv2yAj/lrKXEH/4xytvekdzZIH8XFwpkyKB6Pv
 54rsSR+F7k5I3l7c7Xup72LZqWCBkOTUCar8TVa+JO6+O7i+oS/KndOnMjwqvun8SdKU
 n1Hw==
X-Gm-Message-State: AOAM531Mcg1LYyp6dFfV4Ks/36YX6DUePntf7P3J2wrstpvtTzlIgDsu
 cr68wpWEV8C3J36c561J2aohYMC9Q1nSEQ==
X-Google-Smtp-Source: ABdhPJzOZznt2E5tI0avK2e+etbc9Id1cvxGUkJ+oZysOdx0ne5xqCBXKkKh0dvrFuXpsNFIOcmUCA==
X-Received: by 2002:a17:90b:3753:: with SMTP id
 ne19mr970736pjb.72.1612823266462; 
 Mon, 08 Feb 2021 14:27:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 x190sm5404903pfx.166.2021.02.08.14.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 14:27:45 -0800 (PST)
Subject: Re: [PATCH v2 13/15] tcg/arm: Implement TCG_TARGET_HAS_shv_vec
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-14-richard.henderson@linaro.org>
 <CAFEAcA-Yh-QB2m3y=OTyH+F7E1YkPBXvyiZYdj1=8pOJpjG9mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a77ade66-b34c-9995-ec30-967ebc757a76@linaro.org>
Date: Mon, 8 Feb 2021 14:27:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Yh-QB2m3y=OTyH+F7E1YkPBXvyiZYdj1=8pOJpjG9mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 12:50 PM, Peter Maydell wrote:
> On Mon, 8 Feb 2021 at 03:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The three vector shift by vector operations are all implemented via
>> expansion.  Therefore do not actually set TCG_TARGET_HAS_shv_vec,
>> as none of shlv_vec, shrv_vec, sarv_vec may actually appear in the
>> instruction stream, and therefore also do not appear in tcg_target_op_def.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/arm/tcg-target.opc.h |  3 ++
>>  tcg/arm/tcg-target.c.inc | 61 +++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 63 insertions(+), 1 deletion(-)
> 
>> +    switch (opc) {
>> +    case INDEX_op_shlv_vec:
>> +        /*
>> +         * Merely propagate shlv_vec to arm_ushl_vec.
>> +         * In this way we don't set TCG_TARGET_HAS_shv_vec
>> +         * because everything is done via expansion.
>> +         */
>> +        v2 = temp_tcgv_vec(arg_temp(a2));
>> +        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
>> +                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
>> +        break;
> 
> tcg/aarch64 seems to set TCG_TARGET_HAS_shv_vec and
> only do the right-shifts via expand_op. Is there a difference
> between the two that means Neon has to do it this way, or is it
> just a "works either way" thing?

It's a works either way thing.


r~

> 
>> +
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 


