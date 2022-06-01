Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173953A01B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:13:02 +0200 (CEST)
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwKPU-0000jc-QV
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwKK5-0003o3-Rn
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwKJz-000419-HR
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654074438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikdkIRE77iyi+miXRjffnYfVM5HOhoya/zCnv5tZ8Xk=;
 b=Ens++80jwhUZeYpo8zJxHhkl/uwFcHUYugRVqQBsc/1hUucREJvO6m+TwipUav3J/tBvwU
 UGDt/wzRbfARxfvmPhVHXHAxUKC//jJeOAo029J108vdcKdbFmUHa2tffc0jD9xHrbuP+0
 4WSud5asDSxW7mL711YlrXzVAlmzoGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-K0XOPrN5M7CsWxjQWSgjwQ-1; Wed, 01 Jun 2022 05:07:16 -0400
X-MC-Unique: K0XOPrN5M7CsWxjQWSgjwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so635422wmr.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ikdkIRE77iyi+miXRjffnYfVM5HOhoya/zCnv5tZ8Xk=;
 b=ILkcEHZe67uGreGWRzdL8o4PQQqL5zmlOj460LgT3smHTlsyimGfAOGn3jaLPyEhLS
 FaoJ5dwffEkelZXZJ/qz5bLxBpjDUd2+DleB49kOoyIJwE6lZYKJLLMefcvaXy2wNcun
 EHRKk9UHpxYR8xWA88BcGrgv34O7M9RDYEgFVH1zrrqVeL4nT4a2/aYtbQJ2rq+taEvL
 yEg+jVgQVVFG8Lu5BVwuHirV6BJVxinfOrbJlt5A/9VM9nwD9ry6N1MHmQ5bJwD5SSnx
 EZjOGkIxTJH1cuzwMsrVVTHztZN+pdXBysHy33RrSQ6pWhZhSFslegTYBQrLLU0epjGB
 yNaA==
X-Gm-Message-State: AOAM533Wesi+bpE06BP7TOQDwtV+fWqYH5DfKE+vH7314XMdOOI5Rawd
 3hC3yxfheez2X62t5hIihjTPaua5I4rllIhXJgzSJ8Q6klVSuBCAeypay6048z514uKVKnFGNX6
 zFSLepOHAIswnnBk=
X-Received: by 2002:a05:6000:1842:b0:20f:eeea:c065 with SMTP id
 c2-20020a056000184200b0020feeeac065mr34226276wri.683.1654074435513; 
 Wed, 01 Jun 2022 02:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw82rDaj2hz4af4eer0zwkOfq8DLQOqq1iJsObMqDjDhtNMgdiNqUQLaUMbEPOpR+joe0BkVA==
X-Received: by 2002:a05:6000:1842:b0:20f:eeea:c065 with SMTP id
 c2-20020a056000184200b0020feeeac065mr34226235wri.683.1654074435160; 
 Wed, 01 Jun 2022 02:07:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45?
 (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de.
 [2003:cb:c705:2600:951d:63df:c091:3b45])
 by smtp.gmail.com with ESMTPSA id
 c6-20020adffb46000000b0020c5253d90asm1006813wrs.86.2022.06.01.02.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:07:14 -0700 (PDT)
Message-ID: <6a770c57-6fb5-e709-7d80-4387116678df@redhat.com>
Date: Wed, 1 Jun 2022 11:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
 <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
 <7fbee09c-449d-a6a5-3616-d8839df1b7a6@ilande.co.uk>
 <732960bf-f3ab-6b61-7e6e-967fe4360280@greensocs.com>
 <CAFEAcA_BinJMmqdTBoCs3V-dqSRQ_jjL7FpdMxCr1etZgn0i_A@mail.gmail.com>
 <5a7b14fa-15ef-42c2-1072-d0aec0795718@greensocs.com>
 <e1547885-1d46-f083-520a-087518e2eb6c@ilande.co.uk>
 <bd5caf26-6e34-725e-60a4-018b1a3f905a@greensocs.com>
 <7700fd59-c005-a575-3c2c-ae078b0be534@ilande.co.uk>
 <35806422-e4e4-9a73-ab9f-412858517508@greensocs.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <35806422-e4e4-9a73-ab9f-412858517508@greensocs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.06.22 10:39, Damien Hedde wrote:
> 
> 
> On 5/31/22 22:43, Mark Cave-Ayland wrote:
>> On 31/05/2022 10:22, Damien Hedde wrote:
>>
>>> On 5/31/22 10:00, Mark Cave-Ayland wrote:
>>>> On 30/05/2022 15:05, Damien Hedde wrote:
>>>>
>>>>> On 5/30/22 12:25, Peter Maydell wrote:
>>>>>> On Mon, 30 May 2022 at 10:50, Damien Hedde 
>>>>>> <damien.hedde@greensocs.com> wrote:
>>>>>>> TYPE_SYS_BUS_DEVICE also comes with reset support.
>>>>>>> If a device is on not on any bus it is not reached by the root sysbus
>>>>>>> reset which propagates to every device (and other sub-buses).
>>>>>>> Even if we move all the mmio/sysbus-irq logic into TYPE_DEVICE, we 
>>>>>>> will
>>>>>>> still miss that. The bus is needed to handle the reset.
>>>>>>> For devices created in machine init code, we have the option to do 
>>>>>>> it in
>>>>>>> the machine reset handler. But for user created device, this is an 
>>>>>>> issue.
>>>>>>
>>>>>> Yes, the missing reset support in TYPE_DEVICE is a design
>>>>>> flaw that we really should try to address.
>>>>
>>>> I think the easiest way to handle this would be just after calling 
>>>> dc->realize; if the device has bus == NULL and dc->reset != NULL then 
>>>> manually call qemu_register_reset() for dc->reset. In a qdev world 
>>>> dc->reset is intended to be a bus-level reset, but I can't see an 
>>>> issue with manual registration for individual devices in this way, 
>>>> particularly as there are no reset ordering guarantees for sysbus.
>>>
>>> I'm a bit afraid calling qemu_register_reset() outside dc->realize 
>>> might modify the behavior for existing devices. Does any device end up 
>>> having a non-NULL bus right now when using "-device" CLI ?
>>
>> If you take a look at "info qtree" then that will show you all devices 
>> that are attached to a bus i.e. ones where bus is not NULL.
>>
>>>>>>> If we end up putting in TYPE_DEVICE support for mmios, interrupts and
>>>>>>> some way to do the bus reset. What would be the difference between 
>>>>>>> the
>>>>>>> current TYPE_SYS_BUS_DEVICE ?
>>>>>>
>>>>>> There would be none, and the idea would be to get rid of
>>>>>> TYPE_SYS_BUS_DEVICE entirely...
>>>>>>
>>>>> Do you expect the bus object to disappear in the process (bus-less 
>>>>> system) or transforming the sysbus into a ~TYPE_BUS thing ?
>>>>
>>>> I'd probably lean towards removing sysbus completely since in real 
>>>> life devices can exist outside of a bus. If a device needs a bus then 
>>>> it should already be modelled in QEMU, and anything that requires a 
>>>> hierarchy can already be represented via QOM children
>>>
>>> For me, a "memory bus" is a bus. But I understand in QEMU, this is 
>>> modeled by a memory region and we do not want to represent it anymore 
>>> by a qdev/qbus hierarchy.
>>>
>>>>
>>>>> Assuming we manage to sort out this does cold plugging using the 
>>>>> following scenario looks ok ? (regarding having to issue one command 
>>>>> to create the device AND some commands to handle memory-region and 
>>>>> interrupt lines)
>>>>>
>>>>>  > device_add driver=ibex-uart id=uart chardev=serial0
>>>>>  > sysbus-mmio-map device=uart addr=1073741824
>>>>>  > qom-set path=uart property=sysbus-irq[0] 
>>>>> value=plic/unnamed-gpio-in[1]
>>>>>
>>>>> TYPE_DEVICE or TYPE_SYS_BUS_DEVICE, my goal is still to be able to 
>>>>> cold-plug a "ibex-uart" define its memory map and choose which irq I 
>>>>> wire where.
>>>>
>>>> Anyhow getting back on topic: my main objection here is that you're 
>>>> adding a command "sysbus-mmio-map" when we don't want the concept of 
>>>> SysBusDevice to be exposed outside of QEMU at all. Referring back to 
>>>> my last email I think we should extend the device concept in the 
>>>> monitor to handle the additional functionality perhaps along the 
>>>> lines of:
>>>>
>>>> - A monitor command such as "device_map" which is effectively a 
>>>> wrapper around
>>>>    memory_region_add_subregion(). Do we also want a "device_unmap"? 
>>>> We should
>>>>    consider allow mapping to other memory regions other than the 
>>>> system root.
>>>>
>>>> - A monitor command such as "device_connect" which can be used to 
>>>> simplify your IRQ
>>>>    wiring, perhaps also with a "device_disconnect"?
>>>>
>>>> - An outline of the monitor commands showing the complete workflow 
>>>> from introspection
>>>>    of a device to mapping its memory region(s) and connecting its gpios
>>>>
>>>> Does that give you enough information to come up with a more detailed 
>>>> proposal?
>>>>
>>>
>>> Yes. Sorry for being not clear enough. I did not wanted to insist on 
>>> specific command names. I've no issues regarding the modifications you 
>>> request about having a device_connect or a device_map.
>>>
>>> My question was more about the workflow which does not rely on issuing 
>>> a single 'device_add' command handling mapping/connection using 
>>> parameters. Note that since we are talking supporting of map/connect 
>>> for the base type TYPE_DEVICE, I don't really see how we could have 
>>> parameters for these without impacting subtypes.
>>
>> I'm not sure I understand what you are saying here? Can you give an 
>> example?
> 
> There are 2 possible workflows:
> 1. several commands
>  > device_add ...
>  > device_map ...
>  > device_connect ...
> 
> 2. single command
>  > device_add ... map={...} connect={...}
> 
> The 2nd one is more like how we connect devices with '-device': all is 
> done at once. But if this is supposed to apply to TYPE_DEVICE (versus 
> TYPE_SYS_BUS_DEVICE), it becomes IMHO hard to prevent using them on 
> devices where it does not makes sense (for example: a virtio or pci 
> device for which everything is already handled).

Can't we flag devices for which map/connect is supported in the device
class somehow?


-- 
Thanks,

David / dhildenb


