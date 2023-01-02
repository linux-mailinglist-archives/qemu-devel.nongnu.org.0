Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A848065B4DA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 17:10:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCNNG-00065d-8H; Mon, 02 Jan 2023 11:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCNNE-00065U-Ed
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCNNC-0006OL-LD
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672675753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZFxil48QhqlLga0akO4fpQWxozHzTfNnE2SlYdFtMs=;
 b=KAvBJRBYn2Va9dNAfDKrzBRQPrUe06KJm9YIlirnEsg6S6x04tJqPXyAPddqTzGtgVhD6j
 uYu2RPmjTx6S1wVSJ6lF2xhd8b/tijE+WQ2pDVj+9gLS+dzo/wxJbqBhELo/H4x3WuB/5o
 KKgiFcswH3kC+RzsBAnouzcO7bjaryo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-aq7I02gaNNmfLuBPlwa_ZA-1; Mon, 02 Jan 2023 11:09:12 -0500
X-MC-Unique: aq7I02gaNNmfLuBPlwa_ZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n8-20020a05600c294800b003d1cc68889dso6465638wmd.7
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 08:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZFxil48QhqlLga0akO4fpQWxozHzTfNnE2SlYdFtMs=;
 b=XjY7ifp6RilalbkmlH+9hmsdHv1qBYx3/a7F/RJT3hSh4aPCh48l5rJmFm70SswHuT
 DWbDOWo1ATrTsDRfBTzIJnb/rO19KMUbzzX/dtMf8TdhgtQqWPlhZ3hiXowMLqKladPq
 vh0RpBejkS66fh/PgXwUZPYc9AjJuSdL6Va6vAshUmIQza40V9rf4cJjIkL37Z5GVDF5
 03B2aw+4yxnzBs5PVCxrUOa1girr4Z6XYGSOTFzQMwOqaRfyga7HGu9eX5iHcWHPllqi
 hxVb6FPAn5aW0rgaxf9IbzhZzfF0suIlHkjgtjCOOTZBh0ht6nOqk5Dc5a0WRIAGCpLW
 j2nQ==
X-Gm-Message-State: AFqh2kqlzEkGEkA2ljGLkKYdXgnY+9VrXWBTahsRCoF+fkjAUVPMiPYp
 b6LkwHf4KrtRkhPbsrVINSWDTCFAS+Fjxq7XDdeNhq2wyRa6S++EZn6io9WqWGNcD+xzNLudsep
 fqeEVGaDdyha5oI0=
X-Received: by 2002:a05:6000:1f0e:b0:27a:3822:806e with SMTP id
 bv14-20020a0560001f0e00b0027a3822806emr19226638wrb.31.1672675750991; 
 Mon, 02 Jan 2023 08:09:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtE68jiXKhZkEJeQnDPlXQb9MWD9b1b0TKoXOsTo83c2wmXLGiVUSg/huooCEnHsL5bbTwtdg==
X-Received: by 2002:a05:6000:1f0e:b0:27a:3822:806e with SMTP id
 bv14-20020a0560001f0e00b0027a3822806emr19226627wrb.31.1672675750798; 
 Mon, 02 Jan 2023 08:09:10 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-126.web.vodafone.de.
 [109.43.176.126]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d56cb000000b0028d66c43101sm11440566wrw.29.2023.01.02.08.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 08:09:10 -0800 (PST)
Message-ID: <1328eea1-437d-6c43-a542-9e1a4d1d751e@redhat.com>
Date: Mon, 2 Jan 2023 17:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221229105848.147509-1-thuth@redhat.com>
 <52276B51-B29A-47BD-B5A6-EA2E7A3E69CC@gmail.com>
 <aa12364c-ff9b-3252-1fa0-7d72876b0796@redhat.com>
Subject: Re: [PATCH v4] hw/rtc/mc146818rtc: Make this rtc device target
 independent
In-Reply-To: <aa12364c-ff9b-3252-1fa0-7d72876b0796@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02/01/2023 14.36, Thomas Huth wrote:
> On 31/12/2022 00.45, Bernhard Beschow wrote:
>>
>> Am 29. Dezember 2022 10:58:48 UTC schrieb Thomas Huth <thuth@redhat.com>:
[...]
>>> static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>> {
>>> @@ -922,14 +911,15 @@ static void rtc_realizefn(DeviceState *dev, Error 
>>> **errp)
>>>      rtc_set_date_from_host(isadev);
>>>
>>>      switch (s->lost_tick_policy) {
>>> -#ifdef TARGET_I386
>>> -    case LOST_TICK_POLICY_SLEW:
>>> -        s->coalesced_timer =
>>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>> -        break;
>>> -#endif
>>>      case LOST_TICK_POLICY_DISCARD:
>>>          break;
>>> +    case LOST_TICK_POLICY_SLEW:
>>> +        /* Slew tick policy is only available on x86 */
>>> +        if (arch_type == QEMU_ARCH_I386) {
>>
>> This reflects the intention much better than before, which is nice.
>>
>> How does `arch_type` play together with qemu-system-all? IIUC it should be 
>> possible to load all arch backends simultaneously while `arch_type` is an 
>> external symbol defined by each arch backend differently. So this seems to 
>> conflict.
> 
> I assume that there still will be a main arch_type for the current selected 
> machine? ... not sure how this will exactly work, though ...
> 
>> Can we just add a property such as "slew-tick-policy-available" instead? 
>> It should default to false and all x86 machines would need to opt in 
>> explicitly.
> 
> Sounds like a good idea, it's certainly better than checking arch_type here 
> ... I'll give it a try, thanks!

I've now had a look at this, and it's also getting ugly: Since the property 
has to be set before realize() is done, the setting of the property has to 
be added to the mc146818_rtc_init() function. Thus this function would need 
a new parameter - and it then needs to be changed all over the place, i.e. 
also for all the non-x86 machines, defeating the idea of a default value...

Maybe it makes more sense to check for a TYPE_X86_MACHINE machine type instead?

  Thomas


