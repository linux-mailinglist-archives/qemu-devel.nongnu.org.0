Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E852EE640
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:39:19 +0100 (CET)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxb7u-0007gy-9l
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxb6f-0006sT-Lr; Thu, 07 Jan 2021 14:38:01 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxb6c-0004Ca-EJ; Thu, 07 Jan 2021 14:38:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 64A3C7470F7;
 Thu,  7 Jan 2021 20:37:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1B4B47470F4; Thu,  7 Jan 2021 20:37:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 196BC7470DF;
 Thu,  7 Jan 2021 20:37:52 +0100 (CET)
Date: Thu, 7 Jan 2021 20:37:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/3] sam460ex: Use type cast macro instead of simple cast
In-Reply-To: <20210107121304.1db97130@bahia.lan>
Message-ID: <9060766a-f159-c7c3-f7e-c2b5f2d41e24@eik.bme.hu>
References: <cover.1609946641.git.balaton@eik.bme.hu>
 <8bc87f574759a3e9e9e8707b1e0947c1ee21fa8c.1609946641.git.balaton@eik.bme.hu>
 <20210107090815.12cc73fd@bahia.lan>
 <201f883b-c4f2-88f1-24fa-b1759d2c849d@eik.bme.hu>
 <20210107121304.1db97130@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 BALATON Zoltan via <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021, Greg Kurz wrote:
> On Thu, 7 Jan 2021 10:45:26 +0100
> BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> On Thu, 7 Jan 2021, Greg Kurz wrote:
>>> On Wed, 6 Jan 2021 16:24:01 +0100
>>> BALATON Zoltan via <qemu-ppc@nongnu.org> wrote:
>>>
>>>> Use the PCI_BUS type cast macro to convert result of
>>>> qdev_get_child_bus(). Also remove the check for NULL afterwards which
>>>> should not be needed because sysbus_create_simple() uses error_abort
>>>
>>> It seems to me that sysbus_create_simple() doesn't return NULL because
>>> it ends up calling object_new_with_type(). This allocates the object
>>> with either g_malloc() or qemu_memalign(), both of which abort on
>>> failure.
>>>
>>>> and PCI_BUS macro also checks its argument by default so this
>>>
>>> AFAICT, PCI_BUS() and all other instance type checking macros are
>>> happy with a NULL argument. They simply return NULL in this case.
>>
>> This wasn't my experience when I've got an error in code and got a NULL
>> pointer here (on pegasos2 board but same situation). At least with
>> qom-debug enabled (which I think is on by default unless explicitly
>> disabled in configure) this will abort if the object is not the right
>> type.
>>
>
> You're right that qom-cast-debug is enabled by default and that it
> causes object_dynamic_cast_assert() to abort on type mismatch, but
> definitely not with a NULL value, as mentioned in this very old
> commit:

Indeed, PCI_BUS(NULL) does not abort just returns NULL. I think I 
remembered wrong and had dev==NULL so qdev_get_child_bus() was aborting.

> commit b7f43fe46029d8fd0594cd599fa2599dcce0f553
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Fri Nov 23 16:56:17 2012 +0100
>
>    qom: dynamic_cast of NULL is always NULL
>
>    Trying to cast a NULL value will cause a crash.  Returning
>    NULL is also sensible, and it is also what the type-unsafe
>    DO_UPCAST macro does.
>
>    Reported-by: Markus Armbruster <armbru@redhat.com>
>    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
>
> Maybe this should be documented in the function header in "qom/object.h".
>
>>>> shouldn't fail here.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>  hw/ppc/sam460ex.c | 7 ++-----
>>>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>>>> index 14e6583eb0..cc67e9c39b 100644
>>>> --- a/hw/ppc/sam460ex.c
>>>> +++ b/hw/ppc/sam460ex.c
>>>> @@ -384,11 +384,8 @@ static void sam460ex_init(MachineState *machine)
>>>>      ppc460ex_pcie_init(env);
>>>>      /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
>>>>      dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
>>>> -    pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>>>> -    if (!pci_bus) {
>>>> -        error_report("couldn't create PCI controller!");
>>>> -        exit(1);
>>>> -    }
>>>> +    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci.0"));
>>>> +
>>>
>>> But PCI_BUS() is being passed qdev_get_child_bus(dev, "pci.0"), not
>>> dev... so the real question here is whether this can return NULL
>>> or not. And if this happens, is this a (1) user or (2) programming
>>> error ?
>>>
>>> If (1) then the "if (!pci_bus) { }" should be kept. If (2) then
>>> it should be converted to an assert().
>>
>> I think it can only fail if the ppc440-pcix-host type is changed to not
>> have a pci.0 child any more which is a programming error that's very
>> unlikely to happen but if needed an assert could be added but I don't
>> think that's really necessary. The error_report was definitely not needed
>> as it's not a user error in any case.
>>
>
> I was also thinking about a programming error. Whether to add an assert()
> or not is up to you, you're the maintainer for this code :)

In that case I think I keep it simple and don't add an assert because I 
think this error is highly unlikely (we create a pci host object that 
should have a pci bus child) and it would crash anyway shortly when trying 
to add devices so an additional assert here does not seem to help much 
catching a bug.

Regards,
BALATON Zoltan

