Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A83A407D80
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:12:48 +0200 (CEST)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPPHq-0003cV-1I
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPPFT-0001Yl-Ae
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:10:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPPFQ-0007Mh-Rs
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:10:19 -0400
Received: by mail-pf1-x433.google.com with SMTP id v123so6300340pfb.11
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UFVQsQUQavJni4qWF0A8CyNBgE1+gq8GL1avN2S07FA=;
 b=mbSmNrxmkwuczLUXh7fNJZS3D8Zm1rbk18y9jyDy1rSdwi2BZQknSeKo0MtiRGhhxO
 rnAN0Y1Hel41cHmd9KYHkx0x20lSsXknncnhhZeND1TBH2eLWnYJ3o66DtRIq/NuOLpz
 DQw0GuBsjEvOLoSHQQp0+/f4uHB0vaA8LfHs+4OSks7Gyk9BPzGBc80mbEKRjCMjZBLI
 ebG94KlwFJmnu+z7tHlQD8GWQgYjS3ver9AN4Yk71KOIUk4AhFz6b68ZTQwj4KQ9HZBS
 /xXfn//qSPms4RMu+NCrdU5GHqjzE8ddz7K/ly2qbfgrs5tNMQm4yB9KtsyDDD/TTQKK
 Il2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UFVQsQUQavJni4qWF0A8CyNBgE1+gq8GL1avN2S07FA=;
 b=xl3Dxe5XAbQ6rSkJgSsstAV3EucZhk8+xMom1OQnenrmJpjhYkdMLLo8H6D39KsWVG
 DN86nASN33/nOcBtCIFMTcpDjEHyy/8hJMAor5SVJ8if2EVFRI8kMB87pVUG4tg97nsN
 BnENEZaPWhzhu7Lugph3xYMOAP8sAGdW8kocdl3Kfdjyb2Z9rWA4hX8lKLgZ7g5Jrp6Q
 CfdjuB/YcljiNanz46q8xke1qGhVmxYvJ5uikvUYAErMGrOrCx6w48SvexeoRmCSV+BB
 NyVlLiAbwF3NePtEpLYhGs4gekNvBw6lOHDaAs7LpqADwJnhEdNjEaGKpxiXYVt0nOaF
 oocA==
X-Gm-Message-State: AOAM532b1KzAbYqTqlHCzdbotiT5t3n6s0YeFqMg59Aq6p0llU2/gGvB
 MhnyAe4jklRiFFSv/lIiS2b9hptoPdP5AA==
X-Google-Smtp-Source: ABdhPJz02b2oUQjoq7y0IWddKaN/eOkbCF4FYvt4mu5MOo6t58NhLwbn/vfMDBYr9/i7PnyHuKi2Zg==
X-Received: by 2002:a62:5297:0:b0:3f4:263a:b078 with SMTP id
 g145-20020a625297000000b003f4263ab078mr6507614pfb.20.1631452215210; 
 Sun, 12 Sep 2021 06:10:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a12sm3890304pjq.16.2021.09.12.06.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 06:10:14 -0700 (PDT)
Subject: Re: tcg: pointer size warning on x32 arch
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <f5bd1db5-1bf1-e32f-3eff-aa8f0c7e8a1e@msgid.tls.msk.ru>
 <6b1c1c7f-0e0b-fd49-2ef8-1ab7c8b7a3e5@amsat.org>
 <fd38f80c-bd36-8399-33b0-bbd3ec566813@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c8258e0d-5c87-3953-6355-16d3c1604d43@linaro.org>
Date: Sun, 12 Sep 2021 06:10:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fd38f80c-bd36-8399-33b0-bbd3ec566813@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/21 2:46 PM, Philippe Mathieu-Daudé wrote:
> On 9/11/21 11:06 PM, Philippe Mathieu-Daudé wrote:
>> On 9/11/21 7:50 PM, Michael Tokarev wrote:
>>> Hi.
>>>
>>> The following warning is reported by the C compiler when compiling
>>> tcg code on x32 architecture:
>>>
>>> In file included from ../../tcg/tcg.c:429:
>>> tcg/i386/tcg-target.c.inc: In function ‘tcg_out_movi_int’:
>>> tcg/i386/tcg-target.c.inc:959:30: warning: cast to pointer from integer
>>> of different size [-Wint-to-pointer-cast]
>>>    959 |     diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
>>
>> Likely fixed by:
>>
>> ---
>> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
>> index 98d924b91a8..0895f5670a1 100644
>> --- a/tcg/i386/tcg-target.c.inc
>> +++ b/tcg/i386/tcg-target.c.inc
>> @@ -956,7 +956,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType
>> type,
>>       }
>>
>>       /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
>> -    diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
>> +    diff = tcg_pcrel_diff(s, (const void *)(uintptr_t)arg) - 7;
> 
> Hmm not quite. At this point tcg_out_movi_int() already checked 'arg'
> does not fit into a 32-bit value... And on x32 we have sizeof(void*) = 4
> so we can't cast a >32-bit value that way.
> 
> But tcg_out_movi_int() is called by tcg_out_movi(), and all 'arg' values
> are either 0, 1 or a host address (often casted as uintptr_t).

That's false -- 'arg' is an arbitrary 64-bit constant here, for x32. But you're right that 
no x32 pointers will arrive here, because TCG_TYPE_PTR == TCG_TYPE_I32 for that case and 
we'll use the 5-byte mov immediate insn.

> +    assert(sizeof(uintptr_t) > sizeof(uint32_t));
> +
>       /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
>       diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
>       if (diff == (int32_t)diff) {

We may need something like

     if (sizeof(void *) == 8) {
         diff = tcg_pcrel_diff(s, (const void *)(uintptr_t)arg) - 7;
         ...
     }

I wonder if I still have an x32 vmm hanging about.


r~

