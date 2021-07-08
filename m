Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C903C1748
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:44:38 +0200 (CEST)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X8f-0000Jw-8x
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WWD-0007z7-TT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:04:54 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WWA-0005zO-H9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:04:53 -0400
Received: by mail-pl1-x629.google.com with SMTP id a14so3234638pls.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fygWJfwDNSSDF4VUyI0K1AU2fBwaAUpGuNPoR+oaYGg=;
 b=N5XzCFjTcDZVc0ZlzsZvPq2g3ZQAl1iUVwcytOZALG11Z6YfQRNzrmE7AGuUjtxG4A
 u4BaawU0dAOPgSUlAkoGk13+rM/nqKhizKE3KX91DYQLAsb/y5VVBqCccDAg5KmXe+/V
 5FWPXUrAhLNYrxV11KTdsv3zts0Yc9xMM1MKhoFz8jywUUY1fd74Q8AW9D+DrM3AVC40
 jEI7fH9atIjdGM9IssiNs8DTTQQYeZsnPNqSODevSsERHazWfXw47WhxCkqhfM7R1gwT
 KBwoqP1IWBumSdmbwOSfoqJw6MtTBTK34vwBi4EoaSgdDJFe0iPceh1ugGnXcVX4aOID
 ywwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fygWJfwDNSSDF4VUyI0K1AU2fBwaAUpGuNPoR+oaYGg=;
 b=p5dXYAcpwb8t8LirSZ+dOfmhPzfDgNYuq05N6j0ATTiSjidGhmCQAkWFy0knNfOTbj
 i0s/vSmFw//UZyvPl+b3ayq9Li3aKgOrHvpIppvCkFWxD+5gQVWeA20fN0D2VX/tAxvj
 XBzqU0jTNcIr9Xi4aVyxznrm47dlGZVWyVIEm9rcjK9PbqiSEwVmMjCKod6eteHIvudH
 Z7SroHidZ4yDBWFEQOf1vYDFI6WP15pZ+sA0urcxjHpno3dSbOkozjhYqVGBQLibEvPY
 7Ljhdz2lGiB0hu3mxd7+t6xmutMWymvMZdiN9bw9XKTqwC+svNAQHWntsUfIyG6DCIqQ
 0DRg==
X-Gm-Message-State: AOAM533QpW3Q0LL19WGihAldfYId0+oqGT8D+VnSCv2r2utO2STYhTit
 VKn8BXKKcNVOYju5ZjQpnaEI8A==
X-Google-Smtp-Source: ABdhPJzL8EbmM2DMjIxB5qHqPH7QWf8KiylaFhN5v60IdU+O4Mwi+9RuWSCgZTNaLO7morzoZrcRkQ==
X-Received: by 2002:a17:90a:eac3:: with SMTP id
 ev3mr5759075pjb.161.1625760288847; 
 Thu, 08 Jul 2021 09:04:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b62sm3468329pfb.149.2021.07.08.09.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:04:48 -0700 (PDT)
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
Date: Thu, 8 Jul 2021 09:04:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 7/8/21 5:05 AM, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 19:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Using gen_goto_tb directly misses the single-step check.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index a0c6cfa902..8cd31feeaa 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -8582,7 +8582,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
>>        * self-modifying code correctly and also to take
>>        * any pending interrupts immediately.
>>        */
>> -    gen_goto_tb(s, 0, s->base.pc_next);
>> +    gen_jmp(s, s->base.pc_next);
>>       return true;
>>   }
>>
>> @@ -8596,7 +8596,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
>>        * for TCG; MB and end the TB instead.
>>        */
>>       tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>> -    gen_goto_tb(s, 0, s->base.pc_next);
>> +    gen_jmp(s, s->base.pc_next);
>>       return true;
> 
> Why isn't it enough here just to set is_jmp to DISAS_NEXT ?

You mean DISAS_TOO_MANY?  That would work, yes.
At the time I was just thinking of replacing one jump with another.


r~


