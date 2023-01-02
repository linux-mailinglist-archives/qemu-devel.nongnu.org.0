Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2D65B554
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 17:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCO1G-0000K5-7Z; Mon, 02 Jan 2023 11:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCO1D-0000IH-UT
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCO1C-0004Y2-7R
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672678232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6n7zLqfbfmDYmbap2n7MH9c7/oVzn97hIhjFLByn0Y=;
 b=UWryCVP1s79A9fV/Kr5tsGw2ER2PidEHzv22AqiAFM6DbM8Hl3SbRVoSUeSwqV5MwZhZL5
 PFAsbTe/CYlA3SfkPlU6Hwoz7l1Q4D+DVoiAt9WsmR9dGxHZxeIvV67Fj2E8viRifbGUGM
 bMt4MF6xLnLgmmt9rt5rvAF5KnRMo18=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-zhdcBPJ7MsSZYwR9DClNug-1; Mon, 02 Jan 2023 11:50:31 -0500
X-MC-Unique: zhdcBPJ7MsSZYwR9DClNug-1
Received: by mail-wm1-f71.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so6498213wmj.8
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 08:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6n7zLqfbfmDYmbap2n7MH9c7/oVzn97hIhjFLByn0Y=;
 b=ke5EuCBEVEHtF6hM5AQ5nTR+DzAwbnS+TGH38N6bFhvxgjiZ+kRo1NTx88P0cM9T5M
 IY963RJ4dofn16t+bXk7gtuQz4x/7AX+eONKq9h6P5d7y9PAT5Tlju90ho5y6dtwrLgO
 eOdaE4j+vVg0pbO7iCH87gdfxJWsdfmQFg565K3vL6RwMO32C0g0bc9d0/SjeHL9wXrZ
 tQwvNWLQnGi6wMQyDbk0IbxJYd1TG3kHzLB32ZQwM0AqDQ37/jXDEsOz0LA6CuA12iRl
 FBuqoY8pHBZ6+V8PCj1E6c5qY4SkqTW2O3ZdvPcTOPdacvyatlKy8T/+0DvXb2clqWm8
 ER4A==
X-Gm-Message-State: AFqh2koQ5TZAu6E9NuoknlSv7qBALRLeB4mcUPLIipx8GCYjqVLQiDEu
 5Z5S8SmlKZeUBehYgYnfI01bkpZuuXmoYxcCPYHcAMhtMcsW8siXZh1UMDyCye9u2Dwlju/lnsT
 VnlS76QUZE7E6N5I=
X-Received: by 2002:a05:600c:5128:b0:3c6:e62e:2e67 with SMTP id
 o40-20020a05600c512800b003c6e62e2e67mr30056514wms.2.1672678230606; 
 Mon, 02 Jan 2023 08:50:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKbZCFxdxta9ApgYlwN19M2GGwDFxAdNYcgSUU1kfP25xd1rKByrwQPjcyFH87UsbmsHc06g==
X-Received: by 2002:a05:600c:5128:b0:3c6:e62e:2e67 with SMTP id
 o40-20020a05600c512800b003c6e62e2e67mr30056504wms.2.1672678230399; 
 Mon, 02 Jan 2023 08:50:30 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-126.web.vodafone.de.
 [109.43.176.126]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b003d35acb0fd7sm47620453wmq.34.2023.01.02.08.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 08:50:28 -0800 (PST)
Message-ID: <b6466ca9-1e07-c718-dd92-2699dce1881d@redhat.com>
Date: Mon, 2 Jan 2023 17:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221229105848.147509-1-thuth@redhat.com>
 <52276B51-B29A-47BD-B5A6-EA2E7A3E69CC@gmail.com>
 <aa12364c-ff9b-3252-1fa0-7d72876b0796@redhat.com>
 <1328eea1-437d-6c43-a542-9e1a4d1d751e@redhat.com>
 <BF0EC181-629C-4D5F-9D19-A0B861D0E835@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <BF0EC181-629C-4D5F-9D19-A0B861D0E835@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/01/2023 17.47, Bernhard Beschow wrote:
> 
> 
> Am 2. Januar 2023 16:09:08 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> On 02/01/2023 14.36, Thomas Huth wrote:
>>> On 31/12/2022 00.45, Bernhard Beschow wrote:
>>>>
>>>> Am 29. Dezember 2022 10:58:48 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> [...]
>>>>> static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>>>> {
>>>>> @@ -922,14 +911,15 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>>>>>       rtc_set_date_from_host(isadev);
>>>>>
>>>>>       switch (s->lost_tick_policy) {
>>>>> -#ifdef TARGET_I386
>>>>> -    case LOST_TICK_POLICY_SLEW:
>>>>> -        s->coalesced_timer =
>>>>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>>>> -        break;
>>>>> -#endif
>>>>>       case LOST_TICK_POLICY_DISCARD:
>>>>>           break;
>>>>> +    case LOST_TICK_POLICY_SLEW:
>>>>> +        /* Slew tick policy is only available on x86 */
>>>>> +        if (arch_type == QEMU_ARCH_I386) {
>>>>
>>>> This reflects the intention much better than before, which is nice.
>>>>
>>>> How does `arch_type` play together with qemu-system-all? IIUC it should be possible to load all arch backends simultaneously while `arch_type` is an external symbol defined by each arch backend differently. So this seems to conflict.
>>>
>>> I assume that there still will be a main arch_type for the current selected machine? ... not sure how this will exactly work, though ...
>>>
>>>> Can we just add a property such as "slew-tick-policy-available" instead? It should default to false and all x86 machines would need to opt in explicitly.
>>>
>>> Sounds like a good idea, it's certainly better than checking arch_type here ... I'll give it a try, thanks!
>>
>> I've now had a look at this, and it's also getting ugly: Since the property has to be set before realize() is done, the setting of the property has to be added to the mc146818_rtc_init() function. Thus this function would need a new parameter - and it then needs to be changed all over the place, i.e. also for all the non-x86 machines, defeating the idea of a default value...
>>
>> Maybe it makes more sense to check for a TYPE_X86_MACHINE machine type instead?
> 
> Maybe you could base your patch on https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg03795.html ?

That would help, indeed. ... OK, then let's postpone my clean-up until your 
series has landed.

  Thomas


