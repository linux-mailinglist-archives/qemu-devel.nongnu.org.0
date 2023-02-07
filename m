Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F9568DA8E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOs5-0005L4-4E; Tue, 07 Feb 2023 09:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOs2-0005Ko-AF
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOs0-0005de-QJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLLRb7UIiA3ue3A+KTuYUYawy+oxA0/Ekhe7vAC7u+A=;
 b=SagAa5nuTYmHBBy2LQYGQlDjn4K/9vQVR8fKYBJ5294gUhl3UO7YINV+haK/tER0rMm9NC
 obHuWUzXgcd3AlX+4UL+2bvOuSkWg8gEfMeImyctYgNQlQZMGoLpm9xxUJUHoGzGKr4Y9P
 K6PyPPN1HmjlB4jG+XAPBswax/4I67M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-pM37uh0qNMOcn3dQJNLetA-1; Tue, 07 Feb 2023 09:22:50 -0500
X-MC-Unique: pM37uh0qNMOcn3dQJNLetA-1
Received: by mail-qt1-f200.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so8694415qtj.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bLLRb7UIiA3ue3A+KTuYUYawy+oxA0/Ekhe7vAC7u+A=;
 b=QoXWVoEoweqj16PnOqePdNO5s5m2BRQZpMHwWKE1oTuczeb1j6akrTbRNbWom4MId7
 JLXf0focFo7zTYx9jkAzYa6dYpRnkN6H67R1y4WTL+ehieMuD7BEi2lsI/3ww8yrPmG/
 qoSQblGfTet55KmFpdODG33grNC4F9j/OqNWRlNDpuGDxEBATQ1Sa8o64dU+l4OAUF9B
 T/ZPsIxwChn1HA8LEeBuZ2/+sTYGtM0kcmUOtc7rrFvFzbzUFqDtODMgyJ0hAIrR3X2c
 YDVDkPcaBeGazq8yTTDbfTHQSvP6ohHW7bjF7piQCo0g356GIOTR1Bda8cvW+TkKJmms
 E2Cw==
X-Gm-Message-State: AO0yUKUosjxE0Z+tSL/Gum/pPLtpLx7iugaCYHm7d8xRwtIq/5rqSDr7
 oLzRTkNUCncqD/ikzPfZJiugwlUZF6DP8fuiBll0rB9LsjOJLSG35TaVJ+gFQ/c88vnd6L0Zxdf
 NuGv/etpx9uKJ0AhmbD2n30A=
X-Received: by 2002:a05:622a:60b:b0:3b8:26a7:d608 with SMTP id
 z11-20020a05622a060b00b003b826a7d608mr5920537qta.19.1675779769973; 
 Tue, 07 Feb 2023 06:22:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/YvvTg269bzU6B+bFFkqJNcwN23OZQNWavMfd4HlYGuEiZVd10Iwx3o4INwSgmitrbHEBuRQ==
X-Received: by 2002:a05:622a:60b:b0:3b8:26a7:d608 with SMTP id
 z11-20020a05622a060b00b003b826a7d608mr5920496qta.19.1675779769721; 
 Tue, 07 Feb 2023 06:22:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05620a278c00b0070531c5d655sm9527299qkp.90.2023.02.07.06.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:22:49 -0800 (PST)
Message-ID: <50a9a8f9-21b2-d40b-3116-90a96dcc9bc7@redhat.com>
Date: Tue, 7 Feb 2023 15:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 06/12] tests/qtest: Skip unplug tests that use missing
 devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-7-farosas@suse.de>
 <7d61db17-d0f1-3f9f-8bf6-bf9b0d33a063@redhat.com> <874jrxo8zh.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <874jrxo8zh.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/02/2023 15.17, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 06/02/2023 16.04, Fabiano Rosas wrote:
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>    tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
>>> index 5a6afa2b57..931acbdf50 100644
>>> --- a/tests/qtest/device-plug-test.c
>>> +++ b/tests/qtest/device-plug-test.c
>>> @@ -67,6 +67,11 @@ static void test_pci_unplug_request(void)
>>>        const char *arch = qtest_get_arch();
>>>        const char *machine_addition = "";
>>>    
>>> +    if (!qtest_has_device("virtio-mouse-pci")) {
>>> +        g_test_skip("Device virtio-mouse-pci not available");
>>> +        return;
>>> +    }
>>> +
>>>        if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>>            machine_addition = "-machine pc";
>>>        }
>>> @@ -81,6 +86,10 @@ static void test_pci_unplug_request(void)
>>>    
>>>    static void test_q35_pci_unplug_request(void)
>>>    {
>>> +    if (!qtest_has_device("virtio-mouse-pci")) {
>>> +        g_test_skip("Device virtio-mouse-pci not available");
>>> +        return;
>>> +    }
>>>    
>>>        QTestState *qtest = qtest_initf("-machine q35 "
>>>                                        "-device pcie-root-port,id=p1 "
>>
>> This seems to break the QEMU coding style ("Mixed declarations (interleaving
>> statements and declarations within blocks) are generally not allowed;
>> declarations should be at the beginning
>> of blocks.") ... could you separate the declaration of qtest from its
>> initialization now, please?
> 
> Ah well spotted, I got thrown off because some of these tests already
> have a:
> 
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          machine_addition = "-machine pc";
>      }
> 
>      QTestState *qtest = qtest_initf...
> 
> I'll fix those as well.

Yes, please.

Actually, I wonder whether we could remove those "-machine pc" lines again, 
since "pc" is the default machine anyway. I think the original idea here was 
to get rid of the default machine on x86 or to switch it to q35, but that 
never happened, so this code seems superfluous now. Anyway, maybe rather 
something for a separate patch later...

  Thomas


