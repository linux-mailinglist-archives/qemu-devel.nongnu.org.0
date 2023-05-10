Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D66FE151
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:12:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlUH-0000rD-3r; Wed, 10 May 2023 11:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlU1-0000Pg-LC
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:12:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlTz-0002mR-Hy
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:12:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so34260355e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731518; x=1686323518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NPbkl1w505Zowfiz+GHGxaI04VxXXiXlI/G49RY29tw=;
 b=mbYq6GownMbEkVcDrFe49JKDpFRnUrMzJmsq2JtBlfbXT1nkZZk4nqBxfGcmd9GoUV
 QURGmvcFM0fq6Y+mk/I3RWCgJElUHxcdfpOxj1IlGVR8/9Fm9sFE9xFbC71tZ7LIfAMa
 UfQuX7p5hQ5u27IskeQ0jt6w8CMvBwoiBqXWINIxc+/Xlc6SRyh87wkEyySghcBdacEg
 vk1DNa44Eucc1NnLnmg/qY59Y/h4bBXN6CnOSHkifZZP1+xE0fYlg6960q4QcXQlfaFC
 SocsiK/qdiQyXR7cl8OY4SZBzmHUJyOeaW/OHEpP8yYRx4g6+I+1rjP9d8Sj3egtPzXW
 PgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731518; x=1686323518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPbkl1w505Zowfiz+GHGxaI04VxXXiXlI/G49RY29tw=;
 b=XqTRms7VzlyS4E6AOvfFIYfCuI+GtXupeI0J/klKWnaMLEcKCxXNpfnbsKEDjiQyew
 HdeGn8zgdBeOE57lQMOXYgKQCTBfBRhE2DCAh8q91Ci6utHnoD5U1JbVU2+wEcMKiFYS
 WM1SOoYFnLIbl2fNx+fRFhX/lVXGJO1FW1JaGFurVI/BRV5yIkgstOiB3sanaBW7EWfm
 LRDpRV9c5cEAi2uftOTDUhhDgSxCvQEy+QZKyLW5m7Yz2X3d8ZxsgYjghGaiIcf8ZqoO
 mpGbo4yC827b0jfCBIS2hjN0xe7uVwl29auBC21egEkobv1mYTdQILvMroPHWGl/o01+
 ia0A==
X-Gm-Message-State: AC+VfDwY9l57MRuLiPwW4ccF42Zk/zDU2tz2VEnQOuGPqkdHv5KMZif7
 jX+PkRzWeavdHY5SAvFeMwn/PA==
X-Google-Smtp-Source: ACHHUZ5UHDaK51jx/WgDcZ2qs9cDRTvTOc6o1hS4HC1nESndVLtajUyfXCphmlduNqZEcqaoX2fF/w==
X-Received: by 2002:a7b:ca51:0:b0:3f4:2148:e8e5 with SMTP id
 m17-20020a7bca51000000b003f42148e8e5mr9500563wml.1.1683731517793; 
 Wed, 10 May 2023 08:11:57 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b003f427db0015sm7892899wmo.38.2023.05.10.08.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:11:57 -0700 (PDT)
Message-ID: <ce70d9d9-71e5-d185-9841-b1283de72fe1@linaro.org>
Date: Wed, 10 May 2023 16:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/16] tcg: Remove TARGET_ALIGNED_ONLY
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, crwulff@gmail.com, marex@denx.de,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-17-richard.henderson@linaro.org>
 <b0e9ba06-ad37-65ac-da6a-f041e5187660@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b0e9ba06-ad37-65ac-da6a-f041e5187660@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 15:43, Philippe Mathieu-Daudé wrote:
> On 2/5/23 18:08, Richard Henderson wrote:
>> All uses have now been expunged.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/memop.h  | 13 ++-----------
>>   include/exec/poison.h |  1 -
>>   tcg/tcg.c             |  5 -----
>>   3 files changed, 2 insertions(+), 17 deletions(-)
> 
> 
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index cfd3262a4a..2ce9dba25c 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -2071,13 +2071,8 @@ static const char * const ldst_name[] =
>>   };
>>   static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
>> -#ifdef TARGET_ALIGNED_ONLY
>> -    [MO_UNALN >> MO_ASHIFT]    = "un+",
> 
> Maybe we want to keep the "un+" prefix.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> -    [MO_ALIGN >> MO_ASHIFT]    = "",
>> -#else
>>       [MO_UNALN >> MO_ASHIFT]    = "",
>>       [MO_ALIGN >> MO_ASHIFT]    = "al+",

Done.


r~

