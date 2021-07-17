Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC983CC585
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 20:32:50 +0200 (CEST)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4p7J-0002wq-65
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 14:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4p5p-0002Gy-LD
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 14:31:17 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4p5n-00013V-Vb
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 14:31:17 -0400
Received: by mail-pl1-x629.google.com with SMTP id u3so7150324plf.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gjrri3/Ylx40M3v08Ob3mMeG7ZZ5wUmdIQR1TDznXxI=;
 b=sdErMfapFHEZ6TR2iTXe3HRf9SBt6qDqyA5bHZU5UiEndpsH2Jfudh3zO83RhjCVLu
 xJuJm9fow0+RltfnIPrZVwcfFeVSRJ+cYoGFcGT4CUrsY5okUoIwiimiH0d/jGAARtEo
 tX/Uc7NqcYDdqA1fyZIQ50Um/6DvTaQJLfYIf+dNcB0QBZcFQ0Fe/XaxTUBKlJRcyTy+
 mGqyeCfCouM02sKBDznJPPRESfzOQsyFaL+1zJd6c+qWyMCladh6qUrjq8RfhTa5y2do
 IF9rKQ215SC3dmnD3RwxiXIczxoXk98SDHzNOZHG3fAUKl797yV1jCEjwFZplBO7ETu6
 vERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gjrri3/Ylx40M3v08Ob3mMeG7ZZ5wUmdIQR1TDznXxI=;
 b=XUjgE/HOwQ3fbpbu4/X1ouHL88bBE3cyz+3FA/8ofoxzv/lcHDqDo3sfVPKP+OLbbD
 Wooc8cZC0zUhbJZtiI0gCDgFKGA2Yeo9+5y49I89sNWcrAp7TQ97oqi9wREOpObrdtBP
 /7K/094qKMSeG9Rqwt+sYlxGmI2FmYEWzcOeBl2cX9hHdgkuKjGEFKX49Up9aCa9Gj+q
 LzWCrK84sgTf845I9FOML8v1DzM3sv1iiY9v13ld+y47nTw1kqs0dQ5IS4k8YWZgq+Ni
 ty/ZBGLwhBWwJ7oBjEUpA3ZI1H+F8qjqY3hgk4FBN+jlCq/8j+dvCXki3mHD38keNKHJ
 JlyA==
X-Gm-Message-State: AOAM533ud2dMNNhPuIabJxXizVRbGx0GWkd1yhBCzhUuyxTxYkBjdkbE
 Uz0WdHwkqXw3AbgdV6Zc391hDw==
X-Google-Smtp-Source: ABdhPJyw0NdU2LBdQh3FXpzphma8jEvxgm5AJA3rB5uCOUU+1kAws3Bn7EKPJv7QHhG/as+ov0SrEw==
X-Received: by 2002:a17:90a:e513:: with SMTP id
 t19mr16114544pjy.104.1626546674182; 
 Sat, 17 Jul 2021 11:31:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u3sm2511574pjn.18.2021.07.17.11.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 11:31:13 -0700 (PDT)
Subject: Re: [PATCH v2 01/10] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-2-richard.henderson@linaro.org>
 <CAFEAcA_iPBPUUP-pjM6jkLHCjftgeKeSWMT6s_QHes0mPU7PNg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a55ce858-31b9-6678-80de-530e24a6b055@linaro.org>
Date: Sat, 17 Jul 2021 11:31:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_iPBPUUP-pjM6jkLHCjftgeKeSWMT6s_QHes0mPU7PNg@mail.gmail.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 10:30 AM, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 16:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The space reserved for CF_COUNT_MASK was overly large.
>> Reduce to free up cflags bits and eliminate an extra test.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/exec-all.h   | 4 +++-
>>   accel/tcg/translate-all.c | 5 ++---
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 754f4130c9..dfe82ed19c 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -492,7 +492,9 @@ struct TranslationBlock {
>>       target_ulong cs_base; /* CS base for this block */
>>       uint32_t flags; /* flags defining in which context the code was generated */
>>       uint32_t cflags;    /* compile flags */
>> -#define CF_COUNT_MASK  0x00007fff
>> +
>> +/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
>> +#define CF_COUNT_MASK  0x000001ff
>>   #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
>>   #define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
>>   #define CF_USE_ICOUNT  0x00020000
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 4df26de858..997e44c73b 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -1430,9 +1430,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>       if (max_insns == 0) {
>>           max_insns = CF_COUNT_MASK;
>>       }
>> -    if (max_insns > TCG_MAX_INSNS) {
>> -        max_insns = TCG_MAX_INSNS;
>> -    }
>> +    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
>> +
> 
> Previously we would allow max_insns = TCG_MAX_INSNS (512).
> Now we only allow it to be 511...

Hmm.  Well, 0 is supposed to map to "max", currently written as

     max_insns = cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
     }

I could just as easily map 0 -> TCG_MAX_INSNS instead.


r~


