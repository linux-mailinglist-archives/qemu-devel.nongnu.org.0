Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161464A213
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:49:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jAm-0002ue-M9; Mon, 12 Dec 2022 08:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4jAY-0002mD-Hy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4jAW-0001mL-JC
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670852910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1aAgUUt9NQz5ix9XMQ3xwMR9B1WJdeUG1VIrP5CSnw=;
 b=WOtVWYz5IjnA301VMhdwYzXvzmZcd5gOL+jRR+5w1okbBCxsbCiRXmMQleecOb5ij2GRmx
 VBQxTJylyRHw+4MWw+OC3GmfpYuLSshwUwxKO4mHGZIK2zMQaopEZbUkguTyaKVMvQnLR0
 qrl/nqNSdUcPkMhP/5K7mWw6X37SELQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-xbHjHMHEMZiVyfi1gcQ9Aw-1; Mon, 12 Dec 2022 08:48:29 -0500
X-MC-Unique: xbHjHMHEMZiVyfi1gcQ9Aw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i9-20020a1c3b09000000b003d21fa95c38so1392064wma.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g1aAgUUt9NQz5ix9XMQ3xwMR9B1WJdeUG1VIrP5CSnw=;
 b=g4oU5axsGKOK5oKe6MQcXhr583ywVXvPDw2bXLPJSRDxSwua/oGGfwV0sGUHsg6dOA
 laLNq7lnktS/YmuByDWfsTGDSe8spRp9F4P8HaWkcyTdecmMRdiUqmkpqmypK/udmKb+
 gzDuQFbrda/KgD5TtkU6lTeUHm1HaCsNrAdarTOHJReCacn5K3uBsrmXKwPU3nHnafU3
 mkO0lM1lLL5drIg2TAohT9Wr3Lza6x7vgniIEqQU6iX0PWmTJH+UmdHtWJStPCglBHLM
 0SjutnPFjYTvVRaoVOwlEsUd/H5y2RaFeNAiYED1DyuCS7f0/SlU1fDYVHYzIoCsCuPi
 iNIg==
X-Gm-Message-State: ANoB5pl89PEz220abk9XFIukQ4As2jq8cDIoXn78jX+xQlkUqtTzD+Od
 y742hK/h+s0T7i2HHemBI0+z4jtT5mFfhzV0au5cYS9U2vWCOY/oBlFGp5vwm5vRsdKey8Kt5zA
 iiknoTfHrsPeWAqQ=
X-Received: by 2002:a05:600c:3c92:b0:3cf:a851:d2f2 with SMTP id
 bg18-20020a05600c3c9200b003cfa851d2f2mr12573736wmb.21.1670852908211; 
 Mon, 12 Dec 2022 05:48:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5LiLRaTLPKbjau2ahOJsSuLuJAyHFbIsSifRwtpE4hHVUWj1NaXWVewqHeI5dyyUICJAfIEA==
X-Received: by 2002:a05:600c:3c92:b0:3cf:a851:d2f2 with SMTP id
 bg18-20020a05600c3c9200b003cfa851d2f2mr12573721wmb.21.1670852908007; 
 Mon, 12 Dec 2022 05:48:28 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b003d1cf67460esm10377756wmo.40.2022.12.12.05.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:48:27 -0800 (PST)
Message-ID: <dd94d639-ff48-554a-c462-ae7fe2399d4e@redhat.com>
Date: Mon, 12 Dec 2022 14:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221212075600.17408-1-thuth@redhat.com>
 <12d9fcbf-e00f-1154-63e0-36420e89f619@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <12d9fcbf-e00f-1154-63e0-36420e89f619@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/12/2022 14.39, Mark Cave-Ayland wrote:
> On 12/12/2022 07:56, Thomas Huth wrote:
> 
>> The only reason for this code being target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
>> simple, we can easily move them into a new, separate file (apic_irqcount.c)
>> which will always be compiled and linked if either APIC or the mc146818 
>> device
>> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
>> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
>> that the code only gets compiled once for all targets.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v3: Move TYPE_APIC_COMMON from apic_internal.h to apic.h and use it
>>
>>   include/hw/i386/apic.h          |  2 ++
>>   include/hw/i386/apic_internal.h |  2 --
>>   include/hw/rtc/mc146818rtc.h    |  1 +
>>   hw/intc/apic_common.c           | 27 -----------------
>>   hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>>   hw/rtc/mc146818rtc.c            | 25 +++++-----------
>>   hw/intc/meson.build             |  6 +++-
>>   hw/rtc/meson.build              |  3 +-
>>   8 files changed, 69 insertions(+), 50 deletions(-)
>>   create mode 100644 hw/intc/apic_irqcount.c
>>
>> diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
>> index da1d2fe155..24069fb961 100644
>> --- a/include/hw/i386/apic.h
>> +++ b/include/hw/i386/apic.h
>> @@ -1,6 +1,7 @@
>>   #ifndef APIC_H
>>   #define APIC_H
>> +#define TYPE_APIC_COMMON "apic-common"
> 
> Ah sorry, I should have been more specific here: what I was suggesting was 
> to move the entire QOM type information into apic.h as per the normal 
> convention, as opposed to just the #define. At first glance that would 
> involve lines 128-190 in apic_internal.h which would also bring in 
> APICCommonClass and APICCommonState - possibly the change may warrant its 
> own commit.

At least APICCommonState is target specific since it uses "X86CPU" ... so 
moving that to apic.h would be very counterproductive here.

Anyway, moving those structs is certainly way more than what is required for 
this patch, so if we decide to move anything else related to the APIC, it 
should be done in a separate patch later.

  Thomas


