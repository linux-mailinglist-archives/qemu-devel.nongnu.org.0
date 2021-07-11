Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF03C3B37
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 10:51:10 +0200 (CEST)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2VB7-00028B-4l
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 04:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m2V9t-0001IE-Hd; Sun, 11 Jul 2021 04:49:53 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m2V9r-0000XG-NT; Sun, 11 Jul 2021 04:49:53 -0400
Received: by mail-pf1-x434.google.com with SMTP id j199so13221020pfd.7;
 Sun, 11 Jul 2021 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dl0jC2CM+jdFfPqGTgwt/TlbZrQSl4I/vLT/6mT3gTY=;
 b=LIfzD68ZURQV0tz6LtfB5AYDgGwAZZnLM4QWTvjyWuzd05haPfc2HtuI3UEKV6zgN/
 VV5Hcmt92WE+00Jl3+JIRiEd4b1fZ0zRRsyqilRcjaAJHg4DfBSWmf7YjquGgCRvlqZM
 HsBQ2RNrvz/BsyopT1fKMOGrp7I50ZfxMC6CgDkLb7VqBG3SdQbpSE4y5BIgK4CrtTzC
 vLVLGAjOEAP64rQLwDQ/G8sn+fLlwDWEdi1oVvp5lM2NFQu4DQE6MTA9IvjvZddIx0Ko
 a7kLeuf74lQzWfNzTKcB+dCQbmnfQNS/Yxdxi9q6t7Bv1SiVqQZ2uqz3jMghp3sjlihN
 iAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dl0jC2CM+jdFfPqGTgwt/TlbZrQSl4I/vLT/6mT3gTY=;
 b=lOQN3ZJlYDfTtscddRQKYh/CaZ1S17jGckJOleDPS+RsA8x4zguCYXaFb+ZyHjDef2
 lRTQZOfwAhNzHk1jYcgNx9VpnwHsFIx6y439D1GbA2ZDu3PMUKf/41UudcqO9JqsAL4N
 SPeaY+d3vFapxiJnXihv2kJigKcQrnXYyxqkcJI2DbwrLyE3vGfoWH6blPTjm5+pEGad
 t8Z2Gz512zWgGi5EiBDiMqaPqN4Nt81t9IOrzAbO6st9G2dAbNXWuzTB6pXI7eUlmP4s
 UbcjRYjRnUpwweSZozsG89iE5k+CyUtf1rlEXGS9MVRnAl+kR0sFWDq88jSfemKZlUMJ
 37bw==
X-Gm-Message-State: AOAM53169ZiDf7V5e1UI51FcGqVLGFVPuSvaeQuSFy/VHCU1aTYm1mO3
 77+Az2xS6D8IcadN3nTlyrw=
X-Google-Smtp-Source: ABdhPJwkzf7aKvqSoEWfxFliy0eTaMr6DxBAcrw6BmctqVUuOw7Er93crcfAGCNq2mK/OmFlrJDrBg==
X-Received: by 2002:a63:1656:: with SMTP id 22mr6360339pgw.163.1625993389471; 
 Sun, 11 Jul 2021 01:49:49 -0700 (PDT)
Received: from [192.168.10.222] ([177.103.89.244])
 by smtp.gmail.com with ESMTPSA id t37sm766434pfg.14.2021.07.11.01.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 01:49:49 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
To: Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-4-danielhb413@gmail.com>
 <87h7h56jh2.fsf@dusky.pond.sub.org> <20210709103913.5c938852@redhat.com>
 <87sg0n685k.fsf@dusky.pond.sub.org> <20210709153838.75de8813@redhat.com>
 <87y2ae3bbt.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <a2317d81-4a41-2add-61dc-5e7906e38eac@gmail.com>
Date: Sun, 11 Jul 2021 05:49:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87y2ae3bbt.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/10/21 3:57 AM, Markus Armbruster wrote:
> Igor Mammedov <imammedo@redhat.com> writes:
> 
>> On Fri, 09 Jul 2021 13:25:43 +0200
>> Markus Armbruster <armbru@redhat.com> wrote:
>>
>>> Igor Mammedov <imammedo@redhat.com> writes:
>>>
>>>> On Thu, 08 Jul 2021 15:08:57 +0200
>>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>>   
>>>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>>>    
>>>>>> MEM_UNPLUG_ERROR is deprecated since the introduction of
>>>>>> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
>>>>>> MEM_UNPLUG_ERROR is pending.
>>>>>>
>>>>>> CC: Michael S. Tsirkin <mst@redhat.com>
>>>>>> CC: Igor Mammedov <imammedo@redhat.com>
>>>>>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>>>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>>>> ---
>>>>>>   hw/acpi/memory_hotplug.c | 13 +++++++++++--
>>>>>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
>>>>>> index af37889423..fb9f4d2de7 100644
>>>>>> --- a/hw/acpi/memory_hotplug.c
>>>>>> +++ b/hw/acpi/memory_hotplug.c
>>>>>> @@ -8,6 +8,7 @@
>>>>>>   #include "qapi/error.h"
>>>>>>   #include "qapi/qapi-events-acpi.h"
>>>>>>   #include "qapi/qapi-events-machine.h"
>>>>>> +#include "qapi/qapi-events-qdev.h"
>>>>>>   
>>>>>>   #define MEMORY_SLOTS_NUMBER          "MDNR"
>>>>>>   #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
>>>>>> @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>>>>>>               /* call pc-dimm unplug cb */
>>>>>>               hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>>>>>>               if (local_err) {
>>>>>> +                const char *error_pretty = error_get_pretty(local_err);
>>>>>> +
>>>>>>                   trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
>>>>>> -                qapi_event_send_mem_unplug_error(dev->id,
>>>>>> -                                                 error_get_pretty(local_err));
>>>>>> +
>>>>>> +                /*
>>>>>> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
>>>>>> +                 * while the deprecation of MEM_UNPLUG_ERROR is
>>>>>> +                 * pending.
>>>>>> +                 */
>>>>>> +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
>>>>>> +                qapi_event_send_device_unplug_error(dev->id, error_pretty);
>>>>>>                   error_free(local_err);
>>>>>>                   break;
>>>>>>               }
>>>>>
>>>>> Same question as for PATCH 2: can dev->id be null?
>>>> only theoretically (if memory device were created directly without
>>>> using device_add), which as far as I know is not the case as all
>>>> memory devices are created using -device/device_add so far.
>>>>
>>>> ( for device_add case see qdev_device_add->qdev_set_id where
>>>>    'id' is set to user provided or to generated "device[%d]" value)
>>>
>>> Something is set to a generated value, but it's not dev->id :)
>>>
>>>      void qdev_set_id(DeviceState *dev, const char *id)
>>>
>>> @id is the value of id=...  It may be null.
>>>
>>> dev->id still is null here.
>>>
>>>      {
>>>          if (id) {
>>>              dev->id = id;
>>>          }
>>>
>>> dev->id is now the value of id=...  It may be null.
>>>
>>>          if (dev->id) {
>>>              object_property_add_child(qdev_get_peripheral(), dev->id,
>>>                                        OBJECT(dev));
>>>
>>> If the user specified id=..., add @dev as child of /peripheral.  The
>>> child's name is the (non-null) value of id=...
>>>
>>>          } else {
>>>              static int anon_count;
>>>              gchar *name = g_strdup_printf("device[%d]", anon_count++);
>>>              object_property_add_child(qdev_get_peripheral_anon(), name,
>>>                                        OBJECT(dev));
>>>              g_free(name);
>>>
>>> Else, add @dev as child of /peripheral-anon.  The child's name is made
>>> up.
>>>
>>>
>>>          }
>>>      }
>>>
>>> dev->id is still the value of id=..., i.e. it may be null.
>> yep, I was wrong and confused it child name in QOM tree.
>>
>>> Sure dereferencing dev->id in acpi_memory_hotplug_write() is safe?
>>
>> it aren't safe since guest may trigger this error when
>> memory-device is created without id.
> 
> Thanks!
> 
> Daniel, the issue predates your series, but your series adds instances.
> We need a patch fixing the existing instances before your series, and
> fix up your series.  Can you take care of that?


Sure. I'll add a patch to handle the dev->id == NULL case before calling
qapi_event_send_mem_unplug_error() in acpi_memory_hotplug_write().



Daniel

> 

