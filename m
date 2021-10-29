Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47A44017F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:53:04 +0200 (CEST)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgW3r-0002a1-IT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgW1W-0008Bh-9L
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:50:38 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgW1U-0002UN-O4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:50:38 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 127so9940448pfu.1
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QQLSRbvZuuF3NnYBXxZlEe0yFbD+MpxWPOd8yac5kb4=;
 b=QgWFpTAQPf74Pqz/1uiUB3U0fwWFSivIw6hWg0m4loQ//DlYbnNDROgw433UR481Lk
 L3u3VbCC7ne6/FD2j8lIcmBK+ULEz/o3CIXDjbmk4rSt+1I3IOCUkXYsS3tZzLWCi59T
 Pm1RyRbnypqxoBLr2JrELr439qHOzgJRGiUx52uEpR3zHV4yNnDM2TZhJswz8HmBYhzB
 s37WWqJ79XZ4MnZsxpGt3YJogtf756FBSgANLNcjSP7XIg2kbxke+Jbx7C8EY5kYt+tx
 MSB0P/vLXgHntOui60ImqiEbmxezA+8RbRl7E0YCu+y6INzqVp5y8XZWsu6FcB5Ea85X
 WuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQLSRbvZuuF3NnYBXxZlEe0yFbD+MpxWPOd8yac5kb4=;
 b=a3tQnwgQqb3AA4TWl15nH5VkGQFV6lTmXV8hvNj/IzGPFLjqgSqy4vl/r0cIriNZTh
 n9oSuNI+h1BTt8aklICxgtd09fkQa8nwb0c2u1iLre1akWwNEarMov87PoGEu40n53IX
 a7xkMACveCizxGpb53QDHNVIDKi9U13QlR/jGKL3AEn2zObJOutyG5wtXvoMZZLBFTHM
 k/er9dMRm2LDijBvAtZNByuK7gM71SlZ82XpCxPrVDj248MbYT0gMj2ewDVohce2E+kF
 SRyInqw6OvextTDBXBUBc3Fqn/SlclAS5JvnaS5yKryJjMGxl1+1Iqihp1IAe8dVuHe1
 rIJw==
X-Gm-Message-State: AOAM531MBUTGG+poUNHmtsRBsmqyxKSr00fOqIZTASr0ghmGeQG0bPBj
 slM+QkwVr6VV6t9VKW4BYeTbWQ==
X-Google-Smtp-Source: ABdhPJylmpg6Uifb0Y+bhqZptQFpfNoiYhblKn6r/SBaYt3pbSCQDOgGXtgGXj/u9pn93TPZ16XG5Q==
X-Received: by 2002:aa7:924d:0:b0:47b:d390:da8d with SMTP id
 13-20020aa7924d000000b0047bd390da8dmr12369988pfp.15.1635529835319; 
 Fri, 29 Oct 2021 10:50:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g25sm7399901pfh.216.2021.10.29.10.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:50:34 -0700 (PDT)
Subject: Re: [PATCH v3 20/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 1/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-21-f4bug@amsat.org>
 <7b392e80-b4a5-b01a-e9ec-0d2fa6a39e76@linaro.org>
 <df826b1b-f563-2fb9-7e92-f823dea61936@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e9487be-f0cb-391c-11de-461e536fab65@linaro.org>
Date: Fri, 29 Oct 2021 10:50:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <df826b1b-f563-2fb9-7e92-f823dea61936@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 10:23 AM, Philippe Mathieu-Daudé wrote:
> On 10/29/21 18:35, Richard Henderson wrote:
>> On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
>>> +@3r                 ...... ...  df:2 wt:5ws:5  wd:5 ......  &msa_r
>>
>> Nit: should this be called @3rf, since it includes df and...
> 
> "3R" is how the manual names this instruction class:
> 
>    Figure 3-40 3R Instruction Format
> 
> 3R has 2-bit DF field, 3RF has 1-bit DF field. The other
> arguments are the same (for the helpers).

Ok, I see.


r~

