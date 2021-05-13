Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE4A37F809
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:36:27 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAZm-0005gG-JR
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAPj-0006KM-8D
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:26:03 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAPe-0004AP-Jl
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:26:01 -0400
Received: by mail-qt1-x82c.google.com with SMTP id f8so15396213qth.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVA0M/OdrywKqwb+9zLR3Z30sVvXQ/WpefvxwKm0ZM4=;
 b=xja1WmQ1DnFIFcTG8UXBGOYzmmmlXt+5MhpGkgegRWi9tNsdL9u2Nu//QECrru73zC
 MfriSNHlToasoz7TapIDwCh7CIg/FtOyAQP6JztlozTP62GE2VUWYbQpCnNhcwfVlMBh
 6zmaDTymE3kK9DAocfOMiY+ID2Z72zTkxCCRSsCfhGjWHd6y1SUsXHSjKlcbMZf3LFO6
 P4SOsZNXtxL5xL58bmIcyEbkFe3G2D7Eti0sanAMahocwQYOywo+2JBi84yXMGVhII6R
 9CrY3qcRK5X3bSa4+BVXHGD3OOndFPQKwrb0vTcFfeWnkvtEu6e/NFFsvGoEcY39GWne
 gHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVA0M/OdrywKqwb+9zLR3Z30sVvXQ/WpefvxwKm0ZM4=;
 b=qK8SNTxC80529gno+nikfaTj3kkGP3U0foRvV6AaJqDchhNpdeuwezmecm9a4QGUUm
 Szy8HRiQZmpad6G6mv22NHZuaut7TYR6q8+W1sQ8DmOI97T0iIv9KXpxvst5nMFj/ukG
 1PEcfX+E7Nqkp1EWWwp2rix85w9Di5C4OWpaLNDycBwGMn41ebVdxdVynSZM6xhWq92U
 vV16joW/4tQWar9l2KkcyClz6I758bFtieYiGvGZmYLC0K4d4mOcYqz3D/6TKNdlvPks
 sNub6o692YtbliiZnpJW+7lXHU6vSDo0KiY+EdLCGmC+jfc5pBDO+0K7lhKkdoVzYWa2
 fRbg==
X-Gm-Message-State: AOAM532KTbUUMasCb5aG1z1OPf7TUFuczG5wS1aR2PoATvDdYUzR+wWy
 gpz2JTxjdk4ecFr+rTkGoFYDWA==
X-Google-Smtp-Source: ABdhPJy2wWNNE+lSbHjyhOdeZ37k8gAKoRzObAUhgbHri0mhnanWTeR38IDkzTYJZA195RrHafHaDA==
X-Received: by 2002:ac8:5f4b:: with SMTP id y11mr32145782qta.158.1620908757498; 
 Thu, 13 May 2021 05:25:57 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 129sm2159130qkn.44.2021.05.13.05.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 05:25:57 -0700 (PDT)
Subject: Re: [PATCH 26/72] softfloat: Convert float128_silence_nan to parts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-27-richard.henderson@linaro.org>
 <8735urf2g6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <525690b9-e44b-15e1-5ce8-87e3b0c186bc@linaro.org>
Date: Thu, 13 May 2021 07:25:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735urf2g6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 3:34 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> This is the minimal change that also introduces float128_params,
>> float128_unpack_raw, and float128_pack_raw without running into
>> unused symbol Werrors.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   fpu/softfloat.c                | 96 +++++++++++++++++++++++++++++-----
>>   fpu/softfloat-specialize.c.inc | 25 +++------
>>   2 files changed, 89 insertions(+), 32 deletions(-)
>>
>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>> index 2d6f61ee7a..073b80d502 100644
>> --- a/fpu/softfloat.c
>> +++ b/fpu/softfloat.c
>> @@ -500,14 +500,12 @@ static inline __attribute__((unused)) bool is_qnan(FloatClass c)
>>   }
>>   
>>   /*
>> - * Structure holding all of the decomposed parts of a float. The
>> - * exponent is unbiased and the fraction is normalized. All
>> - * calculations are done with a 64 bit fraction and then rounded as
>> - * appropriate for the final format.
>> + * Structure holding all of the decomposed parts of a float.
>> + * The exponent is unbiased and the fraction is normalized.
>>    *
>> - * Thanks to the packed FloatClass a decent compiler should be able to
>> - * fit the whole structure into registers and avoid using the stack
>> - * for parameter passing.
>> + * The fraction words are stored in big-endian word ordering,
>> + * so that truncation from a larger format to a smaller format
>> + * can be done simply by ignoring subsequent elements.
>>    */
>>   
>>   typedef struct {
>> @@ -526,6 +524,15 @@ typedef struct {
>>       };
>>   } FloatParts64;
>>   
>> +typedef struct {
>> +    FloatClass cls;
>> +    bool sign;
>> +    int32_t exp;
>> +    uint64_t frac_hi;
>> +    uint64_t frac_lo;
>> +} FloatParts128;
>> +
>> +/* These apply to the most significant word of each FloatPartsN. */
>>   #define DECOMPOSED_BINARY_POINT    63
>>   #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
>>   
>> @@ -561,11 +568,11 @@ typedef struct {
>>       .exp_bias       = ((1 << E) - 1) >> 1,                           \
>>       .exp_max        = (1 << E) - 1,                                  \
>>       .frac_size      = F,                                             \
>> -    .frac_shift     = DECOMPOSED_BINARY_POINT - F,                   \
>> -    .frac_lsb       = 1ull << (DECOMPOSED_BINARY_POINT - F),         \
>> -    .frac_lsbm1     = 1ull << ((DECOMPOSED_BINARY_POINT - F) - 1),   \
>> -    .round_mask     = (1ull << (DECOMPOSED_BINARY_POINT - F)) - 1,   \
>> -    .roundeven_mask = (2ull << (DECOMPOSED_BINARY_POINT - F)) - 1
>> +    .frac_shift     = (-F - 1) & 63,                                 \
>> +    .frac_lsb       = 1ull << ((-F - 1) & 63),                       \
>> +    .frac_lsbm1     = 1ull << ((-F - 2) & 63),                       \
>> +    .round_mask     = (1ull << ((-F - 1) & 63)) - 1,                 \
>> +    .roundeven_mask = (2ull << ((-F - 1) & 63)) - 1
>>
> 
> I have to admit I find the switch to (-F - 1) & 63 a little black
> magical. Isn't the shift always going to end up a factor of the number
> of exponent bits we need to move past and the natural size of the
> original float?

Yep.  But now we're looking to compute the number relative to .frac_lo, rather 
than the entire logical fraction.


r~

> 
> Anyway my personal brain twisting aside it obviously works and
> everything else looks fine so:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


