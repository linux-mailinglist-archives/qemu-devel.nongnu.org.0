Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36E5A80FC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:12:47 +0200 (CEST)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTPOY-0002RR-5I
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTPMW-0007dB-CW; Wed, 31 Aug 2022 11:10:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:42916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTPMT-0004uZ-Ee; Wed, 31 Aug 2022 11:10:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 965B67470B9;
 Wed, 31 Aug 2022 17:10:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 579CA746E07; Wed, 31 Aug 2022 17:10:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5616D746396;
 Wed, 31 Aug 2022 17:10:32 +0200 (CEST)
Date: Wed, 31 Aug 2022 17:10:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: BB <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 05/10] hw/isa/vt82c686: Instantiate IDE function in
 host device
In-Reply-To: <132A9DC6-304A-4CAD-BCF5-C032C2942961@gmail.com>
Message-ID: <b53a6889-bcdf-af49-67f7-fa2874f45736@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-6-shentey@gmail.com>
 <4518c58f-7f54-2693-ed7b-1125bad1623@eik.bme.hu>
 <132A9DC6-304A-4CAD-BCF5-C032C2942961@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Wed, 31 Aug 2022, BB wrote:
> Am 31. August 2022 15:12:26 MESZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>>> The IDE function is closely tied to the ISA function (e.g. the IDE
>>> interrupt routing happens there), so it makes sense that the IDE
>>> function is instantiated within the south bridge itself.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> configs/devices/mips64el-softmmu/default.mak |  1 -
>>> hw/isa/Kconfig                               |  1 +
>>> hw/isa/vt82c686.c                            | 17 +++++++++++++++++
>>> hw/mips/fuloong2e.c                          |  8 ++++----
>>> hw/ppc/Kconfig                               |  1 -
>>> hw/ppc/pegasos2.c                            |  9 ++++-----
>>> 6 files changed, 26 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
>>> index c610749ac1..d5188f7ea5 100644
>>> --- a/configs/devices/mips64el-softmmu/default.mak
>>> +++ b/configs/devices/mips64el-softmmu/default.mak
>>> @@ -1,7 +1,6 @@
>>> # Default configuration for mips64el-softmmu
>>>
>>> include ../mips-softmmu/common.mak
>>> -CONFIG_IDE_VIA=y
>>> CONFIG_FULOONG=y
>>> CONFIG_LOONGSON3V=y
>>> CONFIG_ATI_VGA=y
>>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>>> index d42143a991..20de7e9294 100644
>>> --- a/hw/isa/Kconfig
>>> +++ b/hw/isa/Kconfig
>>> @@ -53,6 +53,7 @@ config VT82C686
>>>     select I8254
>>>     select I8257
>>>     select I8259
>>> +    select IDE_VIA
>>>     select MC146818RTC
>>>     select PARALLEL
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 37e37b3855..9d946cea54 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -17,6 +17,7 @@
>>> #include "hw/isa/vt82c686.h"
>>> #include "hw/pci/pci.h"
>>> #include "hw/qdev-properties.h"
>>> +#include "hw/ide/pci.h"
>>> #include "hw/isa/isa.h"
>>> #include "hw/isa/superio.h"
>>> #include "hw/intc/i8259.h"
>>> @@ -544,6 +545,7 @@ struct ViaISAState {
>>>     qemu_irq cpu_intr;
>>>     qemu_irq *isa_irqs;
>>>     ViaSuperIOState via_sio;
>>> +    PCIIDEState ide;
>>> };
>>>
>>> static const VMStateDescription vmstate_via = {
>>> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
>>>     }
>>> };
>>>
>>> +static void via_isa_init(Object *obj)
>>> +{
>>> +    ViaISAState *s = VIA_ISA(obj);
>>> +
>>> +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>> +}
>>> +
>>> static const TypeInfo via_isa_info = {
>>>     .name          = TYPE_VIA_ISA,
>>>     .parent        = TYPE_PCI_DEVICE,
>>>     .instance_size = sizeof(ViaISAState),
>>> +    .instance_init = via_isa_init,
>>
>> Did you verify this is actually called? I guess you could add a debug printf in the init method above or check the output of info qom-tree to see if ide apears below via-isa. I'm not sure because I think QOM does not call superclass methods if you override them, that's why the subclass realize methods called via_isa_realize before. In this case it may not cause a problem because ide-via does not have an init method so it will work with just realize called so the only effect may be that qom-tree is not like it should be. Or if this is called then I still don't get QOM.
>
> We discussed the semantics of init() vs. realize() when discussing patch 
> 1 in v1 which consolidates realize() methods. My understanding is that 
> init() behaves like C++ constructors which are called implicitly parent 
> first, child next. OTOH realize() methods behave like virtual methods 
> which get replaced by the most specific one, i.e. one needs to call the 
> parent implementation explicitly.

Indeed, it seems object_init inits all parents recursively. This is a bit 
confusing and maybe not well ecplained in docs/devel/qom.rst at least it 
does not mention instance init func or I missed it but not sure how this 
could be clarified.

Regards,
BALATON Zoltan

