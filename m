Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDA3898DA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 23:50:47 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljU5W-0005uR-JR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 17:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljU4Z-0005FG-7E
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljU4W-0006lA-RT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621460983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBVzqKiG6wm5r/8mXYWr7T7BpGCGchsl5E9uWcchepY=;
 b=DsyDGZSM0FpAJeozOTCgNFuW/QOXSEAkfg/xg8K0ZSEJ8HH/HSe2Ivm/GOdr9PDvO2wrgf
 rPd/wuOAuzbppuMn//kiq/+L/IlKMsyBp44Uc6wtxI2PZUkX5xrxAeRJ5mvfYXV9wJ7F6R
 m7CGWE3rNQOlZN3+aFGweweSeutzP38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-a22GwiChMJma3tJ5YXJCOg-1; Wed, 19 May 2021 17:49:42 -0400
X-MC-Unique: a22GwiChMJma3tJ5YXJCOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA03107ACC7;
 Wed, 19 May 2021 21:49:40 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24DC863BA7;
 Wed, 19 May 2021 21:49:35 +0000 (UTC)
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
From: John Snow <jsnow@redhat.com>
Message-ID: <3ba44704-6418-4aee-23ad-7d4dcc1fe60d@redhat.com>
Date: Wed, 19 May 2021 17:49:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 7:05 PM, BALATON Zoltan wrote:
> On Tue, 18 May 2021, Philippe Mathieu-Daudé wrote:
>> IDE bus depends on ISA bus for IRQ/DMA.
>>
>> Add an ISABus reference in PCIIDEState, and add link properties
>> to it in the PIIX and VIA objects (which inherit PCI_IDE).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> include/hw/ide/pci.h |  1 +
>> hw/ide/piix.c        | 11 ++++++++++-
>> hw/ide/via.c         | 10 +++++++++-
>> 3 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>> index d8384e1c422..e790722ed14 100644
>> --- a/include/hw/ide/pci.h
>> +++ b/include/hw/ide/pci.h
>> @@ -47,6 +47,7 @@ struct PCIIDEState {
>>     PCIDevice parent_obj;
>>     /*< public >*/
>>
>> +    ISABus *isa_bus;
> 
> I'm not sure that this belongs here. Previously we managed to remove 
> device specific fields from this structure so it's now really just holds 
> stuff related to PCI IDE (except the remaining "secondary" field 
> specific to CMD646). PCI IDE normaly has nothing to do with ISA except 
> for those south bridges that have IDE with legacy mode. So this ISABus 
> reference should be in those south bridges instead. But that may need a 

by "those south bridges" I assume you are referring to the integrated 
PIIX and VIA controller implementations.

> new subclass just for this so putting it here is just avoiding 
> boilerplate of declaring new subclasses in piix and via-ide. I can 
> sympathise with that but I'd still prefer to keep it off here but I 
> wonder if there's a way to do that without subclassing and storing an 
> ISABus ref? If I understand correctly this ISABus ref is just needed to 
> get appropriate ISA irqs. But could we just store a ref to those irqs 

It looks like it's just the IRQs, yeah.

> directly so we don't need to keep the ref to the ISA bus? There's 

I think the idea actually is to formalize the dependency of these models 
on the ISA bus instead of hacking / faking one. I think we DO want the 
dependency.

> already a qemu_irq in BMDMAState but I'm not sure how those are set and 
> if you could store an isa irq there to simplify this. I don't know the 
> details and could not detangle it by a brief look so not sure it can be 
> done but conceptually it feels better to keep PCI IDE separate from ISA 
> and let it raise either PCI irq or ISA irq as needed. For that a ref to 
> the irq should be enough and that can either come from a PCI bus (which 
> is normaly expected for PCI IDE) or an ISA bridge for legacy modes. Hope 
> it makes sense and you get what I'm trying to say. (Longer term we may 
> want to make it changeable also after the device is created to allow 
> switching between legacy and PCI mode but so far we could get away 
> without emulating that so it's not a requirement just something to 
> consider when you're changing this. The real problem that prevents 
> switching modes is not irq I think but ioports and that ISA devices are 
> not configurable after creating them but that would need QOM'ifying ISA 
> emulation which probably does not worth the effort unless we come across 
> some guest that needs this.)
> 
> Regards,
> BALATON Zoltan
> 

I assume the idea here is that PCIIDE does not technically need "ISA" to 
provide ioport access to the ATA drives, so taxonomically it's odd for 
the generic/abstract PCIIDE device to require an ISA bus.

Am I understanding correctly?

>>     IDEBus bus[2];
>>     BMDMAState bmdma[2];
>>     uint32_t secondary; /* used only for cmd646 */
>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>> index b9860e35a5c..48da68da37f 100644
>> --- a/hw/ide/piix.c
>> +++ b/hw/ide/piix.c
>> @@ -30,8 +30,9 @@
>> #include "sysemu/block-backend.h"
>> #include "sysemu/blockdev.h"
>> #include "sysemu/dma.h"
>> -
>> +#include "qapi/error.h"
>> #include "hw/ide/pci.h"
>> +#include "hw/isa/isa.h"
>> #include "trace.h"
>>
>> static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
>> @@ -207,6 +208,12 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>>     }
>> }
>>
>> +static Property piix_ide_properties[] = {
>> +    DEFINE_PROP_LINK("isa-bus", PCIIDEState, isa_bus,
>> +                     TYPE_ISA_BUS, ISABus *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>> static void piix3_ide_class_init(ObjectClass *klass, void *data)
>> {
>> @@ -221,6 +228,7 @@ static void piix3_ide_class_init(ObjectClass 
>> *klass, void *data)
>>     k->class_id = PCI_CLASS_STORAGE_IDE;
>>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>     dc->hotpluggable = false;
>> +    device_class_set_props(dc, piix_ide_properties);
>> }
>>
>> static const TypeInfo piix3_ide_info = {
>> @@ -249,6 +257,7 @@ static void piix4_ide_class_init(ObjectClass 
>> *klass, void *data)
>>     k->class_id = PCI_CLASS_STORAGE_IDE;
>>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>     dc->hotpluggable = false;
>> +    device_class_set_props(dc, piix_ide_properties);
>> }
>>
>> static const TypeInfo piix4_ide_info = {
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index be09912b334..65fdca6dcf4 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -28,8 +28,9 @@
>> #include "hw/pci/pci.h"
>> #include "migration/vmstate.h"
>> #include "qemu/module.h"
>> +#include "qapi/error.h"
>> #include "sysemu/dma.h"
>> -
>> +#include "hw/isa/isa.h"
>> #include "hw/ide/pci.h"
>> #include "trace.h"
>>
>> @@ -210,6 +211,12 @@ static void via_ide_exitfn(PCIDevice *dev)
>>     }
>> }
>>
>> +static Property via_ide_properties[] = {
>> +    DEFINE_PROP_LINK("isa-bus", PCIIDEState, isa_bus,
>> +                     TYPE_ISA_BUS, ISABus *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> static void via_ide_class_init(ObjectClass *klass, void *data)
>> {
>>     DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -224,6 +231,7 @@ static void via_ide_class_init(ObjectClass *klass, 
>> void *data)
>>     k->revision = 0x06;
>>     k->class_id = PCI_CLASS_STORAGE_IDE;
>>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>> +    device_class_set_props(dc, via_ide_properties);
>> }
>>
>> static const TypeInfo via_ide_info = {
>>


