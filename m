Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB13700A10
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:15:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTXH-0003MJ-FB; Fri, 12 May 2023 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxTX2-0003LL-C0
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:14:04 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxTX0-0006IA-Bs
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:14:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so45438085e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683900839; x=1686492839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fahuPkjbOPq65n7Zo4uP5iqTMhy+C09Ng3Ez9malXSU=;
 b=XfInYyDnABPEsnm7z0Yq7mOt/JNvNnY79XPFO6aU1rHc3O/LTyEoLGV6HjdnY/akiZ
 vCBnSJdk6H8k2lxlzu74DmdrysB+Am3FXc1s7iEwbMOAUwA3m80vuzZsAByhXw7ET+3M
 lyH6Pwzhd3m11QUZ/XF9XRvEAMdQrV6xk4JycR0DWNH61BtOyY7Qthzr25FIp+b11XuC
 liyaRoJQEr7QJDwSkhyd/PpK+7+WOLDFfvtvdE19gVVGFlaFYxcBzIGRFhTaIcTaUb+6
 WMeOmvF5k+NQTqSLr6PVjNL275TODn5q2S5rc1LvPC5Mi2TkkdI6SO1J2h3mndjPIUK8
 qerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683900839; x=1686492839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fahuPkjbOPq65n7Zo4uP5iqTMhy+C09Ng3Ez9malXSU=;
 b=EwsunX8HlHqGXhuCFMLWYTKxGxqCRdrUdL5wCL/h7pS5GwFPNwUvCW/QEiHYnc/ICm
 V6daV0gPXEBPnmgQ2CFOay/63HpawSzLxnfbIStB4hRyyJvpLtdI7mBdtmaVoUoiCVLi
 ByFk61V7xKvlVH9IKpkbo/rzu+Pim/GGLKO5Wy8Ka5BHTMCEzu6te/9IbHLauL3Z7G2X
 vf5ZK2q8q5lEnPX5pHS3nFeskOA033c4RFxy39qnNlUrRfzXJf0IcX0Z9bblZD2c7Bho
 srhPW0HFOMhKMFsKTfSfGCU2ixHktpRmkOb14eHvuuJZXccG+NJoS1ao5SgP+57ulKAJ
 Wpeg==
X-Gm-Message-State: AC+VfDxPoHfXwotu8XEtCxBsgNQZqjYDaICoi7wQrYiquSck6fXX8Jj3
 CghreHhFR4HYysn1h4atFXgBFzwVzC+IM51Ow0Y5Nw==
X-Google-Smtp-Source: ACHHUZ7N639xpYlf+/+E7mHyVl8P30rSpgM211uMWKmqfziKfOhcgICSnEYkF1roSSCNyKWRUbEHvg==
X-Received: by 2002:a1c:f204:0:b0:3f3:f7f0:2203 with SMTP id
 s4-20020a1cf204000000b003f3f7f02203mr16859346wmc.12.1683900838803; 
 Fri, 12 May 2023 07:13:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.246])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm28432959wmc.14.2023.05.12.07.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 07:13:58 -0700 (PDT)
Message-ID: <492d6a94-2937-eeec-3855-8ba14046957c@linaro.org>
Date: Fri, 12 May 2023 16:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] softmmu/ioport.c: make MemoryRegionPortioList owner
 of portio_list MemoryRegions
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-4-mark.cave-ayland@ilande.co.uk>
 <0f030dfa-9c3e-b44a-584a-22deca1680f7@linaro.org>
 <3591883e-c121-efda-b2eb-cb4e58da291f@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3591883e-c121-efda-b2eb-cb4e58da291f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12/5/23 08:56, Mark Cave-Ayland wrote:
> On 11/05/2023 20:22, Philippe Mathieu-Daudé wrote:
> 
>> On 19/4/23 17:16, Mark Cave-Ayland wrote:
>>> Currently when portio_list MemoryRegions are freed using 
>>> portio_list_destroy() the RCU
>>> thread segfaults generating a backtrace similar to that below:
>>>
>>>      #0 0x5555599a34b6 in phys_section_destroy ../softmmu/physmem.c:996
>>>      #1 0x5555599a37a3 in phys_sections_free ../softmmu/physmem.c:1011
>>>      #2 0x5555599b24aa in address_space_dispatch_free 
>>> ../softmmu/physmem.c:2430
>>>      #3 0x55555996a283 in flatview_destroy ../softmmu/memory.c:292
>>>      #4 0x55555a2cb9fb in call_rcu_thread ../util/rcu.c:284
>>>      #5 0x55555a29b71d in qemu_thread_start 
>>> ../util/qemu-thread-posix.c:541
>>>      #6 0x7ffff4a0cea6 in start_thread nptl/pthread_create.c:477
>>>      #7 0x7ffff492ca2e in __clone 
>>> (/lib/x86_64-linux-gnu/libc.so.6+0xfca2e)
>>>
>>> The problem here is that portio_list_destroy() unparents the 
>>> portio_list MemoryRegions
>>> causing them to be freed immediately, however the flatview still has 
>>> a reference to the
>>> MemoryRegion and so causes a use-after-free segfault when the RCU 
>>> thread next updates
>>> the flatview.
>>>
>>> Solve the lifetime issue by making MemoryRegionPortioList the owner 
>>> of the portio_list
>>> MemoryRegions, and then reparenting them to the portio_list owner. 
>>> This ensures that they
>>> can be accessed as QOM childen via the portio_list owner, yet the 
>>> MemoryRegionPortioList
>>
>> "children"
> 
> Ooops, thanks - I'll correct that on the next respin.
> 
>>> owns the refcount.
>>>
>>> Update portio_list_destroy() to unparent the MemoryRegion from the 
>>> portio_list owner and
>>> then add a finalize() method to MemoryRegionPortioList, so that the 
>>> portio_list
>>> MemoryRegions remain allocated until flatview_destroy() removes the 
>>> final refcount upon
>>> the next flatview update.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   softmmu/ioport.c | 34 +++++++++++++++++++++++++++++++---
>>>   1 file changed, 31 insertions(+), 3 deletions(-)
>>
>>
>>> @@ -230,6 +230,8 @@ static void portio_list_add_1(PortioList *piolist,
>>>                                 unsigned off_low, unsigned off_high)
>>>   {
>>>       MemoryRegionPortioList *mrpio;
>>> +    Object *owner;
>>> +    char *name;
>>>       unsigned i;
>>>       /* Copy the sub-list and null-terminate it.  */
>>> @@ -246,8 +248,25 @@ static void portio_list_add_1(PortioList *piolist,
>>>           mrpio->ports[i].base = start + off_low;
>>>       }
>>> -    memory_region_init_io(&mrpio->mr, piolist->owner, &portio_ops, 
>>> mrpio,
>>> +    /*
>>> +     * The MemoryRegion owner is the MemoryRegionPortioList since 
>>> that manages
>>> +     * the lifecycle via the refcount
>>> +     */
>>> +    memory_region_init_io(&mrpio->mr, OBJECT(mrpio), &portio_ops, 
>>> mrpio,
>>>                             piolist->name, off_high - off_low);
>>> +
>>> +    /* Reparent the MemoryRegion to the piolist owner */
>>> +    object_ref(&mrpio->mr);
>>> +    object_unparent(OBJECT(&mrpio->mr));
>>
>> Out of this patch scope, but could this part <...
>>
>>> +    if (!piolist->owner) {
>>> +        owner = container_get(qdev_get_machine(), "/unattached");
>>> +    } else {
>>> +        owner = piolist->owner;
>>> +    }
>>> +    name = g_strdup_printf("%s[*]", piolist->name);
>>> +    object_property_add_child(owner, name, OBJECT(&mrpio->mr));
>>> +    g_free(name);
>>
>> ...> be extracted as qdev_add_child()? It seems to duplicate
>> code from device_set_realized().
> 
> I would say no for 2 reasons: firstly qdev itself only has the concept 
> of devices and buses: the fact that devices appear as children of their 
> bus is an artifact of how they are modelled in QOM, rather than being 
> part of the qdev design philosophy.

Right.

> Secondly there is actually only one user of portio_list which doesn't 
> have an owner, and that is our old friend the PCI IDE controller. That's 
> because everything else is done through isa_register_ioport(), and in 
> fact we have both attempted to solve this previously (see my comments at 
> https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-9-philmd@linaro.org/#ca177083-b24d-90cd-9f3c-c99653bc9a08@ilande.co.uk and https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/#6bc0dc92-3787-5379-b139-a8b5973d87fc@ilande.co.uk).
> 
> My preference would be to merge this in its current form and then remove 
> the part handling NULL piolist->owner and replace it with 
> assert(piolist->owner) once one of the PCI IDE controller/ISA ioport 
> patches have been merged.

Sure, I'm not asking for change on this series.
Possibly the maintainer taking this can fix the typo.

> 
>>>       if (piolist->flush_coalesced_mmio) {
>>>           memory_region_set_flush_coalesced(&mrpio->mr);
>>>       }
>>> @@ -305,10 +324,19 @@ void portio_list_del(PortioList *piolist)
>>>       }
>>>   }
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 
> ATB,
> 
> Mark.
> 


