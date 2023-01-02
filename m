Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A191265B2BA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 14:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCKzo-0008DG-Tm; Mon, 02 Jan 2023 08:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCKzm-0008Ac-Dh
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:36:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCKzk-00061N-Gy
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672666611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+Ypv0rrqEtut9XyomvsGZy6mDum0UZb1UIaZlMro60=;
 b=VoZoW8/aKx0ONjFGnwx+U57yNWrhTK/gJhuMcj3Wo7BHuPQdzD1lqpSNAt8mGHWYORzaBi
 VsE/ThnBdEqkKwbJQX7XEQJLWzIJ0dWylD7LVyuZ3qQuxMT5ebjW7vokOyRvAIQxLC6awD
 1BwEUM2SiTyswjrlSyYd/959vcgnQ5c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-JYJoPG_RMj-ur0CVGp9pRw-1; Mon, 02 Jan 2023 08:36:50 -0500
X-MC-Unique: JYJoPG_RMj-ur0CVGp9pRw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so18490734wmq.5
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 05:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m+Ypv0rrqEtut9XyomvsGZy6mDum0UZb1UIaZlMro60=;
 b=mAtoMTRfJb6Zuc50Bl58QM8OwFDcg1gPhEVuAqjMTaOiD7mNnUZSVf16rUoegIhQS2
 rQnEWPPbq0Y6g+LLAShqgD7Y+6nDULzKT+de7HpcqhZPFWPnQ1vfHYpB1UfO9qL2U7tx
 TQjVzxI4DzLeBfbHBcs5JrP1AjSwRu/AFkXfsVhlFcLo+ElHxWAJU/rPBkFncgJIlQj8
 VBEtgYWP0la79opIH80vtfOzSPKzZcSUntgzCU/eg0hVMcl/aN1yCaJX77pbc6h+zDxv
 hshQRBEFffZr8XJjgSZOYE1zOtZX8kRL81xqBrd4IG/HAzeMArN9O/9wpSPAgFQwIGPc
 sPYw==
X-Gm-Message-State: AFqh2ko4BKqkr+we3dV/akHqXLt2FAdAR9wtIOkhvc8/w+aJ6h2DDvUh
 ujYS8Xw7Bh3VYvW4BidGtwZBGRKJ9+nINXwrrDjwwCnCBwSAMKIaRM6s0yPWruILyrGQ8M00OO1
 Y/+tV8jl28Uw0Wck=
X-Received: by 2002:a5d:668f:0:b0:24f:dbcd:7726 with SMTP id
 l15-20020a5d668f000000b0024fdbcd7726mr24398832wru.5.1672666608988; 
 Mon, 02 Jan 2023 05:36:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsW02NNbFcypjPoCF+S8/QZIvCT7tsvnF8ZLGMY248vuOjp8cfpE+Kpx71OA46fvMTfFJGsNw==
X-Received: by 2002:a5d:668f:0:b0:24f:dbcd:7726 with SMTP id
 l15-20020a5d668f000000b0024fdbcd7726mr24398820wru.5.1672666608728; 
 Mon, 02 Jan 2023 05:36:48 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-126.web.vodafone.de.
 [109.43.176.126]) by smtp.gmail.com with ESMTPSA id
 bo19-20020a056000069300b00294176c2c01sm6758563wrb.86.2023.01.02.05.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 05:36:48 -0800 (PST)
Message-ID: <aa12364c-ff9b-3252-1fa0-7d72876b0796@redhat.com>
Date: Mon, 2 Jan 2023 14:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221229105848.147509-1-thuth@redhat.com>
 <52276B51-B29A-47BD-B5A6-EA2E7A3E69CC@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4] hw/rtc/mc146818rtc: Make this rtc device target
 independent
In-Reply-To: <52276B51-B29A-47BD-B5A6-EA2E7A3E69CC@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 31/12/2022 00.45, Bernhard Beschow wrote:
> 
> 
> Am 29. Dezember 2022 10:58:48 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> The only reason for this code being target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
>> simple, we can easily move them into a new, separate file (apic_irqcount.c)
>> which will always be compiled and linked if either APIC or the mc146818 device
>> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
>> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
>> that the code only gets compiled once for all targets.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> v4: Check for QEMU_ARCH_I386 instead of looking for an APIC
> 
> Can we find a more appropriate name for the helpers than "apic" then? If the slew tick policy is a workaround for (x86-) KVM I propose to do s/apic/kvm/ while still compiling for every target.

Yes, since the IRQ-counting is also used by the old i8259 PIC, it likely 
makes sense to rename the functions.

>> static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>> {
>> @@ -922,14 +911,15 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>>      rtc_set_date_from_host(isadev);
>>
>>      switch (s->lost_tick_policy) {
>> -#ifdef TARGET_I386
>> -    case LOST_TICK_POLICY_SLEW:
>> -        s->coalesced_timer =
>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>> -        break;
>> -#endif
>>      case LOST_TICK_POLICY_DISCARD:
>>          break;
>> +    case LOST_TICK_POLICY_SLEW:
>> +        /* Slew tick policy is only available on x86 */
>> +        if (arch_type == QEMU_ARCH_I386) {
> 
> This reflects the intention much better than before, which is nice.
> 
> How does `arch_type` play together with qemu-system-all? IIUC it should be possible to load all arch backends simultaneously while `arch_type` is an external symbol defined by each arch backend differently. So this seems to conflict.

I assume that there still will be a main arch_type for the current selected 
machine? ... not sure how this will exactly work, though ...

> Can we just add a property such as "slew-tick-policy-available" instead? It should default to false and all x86 machines would need to opt in explicitly.

Sounds like a good idea, it's certainly better than checking arch_type here 
... I'll give it a try, thanks!

  Thomas


