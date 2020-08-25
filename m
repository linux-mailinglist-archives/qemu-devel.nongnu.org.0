Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312C251A70
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 16:04:11 +0200 (CEST)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAZYY-0000pC-9p
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 10:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAZXO-0008Ph-MG
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 10:02:58 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAZXI-00019G-8H
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 10:02:58 -0400
Received: by mail-pf1-x443.google.com with SMTP id 17so7423992pfw.9
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 07:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xaJ+e/rqSr7+PWWtqFvoCopbE2QDmlp3dEvDVvO8suQ=;
 b=ym0WRayI3MGa/HvVvGWyI/W0m4tAEn84vqoSUePu73ruG/kcKti0FEP6ead8BYr91q
 EeCIYEwbnbXKwdLx38EC1DWNNlux+ZwZO/GmPfQIl8JU/n634KTGxwlFlxYMQzPQOHhd
 6nepS11ElhozlMzIPUz2EcogRw4GwmSbRSmbLS8krVNHScFt+AajedLXyYXWdeHcvBDz
 wgeQlfbsxt3yf9I0BKoPfqCnQPxB4dV76bYxjymohmJkMXnH2tyL5U7OlqvupcgVl6pO
 zzisNtEHtN6ym4j00PnmMnJqQarV1xqmNqJVqpXtXcIMDhImUNgTR+YCnJV3pn/K1Fnq
 iMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xaJ+e/rqSr7+PWWtqFvoCopbE2QDmlp3dEvDVvO8suQ=;
 b=jyEQ8e+minTm46oiOAZVhFOea9gGrIEoh5CaOiJkS/ZYuIXJnoQ03zcjvGRlWblCfJ
 uS05HCSxqroB6pbjS2dsh8UTp/DIPRGw8lcCBpgW0lMpC+0bvbUhfwE1jkW0c7z57vOP
 LO+VVEXdIsYlyIgYxjBmAqHyEHxC2c7xKRyazvLKeXOHNTMZcKdeNZKx8bvXxhten/Tc
 Wt/QBQOlTkx4d31D1QWs77GrWnXwmE+HnhSQsTf5OL/kdm6aC59YRvQb57HucezhACq8
 VJBtRcPn7FCc7MsqzWcEmqE1VOWclFroTamkndqvF5rBQuFVYJ7rHwpcX8XKmsWnaBd9
 6V3Q==
X-Gm-Message-State: AOAM531NCI/f6F+dlzgc3H7iJjlwOeOsnNPtwwdiBC5+Lk3d7eewm6a3
 wetBKIsvbzZB+wXFQBO+lsm38g==
X-Google-Smtp-Source: ABdhPJziR2EHjFStLurzokXPTN3s1NaBaQ7+SrU2gzyH2WWf5BEJsYeEdqo1ba6CLNvOjBZoSl2QKw==
X-Received: by 2002:a63:7505:: with SMTP id q5mr6638168pgc.312.1598364170378; 
 Tue, 25 Aug 2020 07:02:50 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id l1sm1231220pfc.164.2020.08.25.07.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 07:02:49 -0700 (PDT)
Subject: Re: [PATCH 15/20] target/arm: Fix sve_uzp_p vs odd vector lengths
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200815013145.539409-1-richard.henderson@linaro.org>
 <20200815013145.539409-16-richard.henderson@linaro.org>
 <CAFEAcA9KPLqMkzT1ckdQPniJJ9y180YncJxfJ3W4TC_tvq9csg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e31f7e7b-bde8-c434-f692-a098eb4c086f@linaro.org>
Date: Tue, 25 Aug 2020 07:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KPLqMkzT1ckdQPniJJ9y180YncJxfJ3W4TC_tvq9csg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/20 6:43 AM, Peter Maydell wrote:
> On Sat, 15 Aug 2020 at 02:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Missed out on compressing the second half of a predicate
>> with length vl % 512 > 256.
>>
>> Adjust all of the x + (y << s) to x | (y << s) as a
>> general style fix.
>>
>> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/sve_helper.c | 30 +++++++++++++++++++++---------
>>  1 file changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index 4758d46f34..fcb46f150f 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -1938,7 +1938,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
>>      if (oprsz <= 8) {
>>          l = compress_bits(n[0] >> odd, esz);
>>          h = compress_bits(m[0] >> odd, esz);
>> -        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
>> +        d[0] = l | (h << (4 * oprsz));
> 
> Why did we drop the extract64() here ? This doesn't seem
> to correspond to either of the things the commit message
> says we're doing.

Indeed, the commit message could use expansion.

> Also, if oprsz is < 8, don't we need to mask out the high
> bits in l that would otherwise overlap with h << (4 * oprsz) ?
> Are they guaranteed zeroes somehow?

They are guaranteed zeros.  See aarch64_sve_narrow_vq.

>>              for (i = 0; i < oprsz_16; i++) {
>>                  l = m[2 * i + 0];
>>                  h = m[2 * i + 1];
>>                  l = compress_bits(l >> odd, esz);
>>                  h = compress_bits(h >> odd, esz);
>> -                tmp_m.p[i] = l + (h << 32);
>> +                tmp_m.p[i] = l | (h << 32);
>>              }
>> -            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
>> +            l = m[2 * i + 0];
>> +            h = m[2 * i + 1];
>> +            l = compress_bits(l >> odd, esz);
>> +            h = compress_bits(h >> odd, esz);
>> +            tmp_m.p[i] = l | (h << final_shift);
>>
>>              swap_memmove(vd + oprsz / 2, &tmp_m, oprsz / 2);
> 
> Aren't there cases where the 'n' part of the result doesn't
> end up a whole number of bytes and we have to do a shift as
> well as a byte copy?

No, oprsz will always be a multiple of 2 for predicates.
Just like oprsz will always be a multiple of 16 for sve vectors.


r~

