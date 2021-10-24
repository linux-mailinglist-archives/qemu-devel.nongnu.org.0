Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32530438BD0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 22:29:05 +0200 (CEST)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mek75-0005XP-RD
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 16:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mek61-0004tH-0a
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 16:27:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mek5y-0003Zp-OT
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 16:27:56 -0400
Received: by mail-pg1-x533.google.com with SMTP id l186so2434527pge.7
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 13:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gQYgio5A05cHtLFFi9FzdHYhJxsoSgyVu/F/j49dRlo=;
 b=mqEkPWYFlBe3EoArcCm2jX3bSBKvo4jEwgRk8GRAsbrZgrLv1uL54e3bLTWSa0vo5F
 q7XI7a0L7Ljmy0QEnKrwAXEh7FIvTjWJhnp81wJqwe0ewbq7CHtDYWh3khY0AqKhIo/6
 eIKhWVmaul/Q76KSK/vo305FuMOs3pVo/IFeuphAokA6t41uWX3KDLql8gBiO6OMhrdW
 by1Wl1dAPaWspNDK4069ojSJK4sQp8fZb1D5J6i6TgCS6kU/frdFonRY+AnpF9PQW71I
 Syfq8iBygnRVWxpxl7uQUKDVBz/e5HuIH7wt9fQO8Wk83ayDDut4/lBSNushFMF49jGc
 8Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQYgio5A05cHtLFFi9FzdHYhJxsoSgyVu/F/j49dRlo=;
 b=rek6k+ho/EqCf4BEIV6X5Xlroehfm/gmZuBfO+JJQRNti5V+fPe00FIGGLyUjCi9QA
 PxedilVb6JTTp3oAzg7ew/W8gOFJBi24OqJg4QL8CkCQUZOuQHoN9ZE8faX2FlgNBjcO
 6xrgpFJPUcG3OdZWcQfdW4qKFOSQqh/XprbEh7rujsK9BBTXfNl+9tMV6NQWl2lhyQVe
 0ldYiwR+bwnJFn7CNfVeaqAn2dB6IQmofAbhwEnvrtQMfhb+1VU79fPblONBG7hSvrSh
 8QU/aAxnQ1cxmNhWvvdEIsLvBYN9HscIWhq+hAfuKJOFS85E0aw64QLwMK+7jC1VyHqZ
 sVoA==
X-Gm-Message-State: AOAM533YjJm4DtSHwBBOhTm0XlDXOpErh80Vs6qzJlHzRMwxZSbJnBFZ
 8XRnuvbLRNU3Xwr7Ff5rO3knBGIRNru1Qg==
X-Google-Smtp-Source: ABdhPJwKMg3yxetCQPCkjgQlYDTwT89FKUGQa5DNBvCk60uS7p3FXKVsV+D7ztlJXJWvhhfTBWwsOA==
X-Received: by 2002:a05:6a00:815:b0:44d:2193:f688 with SMTP id
 m21-20020a056a00081500b0044d2193f688mr14032916pfk.4.1635107272428; 
 Sun, 24 Oct 2021 13:27:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h2sm15153421pjk.44.2021.10.24.13.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 13:27:51 -0700 (PDT)
Subject: Re: [PATCH 22/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-23-f4bug@amsat.org>
 <65fa8116-4a1a-eecf-4ee9-fc6ed2896f89@linaro.org>
 <5d91398c-310d-19cd-24ed-5ca8dc529f34@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37ba040f-1fcb-7855-6ec1-4507259fbbe3@linaro.org>
Date: Sun, 24 Oct 2021 13:27:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5d91398c-310d-19cd-24ed-5ca8dc529f34@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 11:57 AM, Philippe Mathieu-Daudé wrote:
> On 10/24/21 19:52, Richard Henderson wrote:
>> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>>> +static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
>>> +                            void (*gen_msa_3r_df)(TCGv_ptr, TCGv_i32,
>>> TCGv_i32,
>>> +                                                  TCGv_i32, TCGv_i32))
>>> +{
>>> +    TCGv_i32 tdf = tcg_constant_i32(a->df);
>>> +    TCGv_i32 twd = tcg_const_i32(a->wd);
>>> +    TCGv_i32 tws = tcg_const_i32(a->ws);
>>> +    TCGv_i32 twt = tcg_const_i32(a->wt);
>>> +
>>> +    gen_msa_3r_df(cpu_env, tdf, twd, tws, twt);
>>
>> Missing check_msa_access.
> 
> It is included in TRANS_MSA(). How could I make that clearer?
> 
> The style I follow is:
> - trans_UPPER() -> direct implementation
> - trans_lower() -> called via TRANS_xxx() macro

Hmm.  I dunno.  Especially since some of the cases require checking for the null function 
pointer *before* the access check.

How many trans helpers do you wind up with in the end?
Perhaps drop TRANS_MSA entirely?


r~

