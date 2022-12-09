Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4C648019
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ZfE-0001er-IJ; Fri, 09 Dec 2022 04:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3ZfC-0001ej-Pv
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3ZfA-00018w-MO
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670578043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6lGpMNuuLhhdiMhm1oCJCziYvRl31HyVNtMQ1A/X80=;
 b=eJkCcjNtgtkH08pdgGcxAxMHAebCJEVWrPQ5fp09jz88PzAjAL8JCRr38SX+ZP9saAl0t5
 VTDu0dON2jAEX5dH6o1mEBn6ge0i//MJGOXSk8vYZp0nQhmPdjC8rg7tbr274I8urXvfhf
 Dj1di4X9cUKPghUtYLbjARqBdRoP1WI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-sQxZCCQ4OLGI3wZUJSQ4nA-1; Fri, 09 Dec 2022 04:27:21 -0500
X-MC-Unique: sQxZCCQ4OLGI3wZUJSQ4nA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h81-20020a1c2154000000b003d1c8e519fbso3695092wmh.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B6lGpMNuuLhhdiMhm1oCJCziYvRl31HyVNtMQ1A/X80=;
 b=4EFsKl41lUFnavP7vB3sgUsvflAtA2Vmr9CkNfjkRmFRkvzHlPyT0wzmYZmeKiJpx0
 rmhftzugXnKGeK3WUaLS+XwwIbojPnPePXRzqUBvBu7qzOOSuTs7KtYUWukHP76gDsoQ
 XR+v6I0b/bBQ7hHSbetwxQFEW5722tmJLWbQtsq4mrtK4lMSWxnSn/VBfeImnZgtAk5m
 VSam1ZYBzYuuiJq+kWplbOS8ZgWXd2aIPPqZY2Bdnc9qf+cjan0zX86JARRgOJuFHvlA
 4xzfIUUxTikRjPYYt6pA9kFOUI3LXvD1kANgfey3pER2IN14XplUTCH6vWOiYPt0d0xR
 hS+g==
X-Gm-Message-State: ANoB5pksO/Vu5pZOK/k8I/3nKfJriTTYE2DYPTkM2jubRdUuf0spLRiR
 4O441hfBdbb+9UltH4XVQbxF4ZO2G6QTLD5uGW8/1iUAn5ZduxtNfWGWGs0HLoTgqQo5i0Xrcxx
 sxQd2bFFIrilBJT8=
X-Received: by 2002:adf:f643:0:b0:242:2ae6:7c27 with SMTP id
 x3-20020adff643000000b002422ae67c27mr2999352wrp.19.1670578040677; 
 Fri, 09 Dec 2022 01:27:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4sWufa4SVXa+EkI45uavR3Qj6ryCIxoQPHlW9ar12vUOAvEftEBSIU5e3G8FRFuQVs4RdB1Q==
X-Received: by 2002:adf:f643:0:b0:242:2ae6:7c27 with SMTP id
 x3-20020adff643000000b002422ae67c27mr2999346wrp.19.1670578040447; 
 Fri, 09 Dec 2022 01:27:20 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-15.web.vodafone.de.
 [109.43.177.15]) by smtp.gmail.com with ESMTPSA id
 bj5-20020a0560001e0500b002362f6fcaf5sm915978wrb.48.2022.12.09.01.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 01:27:19 -0800 (PST)
Message-ID: <255e2eab-fa65-ce5f-35fa-0787eb1760d3@redhat.com>
Date: Fri, 9 Dec 2022 10:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221206200641.339116-1-thuth@redhat.com>
 <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
In-Reply-To: <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/12/2022 16.29, Mark Cave-Ayland wrote:
> On 06/12/2022 20:06, Thomas Huth wrote:
> 
>> The only code that is really, really target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>> function as parameter to mc146818_rtc_init(), we can make the RTC completely
>> target-independent.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/hw/rtc/mc146818rtc.h |  7 +++++--
>>   hw/alpha/dp264.c             |  2 +-
>>   hw/hppa/machine.c            |  2 +-
>>   hw/i386/microvm.c            |  3 ++-
>>   hw/i386/pc.c                 | 10 +++++++++-
>>   hw/mips/jazz.c               |  2 +-
>>   hw/ppc/pnv.c                 |  2 +-
>>   hw/rtc/mc146818rtc.c         | 34 +++++++++++-----------------------
>>   hw/rtc/meson.build           |  3 +--
>>   9 files changed, 32 insertions(+), 33 deletions(-)
>>
>> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
>> index 1db0fcee92..c687953cc4 100644
>> --- a/include/hw/rtc/mc146818rtc.h
>> +++ b/include/hw/rtc/mc146818rtc.h
>> @@ -46,14 +46,17 @@ struct RTCState {
>>       Notifier clock_reset_notifier;
>>       LostTickPolicy lost_tick_policy;
>>       Notifier suspend_notifier;
>> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>>       QLIST_ENTRY(RTCState) link;
>>   };
[...]
> These days we really should try and avoid setting function pointers outside 
> of _init() and class_init() where possible. If I were looking to model this 
> today I'd probably try an approach like this:
> 
> - Move apic_irq_delivered into APICCommonState
> 
> - Define apic_reset_irq_delivered() and apic_get_irq_delivered() as function 
> pointers in APICCommonState and assign them to the current implementations 
> in apic_common_initfn() adding an APICCommonState parameter as required
> 
> - Grab a reference to APICCommonState in mc146818rtc.c's rtc_realizefn() 
> using either an object property link or object_resolve_path_type("", 
> TYPE_APIC_COMMON, NULL)
> 
> - Use "if (s->apic) { .. }" or similar in mc146818rtc.c to guard calling the 
> apic_*() functions

That also doesn't really fly since the apic_* functions are only available 
on x86 (and maybe arm), but not in the other targets, so this won't link 
there. Ok, we could provide stubs for the other targets, but that's IMHO 
almost as ugly as having a function pointer in RTCState ... ? I can give it 
a try with using a stub, but not sure whether it will really look much better...

  Thomas



