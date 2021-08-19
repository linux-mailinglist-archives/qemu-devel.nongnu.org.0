Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2F3F1BF1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:52:07 +0200 (CEST)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjOo-0002fp-Fe
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjMq-0001S3-HL
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjMo-0006RY-Me
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LtbL35GFfw/jMOYi5MMA9wQzNSgU3PW/M24GFN6G0Y=;
 b=HvqaRXfofPotHsNAO/6rsnmfoeG0/5dEhd3uWSMZPQn3KB9HeKUZbMltZ2SuKe5pWGRna8
 jEItkh/YEU8L4eoUnvvro53FQERVEjKsTJ3oqXp5CLHdE9WbG2a2hHrODdWUnAYvoQFeHN
 oFDJAE0gSlS4C3dYjCUKsJrn+wXk05o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-tgJ7wOvyP0y1CwLL9UcVmg-1; Thu, 19 Aug 2021 10:49:58 -0400
X-MC-Unique: tgJ7wOvyP0y1CwLL9UcVmg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l6-20020a05600c4f0600b002e70c0dfaf1so647265wmq.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3LtbL35GFfw/jMOYi5MMA9wQzNSgU3PW/M24GFN6G0Y=;
 b=jsLbbY2IZBHgILHYOh1bo1huUo+uPybg3v6O4MYiP3St/pr9TuSLzKewd3awmXHKUE
 6JeaXySIf7q1oqGLCa6FNHHBs1SQrKUPTQxlm8955+4MZJsBDrogJXkFRr9d+O2raDOU
 xmAQpYnKFqM4i/Tgj1no8EvyOjrQ/ZG1tlfhMe4l164ZQseEBVenbzg069pStGDd9Qh0
 IwSaM6UAs58AZaNBuiE0iZGKKrN0uBjxzjIWngFdqNBFv0XezTAkfBjWdJwb8naeZeYm
 TUnvPubFrxakaXbzJyBaE4OTMeHo4wg0MZ5uLT3hJxg2RRJjGHTchoALTT/gxcRf0NUI
 Lsrw==
X-Gm-Message-State: AOAM532XMdO8JhGWmacGfVVOFjI7PhqbwrREMQ9FRaV/TJd9c5dCRMrD
 Sxn4iiCujnW2oHbRt7f16nDSdIDV/cLeZIz5RPyrtnDyMozKEfRkDr410Wg+6VSpVs9Drp5PszD
 BXhLW+KmFBYKRqYs=
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr4428532wrr.92.1629384596912; 
 Thu, 19 Aug 2021 07:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpEfiKD7CBiJvLyCmir5m/oUTo+6I7GHvIBOSirg51uoTMok9Bu7GqOk9lQYlaZ19VBEKMAw==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr4428511wrr.92.1629384596697; 
 Thu, 19 Aug 2021 07:49:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s10sm3689846wrv.54.2021.08.19.07.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:49:56 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
To: Ani Sinha <ani@anisinha.ca>
References: <20210812033405.362985-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
 <CAFEAcA8Fu+mkzFi9JdTtbqMcnnV74Swk04xx2a1G4L_oATY2eQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2108191849260.417749@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16b11751-7ab2-8d68-0bf2-5453bc2938fc@redhat.com>
Date: Thu, 19 Aug 2021 16:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108191905100.418214@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Shameer Kolothum.

On 8/19/21 3:36 PM, Ani Sinha wrote:
> On Thu, 19 Aug 2021, Ani Sinha wrote:
>> On Thu, 19 Aug 2021, Peter Maydell wrote:
>>> On Tue, 17 Aug 2021 at 05:45, Ani Sinha <ani@anisinha.ca> wrote:

>>> Is it intended that ACPI_HW_REDUCED must always imply
>>> ACPI_MEMORY_HOTPLUG, or is it just a coincidence that the
>>> virt board happens to want both, and so we select both ?

The ACPI dependency was missing (see commit 36b79e3219d,
"hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)",
now we don't need it explicitly.

>> From a purely code inspection point of view, I noticed that
>> generic_event_device.c depends on CONFIG_ACPI_HW_REDUCED. The GED does use
>> memory hotplug apis - for example acpi_ged_device_plug_cb() uses
>> acpi_memory_plug_cb() etc.
>>
>> Hence, as it stands today, CONFIG_ACPI_HW_REDUCED will need to select ACPI
>> memory hotplug. Unless we remove the GED device's dependence on
>> ACPI_HW_REDUCED that is. I cannot comment whether that would be wise or if
>> we should reorg the code in some other way.
> 
> The other question we should ask is whether arm platform requires
> ACPI_MEMORY_HOTPLUG independent of ACPI_HW_REDUCED/GED device? If that is
> the case, then maybe we should keep that config option as is.
> Maybe @qemu-arm can answer that?

Or git-log:

commit cff51ac978c4fa0b3d0de0fd62d772d9003f123e
Author: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Date:   Wed Sep 18 14:06:27 2019 +0100

    hw/arm/virt: Enable device memory cold/hot plug with ACPI boot

    This initializes the GED device with base memory and irq, configures
    ged memory hotplug event and builds the corresponding aml code. With
    this, both hot and cold plug of device memory is enabled now for
    Guest with ACPI boot. Memory cold plug support with Guest DT boot is
    not yet supported.

>>>> On Thu, 12 Aug 2021, Ani Sinha wrote:
>>>>

Please prepend here 'Since commit 36b79e3219d ("hw/acpi/Kconfig: Add
missing Kconfig dependencies"),'

With it:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>>>>> ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
>>>>> ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
>>>>> explicitly. This is a minor cleanup.
>>>>>
>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>> ---
>>>>>  hw/arm/Kconfig | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>>>> index 4ba0aca067..38cf9f44e2 100644
>>>>> --- a/hw/arm/Kconfig
>>>>> +++ b/hw/arm/Kconfig
>>>>> @@ -25,7 +25,6 @@ config ARM_VIRT
>>>>>      select ACPI_PCI
>>>>>      select MEM_DEVICE
>>>>>      select DIMM
>>>>> -    select ACPI_MEMORY_HOTPLUG
>>>>>      select ACPI_HW_REDUCED
>>>>>      select ACPI_NVDIMM
>>>>>      select ACPI_APEI
>>>>> --
>>>>> 2.25.1


