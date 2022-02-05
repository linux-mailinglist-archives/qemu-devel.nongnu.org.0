Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995364AAAB0
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 18:46:36 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGP8t-0003ND-Ft
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 12:46:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGP6A-0001hb-Cs; Sat, 05 Feb 2022 12:43:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:42836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGP66-00072m-QC; Sat, 05 Feb 2022 12:43:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D9F53745708;
 Sat,  5 Feb 2022 18:43:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6C522745706; Sat,  5 Feb 2022 18:43:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6A43F7456E3;
 Sat,  5 Feb 2022 18:43:38 +0100 (CET)
Date: Sat, 5 Feb 2022 18:43:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH] hw/ide: implement ich6 ide controller support
In-Reply-To: <61d057f7-e877-a8ff-1afc-1960902207e9@gmail.com>
Message-ID: <3f884dd8-277-b2c-33c4-8258ca8f41d3@eik.bme.hu>
References: <20220205111138.35194-1-liavalb@gmail.com>
 <65ad680-dc5a-6720-7ef4-84d3af3e4998@eik.bme.hu>
 <61d057f7-e877-a8ff-1afc-1960902207e9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2072304507-1644083018=:10548"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2072304507-1644083018=:10548
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Sat, 5 Feb 2022, Liav Albani wrote:
> On 2/5/22 17:48, BALATON Zoltan wrote:
>> On Sat, 5 Feb 2022, Liav Albani wrote:
>>> This type of IDE controller has support for relocating the IO ports and
>>> doesn't use IRQ 14 and 15 but one allocated PCI IRQ for the controller.
>> 
>> I haven't looked at in detail so only a few comments I've got while reading 
>> it. What machine needs this? In QEMU I think we only have piix and ich9 
>> emulated for pc and q35 machines but maybe ich6 is also used by some 
>> machine I don't know about. Otherwise it looks odd to have ide part of ich6 
>> but not the other parts of this chip.
>> 
> Hi BALATON,
>
> This is my first patch to QEMU and the first time I send patches over the 
> mail. I sent my github tree to John Snow (the maintainer of the IDE code in 
> QEMU) for advice if I should send them here and I was encouraged to do that.

Welcome and thanks a lot for taking time to contribute and share your 
results. In case you're not yet aware, these docs should explain how 
patches are handled on the list:

https://www.qemu.org/docs/master/devel/submitting-a-patch.html

> For the next time patch I'll put a note on writing a descriptive cover letter 
> as it could have put more valuable details on why I sent this patch.
>
> There's no such machine type emulating the ICH6 chipset in QEMU. However, I 
> wrote this emulation component as a test for the SerenityOS kernel because I 
> have a machine from 2009 which has
> an ICH7 southbridge, so, I wanted to emulate such device with QEMU to ease 
> development on it.
>
> I found out that Linux with libata was using the controller without any 
> noticeable problems, but the SerenityOS kernel struggled to use this device, 
> so I decided that
> I should send this patch to get it merged and then I can use it locally and 
> maybe other people will benefit from it.
>
> In regard to other components of the ICH6 chipset - I don't think it's worth 
> anybody's time to actually implement them as the ICH9 chipset is quite close 
> to what the ICH6 chipset offers as far as I can tell.
> The idea of implementing ich6-ide controller was to enable the option of 
> people like me and other OS developers to ensure their kernels operate 
> correctly on such type of device,
> which is legacy-free device in the aspect of PCI bus resource management but 
> still is a legacy device which belongs to chipsets of late 2000s.

That's OK, maybe a short mention (just one sentence) in the commit message 
explaining this would help to understand why this device model was added.

>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>> ---
>>> hw/i386/Kconfig          |   2 +
>>> hw/ide/Kconfig           |   5 +
>>> hw/ide/bmdma.c           |  83 +++++++++++++++
>>> hw/ide/ich6.c            | 211 +++++++++++++++++++++++++++++++++++++++
>>> hw/ide/meson.build       |   3 +-
>>> hw/ide/piix.c            |  50 +---------
>>> include/hw/ide/pci.h     |   5 +
>>> include/hw/pci/pci_ids.h |   1 +
>>> 8 files changed, 311 insertions(+), 49 deletions(-)
>>> create mode 100644 hw/ide/bmdma.c
>>> create mode 100644 hw/ide/ich6.c
>>> 
>>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>>> index d22ac4a4b9..a18de2d962 100644
>>> --- a/hw/i386/Kconfig
>>> +++ b/hw/i386/Kconfig
>>> @@ -75,6 +75,7 @@ config I440FX
>>>     select PCI_I440FX
>>>     select PIIX3
>>>     select IDE_PIIX
>>> +    select IDE_ICH6
>>>     select DIMM
>>>     select SMBIOS
>>>     select FW_CFG_DMA
>>> @@ -101,6 +102,7 @@ config Q35
>>>     select PCI_EXPRESS_Q35
>>>     select LPC_ICH9
>>>     select AHCI_ICH9
>>> +    select IDE_ICH6
>>>     select DIMM
>>>     select SMBIOS
>>>     select FW_CFG_DMA
>>> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
>>> index dd85fa3619..63304325a5 100644
>>> --- a/hw/ide/Kconfig
>>> +++ b/hw/ide/Kconfig
>>> @@ -38,6 +38,11 @@ config IDE_VIA
>>>     select IDE_PCI
>>>     select IDE_QDEV
>>> 
>>> +config IDE_ICH6
>>> +    bool
>>> +    select IDE_PCI
>>> +    select IDE_QDEV
>>> +
>>> config MICRODRIVE
>>>     bool
>>>     select IDE_QDEV
>>> diff --git a/hw/ide/bmdma.c b/hw/ide/bmdma.c
>>> new file mode 100644
>>> index 0000000000..979f5974fd
>>> --- /dev/null
>>> +++ b/hw/ide/bmdma.c
>>> @@ -0,0 +1,83 @@
>>> +/*
>>> + * QEMU IDE Emulation: PCI PIIX3/4 support.
>>> + *
>>> + * Copyright (c) 2003 Fabrice Bellard
>>> + * Copyright (c) 2006 Openedhand Ltd.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining 
>>> a copy
>>> + * of this software and associated documentation files (the "Software"), 
>>> to deal
>>> + * in the Software without restriction, including without limitation the 
>>> rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or 
>>> sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be 
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
>>> SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
>>> OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>>> ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
>>> IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/pci/pci.h"
>>> +#include "migration/vmstate.h"
>>> +#include "qapi/error.h"
>>> +#include "qemu/module.h"
>>> +#include "sysemu/block-backend.h"
>>> +#include "sysemu/blockdev.h"
>>> +#include "sysemu/dma.h"
>>> +
>>> +#include "hw/ide/pci.h"
>>> +#include "trace.h"
>>> +
>>> +uint64_t piix_bmdma_read(void *opaque, hwaddr addr, unsigned size)
>> 
>> Moving these functions to avoid duplication is a good idea but a couple of 
>> points:
>> 
>> - Maybe this should be a separate patch just for moving these out then 
>> another patch adding ich6 for easier review of separate changes.
>> 
> I don't mind splitting this patch into a couple of "commits" (or series of 
> diffs? I don't understand the terminology yet) so one "commit" will be a 
> preparation - extract the
> functions to a separate file, and the next diff can implement the ich6-ide 
> controller.

See the docs, which should explain how to split up patches and what should 
be in one patch. This would be a patch series then. As to where to move 
these functions or how to proceed with it wait for John Snow's reply as 
he's the maintainer of this part so what he prefers is the way to go. What 
I wrote is my opinion but others may have different views so give them a 
chance to reply too then once we see what to do you can send a v2 with the 
changes that seems to be the consensus on how to best proceed.

>> - There are already several bmdma_* functions in pci.c and you add these to 
>> pci.h so maybe these should be moved near there in pci.c instead. (Or more 
>> of those bmdma_* functions moved in this new file and add its own header?)
>> 
> I'm not sure what is the best approach but maybe the latter suggestion (new 
> file and its own header) seems quite good to me.
>> - This is not piix specific so the name probably should not say that. Maybe 
>> somthing along the lines of pci_default_read_config so bmdma_default_read 
>> or similar. In fact it also appears in via.c and a more complex version in 
>> cmd646.c which could still reuse functions like these like we do with pci 
>> config write. Converting those other two to use the newly split off 
>> functions instead of duplicating it could be done in a follow up patch, if 
>> you don't want to do that I may look at via-ide but a patch is welcome if 
>> you have time for that, unless others think otherwise and we'll take a 
>> different route.
>> 
> I want to create the best possible patch so if it's desirable to rename it to 
> something more generic, that's OK for me.
> I'd like to address some of the issues you mentioned (such as avoiding 
> duplicates in how we use bus master DMA in the ide code) in future patches 
> though, so if possible, let's keep it simple now :)

Sure, this could be done afterwards too just noted it when noticed there 
are other places that use similar functions so this is a possible clean 
up that should be easy to do either as an additional patch in this series 
or a separate one later.

Regards,
BALATON Zoltan

>>> 
>>> +static uint32_t ich6_pci_config_read(PCIDevice *d,
>>> +                                       uint32_t address, int len)
>>> +{
>>> +    return pci_default_read_config(d, address, len);
>>> +}
>> 
>> Why do you override this if you have nothing to do in it? Just use 
>> pci_default_read_config and only override ich6_pci_config_write where you 
>> actually has something to add to the default.
>> 
> You're right, I should not override this function. It was probably me trying 
> (I uploaded this patch to GitHub about 2 weeks ago so I don't remember 
> precisely) to override it for the sake of returning a value of 0x8000 when 
> the guest OS tries to figure out if the IDE channel is disabled or not in the 
> 0x40 and 0x42 registers in the PCI config space of the device.
>> Maybe also wait for a few days for other's comments (especially the 
>> maintainer's opinion on this) before sending a v2 so you get all comments 
>> and see what to do.
>> 
> Thank you very much for putting time into reviewing this! :)
>
> Best regards,
> Liav
>
>
--3866299591-2072304507-1644083018=:10548--

