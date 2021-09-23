Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85341415F49
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:13:56 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOXy-0008Bz-S9
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTOS6-0006Fo-Iq; Thu, 23 Sep 2021 09:07:52 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTOS2-00023K-KI; Thu, 23 Sep 2021 09:07:50 -0400
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 664F520786;
 Thu, 23 Sep 2021 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632402463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFKXSKDeRNHY9r3dJXAy1S04EIsRqGcyMaUITIfJp/E=;
 b=Vgjrf4zf3hLAwwoZpB4MMGRryvLD4WxAgB6E7p3RGlh+GLG2sR84EQIPeqHslh9hEijOx5
 nNtoHHTIsQpYwOwgG/vY2WEuAlFPSV2ZBYrKkAib0o9e+EW4Mn4fmHDVaHLy2lNpaWMqxb
 O0dEBOioAyO97QP65z5rCdIdK0W9DF0=
Message-ID: <87197aa8-cce2-4f76-ca31-7989cbeaedba@greensocs.com>
Date: Thu, 23 Sep 2021 15:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 07/16] hw/core/machine: add
 machine_class_is_dynamic_sysbus_dev_allowed
Content-Language: en-US-large
To: Ani Sinha <ani@anisinha.ca>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-8-damien.hedde@greensocs.com>
 <alpine.DEB.2.22.394.2109231559230.630@anisinha-lenovo>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <alpine.DEB.2.22.394.2109231559230.630@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/23/21 12:51, Ani Sinha wrote:
> 
> 
> On Wed, 22 Sep 2021, Damien Hedde wrote:
> 
>> Right now the allowance check for adding a sysbus device using
>> -device cli option (or device_add qmp command) is done well after
>> the device has been created. It is done during the machine init done
>> notifier: machine_init_notify() in hw/core/machine.c
>>
>> This new function will allow us to check if a sysbus device type is
>> allowed to be dynamically created by the machine during the device
>> creation time.
>>
>> Also make device_is_dynamic_sysbus() use the new function.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>
>> In the context of our series, we need to be able to do the check at
>> device creation time to allow doing it depending on the current
>> MACHINE_INIT phase.
>> ---
>>   include/hw/boards.h | 17 +++++++++++++++++
>>   hw/core/machine.c   | 15 ++++++++++++---
>>   2 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 463a5514f9..934443c1cd 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -51,6 +51,23 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>    */
>>   void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>>
>> +/**
>> + * machine_class_is_dynamic_sysbus_dev_allowed: Check if type is an allowed
>> + * sysbus device type for the machine class.
>> + * @mc: Machine class
>> + * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
>> + *
>> + * Returns: true if @type is a type in the machine's list of
>> + * dynamically pluggable sysbus devices; otherwise false.
>> + *
>> + * Check if the QOM type @type is in the list of allowed sysbus device
>> + * types (see machine_class_allowed_dynamic_sysbus_dev()).
>> + * Note that if @type is a subtype of a type which is in the list, it is
>> + * allowed too.
>> + */
>> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
>> +                                                 const char *type);
>> +
> 
> How about renaming this to device_type_is_allowed_dynamic_sysbus() ?

I followed the "machine_class_allow_dynamic_sysbus_dev" function name style.

But sure I'll rename it. We can even drop the "allowed" if we want
to stay closer to the device_is_dynamic_sysbus legacy function which if 
used to check this on a device instance.

Damien
--
Thanks


> 
>>   /**
>>    * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
>>    * @mc: Machine class
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 9125c9aad0..1a18912dc8 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -545,18 +545,27 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>>
>>   bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>>   {
>> -    bool allowed = false;
>> -    strList *wl;
>>       Object *obj = OBJECT(dev);
>>
>>       if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
>>           return false;
>>       }
>>
>> +    return machine_class_is_dynamic_sysbus_dev_allowed(mc,
>> +            object_get_typename(obj));
>> +}
>> +
>> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
>> +                                                 const char *type)
>> +{
>> +    bool allowed = false;
>> +    strList *wl;
>> +    ObjectClass *klass = object_class_by_name(type);
>> +
>>       for (wl = mc->allowed_dynamic_sysbus_devices;
>>            !allowed && wl;
>>            wl = wl->next) {
>> -        allowed |= !!object_dynamic_cast(obj, wl->value);
>> +        allowed |= !!object_class_dynamic_cast(klass, wl->value);
>>       }
>>
>>       return allowed;
>> --
>> 2.33.0
>>
>>

