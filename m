Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7740E1B6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:52:25 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQucZ-0002ga-Ou
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mQuay-0001oa-F0
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 12:50:44 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:40287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mQuau-0002hf-KW
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 12:50:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A295A7462D3;
 Thu, 16 Sep 2021 18:50:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 710C27457EE; Thu, 16 Sep 2021 18:50:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6F554745708;
 Thu, 16 Sep 2021 18:50:37 +0200 (CEST)
Date: Thu, 16 Sep 2021 18:50:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 12/20] nubus: move nubus to its own 32-bit address space
In-Reply-To: <129c6752-11af-8139-2b34-8738a57a3db2@ilande.co.uk>
Message-ID: <1d7dd0e1-b892-d69d-3c9-568d9f945b@eik.bme.hu>
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-13-mark.cave-ayland@ilande.co.uk>
 <cd70aa7-1c56-e51f-2395-45e5787580@eik.bme.hu>
 <129c6752-11af-8139-2b34-8738a57a3db2@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1024379279-1631811037=:41161"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1024379279-1631811037=:41161
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 16 Sep 2021, Mark Cave-Ayland wrote:
> On 16/09/2021 13:48, BALATON Zoltan wrote:
>
>> On Thu, 16 Sep 2021, Mark Cave-Ayland wrote:
>>> According to "Designing Cards and Drivers for the Macintosh Family" the 
>>> Nubus
>>> has its own 32-bit address space based upon physical slot addressing.
>>> 
>>> Move Nubus to its own 32-bit address space and then use memory region 
>>> aliases
>>> to map available slot and super slot ranges into the q800 system address
>>> space via the Macintosh Nubus bridge.
>>> 
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> hw/m68k/q800.c                      |  8 +++-----
>>> hw/nubus/mac-nubus-bridge.c         | 15 +++++++++++++--
>>> hw/nubus/nubus-bus.c                | 18 ++++++++++++++++++
>>> hw/nubus/nubus-device.c             |  2 +-
>>> include/hw/nubus/mac-nubus-bridge.h |  2 ++
>>> include/hw/nubus/nubus.h            | 10 +++++++---
>>> 6 files changed, 44 insertions(+), 11 deletions(-)
>>> 
>>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>>> index 5ba87f789c..0a0051a296 100644
>>> --- a/hw/m68k/q800.c
>>> +++ b/hw/m68k/q800.c
>>> @@ -67,9 +67,6 @@
>>> #define ASC_BASE              (IO_BASE + 0x14000)
>>> #define SWIM_BASE             (IO_BASE + 0x1E000)
>>> 
>>> -#define NUBUS_SUPER_SLOT_BASE 0x60000000
>>> -#define NUBUS_SLOT_BASE       0xf0000000
>>> -
>>> #define SONIC_PROM_SIZE       0x1000
>>> 
>>> /*
>>> @@ -396,8 +393,9 @@ static void q800_init(MachineState *machine)
>>> 
>>>     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
>>>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, NUBUS_SUPER_SLOT_BASE);
>>> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE);
>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
>>> +                                            9 * NUBUS_SLOT_SIZE);
>>> 
>>>     nubus = MAC_NUBUS_BRIDGE(dev)->bus;
>>> 
>>> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
>>> index c1d77e2bc7..574bc7831e 100644
>>> --- a/hw/nubus/mac-nubus-bridge.c
>>> +++ b/hw/nubus/mac-nubus-bridge.c
>>> @@ -21,8 +21,19 @@ static void mac_nubus_bridge_init(Object *obj)
>>>     /* Macintosh only has slots 0x9 to 0xe available */
>>>     s->bus->slot_available_mask = MAKE_64BIT_MASK(9, 6);
>>> 
>>> -    sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>>> -    sysbus_init_mmio(sbd, &s->bus->slot_io);
>>> +    /* Aliases for slots 0x9 to 0xe */
>>> +    memory_region_init_alias(&s->super_slot_alias, obj, 
>>> "super-slot-alias",
>>> +                             &s->bus->nubus_mr,
>>> +                             9 * NUBUS_SUPER_SLOT_SIZE,
>>> +                             6 * NUBUS_SUPER_SLOT_SIZE);
>> 
>> Sorry for not spotting it yesterday in v2 but I only had time to have a 
>> closer look now. Do these 9 and 6 worth a #define? Are these something like 
>> MAC_FIST_SLOT and MAC_NUM_SLOTS? As they maybe always appear together with 
>> NUBUS_SUPER_SLOT_SIZE (I haven't checked all but most look like that) so 
>> those products could have a #define just to make it shorter in these calls. 
>> (Are those the #defines that you've removed above?) Maybe
>> 
>> #define MAC_FIRST_SLOT 9
>> #define MAC_NUM_SLOTS  6
>> 
>> then use these to
>> 
>> #define MAC_SLOTS_MASK  MAKE_64BIT_MASK(MAC_FIRST_SLOT, MAC_NUM_SLOTS)
>> 
>> and similarly the memory address and size as
>> 
>> #define MAC_SLOT_BASE  9 * NUBUS_SUPER_SLOT_SIZE #define MAC_SLOT_SIZE  6 * 
>> NUBUS_SUPER_SLOT_SIZE
>> 
>> or so and then use these latter three where they appear now open coded 
>> could be shorter and clearer but I don't mind either way so if you want to 
>> keep the current version that's OK with me as well. (I may have got the 
>> names for these wrong but hopefully you get the idea, I haven't tried to 
>> understand in detail what these really are.)
>> 
>> Regards,
>> BALATON Zoltan
>
> I'm not amazingly sold on this since it introduces another layer of 
> indirection: in its current form you can immediately correlate all of mask, 
> offset, and size with the comment without having to look up another set of 
> constants first.

As I said I'm OK with it as it as too.

Regards,
BALATON Zoltan
--3866299591-1024379279-1631811037=:41161--

