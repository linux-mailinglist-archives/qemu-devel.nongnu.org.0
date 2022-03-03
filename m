Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298C4CC10F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:20:41 +0100 (CET)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnFw-0008GQ-78
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:20:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPnCX-0005QZ-C2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:09 -0500
Received: from [2607:f8b0:4864:20::1031] (port=37741
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPnCS-0004Wa-H9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:06 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso7938652pjj.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=noM9w9ciTHsVuZ9RtVu+MRUtv9f0Oxsvoh3q7R5lvjg=;
 b=qgEHCQLOXRzuD9U1Qtp2GhWO0JQj85kMj5UBlxCDnDaOnFKDd47ZfqwM6yQ9VSDw3Q
 nTweMFUpoi+jZHavhcqWmiRjxzWsyO4If6AqCg9Q/P35/b1NIFUbIBIzIzBwqAVT80ux
 carEDDbu20jaIgfUqosXcFpLTpoz/zBWfmR/NbjI/zhDZJhA5llZOMHU+udCZeQvAss/
 nUPeIhg94aSimgLjUOZipnwmhw6OiNkFKQ1xoP7UqXJxuUTx5q3UGii1MqKfr+z73xF1
 cxI40TyaSg+pn4QS6tjA18YGO4UQ1ujX2nlOkXEKv1hwSnzszp3NLJ1i5nUVTzz1scuM
 Wg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=noM9w9ciTHsVuZ9RtVu+MRUtv9f0Oxsvoh3q7R5lvjg=;
 b=VJ6xW0Xbhq/hjumILalk+tS+3ovuH1xJBfyQ4VqZpJsVolnYl0oDa/N+9PhZV+Tf6f
 T9jA08tc6PAJwySPiBcv0EK/d4swFTnNuDWxd3VLJnI3jAfTaKrQ6ZsQ98XpHU68oIyK
 LNLvLHr8ocY6dTqttkGHBnedxyy8PoTxzX/tuxZyZA8pWP3cKocvCzrg5mQqjcZcgvIu
 /jqyBNBhFlQ/u4nU+9+wuRzw0W/AcpJxC7Jz7gdZWx5tNqKFSYxDHpo0fuOjWR94hLS1
 Xh3qVXCoSOrth9NUtBeyf9XO3Z9DsLyosEXrPf4eFnZxg1oqyKf6zzGf0G1koETHwkvy
 zc3w==
X-Gm-Message-State: AOAM532uZ0j/z2N1nEcTEsUgHmEshun0ldNvE/ZpJXxqyl2aLtes8MN/
 /OdNHxm1d+M0mfWU3u59jOI=
X-Google-Smtp-Source: ABdhPJzptSifkIJ4qhxXjwL+9yulSRCTtE/HUyS+oBW+N98Of7pu/oZh65IbafQaW9dkEA6WUieJxg==
X-Received: by 2002:a17:902:c94a:b0:151:8e65:c715 with SMTP id
 i10-20020a170902c94a00b001518e65c715mr11645351pla.169.1646320622691; 
 Thu, 03 Mar 2022 07:17:02 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056a000cc900b004f3581ae086sm3136078pfv.16.2022.03.03.07.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 07:17:02 -0800 (PST)
Message-ID: <376ae622-e4c6-4d73-95de-6b619bdf29ef@gmail.com>
Date: Thu, 3 Mar 2022 16:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
 <20220223104450.196e9624@redhat.com>
 <9d0cfe90-01bc-6008-664f-74bdaa9c145c@greensocs.com>
 <20220224105521.1b760212@redhat.com>
 <2e1bef30-3227-5137-cab8-5dbd7011f39c@greensocs.com>
 <20220225123845.5cf81c26@redhat.com>
 <5c3405b1-817a-cc9e-b68b-749cd9653ae4@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <5c3405b1-817a-cc9e-b68b-749cd9653ae4@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mark.burton@greensocs.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 edgari@xilinx.com, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mark / Daniel / Markus / Alex for design.

On 25/2/22 16:31, Damien Hedde wrote:
> On 2/25/22 12:38, Igor Mammedov wrote:
>> On Thu, 24 Feb 2022 12:43:21 +0100
>> Damien Hedde <damien.hedde@greensocs.com> wrote:
>>> On 2/24/22 10:55, Igor Mammedov wrote:
>>>> On Wed, 23 Feb 2022 11:19:49 +0100
>>>> Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>>> On 2/23/22 10:44, Igor Mammedov wrote:
>>>>>> On Wed, 23 Feb 2022 10:07:05 +0100
>>>>>> Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>>>>> This device can be used to create a memory wrapped into a
>>>>>>> sysbus device.
>>>>>>> This device has one property 'readonly' which allows
>>>>>>> to choose between a ram or a rom.
>>>>>>> The purpose for this device is to be used with qapi command
>>>>>>> device_add.
>>>>>> that's the way to add a device to QEMU but a don't actual
>>>>>> purpose described here, i.e. how board will use this
>>>>>> device/actual usecase and how it will be wired to board
>>>>>> and why it does have to be a sysbus device.
>>>>> Sorry, this was unclear.
>>>>>
>>>>> It is a sysbus device in order to use it like any other sysbus device.
>>>>> The memory region it contains is exposed as a sysbus mmio.
>>>>
>>>> aside of that sysbus is legacy fictional bus (albeit widely used),
>>>> it doesn't scale to non sysbus devices (me thinking about buss-less
>>>> pc-dimm & co) since eventually we would like to create mainstream
>>>> machine types via QMP as well.
>>>>> I can replace the commit message by the following paragraph:
>>>>>
>>>>> Boards instantiate memories by creating memory region objects which is
>>>>> not possible using QAPI commands.
>>>>
>>>> That's not entirely true, you can use object-add with hostmem backends
>>>> which do provide a means to allocate memory_region.
>>>> (there is no rom hostmem backend probably (i.e. one that return rom 
>>>> memory region)
>>>> but that could be added).
>>>> Another benefit of approach is that one can replace backing
>>>> memory any other backend (file/memfd/pmem...) without affecting
>>>> device model.
>>>
>>> I'm not familiar with memory backends. I need to take a look at them.
>>>>> To create a memory, the user can instantiate and map this device by
>>>>> issuing the following commands:
>>>>> device_add driver=sysbus-memory size=0x1000 id=someram
>>>>> sysbus-mmio-map device=someram addr=0
>>>>
>>>> I'd imagine more generic approach would look like:
>>>>
>>>> object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
>>>> device_add memdevice_frontend,memdev=mem1,addr=0x0
>>>>
>>>> where [pre]plug hooks in machine can map device to
>>>> an appropriate address space/place at device realize time.
>>>> (see memory_device_[pre_]plug() for starters).
>>>
>>> We cannot rely on hooks the machine would define, because we start
>>> from an empty machine. So anything must come from qapi and we would
>>> need to do something like that I suppose:
>>> object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
>>> device_add sysbus-memory-frontend,memdev=mem1,id=memdev_fe
>>> sysbus-mmio-map device=memdev_fe addr=0
>>
>> As I pointed out using legacy sysbus doesn't scale, also I'd avoid
>> spawning more new device based on it if it can be helped.
> 
> I'm not sure to get the issue with adding sysbus devices, there is a lot 
> of them. And for most them, they'll never be put on anything else than a 
> simple memory bus. This one is trivial.
> Right now there is a sysbus and the whole buses tree starts from it, it 
> propagates reset. Everything is based on it.
> 
>>
>> with bus-less design, machine is still empty, in advance prepared
>> plug callbacks, is practically meta-data saying which device class
>> map into which address space which is quite generic. It helps
>> to avoid having extra QMP command for mapping.
> 
> AFAIK the sysbus is the only bus type, on which we cannot specify the 
> mapping/addresses with some device_add command parameter (this is 
> probably doable, but hard). That's why I proposed to add sysbus-mmio-map 
> several months ago. I didn't look again since, it's probably easier now 
> with the modification done to device_add.
> 
>> However if prebuilt mapping is problematic, maybe have an alternative
>> QMP command that would do mapping, just not limited to sysbus,
>> something like
>>
>>     map_at_as device=1 as={parent_mr_name,system,io} [addr=x overlap=y 
>> prio=z]
>>
>> which should give you full control where and how to map device.

I agree with Igor (this is what I mentioned I was worried about when
reviewing patch #12 "add sysbus-mmio-map qapi command").

Sysbus devices are limited to a single main bus, and it is limiting us.
Instead of growing the sysbus API, we should add such feature to the
qdev API, so it could benefit any device (sysbus devices being a corner
case of qdev devices).

> sysbus-mmio-map is not introduced by this series just for this memory 
> device. It is here to solve mapping of any existing sysbus devices.
> 
> By bus-less. You mean mapping a sysbus device on another address space 
> than the main one exposed by the sysbus ? We can support this by adding 
> an 'as' parameter to the mapping function.

Yes.

> You mentioned non sysbus devices above. I don't think we need to try to 
> do super-commands to solve all use cases.

I tend to disagree, we want to build any machine, being able to use all
of our devices, not only the sysbus ones. How do you plan to create a
Clock object for example? IIRC some machines don't use sysbus at all;
I don't think the raspi3b do for example.

> I think there is a need to map a sysbus device on a sysbus.
> Maybe there is also a need to map a non-sysbus device (a memory region 
> then ?) to an address space.

Certainly.

