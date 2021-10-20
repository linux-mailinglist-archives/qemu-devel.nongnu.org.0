Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5D43478C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:02:50 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7Un-00067M-Sh
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1md7RF-0004Wq-Gn
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1md7R8-0004Dd-72
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634720341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhJyJIWaQ5N/hLikD4R2GLOmeauEn0TqdZoqMYajkzU=;
 b=E9jJFs4vTPa6x6cONZGeRapyfZfHcq7akaqxDJxA+ZUpL5PuHlBFxiBAYKjPtFA5BO53CU
 YJ+pB2dH2aokI3bkxLeNk6q0iliVYRElgVSD4ZK4OF4Qzvbr/0droJQYVoWWvPZsP49A0y
 FEqeO92/vgOqboQBDB8Yw98zacwKYG8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-gmjwS2BSOeaDvkvB3SLwSg-1; Wed, 20 Oct 2021 04:58:57 -0400
X-MC-Unique: gmjwS2BSOeaDvkvB3SLwSg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so2766715wmg.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhJyJIWaQ5N/hLikD4R2GLOmeauEn0TqdZoqMYajkzU=;
 b=uUS2SG3Rl8U1pdTvueAZzdX7/jOff5vJf5ANiyu67/R53fekJqjZBfGCyMzYYVCalJ
 BaOAMPI49IH1GK+TKE+dXkdioM6Z+y7RsZ8X9oIfydkM12bMhQQ9sE82VAiBJg1C/EV7
 zbvGdTokB5A0qXh1Bbts1sptUmwoAZSw830XNAcCEdBBfsG0oyD6GSdLn51Dhw9qJmcd
 95GFZBt0oQJ7Okdf0U+uxTq8fdzmARgSAXjn2fHtfHomIW1MzIkYwJzkvtIBBHX6LYYs
 LC8Wa9aFKQXpr7Gp21KS/FMdCkRQxlBt6B/Hyz+rlHT7Z1xoAxWmr5gbUuvFyaE42fSe
 jzxg==
X-Gm-Message-State: AOAM530QcG5IqxSts7EWwWUuW8LEgdvjufSs/vCGDXHPeFbme2sCttqh
 EAyOhQUdrUrxkUdRjHNHaC56JCSw4b9R3ZDXEv6bU64StBMYyalpeaS7r/7Ye4m00KMcrHTSPAQ
 UgTWTMhuyvBppbcY=
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr10081466wma.151.1634720336777; 
 Wed, 20 Oct 2021 01:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXSAebT3PHLXI9cTZm8PY+PFB1BFzrkHPlEoTjzfamwgykKrYwdQmJmhExcKIGdUVfaJ1/SA==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr10081444wma.151.1634720336547; 
 Wed, 20 Oct 2021 01:58:56 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id r128sm4609301wma.44.2021.10.20.01.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 01:58:56 -0700 (PDT)
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
 <20211018173052-mutt-send-email-mst@kernel.org>
 <20211019114825.1464da19@redhat.com>
 <20211019061656-mutt-send-email-mst@kernel.org>
 <20211019133624.5cd5ae3d@redhat.com>
 <20211019074422-mutt-send-email-mst@kernel.org>
 <20211020101607.5181e69d@redhat.com>
 <20211020041734-mutt-send-email-mst@kernel.org>
 <20211020105348.7ef7cdd5@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8b2dbf60-0e52-1a06-ff70-b6b253413aad@redhat.com>
Date: Wed, 20 Oct 2021 10:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020105348.7ef7cdd5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 10.53, Igor Mammedov wrote:
> On Wed, 20 Oct 2021 04:18:07 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Wed, Oct 20, 2021 at 10:16:07AM +0200, Igor Mammedov wrote:
>>> On Tue, 19 Oct 2021 07:44:38 -0400
>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>    
>>>> On Tue, Oct 19, 2021 at 01:36:24PM +0200, Igor Mammedov wrote:
>>>>> On Tue, 19 Oct 2021 06:23:40 -0400
>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>      
>>>>>> On Tue, Oct 19, 2021 at 11:48:25AM +0200, Igor Mammedov wrote:
>>>>>>> On Mon, 18 Oct 2021 17:31:33 -0400
>>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>>>        
>>>>>>>> On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:
>>>>>>>>> Set -smp 1,maxcpus=288 to test for ACPI code that
>>>>>>>>> deal with CPUs with large APIC ID (>255).
>>>>>>>>>
>>>>>>>>> PS:
>>>>>>>>> Test requires KVM and in-kernel irqchip support,
>>>>>>>>> so skip test if KVM is not available.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>>>>>>>> ---
>>>>>>>>> v3:
>>>>>>>>>    - add dedicated test instead of abusing 'numamem' one
>>>>>>>>>    - add 'kvm' prefix to the test name
>>>>>>>>>        ("Michael S. Tsirkin" <mst@redhat.com>)
>>>>>>>>> v2:
>>>>>>>>>    - switch to qtest_has_accel() API
>>>>>>>>>
>>>>>>>>> CC: thuth@redhat.com
>>>>>>>>> CC: lvivier@redhat.com
>>>>>>>>> ---
>>>>>>>>>   tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
>>>>>>>>>   1 file changed, 17 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>>>>>>>> index 51d3a4e239..1f6779da87 100644
>>>>>>>>> --- a/tests/qtest/bios-tables-test.c
>>>>>>>>> +++ b/tests/qtest/bios-tables-test.c
>>>>>>>>> @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
>>>>>>>>>       free_test_data(&data);
>>>>>>>>>   }
>>>>>>>>>   
>>>>>>>>> +static void test_acpi_q35_kvm_xapic(void)
>>>>>>>>> +{
>>>>>>>>> +    test_data data;
>>>>>>>>> +
>>>>>>>>> +    memset(&data, 0, sizeof(data));
>>>>>>>>> +    data.machine = MACHINE_Q35;
>>>>>>>>> +    data.variant = ".xapic";
>>>>>>>>> +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
>>>>>>>>> +                  " -numa node -numa node,memdev=ram0"
>>>>>>>>> +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
>>>>>>>>> +    free_test_data(&data);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>   static void test_acpi_q35_tcg_nosmm(void)
>>>>>>>>>   {
>>>>>>>>>       test_data data;
>>>>>>>>
>>>>>>>>
>>>>>>>> This causes an annoying message each time I run it:
>>>>>>>>
>>>>>>>> qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)
>>>>>>>>
>>>>>>>> what gives?
>>>>>>>
>>>>>>> it depends on kernel, see kvm_recommended_vcpus().
>>>>>>>
>>>>>>> We probably should bump it on upstream kernel side
>>>>>>> (it's much more than that in RHEL8).
>>>>>>>
>>>>>>> Is there anything that prevents bumping upstream kernel limits?
>>>>>>
>>>>>> what should we do with the annoying warning though?
>>>>>
>>>>> I'd leave it alone.
>>>>> What do you suggest?
>>>>>       
>>>>
>>>> reduce the value so a typical system does not trigger it?
>>>
>>> it won't work, test needs as minimum 255 vcpus to trigger X2APIC logic
>>> and 288 value additionally tests max limits
>>
>> Add a flag to disable the warning while running this specific test?
> 
> if it were qtest accel, it would be trivial but
> I'm not aware of something similar for tcg/kvm mode.
> Do you suggest to add to QEMU a CLI option for that?

I think you can still use qtest_enabled(), even if -accel kvm has been 
specified on top?

  Thomas


