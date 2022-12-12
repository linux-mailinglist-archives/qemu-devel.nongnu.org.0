Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA864A45F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:46:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kyr-0006jP-To; Mon, 12 Dec 2022 10:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4kyp-0006jC-91
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:44:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4kyn-0008H3-Ht
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:44:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso4016887wmp.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WQIRe/e8xlbW1LgwHbUsvWTYrVEekqbr16vaUt+PDZ0=;
 b=km/dZIc3CufPzaLM+2g5iQSWnGCMnWzq1fPuvM0KmzlMeS2bAq3vllUBCmwA6s/3ru
 1wrrZUVpniLDl3Q7goiS7yPhX/4OVhjw0P/YBStWo8gRPUwhQAOIy7H3LnLcjgIdSPeR
 +Ie9+dyc0f58ZQNYIMZNxA/+X4wp5s8tyNu/gB32xXLH9NIg4C7IgOYovKJmBjqJPy85
 4OYRvljSS3MBz+WItM6GYaWFG+V8nzoejqyjTFo6+w8yXUZocZ5HHNSccRVcZLCAYmmK
 hbWuWokMzEeg7VxADbzxGy+jtbiYihuRCwmM5fYPPYUzpnOe9AgXXDoG5tfgZvXVNHb7
 3G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQIRe/e8xlbW1LgwHbUsvWTYrVEekqbr16vaUt+PDZ0=;
 b=EV4UVSKx0nNEb53b7wKyzL0+9PrqyHJ1noeXHradONt/pKf5tWNET5guQqt42brmCq
 po1eCdwjpV6sXXQ5rr7RrUALq3CJvnd0QW9cx46WNBwlZ3SLv7Uf0mS+nISqmPfcEV1/
 eR2d42wLAsOEYAaeSL+mbTsEnffEhVVp6MHy7R+J4WT2FSabSQ0LftRSJWlY1qYYpa4P
 fivjoT/uuy5Vi7KUIzMpfPwE2BbLrOKZ6Z0ViCNeXf79ZMZwSIaSGLpvQMOza2ttaue4
 B2putDIMM6f8SVmD2WLwk9SydLrk1WIMFpOGSsQ75DRgRF7A0zGRkpMUrI9XOZKQ8HIk
 RkQg==
X-Gm-Message-State: ANoB5pl7YHNwonxmRtnsB/Ajjce/2D2nOsW8obcfd/9AxAm9ligH9kbh
 Lder4z5klAL4J3FUh/gCg+zMig==
X-Google-Smtp-Source: AA0mqf5K8AhqdUdkgYrgfh6+dE25RKcLhvkzKmEKcOtqt0YeFR/f0xmPPt1OTMN9ZSjQbec14XSLRA==
X-Received: by 2002:a05:600c:4f93:b0:3cf:6e85:eda7 with SMTP id
 n19-20020a05600c4f9300b003cf6e85eda7mr13391853wmq.14.1670859871633; 
 Mon, 12 Dec 2022 07:44:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003b4a699ce8esm11115238wms.6.2022.12.12.07.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:44:31 -0800 (PST)
Message-ID: <02e4ebf7-908b-28f6-9f90-d917ee2b307b@linaro.org>
Date: Mon, 12 Dec 2022 16:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: Michael S Tsirkin <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20221212075600.17408-1-thuth@redhat.com>
 <12d9fcbf-e00f-1154-63e0-36420e89f619@ilande.co.uk>
 <dd94d639-ff48-554a-c462-ae7fe2399d4e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <dd94d639-ff48-554a-c462-ae7fe2399d4e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 14:48, Thomas Huth wrote:
> On 12/12/2022 14.39, Mark Cave-Ayland wrote:
>> On 12/12/2022 07:56, Thomas Huth wrote:
>>
>>> The only reason for this code being target dependent is the apic-related
>>> code in rtc_policy_slew_deliver_irq(). Since these apic functions are 
>>> rather
>>> simple, we can easily move them into a new, separate file 
>>> (apic_irqcount.c)
>>> which will always be compiled and linked if either APIC or the 
>>> mc146818 device
>>> are required. This way we can get rid of the #ifdef TARGET_I386 
>>> switches in
>>> mc146818rtc.c and declare it in the softmmu_ss instead of 
>>> specific_ss, so
>>> that the code only gets compiled once for all targets.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   v3: Move TYPE_APIC_COMMON from apic_internal.h to apic.h and use it
>>>
>>>   include/hw/i386/apic.h          |  2 ++
>>>   include/hw/i386/apic_internal.h |  2 --
>>>   include/hw/rtc/mc146818rtc.h    |  1 +
>>>   hw/intc/apic_common.c           | 27 -----------------
>>>   hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>>>   hw/rtc/mc146818rtc.c            | 25 +++++-----------
>>>   hw/intc/meson.build             |  6 +++-
>>>   hw/rtc/meson.build              |  3 +-
>>>   8 files changed, 69 insertions(+), 50 deletions(-)
>>>   create mode 100644 hw/intc/apic_irqcount.c
>>>
>>> diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
>>> index da1d2fe155..24069fb961 100644
>>> --- a/include/hw/i386/apic.h
>>> +++ b/include/hw/i386/apic.h
>>> @@ -1,6 +1,7 @@
>>>   #ifndef APIC_H
>>>   #define APIC_H
>>> +#define TYPE_APIC_COMMON "apic-common"
>>
>> Ah sorry, I should have been more specific here: what I was suggesting 
>> was to move the entire QOM type information into apic.h as per the 
>> normal convention, as opposed to just the #define. At first glance 
>> that would involve lines 128-190 in apic_internal.h which would also 
>> bring in APICCommonClass and APICCommonState - possibly the change may 
>> warrant its own commit.
> 
> At least APICCommonState is target specific since it uses "X86CPU" ...

Replace it by ArchCPU ;)
> so moving that to apic.h would be very counterproductive here.
> 
> Anyway, moving those structs is certainly way more than what is required 
> for this patch, so if we decide to move anything else related to the 
> APIC, it should be done in a separate patch later.

I concur.


