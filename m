Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AE686EA0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:06:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIQD-0000bE-CF; Wed, 01 Feb 2023 14:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNIQ9-0000Ur-SZ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:05:26 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNIQ7-0005dv-UE
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:05:25 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so3992604pjq.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQQW7kkHk+pLz58lDuzz/qQZ2dqinPIblLLadw70xNE=;
 b=Y0cYMet9Ryeewtjf2BE8bLWMdj1tfqZZO4MDyUnlnGPAILRa46hC7EntywpWcPnCE3
 dPVOYJ2GvZW2TRrqg6X9jSgujJv85Ji4SWlxdKw1qZfl55zzloHNYkMfrAQyv/dgbaHb
 J0Xa3nfTZLurLliPq9qsg5c1M/h/TvbSBT9AzAkwt+xjSiveSoQfa4W5sCsGFpkkQdxf
 xhRvBUMAA5pVIPTvExKhi4nj2FeiEutNQmUUMQiP8czNK8dKC4293Nseuq3rgRWUFW6f
 /5RCPI+9S33d6lPHlXajHBoVV77m9gk/vU7JB1DQjp/IYW6twQ37oeBIkX2JJP8N1+72
 5bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQQW7kkHk+pLz58lDuzz/qQZ2dqinPIblLLadw70xNE=;
 b=uzeRdAIa8TtfKmvBEN9IrERT/f0A+OkHsJIdbqnGLlXwzQbJ/PofJXl6+5uUYNF72w
 9MOUQ810gQiA8BOdocSWd5a3R0nqgXVX9MWB1CE0JLp/Xv5xHwTuofnLOfA1+u52FBv/
 uwg4PglPGF/RtGssjFz5mGH6AQb10vGvN0QmJsK6Pg5rk7NdhNxvGSg6oJTG0P/Wy0CV
 F2M+Fr6Hz8qtMQSzBTV8tZcKV72s+mHSA8fcJpWBZArsQNlfruau2UAIRYqu+oVM1REI
 0oF8oHgsq9K6vHJIWeKjT0htkgB+fM0aKoO8bBefCaKRwqUtleLv44Bg0l4UeTRuPGSx
 qAyw==
X-Gm-Message-State: AO0yUKXTeh20qMh6dfmT7N3SxL3ADd69psSTwFQxI3ruK8ci4JHg4nJe
 K7+xnaBfNELTtgix/XVJGmNLMHq1x5udD5lJ
X-Google-Smtp-Source: AK7set9T9hG8ZpWACRcmPFSIQeRkQtCkOb3d+A+77E7e72Sy3QYU64rGuT+Zwzfm+MNpUih1iZ6swQ==
X-Received: by 2002:a17:902:f2cb:b0:196:ecb:790e with SMTP id
 h11-20020a170902f2cb00b001960ecb790emr12473705plc.4.1675278322334; 
 Wed, 01 Feb 2023 11:05:22 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170902748400b0019460ac7c6asm12024388pll.283.2023.02.01.11.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:05:21 -0800 (PST)
Message-ID: <412218e0-d278-9ab5-68b1-75461b3e99ef@linaro.org>
Date: Wed, 1 Feb 2023 09:05:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 19/36] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for
 CASP
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-20-richard.henderson@linaro.org>
 <779b5187-2fb1-3b8e-bf92-8ee7322c5531@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <779b5187-2fb1-3b8e-bf92-8ee7322c5531@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/1/23 05:04, Philippe Mathieu-Daudé wrote:
> On 30/1/23 22:48, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Message-Id: <20221112042555.2622152-3-richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-a64.h    |  2 --
>>   target/arm/helper-a64.c    | 43 ---------------------------
>>   target/arm/translate-a64.c | 61 +++++++++++---------------------------
>>   3 files changed, 18 insertions(+), 88 deletions(-)
> 
> Is it worth extract this pattern:
> 
>> +        if (s->be_data == MO_LE) {
>> +            tcg_gen_concat_i64_i128(val, t1, t2);
> 
>> +        } else {
>> +            tcg_gen_concat_i64_i128(val, t2, t1);
> 
>> +        }
> as a helper for readability ?

It hasn't come up often so far.
How would you imagine that would look?


r~

