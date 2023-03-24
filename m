Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF376C8073
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfefF-0008N0-9e; Fri, 24 Mar 2023 06:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfefA-0008Ml-5N
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfeal-0008H6-A0
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679653446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS/JKXjSrg9Ip71QFFGUdPTfD9MQGqYMuSmz+cXaGKA=;
 b=d6xQnTDKLrOlN5dUiMZfvLRGktZAoy97syamO4OkIj2ZY/GgUjRjoJbBntdFkvPB8CfGsq
 Y9IgkCeVKWaSxgwURjQRqsiLF9Gb19VHKhvV7WUCWeLBNsAcSLmjpAb0ZymrCXi83XaCCI
 dACFnzZeJ+D8XoDe+USNcVHgJeSWanw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-OwFob7cgMzKeR1Yjt59vcQ-1; Fri, 24 Mar 2023 06:17:57 -0400
X-MC-Unique: OwFob7cgMzKeR1Yjt59vcQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so772448qtc.5
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 03:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679653076;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AS/JKXjSrg9Ip71QFFGUdPTfD9MQGqYMuSmz+cXaGKA=;
 b=W2JN2ZPCnXBsWEORahPmSHVFwQwqcVZuMElHll3ACF5hwyp8R402pGsNp+xnU2RJkY
 0LkpFpZXFHoN2c6dfND5L4Ok1YtWZA9by6sTzH8Lke8OT/1PlwPBdhdIyp4B45nK0inQ
 QOOlLJmxFZ6ifAd1FhKPeAwZOxOf10fuVhdcztfza970JjKqH1Wgptv901bDl2OKxHGV
 zhMOn6IodCAEjVD6lVA5Wn4ytzgyFYFG/ROQXYXGNTGs5Xn/zAF85a/ZsDUzTKlChMvN
 RggSqmTVyAnxIL5hzD1GZKha2REapvF6RSXLh6D1QmyjAUxUWUufWzCoYrrsPlOUIAJg
 VcBQ==
X-Gm-Message-State: AAQBX9d8BgTjEfBOnzQnJX9hZ3tPTOa6nEvIvhAUqbPUcFEcqd66fxd+
 2Q/OCDE5UFhrmaAZOZ/6DfqWMB+3FVpAqO2R1OV2JPEYon5sFJocXCKe2p2mDbvx32vZz8q4mGG
 6u2Px4YkDs8F0mRc=
X-Received: by 2002:a05:6214:21ea:b0:5af:af15:8d37 with SMTP id
 p10-20020a05621421ea00b005afaf158d37mr3030464qvj.52.1679653076423; 
 Fri, 24 Mar 2023 03:17:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1+1XFgmPuar95hc/aACaluMjG9CitWPAO/JLHoeINkwDmd4QE7MGl7vlfDYif5IYyD/PLTA==
X-Received: by 2002:a05:6214:21ea:b0:5af:af15:8d37 with SMTP id
 p10-20020a05621421ea00b005afaf158d37mr3030231qvj.52.1679653073039; 
 Fri, 24 Mar 2023 03:17:53 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-101.web.vodafone.de.
 [109.43.179.101]) by smtp.gmail.com with ESMTPSA id
 o197-20020a3741ce000000b0073b575f3603sm14140233qka.101.2023.03.24.03.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 03:17:52 -0700 (PDT)
Message-ID: <0ce0c313-61af-213f-96f6-16ab5f137b0f@redhat.com>
Date: Fri, 24 Mar 2023 11:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
 <20220616165703.42226-3-mst@redhat.com>
 <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
 <06f4e22c-1c30-42a6-6f80-1f04e9d55c96@redhat.com>
 <20221205105403.00003d0f@huawei.com> <20221205124516.00006362@huawei.com>
 <87y1rlnb28.fsf@linaro.org> <20221207132119.000036a8@huawei.com>
 <29cf9b02-be97-753a-797f-c72fb0099c56@redhat.com>
In-Reply-To: <29cf9b02-be97-753a-797f-c72fb0099c56@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 07/12/2022 14.26, Thomas Huth wrote:
> On 07/12/2022 14.21, Jonathan Cameron wrote:
>> On Mon, 05 Dec 2022 14:59:39 +0000
>> Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>> Jonathan Cameron via <qemu-devel@nongnu.org> writes:
>>>
>>>> On Mon, 5 Dec 2022 10:54:03 +0000
>>>> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
>>>>> On Sun, 4 Dec 2022 08:23:55 +0100
>>>>> Thomas Huth <thuth@redhat.com> wrote:
>>>>>> On 04/11/2022 07.47, Thomas Huth wrote:
>>>>>>> On 16/06/2022 18.57, Michael S. Tsirkin wrote:
>>>>>>>> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>>>>>>
>>>>>>>> Emulation of a simple CXL Switch downstream port.
>>>>>>>> The Device ID has been allocated for this use.
>>>>>>>>
>>>>>>>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>>>>>> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
>>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> ---
>>>>>>>>    hw/cxl/cxl-host.c              |  43 +++++-
>>>>>>>>    hw/pci-bridge/cxl_downstream.c | 249 
>>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>>    hw/pci-bridge/meson.build      |   2 +-
>>>>>>>>    3 files changed, 291 insertions(+), 3 deletions(-)
>>>>>>>>    create mode 100644 hw/pci-bridge/cxl_downstream.c
>>>>>>>
>>>>>>>    Hi!
>>>>>>>
>>>>>>> There is a memory problem somewhere in this new device. I can make QEMU
>>>>>>> crash by running something like this:
>>>>>>>
>>>>>>> $ MALLOC_PERTURB_=59 ./qemu-system-x86_64 -M x-remote \
>>>>>>>       -display none -monitor stdio
>>>>>>> QEMU 7.1.50 monitor - type 'help' for more information
>>>>>>> (qemu) device_add cxl-downstream
>>>>>>> ./qemu/qom/object.c:1188:5: runtime error: member access within 
>>>>>>> misaligned
>>>>>>> address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which requires 8 
>>>>>>> byte
>>>>>>> alignment
>>>>>>> 0x3b3b3b3b3b3b3b3b: note: pointer points here
>>>>>>> <memory cannot be printed>
>>>>>>> Bus error (core dumped)
>>>>>>>
>>>>>>> Could you have a look if you've got some spare minutes?
>>>>>>
>>>>>> Ping! Jonathan, Michael, any news on this bug?
>>>>>>
>>>>>> (this breaks one of my local tests, that's why it's annoying for me)
>>>>> Sorry, my email filters ate your earlier message.
>>>>>
>>>>> Looking into this now. I'll note that it also happens on
>>>>> device_add xio3130-downstream so not specific to this new device.
>>>>>
>>>>> So far all I've managed to do is track it to something rcu related
>>>>> as failing in a call to drain_call_rcu() in qmp_device_add()
>>>>>
>>>>> Will continue digging.
>>>>
>>>> Assuming I'm seeing the same thing...
>>>>
>>>> Problem is g_free() on the PCIBridge windows:
>>>> https://elixir.bootlin.com/qemu/latest/source/hw/pci/pci_bridge.c#L235
>>>>
>>>> Is called before we get an rcu_call() to flatview_destroy() as a
>>>> result of the final call of flatview_unref() in 
>>>> address_space_set_flatview()
>>>> so we get a use after free.
>>>>
>>>> As to what the fix is...  Suggestions welcome!
>>>
>>> It sounds like this is the wrong place to free the value then. I guess
>>> the PCI aliases into &w->alias_io() don't get dealt with until RCU
>>> clean-up time.
>>>
>>> I *think* using g_free_rcu() should be enough to ensure the free occurs
>>> after the rest of the RCU cleanups but maybe you should only be cleaning
>>> up the windows at device unrealize time? Is this a dynamic piece of
>>> memory which gets updated during the lifetime of the device?
>>
>> There is unfortunately code that swaps it for an updated structure
>> in pci_bridge_update_mappings()
>>
>>>
>>> If the memory is being cleared with RCU then the access to the base
>>> pointer should be done with the appropriate qatomic_rcu_[set|read]
>>> functions.
>>>
>>
>> I'm annoyingly snowed under this week with other things, but hopefully
>> can get to in a few days.  Note we are looking at an old problem
>> here, just one that's happening for an additional device, not sure
>> if that really affects urgency of fix though.
> 
> It's too late now for QEMU 7.2 anyway, so there is no hurry, I think.

I'm still seeing problems with this device, I guess it's still the
same issue:

$ valgrind -q ./qemu-system-x86_64 -M x-remote -monitor stdio
...
QEMU 7.2.91 monitor - type 'help' for more information
(qemu) device_add cxl-downstream,id=c1
==46154== Thread 2:
==46154== Invalid read of size 8
==46154==    at 0x7A0A0B: memory_region_unref (memory.c:1798)
==46154==    by 0x7A0A0B: flatview_destroy (memory.c:298)
==46154==    by 0x9A5E32: call_rcu_thread (rcu.c:284)
==46154==    by 0x99CC19: qemu_thread_start (qemu-thread-posix.c:541)
==46154==    by 0xB6A31C9: start_thread (in /usr/lib64/libpthread-2.28.so)
==46154==    by 0xB8F4E72: clone (in /usr/lib64/libc-2.28.so)
==46154==  Address 0x1a2a95c0 is 64 bytes inside a block of size 1,632 free'd
==46154==    at 0x4C39A93: free (vg_replace_malloc.c:872)
==46154==    by 0x79B62B1: g_free (in /usr/lib64/libglib-2.0.so.0.5600.4)
==46154==    by 0x55E06F: cxl_dsp_realize (cxl_downstream.c:201)
==46154==    by 0x5523AC: pci_qdev_realize (pci.c:2098)
==46154==    by 0x833A1E: device_set_realized (qdev.c:510)
==46154==    by 0x836DC5: property_set_bool (object.c:2285)
==46154==    by 0x838FA2: object_property_set (object.c:1420)
==46154==    by 0x83C01E: object_property_set_qobject (qom-qobject.c:28)
==46154==    by 0x839213: object_property_set_bool (object.c:1489)
==46154==    by 0x5F9787: qdev_device_add_from_qdict (qdev-monitor.c:714)
==46154==    by 0x5F98F0: qdev_device_add (qdev-monitor.c:733)
==46154==    by 0x5F99E1: qmp_device_add (qdev-monitor.c:855)
==46154==  Block was alloc'd at
==46154==    at 0x4C37135: malloc (vg_replace_malloc.c:381)
==46154==    by 0x79B61A5: g_malloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==46154==    by 0x553072: pci_bridge_region_init (pci_bridge.c:191)
==46154==    by 0x553575: pci_bridge_initfn (pci_bridge.c:388)
==46154==    by 0x55E032: cxl_dsp_realize (cxl_downstream.c:147)
==46154==    by 0x5523AC: pci_qdev_realize (pci.c:2098)
==46154==    by 0x833A1E: device_set_realized (qdev.c:510)
==46154==    by 0x836DC5: property_set_bool (object.c:2285)
==46154==    by 0x838FA2: object_property_set (object.c:1420)
==46154==    by 0x83C01E: object_property_set_qobject (qom-qobject.c:28)
==46154==    by 0x839213: object_property_set_bool (object.c:1489)
==46154==    by 0x5F9787: qdev_device_add_from_qdict (qdev-monitor.c:714)

Could we get a fix for QEMU 8.0 ?

  Thomas


