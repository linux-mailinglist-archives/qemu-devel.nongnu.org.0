Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C56387BB1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:52:16 +0200 (CEST)
Received: from localhost ([::1]:36416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj14x-00086O-KX
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0yb-00036X-S7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:45:44 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:39482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0yI-00031G-LJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:45:35 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id k22so82387vko.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=da1X5FDtZQFaLk6YknN3fhzzydUuvdyIdH0SwN1kKAQ=;
 b=nerQXeJaZvqvPeX5A5IaVcnS9Sm0q1YKLrva0qUaA8foIkSn+U85sub19F4w9xUcLb
 RjedmwJPam29h1LhD34c8EJ7mIHw54g4VkbCSO7wbjmL1Td3fybRgcdAnDXGDbDa93BO
 p4KlzUXpg23qCCh5GRhkFYa6QlxDRTbOHKBc2Ej8/iHwRhZKKx9f7OIj6ftl8vPgs6Jc
 JuShjZ8VjT1PhtEMVJWmKqBixg/DoxihwUL0OQlgdVd0afbMaPs4OLlRjqhW/aNcwNLr
 78kkT8jSr7BJ2RCPLMNHpuXX5nKh17HJErmbwBDcSMWZ6NP5gH6fxgpDJSO2pazzMo6M
 +7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=da1X5FDtZQFaLk6YknN3fhzzydUuvdyIdH0SwN1kKAQ=;
 b=QLjQIe+3Rrfv7U/184XHnTqbo4LA7YKy5uVsIq4GifbtoBM+5qNwOJ6lO1/sj8DnWx
 WZg6aTZC6sGUTOGXaPjf8MRGhFZ8o2L1KCZ8X3Yu8d/XHTEIWwHNoMsrcMVnC9m3Y5h7
 WrdlxlCCPmS3126+DU/GWq4VFWLHyPiyUrxX/Xwkmxzs/e6Xeds0t4y6TEDR/HHoKRgE
 k4Uf9N20WhB1BQbWZEnbd3M2fZ6k/Gk9fClhnOZaO/WMUfP5/PCAtmm8QxvJc6+XNPNN
 G17V8N5SzJrho0G/avfzoRVDWa+YWblmAxDpTfDIG2cM/3ruexFSN8ivGaoxJ2npz1Pl
 le2A==
X-Gm-Message-State: AOAM531saa5Pjz9hMu1NLdOqpmypnVc3kz9Ox7JaMZum41UvtUQIMZ4+
 S7t0YRuc8vmf/PSlp5Kx1gdgEg==
X-Google-Smtp-Source: ABdhPJynNyah/DBGgOyIB/mHSiOsV7CHALnjlLliQaG2FPN3jVDgqmxA7KfKXqOlQW/WpjBG21sxaw==
X-Received: by 2002:a1f:2b14:: with SMTP id r20mr6345684vkr.9.1621349121229;
 Tue, 18 May 2021 07:45:21 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id o72sm1961830vka.30.2021.05.18.07.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:45:20 -0700 (PDT)
Subject: Re: [PATCH v1 08/11] target/arm: Implement bfloat16 matrix multiply
 accumulate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-9-richard.henderson@linaro.org>
 <CAFEAcA_T9f47uZSEt9BRsThxLsvauTPMiDSNM8B5=Dk5xRQ+wg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40bfafe9-ba14-f718-3240-102766f17811@linaro.org>
Date: Tue, 18 May 2021 09:45:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_T9f47uZSEt9BRsThxLsvauTPMiDSNM8B5=Dk5xRQ+wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 7:37 AM, Peter Maydell wrote:
> On Sat, 17 Apr 2021 at 01:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is BFMMLA for both AArch64 AdvSIMD and SVE,
>> and VMMLA.BF16 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
>> +{
>> +    intptr_t s, opr_sz = simd_oprsz(desc);
>> +    float32 *d = vd, *a = va;
>> +    uint32_t *n = vn, *m = vm;
>> +
>> +    for (s = 0; s < opr_sz / 4; s += 4) {
>> +        float32 sum00, sum01, sum10, sum11;
>> +
>> +        /*
>> +         * Process the entire segment at once, writing back the
>> +         * results only after we've consumed all of the inputs.
>> +         *
>> +         * Key to indicies by column:
> 
> "indices"
> 
>> +         *               i   j           i   k             j   k
>> +         */
>> +        sum00 = a[s + H4(0 + 0)];
>> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)]);
>> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)]);
> 
> I can't make these indices match up with the arm arm pseudocode ones,
> which index by "4*i + 2*k + 0" and "4*i + 2*k + 1", not "2*i + k";
> are we hiding a division by 2 somewhere?

Yes.  We're passing BFloat16 pairs via uint32_t[] to bfdotadd().


r~

