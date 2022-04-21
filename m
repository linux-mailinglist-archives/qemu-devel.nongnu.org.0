Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6506B50AADA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:39:32 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheWQ-0004qd-VB
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheUU-0003mO-SJ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:37:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheUT-0006uD-7j
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:37:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so5711094pgn.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X5yCLDEtXnwTfceodqe/0kxx1G7CJjLYhHQhq5M8jTU=;
 b=pmLeTDRkWStelTBV66tiQI5LGyR0Pp/jzT1j+oz/p7c09s4TtYwbtbCcwSBJwmoraY
 1Cbua3bzSq6rwFITF24chLdvvGDMSJLu6YTsv8gHE8fSXXJkIXp3xBCzMGreOfgNjyi2
 8+dZQbNqaEyutTnUuJMkaVyiZ6xQ4XZAlG35qSJ+t6vs2lLD2qweLHzL+6bq/YwBAX1A
 5mrSiGbPn7AETULE3S9JiBgly7C5spvbFDzvJannF2qOczMuOHf4nBSwuXpAg0PbhriM
 hcsSp/DDkqouwIlY/psfRvyFNz/2zh6z9t1AKBJKblIoqHnTApdricJu6CSoLFeIUONb
 As4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X5yCLDEtXnwTfceodqe/0kxx1G7CJjLYhHQhq5M8jTU=;
 b=v+/o+P16ljjh2dDp1gTdD0akeFSg6ddZ6srkSTsMdX1PmvKFJ3hmcZrF2aRFjuHt9j
 +PPb73BeCSxB/p2Ck5HY5t5Kzk9m8H3QQmMJASu8SdTjMWrOSgKVoPeT745SMHTxrlYg
 P3uR4zSjfFUf5BXOCkSeymF5UxdBkr1+30Rl9AlFd2X1F+ULadjLWPQlI2WJssFQlt8r
 8WwNf7tbyip6Ga2lyVVTchOYuSEHSobWKML09DKaiBYyv71Uzwf/Cj8Qu8ra5EPNgDeJ
 Rf9668gw+sWJPkEFpa2mPjv8969Ujm1g3OwkgI9G2qE8znwlRVgQD6ghimq/ml8oDAQL
 B7jA==
X-Gm-Message-State: AOAM531YJbfHK0+MNw6CtGusonTJiTmQbHyuEQ/4iUcpZBuZtWUBnEDy
 tEWtSYNGvoikuLAF0nu06P0U9Q==
X-Google-Smtp-Source: ABdhPJw423gSBPWRBI8T/xrooPP8BlTfBW90izeAQmMHwXjoMi9Kd+XH+NhIINTuU7ba0US23ictGg==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr1630665pfh.60.1650577046175; 
 Thu, 21 Apr 2022 14:37:26 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:ef88:6a04:9d0:2971?
 ([2607:fb90:8060:946d:ef88:6a04:9d0:2971])
 by smtp.gmail.com with ESMTPSA id
 23-20020a621917000000b0050ab87c15e7sm71115pfz.53.2022.04.21.14.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:37:25 -0700 (PDT)
Message-ID: <fbca30bd-72b1-5016-78a9-6410369761d7@linaro.org>
Date: Thu, 21 Apr 2022 14:37:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 18/60] target/arm: Use tcg_constant in
 translate-m-nocp.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-19-richard.henderson@linaro.org>
 <CAFEAcA9VN44x5JwvQTQchixsCz_tG7-bwBGShrEwJRFrU8x-TA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9VN44x5JwvQTQchixsCz_tG7-bwBGShrEwJRFrU8x-TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 12:03, Peter Maydell wrote:
> On Sun, 17 Apr 2022 at 19:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use tcg_constant_{i32,i64} as appropriate throughout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate-m-nocp.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
>> index d9e144e8eb..27363a7b4e 100644
>> --- a/target/arm/translate-m-nocp.c
>> +++ b/target/arm/translate-m-nocp.c
>> @@ -173,7 +173,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
>>       }
>>
>>       /* Zero the Sregs from btmreg to topreg inclusive. */
>> -    zero = tcg_const_i64(0);
>> +    zero = tcg_constant_i64(0);
>>       if (btmreg & 1) {
>>           write_neon_element64(zero, btmreg >> 1, 1, MO_32);
>>           btmreg++;
> 
> Looks like we were previously leaking the TCGv for this one?

Yes.  I'll update the commit message to mention that.

r~

