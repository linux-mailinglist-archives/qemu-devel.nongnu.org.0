Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5228B5EEC4E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 05:08:00 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odju2-0002ez-Vk
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 23:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjsO-0000kJ-5B
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 23:06:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjsM-0008Qc-J6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 23:06:15 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i6so278169pfb.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 20:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=HydTmT9IlZECqNW+k139+szaDo8Sw0aKxqwGzUBe2Qw=;
 b=vLHfiGlW+1n0gYmZspIx6kU7737nI9dYG6LyEiGCKNVhWmyTQG336na0sSzz697RSt
 40jxZtGMsv9VBN/tm3mFHsxmiZxKGG+jrakVeYH4PtidKj4NWEStJdmeHvGe4FGJtw2j
 fo0RKn1CQ00dEoz8PSySo3uIM2treChq58mwUwGalAdloD04nSY5QBOSlQOGRAaEHYpP
 r0A23haCZe6ArS1GA7ocesdbJeLLqLBrWlff8Fu8ZHXhtKbwlzbn4hRoxf7h+IL0vd9a
 Lvge06hEjk5cbIYWk76EU06WEMD8Nvy5f8SJHLFXn/b1s2+t8aUVZol+rgCj4xymORO+
 VN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HydTmT9IlZECqNW+k139+szaDo8Sw0aKxqwGzUBe2Qw=;
 b=DMoT3HoDoOEcRN7xQ3w1oc1vzd7mDfNU3x204lk/KAg6t96JdWmw+ohtv3ZIZNSO92
 IzbPYHyikNw4hicF05uUGnH2NijtHidSeUInNG+eEyBZO2kDCpYldtumX1acP5EBWDlH
 YalNftOskLq/qdiWBNJmA0bmG8LhYarV4w/VEKIZvzyVa+l/baIdfFLCWdLn+X1onM5O
 b7BNyi9P4dW5/VZPrirOqTqfLN7bFwmRMxG9FiSj5yCdCcEbRLkorLI58kNdaWyGaRhS
 teAihFPR8WilZ9LbvIvMcb94VezuqMx+hj4wnlMThlRWcMmk2oSFoYhBIe4yivRxepTE
 t7gQ==
X-Gm-Message-State: ACrzQf3HaTaNvSx4ALte2LWw2Cfrv7fvBdB+viifcePfNQBhIV2TI3kv
 SWY06m0HIyTGZG0Q4Nj+eKmQrg==
X-Google-Smtp-Source: AMsMyM6RShGkKjXFDtDFftMuIj4O3k0vMyH2puddomTKqTxjH49of0iJekSj0y/Hjw61YGTY5l4eow==
X-Received: by 2002:a63:2a02:0:b0:42b:3b16:5759 with SMTP id
 q2-20020a632a02000000b0042b3b165759mr938726pgq.564.1664420773173; 
 Wed, 28 Sep 2022 20:06:13 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a17090311c500b00178b9c997e5sm4655132plh.138.2022.09.28.20.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 20:06:12 -0700 (PDT)
Message-ID: <086890ae-d369-8d4f-3bab-135080edb6ce@linaro.org>
Date: Wed, 28 Sep 2022 20:06:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 3/9] target/arm: Change gen_*set_pc_im to gen_*update_pc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-4-richard.henderson@linaro.org>
 <CAFEAcA_6+jsQfCvTxxUdmdcisMBSsvzKy_g5pdLq0DZ54VtFSg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_6+jsQfCvTxxUdmdcisMBSsvzKy_g5pdLq0DZ54VtFSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 07:04, Peter Maydell wrote:
> On Tue, 6 Sept 2022 at 11:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> In preparation for TARGET_TB_PCREL, reduce reliance on
>> absolute values by passing in pc difference.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> 
> 
>> @@ -263,14 +263,14 @@ static inline int curr_insn_len(DisasContext *s)
>>
>>   #ifdef TARGET_AARCH64
>>   void a64_translate_init(void);
>> -void gen_a64_set_pc_im(uint64_t val);
>> +void gen_a64_update_pc(DisasContext *s, int diff);
> 
> AArch64 addresses are 64-bit, so there's no guarantee the diff
> between two of them will fit in an int... We pass pc values around
> as uint64_t, so I think we should pass diffs around in int64_t.

I'll make the change, but it's also true that no single insn can generate a displacement 
more than INT32_MIN away from pc (adrp).


r~

