Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439C3F0A91
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:52:49 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGPk8-0004rU-6W
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPiM-0003be-Hf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:50:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPiK-0005AI-Vc
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:50:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so2832127pjl.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=e2dEKzJjd60JqHgGn3ZQ1mAybS4Z2O2NWzRTaDlxn+E=;
 b=F9e+QVCq6DD8JK2EaNlp/69bUqcKQLPl4nQWP2W9HTc3ljzwQMS5vmj1z5NbdNXZV4
 9G5ndVsFAoDzvWSNgAQZlCzOphmGARXPUxlcwDNLMxEnrdlArnE+7iekdGuwtyd7LSz3
 pe6/I+SFQYYwSUYqiD15Jr2i82BV90Uz8n+gYvtmJVPUdSkreXEVN7CFb3BVQf2x/A2h
 vqrTsa0WetwenxLHFpZWpm+QXXDChtJdPRNxuodZ+d+6jv7ikPQR97wOSftuL81iay2A
 iQGEQTXutlT8DV5QLAX1Cx7MsIxKrZx66FlzXd/E5aK0YGfjaDyHbYqgHMGXiEOIBMfH
 bQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2dEKzJjd60JqHgGn3ZQ1mAybS4Z2O2NWzRTaDlxn+E=;
 b=hNgDwByJtYsyuu+OxOh6KmFlmwYSyWlG0sKILdS+w5sH03J8SJyKwUeI5uYctGOup1
 STWP0T7twISZtJewG9uETrWWaX5TajTytibDc+0vssgIS1QtZd5qtAQee762p7ZW00JU
 aQ0lSaKIda//Cby/3m40TNX7m+/K5xU/hsyVzk/YJGAJkOyJmVn6OCVscWOWI7uxmtoo
 EHDD5iKfW2jQxeaMZ0M06wdMSRHZP3gSltTc8Ml4jGthyN+2es3GJRQp5CotRp4zG3Ie
 LP2aFcGOsmr3ShhIW1MFcewOGbiJFjGxyIm1KZ3zzfAL615QcGc2JFZTTQd0qugwUoyc
 5Cbw==
X-Gm-Message-State: AOAM530FJU8a2dJ78ASQXxZxhOeFBBXWaheAoWjOSlidrjtIbf7AU/tS
 a8hgSm6Av0Hz/yX/dphO+uDIpg==
X-Google-Smtp-Source: ABdhPJyUXAHyrJKPun6XjnVRnwB4a9B99HD04ClmQHL6bu+D4xqsL6mcnQ9xPykpYS3jg8s4PNdsxg==
X-Received: by 2002:a17:903:2441:b0:12d:c574:e654 with SMTP id
 l1-20020a170903244100b0012dc574e654mr8193621pls.43.1629309055166; 
 Wed, 18 Aug 2021 10:50:55 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q26sm384894pff.174.2021.08.18.10.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:50:54 -0700 (PDT)
Subject: Re: [PATCH v2 34/55] accel/tcg: Add cpu_{ld,st}*_mmu interfaces
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-35-richard.henderson@linaro.org>
 <8feb6f2d-1c20-8f2f-d387-5e1d77be007e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2eb3c5a7-01b1-eb03-1800-20a01d48fa94@linaro.org>
Date: Wed, 18 Aug 2021 07:50:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8feb6f2d-1c20-8f2f-d387-5e1d77be007e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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

On 8/17/21 11:01 PM, Philippe Mathieu-Daudé wrote:
> On 8/3/21 6:14 AM, Richard Henderson wrote:
>> These functions are much closer to the softmmu helper
>> functions, in that they take the complete MemOpIdx,
>> and from that they may enforce required alignment.
>>
>> The previous cpu_ldst.h functions did not have alignment info,
>> and so did not enforce it.  Retain this by adding MO_UNALN to
>> the MemOp that we create in calling the new functions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   docs/devel/loads-stores.rst |  52 ++++-
>>   include/exec/cpu_ldst.h     | 245 ++++++++--------------
>>   accel/tcg/cputlb.c          | 392 ++++++++++++------------------------
>>   accel/tcg/user-exec.c       | 390 +++++++++++++++--------------------
>>   accel/tcg/ldst_common.c.inc | 307 ++++++++++++++++++++++++++++
>>   5 files changed, 722 insertions(+), 664 deletions(-)
>>   create mode 100644 accel/tcg/ldst_common.c.inc
> 
>>   Function names follow the pattern:
>>   
>> +load: ``cpu_ld{size}{end}_mmu(env, ptr, oi, retaddr)``
>> +
>> +store: ``cpu_st{size}{end}_mmu(env, ptr, val, oi, retaddr)``
>> +
>> +``size``
>> + - ``b`` : 8 bits
>> + - ``w`` : 16 bits
>> + - ``l`` : 32 bits
>> + - ``q`` : 64 bits
> 
> kinda unrelated to this patch, but what would be the pattern
> for 128 bits? ``o`` for octoword?

Yeah, that's what we've done for the 128-bit atomics.

r~

