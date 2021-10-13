Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73E42C63B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:23:36 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mah2U-0002Y3-O3
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mah00-0001r5-98
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:21:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1magzw-0003AC-9E
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:20:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id c4so2184525pls.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=srBduUPJJy0/xgorY/SqGLcr6llYw3t2x8HaOwBvHM0=;
 b=5s8PinZtK4C0vy/NOSvWjsqk2wc2QXEUagDj92vtSovHwFcYkfKl5T9BhjsHQDOEnN
 UGURjycwLKjuE+3gjJqzRtrICPvqn+lcBklQpORp+1tAd9cVZdrSr98JXjcFpAJBwgXI
 ocgP6d/uj0PLNMg530H+NqCAGnqpQV+jG1JHievPgZJ3PNJwABdfxQ/6cNecRaQFmH0q
 JNhf/rnrqkRbUEkYTxbvMA33yjxgChg8mncHEkQS2YXGf+XdwWp5R3EDp04IhxwJ+g7V
 6DkTlKt8OS+ETcqbqxt7Rzbq4CQJLbOyyPaxq3eEoxZYc5fyrr6eeqPQjJEEAV263bY1
 GrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=srBduUPJJy0/xgorY/SqGLcr6llYw3t2x8HaOwBvHM0=;
 b=Jfh9sEDRkDM1oUdra9dnXrlpIfMj4hx7GdR50q9oD0zBI+33CAPYswKaxVEk1LRtzQ
 MABMHGUdQIq94q53xl3FK4MN/RKObqvw4pihmd/axdjTzU8//gLP7U3+Lv8V98uryOhu
 cApMRKQ9Cj7mT4oWv8TQajByd4DPI2CyHDGvYzpti5YUsI08m7V6gTsHfcM7leoClXlQ
 mrJlK3bhGL6/FLSgsOFTC9bzapr1mdgnPu8VtS406d4Qo5W1kep8QbEnxyyfcGzVgyil
 Tt3IFQiq/O8BmH1tgkZCWgqCYfKqPVqckMUxDaCPpl+CrEo8eayCtcCiH2FGHT7I+Gy8
 zS1A==
X-Gm-Message-State: AOAM533EuXgO9vIZSk0BOyibcAqYs/WWt8/q/jzqrXTPeyFMwwE+bYIO
 Kx8o0kEi72d1dFyuw20CHByQ8g==
X-Google-Smtp-Source: ABdhPJySOMd441LUor7mk6uQL2DJxnbbHJQji1Bf4XPGigJ5MeymhLL0AJNSNM2mhAuFfML8lwOIuQ==
X-Received: by 2002:a17:903:22c9:b0:13e:ed56:70e2 with SMTP id
 y9-20020a17090322c900b0013eed5670e2mr66035plg.19.1634142053418; 
 Wed, 13 Oct 2021 09:20:53 -0700 (PDT)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id s2sm6840686pjs.56.2021.10.13.09.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:20:53 -0700 (PDT)
Subject: Re: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vincent Palatin <vpalatin@rivosinc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
 <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
 <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
 <CAAeLtUBSZ-=+06SowthZds0r19w66S-ibn18st4=DU81SeJk6Q@mail.gmail.com>
 <CAOojN2Ub=ig3akjXRdtq0WkwTn+wqy_q85UzTgV=UD5Y6y+9iA@mail.gmail.com>
 <CAAeLtUDSss2dco5QsT1wXQJ=bBS5ZAwjmXrH5dceZwxmqKKbSg@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
Message-ID: <fe85a41a-af02-2c1e-cec6-af4668f7519c@rivosinc.com>
Date: Wed, 13 Oct 2021 09:20:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAeLtUDSss2dco5QsT1wXQJ=bBS5ZAwjmXrH5dceZwxmqKKbSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=vineetg@rivosinc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 6:49 AM, Philipp Tomsich wrote:
> On Wed, 13 Oct 2021 at 15:44, Vincent Palatin <vpalatin@rivosinc.com> wrote:
>>
>> On Wed, Oct 13, 2021 at 3:13 PM Philipp Tomsich
>> <philipp.tomsich@vrull.eu> wrote:
>>>
>>> I had a much simpler version initially (using 3 x mask/shift/or, for
>>> 12 instructions after setup of constants), but took up the suggestion
>>> to optimize based on haszero(v)...
>>> Indeed this appears to not do what we expect, when there's only 0x01
>>> set in a byte.
>>>
>>> The less optimized form, with a single constant, that would still do
>>> what we want is:
>>>     /* set high-bit for non-zero bytes */
>>>     constant = dup_const_tl(MO_8, 0x7f);
>>>     tmp = v & constant;   // AND
>>>     tmp += constant;       // ADD
>>>     tmp |= v;                    // OR
>>>     /* extract high-bit to low-bit, for each word */
>>>     tmp &= ~constant;     // ANDC
>>>     tmp >>= 7;                 // SHR
>>>     /* multiply with 0xff to populate entire byte where the low-bit is set */
>>>     tmp *= 0xff;                // MUL
>>>
>>> I'll submit a patch with this one later today, once I had a chance to
>>> pass this through a full test.
>>
>>
>> Thanks for the insight.
>>
>> I have tried it, implemented as:
>> ```
>> static void gen_orc_b(TCGv ret, TCGv source1)
>> {
>>      TCGv  tmp = tcg_temp_new();
>>      TCGv  constant = tcg_constant_tl(dup_const_tl(MO_8, 0x7f));
>>
>>      /* set high-bit for non-zero bytes */
>>      tcg_gen_and_tl(tmp, source1, constant);
>>      tcg_gen_add_tl(tmp, tmp, constant);
>>      tcg_gen_or_tl(tmp, tmp, source1);
>>      /* extract high-bit to low-bit, for each word */
>>      tcg_gen_andc_tl(tmp, tmp, constant);
>>      tcg_gen_shri_tl(tmp, tmp, 7);
>>
>>      /* Replicate the lsb of each byte across the byte. */
>>      tcg_gen_muli_tl(ret, tmp, 0xff);
>>
>>      tcg_temp_free(tmp);
>> }
>> ```
>>
>> It does pass my own test sequences.
> 
> I am running it against SPEC at the moment, using optimized
> strlen/strcpy/strcmp functions using orc.b.
> The verdict on that should be available later today...

off topic but relates, for Zb (and similar things in the future) whats 
the strategy for change management/discovery. I understand you can 
hardcode things for quick test, but for a proper glibc implementation 
this would be an IFUNC but there seems to be no architectural way per 
spec (for software/kernel) to discover this.

Same issue is with building linux kernel with Zb - how do we make sure 
that hardware/sim supports Zb when running corresponding software.

It seems some generic discovery/enumeration scheme is in works but what 
to do in the interim.

Thx,
-Vineet

