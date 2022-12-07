Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F817645AEA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uRe-0000Rt-3M; Wed, 07 Dec 2022 08:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2uRb-0000Ou-Qw
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2uRZ-0001SP-Nf
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AHoRzVzp0JPJQmwMLEGcIt6GG3KLCHK9Sz8ikTbrsM=;
 b=J4/VKaqO1W8wYb+ufsdY7BxRxW5MQ1tJGTILvtmV3zl/rKsDK9F2HaAkd+/UU+t122WecX
 IWrVYcfb3v0DcX+q7bzkh9LgcJv2G2/EpZdFs3iFgxgXp5FrtxcD0Tc9uE7J3Om3K+Vlkd
 qsxGLd2oO35xcCldE0iTxa8FzceFDEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-Go-StGnQMN2QabRkPZUkQw-1; Wed, 07 Dec 2022 08:26:35 -0500
X-MC-Unique: Go-StGnQMN2QabRkPZUkQw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so785498wmb.8
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 05:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0AHoRzVzp0JPJQmwMLEGcIt6GG3KLCHK9Sz8ikTbrsM=;
 b=Hwb6gHE3UbXSKrhffBAIRigE+I7RcWxw4nwTGEnLB1Q7G39VuzfBEFsyAzq/e0GAPO
 XFZWwh2oLVpM/uQt8aHBVUg41/bGJN7aC9rmp1ktZ9wTCyJGiTo1C+N+4/o6QgTGzh7j
 +DbjpSTeH6Tk6XObMGGoumAgICcoh1U/6bw75q3uqx10NY16DvXy1s0WSCBZ4/RvytOI
 cfE4o9nmQFKBYrwd60G8SNLmyQnomzi0IiylYXkQUL31CFWebmb5VFWZ1ri+fMqo2oaH
 haH5pCqZ+WQGSaZOQu37nFvtbaR44wQpSwexbhj1GPjObq6+NXt9Se9qwXkr8aAA0nUv
 UXhA==
X-Gm-Message-State: ANoB5pn8YbznRZDqVB6sH9CylIq6WjWOpOzX0OwBElL1QBY0AGP9AVXR
 P7aSSePBB/GYrcnKVxixR7lq+8cD3qE8VGYeQMumHC7DZS7bSk/k4Jjbg0V3RHp5eCmH3d/Eyrx
 e8YAIHWd2bZ7mnbU=
X-Received: by 2002:adf:dd89:0:b0:242:2875:1a55 with SMTP id
 x9-20020adfdd89000000b0024228751a55mr20200527wrl.402.1670419594856; 
 Wed, 07 Dec 2022 05:26:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5t7CprnOxMZ5stOlxU46bOOs6mz1j+LTi544VXpwGjFBNJZGQLqtEknKe0Rd8Un4loag8LAw==
X-Received: by 2002:adf:dd89:0:b0:242:2875:1a55 with SMTP id
 x9-20020adfdd89000000b0024228751a55mr20200510wrl.402.1670419594588; 
 Wed, 07 Dec 2022 05:26:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-155.web.vodafone.de.
 [109.43.178.155]) by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003c71358a42dsm2363268wma.18.2022.12.07.05.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 05:26:34 -0800 (PST)
Message-ID: <29cf9b02-be97-753a-797f-c72fb0099c56@redhat.com>
Date: Wed, 7 Dec 2022 14:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Content-Language: en-US
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
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221207132119.000036a8@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/12/2022 14.21, Jonathan Cameron wrote:
> On Mon, 05 Dec 2022 14:59:39 +0000
> Alex Bennée <alex.bennee@linaro.org> wrote:
> 
>> Jonathan Cameron via <qemu-devel@nongnu.org> writes:
>>
>>> On Mon, 5 Dec 2022 10:54:03 +0000
>>> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
>>>   
>>>> On Sun, 4 Dec 2022 08:23:55 +0100
>>>> Thomas Huth <thuth@redhat.com> wrote:
>>>>    
>>>>> On 04/11/2022 07.47, Thomas Huth wrote:
>>>>>> On 16/06/2022 18.57, Michael S. Tsirkin wrote:
>>>>>>> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>>>>>
>>>>>>> Emulation of a simple CXL Switch downstream port.
>>>>>>> The Device ID has been allocated for this use.
>>>>>>>
>>>>>>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>>>>> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> ---
>>>>>>>    hw/cxl/cxl-host.c              |  43 +++++-
>>>>>>>    hw/pci-bridge/cxl_downstream.c | 249 +++++++++++++++++++++++++++++++++
>>>>>>>    hw/pci-bridge/meson.build      |   2 +-
>>>>>>>    3 files changed, 291 insertions(+), 3 deletions(-)
>>>>>>>    create mode 100644 hw/pci-bridge/cxl_downstream.c
>>>>>>
>>>>>>    Hi!
>>>>>>
>>>>>> There is a memory problem somewhere in this new device. I can make QEMU
>>>>>> crash by running something like this:
>>>>>>
>>>>>> $ MALLOC_PERTURB_=59 ./qemu-system-x86_64 -M x-remote \
>>>>>>       -display none -monitor stdio
>>>>>> QEMU 7.1.50 monitor - type 'help' for more information
>>>>>> (qemu) device_add cxl-downstream
>>>>>> ./qemu/qom/object.c:1188:5: runtime error: member access within misaligned
>>>>>> address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which requires 8 byte
>>>>>> alignment
>>>>>> 0x3b3b3b3b3b3b3b3b: note: pointer points here
>>>>>> <memory cannot be printed>
>>>>>> Bus error (core dumped)
>>>>>>
>>>>>> Could you have a look if you've got some spare minutes?
>>>>>
>>>>> Ping! Jonathan, Michael, any news on this bug?
>>>>>
>>>>> (this breaks one of my local tests, that's why it's annoying for me)
>>>> Sorry, my email filters ate your earlier message.
>>>>
>>>> Looking into this now. I'll note that it also happens on
>>>> device_add xio3130-downstream so not specific to this new device.
>>>>
>>>> So far all I've managed to do is track it to something rcu related
>>>> as failing in a call to drain_call_rcu() in qmp_device_add()
>>>>
>>>> Will continue digging.
>>>
>>> Assuming I'm seeing the same thing...
>>>
>>> Problem is g_free() on the PCIBridge windows:
>>> https://elixir.bootlin.com/qemu/latest/source/hw/pci/pci_bridge.c#L235
>>>
>>> Is called before we get an rcu_call() to flatview_destroy() as a
>>> result of the final call of flatview_unref() in address_space_set_flatview()
>>> so we get a use after free.
>>>
>>> As to what the fix is...  Suggestions welcome!
>>
>> It sounds like this is the wrong place to free the value then. I guess
>> the PCI aliases into &w->alias_io() don't get dealt with until RCU
>> clean-up time.
>>
>> I *think* using g_free_rcu() should be enough to ensure the free occurs
>> after the rest of the RCU cleanups but maybe you should only be cleaning
>> up the windows at device unrealize time? Is this a dynamic piece of
>> memory which gets updated during the lifetime of the device?
> 
> There is unfortunately code that swaps it for an updated structure
> in pci_bridge_update_mappings()
> 
>>
>> If the memory is being cleared with RCU then the access to the base
>> pointer should be done with the appropriate qatomic_rcu_[set|read]
>> functions.
>>
> 
> I'm annoyingly snowed under this week with other things, but hopefully
> can get to in a few days.  Note we are looking at an old problem
> here, just one that's happening for an additional device, not sure
> if that really affects urgency of fix though.

It's too late now for QEMU 7.2 anyway, so there is no hurry, I think.

  Thomas


