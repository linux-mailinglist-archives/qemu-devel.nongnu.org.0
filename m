Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36466455EE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 10:00:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2qH7-0005tu-DQ; Wed, 07 Dec 2022 03:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2qGk-0005sW-3l
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:59:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2qGi-0005WT-94
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670403541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o84J6eGtB/V9WTocAXuKufY84EMTJjp2VtxLm4K4qKQ=;
 b=F/lAInLafSNbGhPS5xoZb5Ndr6shj8EvDepBpa0uhZItFNbfcBCf92OR31IrXkoJxL2Msx
 6wiL8uXlj4XxRgaUXo4KWjxodCJnJ/MWg7EkqCabMJ4pVt83kXM0Tf5aY1ipYmWKpLAhm3
 Vpd9brVZztmfpug2OU9Jo3kfUGnmQbk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-UG7AOLZiNPKOP9tMubxiKg-1; Wed, 07 Dec 2022 03:58:59 -0500
X-MC-Unique: UG7AOLZiNPKOP9tMubxiKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso510877wms.1
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 00:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o84J6eGtB/V9WTocAXuKufY84EMTJjp2VtxLm4K4qKQ=;
 b=DQeSzKvhuRO29i/cpi0cfIesfWM679JnoRX01XdJfYnswPsZGgfE4diErLW3P4x6p4
 h+SR2JkH3mlsqv33oJ5KT6UKHWzLt9TgXbLlE12lJ+KzIPbgvKEFucOVHE/bHPl+HCgN
 8SFF8mNxNBEBCTIJuN5SGhE3Co+D4HxzPFyjvRuFowYymZ5fqWQq4CODX3h0SmuDnnwK
 NXnnZcUmRdDxV5qON67kSOTxebE/JvLq8R0zRWqlZO3zP+lVfamGzItXRg0ds3qKdzrb
 PloaOvkDvGpiQQAkMt3fulCC0vv1OvEEooYl0Zt/FUBUWYplv2Mdav3JWCrQvcGR6UOd
 5Sfw==
X-Gm-Message-State: ANoB5pkiHTyOYBr4gY7HJlh5wy3AX5l94XkBnuvb1oJNaM1uiuYkTtGf
 o1xcZ3EEqZB8XxKnH+Bo8+7DV7tK4m5y0csFkRg1t8SR58VKIZonN0BDpPjyxpdJPSnaatdHadJ
 jiDppLKRkwpxuLJE=
X-Received: by 2002:a05:600c:34c5:b0:3d0:7416:a84c with SMTP id
 d5-20020a05600c34c500b003d07416a84cmr21655116wmq.145.1670403538654; 
 Wed, 07 Dec 2022 00:58:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62wkiCrXv7VfGjidqxxny2u2gsWHc9tOWcYR5wbPt71Mbl/nLzVBs430YMYBJaaxk0503S/w==
X-Received: by 2002:a05:600c:34c5:b0:3d0:7416:a84c with SMTP id
 d5-20020a05600c34c500b003d07416a84cmr21655111wmq.145.1670403538451; 
 Wed, 07 Dec 2022 00:58:58 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-155.web.vodafone.de.
 [109.43.178.155]) by smtp.gmail.com with ESMTPSA id
 z10-20020adfec8a000000b00236576c8eddsm18884473wrn.12.2022.12.07.00.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 00:58:57 -0800 (PST)
Message-ID: <c5744df8-b4c3-3878-15f2-98fe24ac8554@redhat.com>
Date: Wed, 7 Dec 2022 09:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221206200641.339116-1-thuth@redhat.com>
 <1ec2cb6a-b6de-7254-d37f-a48c993698eb@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1ec2cb6a-b6de-7254-d37f-a48c993698eb@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/12/2022 00.12, BALATON Zoltan wrote:
> On Tue, 6 Dec 2022, Thomas Huth wrote:
>> The only code that is really, really target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>> function as parameter to mc146818_rtc_init(), we can make the RTC completely
>> target-independent.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
...
>> @@ -124,9 +118,8 @@ void qmp_rtc_reset_reinjection(Error **errp)
>>
>> static bool rtc_policy_slew_deliver_irq(RTCState *s)
>> {
>> -    apic_reset_irq_delivered();
>> -    qemu_irq_raise(s->irq);
>> -    return apic_get_irq_delivered();
>> +    assert(s->policy_slew_deliver_irq);
> 
> Is this assert necessary here? Since it seems that creating the timer that 
> would call this is testing for s->policy_slew_deliver_irq being non-NULL 
> there should be no way to call this without policy_slew_deliver_irq set.

There was an assert(0) in the original code on non-x86 targets, too, see 
below. I would like to keep that logic here.

> If 
> you drop the assert then this function also become redundant and 
> s->policy_slew_deliver_irq() can be used directly instead simplifying this a 
> bit more.

I'd agree, but I really would like to keep the assert(). (additionally, the 
patch stays smaller this way)

>> +    return s->policy_slew_deliver_irq(s);
>> }
>>
>> static void rtc_coalesced_timer(void *opaque)
>> @@ -145,13 +138,6 @@ static void rtc_coalesced_timer(void *opaque)
>>
>>     rtc_coalesced_timer_update(s);
>> }
>> -#else
>> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
>> -{
>> -    assert(0);

This ----^ is the assert() I was talking about.

>> -    return false;
>> -}
>> -#endif

  Thomas


