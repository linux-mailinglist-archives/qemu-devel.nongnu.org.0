Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5401844B1F0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:23:52 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUqc-0005Bn-US
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkUoy-0003qE-6q
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:22:08 -0500
Received: from [2a00:1450:4864:20::435] (port=37586
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkUow-00019E-98
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:22:07 -0500
Received: by mail-wr1-x435.google.com with SMTP id b12so34287978wrh.4
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wv5dnKs7a8YcRLwEU5JzC3WXIVQH89PG/wyEuMCzqug=;
 b=Q+KyTk4pqbs6IqwM5Y6wUNUtEKGHigGHBKceDkiBAVzVYL4ajRDzsDSX889KAzaAHh
 AoYXaICra7jGR4KDs+KRB6BUTOyGDZj/zfS9NdTycR+p43grvthUhJqBu3M9B3wfPtOn
 zvAF4QlE6Q997QyyuCUwNeO5w6/cpUmEac88foDmfcA35+7m6V22e/hDucq66YVzkglQ
 Ab53bTL8aCo11PuRpvT1fHNz4B0LTU4tvLBOve3AFmxmrtvA1FC7ROJ/I8tdYPsuTosy
 XQQxwtZVC9l4tYSP33Yd4WvQJ3a2VqvAVQYlWmafdJHGyEdz7NmSNvDkT5c1IS9rkqds
 J2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wv5dnKs7a8YcRLwEU5JzC3WXIVQH89PG/wyEuMCzqug=;
 b=zuUKRvCcBI/Rcccdx/AGFgSuG8OickDAVaxhOJ+nRkXyQz5VcUAh1Yj0K31A81zkS2
 7q7e4ECSJOBV0+gSV+vtnHr1xioSv+vkyOiKVBPo6OlFkE9CxDGqZRxMptxyH5KAsDQN
 dF2jmQsImM98BmOkXDC9lD0UUgALiINFTRtmhlM43sYdLcerYQfLu/ekxZjXosB2Da0x
 Hmq+aeYAO29VyCIFbMceEW+CwhjZi/bpeqkEMQzrzO8Ov0UNc/KB/EzljBvYNdR9buTB
 FB8Od52+L5mZ18jMZq1d3ANVPpcdQvAyH37k180H25m+G25+rMIXm9ZF9cDdwa8HvWYQ
 Gwug==
X-Gm-Message-State: AOAM531WyTL13G9PbhU2zXpl9qdfCi8phESZrhO+c5K5cPVeJnV9FGv7
 K/FYECFoXhoODQ8tTiukUBnBGQ==
X-Google-Smtp-Source: ABdhPJx6JU90Wk0HbmUIp6hQVyrIhsB0YptOysAzZwZRqUMwcIImbBqIspa3G+7DUhcdfi6tr21GeQ==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr11576938wrl.176.1636478524870; 
 Tue, 09 Nov 2021 09:22:04 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id w15sm20760056wrk.77.2021.11.09.09.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:22:04 -0800 (PST)
Subject: Re: [PULL v2 28/60] tcg/optimize: Split out fold_extract2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
 <20211029043329.1518029-29-richard.henderson@linaro.org>
 <CAFEAcA9U3HqtyJBd-D22zzwVdr0tY3MP8xqemndyJd2JdN8cyg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a06b8c8-f10e-3de7-5a43-fffffce2dd76@linaro.org>
Date: Tue, 9 Nov 2021 18:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9U3HqtyJBd-D22zzwVdr0tY3MP8xqemndyJd2JdN8cyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 5:52 PM, Peter Maydell wrote:
> On Fri, 29 Oct 2021 at 05:59, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/tcg/optimize.c b/tcg/optimize.c
>> index 110b3d1cc2..faedbdbfb8 100644
>> --- a/tcg/optimize.c
>> +++ b/tcg/optimize.c
>> @@ -888,6 +888,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
>>       return fold_const2(ctx, op);
>>   }
> 
> Hi; Coverity warns about a shift in here (CID 1465220):
> 
>>
>> +static bool fold_extract2(OptContext *ctx, TCGOp *op)
>> +{
>> +    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
>> +        uint64_t v1 = arg_info(op->args[1])->val;
>> +        uint64_t v2 = arg_info(op->args[2])->val;
>> +        int shr = op->args[3];
>> +
>> +        if (op->opc == INDEX_op_extract2_i64) {
>> +            v1 >>= shr;
>> +            v2 <<= 64 - shr;
>> +        } else {
>> +            v1 = (uint32_t)v1 >> shr;
>> +            v2 = (int32_t)v2 << (32 - shr);
> 
> Here we do the shift at 32-bits and then assign it into a 64-bit
> variable, which triggers Coverity's usual OVERFLOW_BEFORE_WIDEN
> heuristic. Is the 32-bitness intentional?

Yep.  I'll add another cast.


r~

