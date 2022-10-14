Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92D5FF3D1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:50:04 +0200 (CEST)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPkx-0002RQ-3e
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPhT-0007oR-Os
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:46:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPhR-0001QS-Vu
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:46:27 -0400
Received: by mail-pl1-x632.google.com with SMTP id d24so5558687pls.4
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bVRISwWg+YApByjtm9TBzbXPhejuAEJFZrHBh71/t+E=;
 b=whIE/pNN/Cxgo/qLSuXc0KXlfL06dlZY6Ye0TgfBE6i8Ov/61iumfUjwi9nxuD2mTW
 PNR6czu4WnGS25X9g7kBFbjdkKscx/JwBmM3C6P0pnou7IM6g5tjoxViqMjiTDJ09U0P
 2+FwvKgqP5Ao5mN4qUZjjacbBUF5e7/mMjEFOkWTI5UNkZGnQ26CyBJ29+ldPDeGnvz4
 ysZkUOTIGWUI4gmeSaOwfLd6MAj0LxcliHv5xCASR4aY01wXNz+2S/UOnDbOeuoZotnp
 jG8jh8FRwsEbwXAGApOMBAfVPj3RzhAycNfzTVw3L2xNykspuaGAW4ywgO8ZMDWijZX4
 dqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVRISwWg+YApByjtm9TBzbXPhejuAEJFZrHBh71/t+E=;
 b=pTrY/sSm4z4c+iRUqKSi8Jv0K8YMmgnN4U+MojUBmnEohh84TSSBYPZJkwqjjv/gcF
 g+byXoqbddPFIejb2CfjK7Vn0wo6AWgZgjl0Tm97hszdGJMMJ3FHQIXCUUDpvXGiCcmX
 4OtIdkO2oXQNMeJ/EoS0vNrwYlJkcLzB3iMCYsPpGDf3jVHVOqNdkzAuk7HueNochjyL
 610ey8SoWzgUSDzw6W2C4WSapJ/WHBzr9uNi/RUpNP6k0d6/aH9El3OnW//vlxRPGDzD
 kyO9iJUaQPz8WL90ZIDWe98dunBHgEFckQ5Px3/cF1wGqEmanzoVOmrNFx2MKiy9Jz2c
 yH1A==
X-Gm-Message-State: ACrzQf3NUSdKBBiy9Wm26KVSOvAaPGGba4Lb8JgSpJ28G8IX+F6hTAI8
 lL88dao0IEVekiErrsuiOERDZw==
X-Google-Smtp-Source: AMsMyM6iK8csGMCtsaYigAl9qDvcPvfDDsQTfsxgelJAQFANfu4hxlUA9owCafrYC2SJayzrKqZb+w==
X-Received: by 2002:a17:902:d34a:b0:17f:9be0:cdf9 with SMTP id
 l10-20020a170902d34a00b0017f9be0cdf9mr6646251plk.132.1665773183719; 
 Fri, 14 Oct 2022 11:46:23 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 a1-20020a170902710100b00178ac4e70dcsm2031567pll.185.2022.10.14.11.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 11:46:23 -0700 (PDT)
Message-ID: <23cafb0e-cd1b-d0d6-e2ab-6309296e4f50@linaro.org>
Date: Sat, 15 Oct 2022 05:46:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
 <20221006033846.1178422-9-richard.henderson@linaro.org>
 <CAFEAcA8zy2J06hZVt2ULJmbhQzDKRKrKBX9KaKLVHJhuudZQnA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8zy2J06hZVt2ULJmbhQzDKRKrKBX9KaKLVHJhuudZQnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.856,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/15/22 04:53, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 04:55, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
>>       TCGv_i32 tmp = tcg_temp_new_i32();
>>
>>       if (reg == 15) {
>> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
>> +        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
>> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
>>       } else {
>>           tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
>>       }
> 
> This is still doing the pc - pc thing -- I guess my comment on v5
> crossed in the mail with your v6 repost.

Yes, v6 was posted a couple of days beforehand.
I'll do a v7 with the change soon.


r~


