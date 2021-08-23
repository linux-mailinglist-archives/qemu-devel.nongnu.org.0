Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D63F4BC5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:34:38 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIA61-0007mL-AG
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIA4t-0006zQ-Tt
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIA4r-0000Ha-J1
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629725604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3N7fcD4bSIUAc+tMQNyD650DuSPqCdD/QkkCp8EBUuA=;
 b=CPFJ9BvbrAbjbgrLRV76LIcwetzM5FcTwjX9EIHLzAfxFepaawwE88ChPQSxXapexvNuxP
 Jbzv23Xo5H1m8dJX6qpeO2i0+mTLG1Z28dxiPraqkaHk99XpV6vWAtkpdUq/HXUjkpjlwU
 hw2oAoR6Ehw8jpWnIoWIjJFoQo6RxT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-RnoMeaopP0yJCZWm-KG_kw-1; Mon, 23 Aug 2021 09:33:23 -0400
X-MC-Unique: RnoMeaopP0yJCZWm-KG_kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBDEB87D542;
 Mon, 23 Aug 2021 13:33:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 768015DA61;
 Mon, 23 Aug 2021 13:33:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C93E411380A9; Mon, 23 Aug 2021 15:33:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 6/7] spapr: use DEVICE_UNPLUG_ERROR to report
 unplug errors
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-7-danielhb413@gmail.com>
 <87a6ltbb7w.fsf@dusky.pond.sub.org>
 <f0a87e8b-abee-ae02-e0c5-772dd5e08dd3@gmail.com>
Date: Mon, 23 Aug 2021 15:33:19 +0200
In-Reply-To: <f0a87e8b-abee-ae02-e0c5-772dd5e08dd3@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 9 Aug 2021 15:47:14 -0300")
Message-ID: <87pmu4cmlc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 8/7/21 11:06 AM, Markus Armbruster wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> 
>>> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
>>> error path, signalling that the hotunplug process wasn't successful.
>>> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
>>> to signal this error to the management layer.
>>>
>>> We also have another error path in spapr_memory_unplug_rollback() for
>>> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
>>> in the hotunplug error path, but it will reconfigure them. Let's send
>>> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
>>> case of older kernels.
>>>
>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/ppc/spapr.c     |  9 ++++++++-
>>>   hw/ppc/spapr_drc.c | 18 ++++++++++++------
>>>   2 files changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index 1611d7ab05..5459f9a7e9 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -29,6 +29,7 @@
>>>   #include "qemu/datadir.h"
>>>   #include "qapi/error.h"
>>>   #include "qapi/qapi-events-machine.h"
>>> +#include "qapi/qapi-events-qdev.h"
>>>   #include "qapi/visitor.h"
>>>   #include "sysemu/sysemu.h"
>>>   #include "sysemu/hostmem.h"
>>> @@ -3686,13 +3687,19 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>>>         /*
>>>        * Tell QAPI that something happened and the memory
>>> -     * hotunplug wasn't successful.
>>> +     * hotunplug wasn't successful. Keep sending
>>> +     * MEM_UNPLUG_ERROR even while sending DEVICE_UNPLUG_ERROR
>>> +     * until the deprecation MEM_UNPLUG_ERROR is due.
>>>        */
>>>       if (dev->id) {
>>>           qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>>>                                        "for device %s", dev->id);
>>>           qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>>>       }
>>> +
>>> +    qapi_event_send_device_unplug_error(!!dev->id, dev->id,
>>> +                                        dev->canonical_path,
>>> +                                        qapi_error != NULL, qapi_error);
>>>   }
>>>   
>> When dev->id is null, we send something like
>>
>>      {"event": "DEVICE_UNPLUG_ERROR",
>>       "data": {"path": "/machine/..."},
>>       "timestamp": ...}
>>
>> Unless I'm missing something, this is all the information the management
>> application really needs.
>>
>> When dev->id is non-null, we add to "data":
>>
>>                "device": "dev123",
>>                "msg": "Memory hotunplug rejected by the guest for device dev123",
>>
>> I'm fine with emitting the device ID when we have it.
>>
>> What's the intended use of "msg"?
>>
>> Could DEVICE_UNPLUG_ERROR ever be emitted for this device with a
>> different "msg"?
>
>
> It won't have a different 'msg' for the current use of the event in both ppc64
> and x86. It'll always be the same '<dev> hotunplug rejected by the guest'
> message.
>
> The idea is that a future caller might want to insert a more informative
> message, such as "hotunplug failed: memory is being used by kernel space"
> or any other more specific condition. But then I guess we can argue that,
> if that time comes, one can just add this new optional 'msg' member in this
> event, and for now we can live without it.
>
> Would you oppose to renaming this new event to "DEVICE_UNPLUG_GUEST_ERROR"
> and then remove the 'msg' member? I guess this rename would make it clearer
> for management that we're reporting a guest side error, making any further
> clarifications via 'msg' unneeded.

No objection.


