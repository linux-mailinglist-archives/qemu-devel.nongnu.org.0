Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6E3E4C5F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 20:48:36 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAKB-0005jN-Qa
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 14:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDAJ0-0004th-M4; Mon, 09 Aug 2021 14:47:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDAIx-0003dB-Td; Mon, 09 Aug 2021 14:47:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id j3so17498685plx.4;
 Mon, 09 Aug 2021 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FhkwmH27Ab8KqEMd3hDLKuEFi4frA+42wPZFsA3RtGo=;
 b=h+dhD8628rUBsR2W5D8ajYwfrwhQgbVBGsHvRVbJ8k1Z/gLAqAySpkoJTbS7upchc0
 EkBMzf3VgdU10mVlMx/WRm4hEn1666+Rv35xfXcQA3LEosKCNa+dgOTQ62MOpyuwKKaY
 xf9ujskdlwqaQ28AJVK0sfT8ji2fUaftv7Sv4nPwyCXUjMuh417EACqfKwFn+gb8N7Wa
 cESHCAPQW2XRPbAExlHCMvAV2+tKnnc0fNZ+Z2xbvVJZ93dgAXy7cOGKisE6hjk7Gx3l
 PkkN6Nw/YWTZp6KmZUFAffr0CJjpGwVF4LsyC3aUIKBL/mLs/dw82kVHwpcHZf/mE4Yo
 zVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FhkwmH27Ab8KqEMd3hDLKuEFi4frA+42wPZFsA3RtGo=;
 b=k2Jt1EaZsC1aN5BOLlrfAAA4CNMvToBT2E5s9w5Y0e1ZedR25oWYHDGJSE4BvnsfE5
 Ya0u3+mFeG9Okx010qE3ZUG+f8GXF/s5dNhTMZhbLcWrZ727Py9QAyzX8G1BDIAhdnWF
 RNBRZ+G+FqpH+Vi9nj6+n9Ykxa58bgnywBi57XDcdqOegkQUFkPmP7YXkO5SWkX1hsHq
 5TFruHpox5B7VGyOwMV2nLZRHD7buUTelr9FyzXeKRwiyxH5pKZ96uJXHJZg49mLiIjZ
 nIyYlOfB9T3nfqY7hkTXQ+73O+ds5M2BRhd4rX+nYSHuIq2jBtCqecOpV3cJAsdnLNhp
 NHzg==
X-Gm-Message-State: AOAM5335iZTZDnxDQ2t3XHnA/XRlo38/CxqS+khaj57LqS0jy9uwWmOI
 4U7GBDqAnzfU9K5laUAdNBE=
X-Google-Smtp-Source: ABdhPJy+c8X39SsWLUz3wqMW4kJPNuDsgzsKV9zPyPkhc9zrfzpe1kHiEha6we9S1w770P5jMXhHWA==
X-Received: by 2002:a65:6107:: with SMTP id z7mr45830pgu.43.1628534838138;
 Mon, 09 Aug 2021 11:47:18 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id mm7sm8909537pjb.44.2021.08.09.11.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 11:47:17 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v6 6/7] spapr: use DEVICE_UNPLUG_ERROR to report
 unplug errors
To: Markus Armbruster <armbru@redhat.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-7-danielhb413@gmail.com>
 <87a6ltbb7w.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <f0a87e8b-abee-ae02-e0c5-772dd5e08dd3@gmail.com>
Date: Mon, 9 Aug 2021 15:47:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87a6ltbb7w.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x636.google.com
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/7/21 11:06 AM, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
>> error path, signalling that the hotunplug process wasn't successful.
>> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
>> to signal this error to the management layer.
>>
>> We also have another error path in spapr_memory_unplug_rollback() for
>> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
>> in the hotunplug error path, but it will reconfigure them. Let's send
>> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
>> case of older kernels.
>>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c     |  9 ++++++++-
>>   hw/ppc/spapr_drc.c | 18 ++++++++++++------
>>   2 files changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 1611d7ab05..5459f9a7e9 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -29,6 +29,7 @@
>>   #include "qemu/datadir.h"
>>   #include "qapi/error.h"
>>   #include "qapi/qapi-events-machine.h"
>> +#include "qapi/qapi-events-qdev.h"
>>   #include "qapi/visitor.h"
>>   #include "sysemu/sysemu.h"
>>   #include "sysemu/hostmem.h"
>> @@ -3686,13 +3687,19 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>>   
>>       /*
>>        * Tell QAPI that something happened and the memory
>> -     * hotunplug wasn't successful.
>> +     * hotunplug wasn't successful. Keep sending
>> +     * MEM_UNPLUG_ERROR even while sending DEVICE_UNPLUG_ERROR
>> +     * until the deprecation MEM_UNPLUG_ERROR is due.
>>        */
>>       if (dev->id) {
>>           qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>>                                        "for device %s", dev->id);
>>           qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>>       }
>> +
>> +    qapi_event_send_device_unplug_error(!!dev->id, dev->id,
>> +                                        dev->canonical_path,
>> +                                        qapi_error != NULL, qapi_error);
>>   }
>>   
> 
> When dev->id is null, we send something like
> 
>      {"event": "DEVICE_UNPLUG_ERROR",
>       "data": {"path": "/machine/..."},
>       "timestamp": ...}
> 
> Unless I'm missing something, this is all the information the management
> application really needs.
> 
> When dev->id is non-null, we add to "data":
> 
>                "device": "dev123",
>                "msg": "Memory hotunplug rejected by the guest for device dev123",
> 
> I'm fine with emitting the device ID when we have it.
> 
> What's the intended use of "msg"?
> 
> Could DEVICE_UNPLUG_ERROR ever be emitted for this device with a
> different "msg"?


It won't have a different 'msg' for the current use of the event in both ppc64
and x86. It'll always be the same '<dev> hotunplug rejected by the guest'
message.

The idea is that a future caller might want to insert a more informative
message, such as "hotunplug failed: memory is being used by kernel space"
or any other more specific condition. But then I guess we can argue that,
if that time comes, one can just add this new optional 'msg' member in this
event, and for now we can live without it.

Would you oppose to renaming this new event to "DEVICE_UNPLUG_GUEST_ERROR"
and then remove the 'msg' member? I guess this rename would make it clearer
for management that we're reporting a guest side error, making any further
clarifications via 'msg' unneeded.


Thanks,


Daniel




> 
> If "msg" is useful when dev->id is non-null, then it's likely useful
> when dev->id is null.  Why not
> 
>                "msg": "Memory hotunplug rejected by the guest",
> 
> always?
> 
> If we do that here, we'll likely do it everywhere, and then member @msg
> isn't actually optional.
> 
>>   /* Callback to be called during DRC release. */
>> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
>> index a4d9496f76..8f0479631f 100644
>> --- a/hw/ppc/spapr_drc.c
>> +++ b/hw/ppc/spapr_drc.c
>> @@ -17,6 +17,8 @@
>>   #include "hw/ppc/spapr_drc.h"
>>   #include "qom/object.h"
>>   #include "migration/vmstate.h"
>> +#include "qapi/error.h"
>> +#include "qapi/qapi-events-qdev.h"
>>   #include "qapi/visitor.h"
>>   #include "qemu/error-report.h"
>>   #include "hw/ppc/spapr.h" /* for RTAS return codes */
>> @@ -160,6 +162,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>>            * means that the kernel is refusing the removal.
>>            */
>>           if (drc->unplug_requested && drc->dev) {
>> +            const char qapi_error_fmt[] = \
> 
> Drop the superfluous \
> 
>> +"Device hotunplug rejected by the guest for device %s";
> 
> Unusual indentation.
> 
>> +
>> +            g_autofree char *qapi_error = NULL;
>> +
>>               if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
>>                   spapr = SPAPR_MACHINE(qdev_get_machine());
>>   
>> @@ -169,14 +176,13 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>>               drc->unplug_requested = false;
>>   
>>               if (drc->dev->id) {
>> -                error_report("Device hotunplug rejected by the guest "
>> -                             "for device %s", drc->dev->id);
>> +                qapi_error = g_strdup_printf(qapi_error_fmt, drc->dev->id);
>> +                error_report(qapi_error_fmt, drc->dev->id);
> 
> Simpler:
> 
>                     qapi_error = ...
>                     error_report("%s", qapi_error);
> 
> Matter of taste.  Maintainer decides.
> 
>>               }
>>   
>> -            /*
>> -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
>> -             * it is implemented.
>> -             */
>> +            qapi_event_send_device_unplug_error(!!drc->dev->id, drc->dev->id,
>> +                                                drc->dev->canonical_path,
>> +                                                qapi_error != NULL, qapi_error);
> 
> My questions on "msg" apply.
> 
>>           }
>>   
>>           return RTAS_OUT_SUCCESS; /* Nothing to do */
> 

