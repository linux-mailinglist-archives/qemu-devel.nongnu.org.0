Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6643CC588
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 20:40:02 +0200 (CEST)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pEH-0006SP-BC
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 14:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pD1-0004bk-9O
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 14:38:43 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pCz-0005xc-1u
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 14:38:42 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so9327990pju.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M7u+9P2eBa2BsrciNjB51X78LsWRfEsw5kxn/RHtMn8=;
 b=smmGCWJl0rKGz748cBc1hsOdODWphriE4bVh7C85meGKfF9vZSRBvSjVJaS3G1VaVS
 rnQUj/ToW7Yo4eWCndHEngIrFFMcAl89mznE4ABn7fDZESAuHmMp0eHwxeAXH5iM+RFG
 dQziyxmckxUNqwZr27eRhGTAhXzs+XI+Jmi5PSvkg+F+8+vVRcmmFh9OTNqug3f3MDsB
 Jr+m8N7ju4fnUptY6Agxsl2NKlE/AxlGMNT4Q96Nxn43yuOTwdxoI6/KNmpbGzfViQ/w
 Q9CnfGzDKR3PvdhPgSh4mn85Z3AF4gTdAvmYrjnw8fDqQPAy0iUH5yoiDBUwgT3GQJUE
 EpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M7u+9P2eBa2BsrciNjB51X78LsWRfEsw5kxn/RHtMn8=;
 b=gsmPJdkMzy1ADTsdSwUM5ASFiS2H+UDz/DlNHiNH+OLdzf/FoO8jFodkBcKuY7Nt2L
 n3oK+sj8XcOZ5jw4CArPHzLIdpag/II0HLkVQy9Tqdl/EYvDitIPdQiHbaOr+DZweMfo
 HJDHGM9C4xmirmTZD67qSkbVAthmsj4D76w+CCSTrxrjSRUf3Yyzqqff++puTg+N05rL
 /LSs6f8bsYU641PS16CBPM53eXNP2L71AnxLW5+0Rto+WZ2cm2Nke48BoVH8Dyir0Y4p
 NURpEwflszHnN6DbgKFZJPWt/esqpUXBpHrjB8J5ODAcJQ6x8CdaRlsESb0pfrWaLV3h
 /1wg==
X-Gm-Message-State: AOAM533XS2YQGI77NWn8K5gJG8KZfSzcIzF8BZSaBaj4ywZ7ZtUz0TDj
 h7M2GPnuBND3+AQ3Go+fjLAFPQ==
X-Google-Smtp-Source: ABdhPJyubmK6nFg9hz1vsMVLyVlDbGlnJfM+SOx8/GmzO/IR0pmpZe8rJ4gf1Awt/duNzeZIWdIvCg==
X-Received: by 2002:a17:903:404d:b029:129:b048:528b with SMTP id
 n13-20020a170903404db0290129b048528bmr12660537pla.65.1626547119442; 
 Sat, 17 Jul 2021 11:38:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d23sm11306999pjd.25.2021.07.17.11.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 11:38:39 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-5-richard.henderson@linaro.org>
 <87czrg3kkh.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e0422d3-5606-c560-dfb9-7a621f12600d@linaro.org>
Date: Sat, 17 Jul 2021 11:38:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87czrg3kkh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 10:39 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The purpose of suppressing goto_ptr from -d nochain had been
>> to return to the main loop so that -d cpu would be recognized.
> 
> Hmm is it though? I've always treated it as ensuring we always come out
> into the main loop (which is helpful for debugging).

What's helpful for debugging wrt the main loop beyond logging?


r~

> 
>> But we now include -d cpu logging in helper_lookup_tb_ptr so
>> there is no need to exclude goto_ptr.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index d3232d5764..70ea3c7d68 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
>>       uint32_t cflags = cpu->tcg_cflags;
>>   
>>       if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>> -        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
>> +        cflags |= CF_NO_GOTO_TB;
>>       }
>>   
>>       return cflags;
> 
> 


