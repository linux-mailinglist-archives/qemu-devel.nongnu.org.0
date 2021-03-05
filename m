Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1632EF00
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:36:57 +0100 (CET)
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICVc-0001JP-S6
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lICIU-0008D4-K9
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:23:22 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lICIS-0005VG-P3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:23:22 -0500
Received: by mail-pl1-x629.google.com with SMTP id d11so1563023plo.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OeQhTkWuZRIV99ul0o8pp+Cd7R7HMh1hLMhZEMaVpx8=;
 b=l5/UqqkpiJJMnvXDCSr10Y+5sWBOD83YBRd5YOxHiGsIG12JKCkMOMnOIVi31/uBTL
 Ay+kLllz90flNGR+1SfrCAVkv+cNwFlaYLBZC5CE7iYJ26pTvOoCAr7qxCKGZYgCA5Hl
 tly19IwHNWNlQU2y41Hp8HD8XhuGtC6jOwJbJm6wRJIaqAbxweEgGuP3w+MSSd+yhnEW
 hAW7ta3JE1Iyr5oohK8RPIxlwqer4wQMIFEMbZRAXoTV60fdKRdOfCfKqBNMMpyupZWv
 U41LsVe9KiXn+yFnngrkRkdn3Mre7Ija5uq4M3beHl5pouzKRTWp4ixym2nik1u8k6LK
 +cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OeQhTkWuZRIV99ul0o8pp+Cd7R7HMh1hLMhZEMaVpx8=;
 b=R4NyTUmT/iWFT+w4a6jrIU49YELLELwvaCiJJcgPwftjcSNbRqyt8zeuVYNIX4rLlH
 GPOiY6E0kFoNTHCEmdEc7L5HcC/d8mCng0zWEP3l0GmKjk9YKIU6nyb9OnU6KDOGgWrL
 lWuTak1xotg5+dPREwurIva8ngwE5mW8Fp9ZC+4MmzHz3WN54EgS5k7q9hAqjVEm/uk9
 rS8TjGW1vv6ls2SiCg40ir4kkikeD7KJ4gN0+i+C2LN+svdBDL2HH7bSHmLxQm5fBydv
 5aiWLfumqoQR1Zo4HpfKTqtwolxAMFtVwmkrzYu0g/nHmY0z8qPI1Fsi9P8pfFKlieJ8
 yArQ==
X-Gm-Message-State: AOAM531iCaA3epBz2e9K57btu8c/MMXl7GRm2bD69IkFu7PTQgGAlFH6
 zewinMXYlnX2UAYRQl57INNkbw==
X-Google-Smtp-Source: ABdhPJyZTIm/Tq6YAE4kXByPLUf+bGvjQCxWAG5fHZueDs3n+cWsLLnLyLJLpLpRenfwMqCc8zNrwQ==
X-Received: by 2002:a17:90a:5d14:: with SMTP id
 s20mr10791482pji.6.1614957798697; 
 Fri, 05 Mar 2021 07:23:18 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b15sm2886485pgj.84.2021.03.05.07.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 07:23:18 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit
 CPU
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-4-rebecca@nuviainc.com>
 <CAFEAcA8LYf5V=3SEKBzfaGnzSL4K58SQXBqsdMizpE45vTD9VA@mail.gmail.com>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <03da2b87-10f3-f7c9-82ff-0a4dc2e65aaf@nuviainc.com>
Date: Fri, 5 Mar 2021 08:23:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8LYf5V=3SEKBzfaGnzSL4K58SQXBqsdMizpE45vTD9VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=rebecca@nuviainc.com; helo=mail-pl1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:31 AM, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 22:45, Rebecca Cran <rebecca@nuviainc.com> wrote:
>>
>> Enable FEAT_SSBS for the "max" 32-bit CPU.
>>
>> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5cf6c056c50f..88a6b183d325 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
>>           t = cpu->isar.id_pfr0;
>>           t = FIELD_DP32(t, ID_PFR0, DIT, 1);
>>           cpu->isar.id_pfr0 = t;
>> +
>> +        t = cpu->isar.id_pfr2;
>> +        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
>> +        cpu->isar.id_mfr2 = t;
> 
> Er, this doesn't compile:
> 
> ../../target/arm/cpu.c:2223:19: error: no member named 'id_mfr2' in
> 'struct ARMISARegisters'
>          cpu->isar.id_mfr2 = t;
>          ~~~~~~~~~ ^
> 
> The typo is obvious, so I'm just going to fix it up in the
> target-arm queue, but this does suggest that your testing process
> before sending out patches could be improved ;-)

Thanks, and sorry for the mistake. I'll work on improving my testing of 
32-bit ARM targets when I'm making changes to them.

-- 
Rebecca Cran

