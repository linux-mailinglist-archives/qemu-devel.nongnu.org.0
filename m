Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433524B36C0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 18:06:28 +0100 (CET)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIvqs-0004Mg-DJ
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 12:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIvnL-0000em-7b
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 12:02:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:57744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIvnH-0003o9-Sy
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 12:02:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A388074635C;
 Sat, 12 Feb 2022 18:02:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 81A34745708; Sat, 12 Feb 2022 18:02:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 809517456E3;
 Sat, 12 Feb 2022 18:02:40 +0100 (CET)
Date: Sat, 12 Feb 2022 18:02:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 4/5] isa/piix4: Fix PCI IRQ levels to be preserved in
 VMState
In-Reply-To: <CAFEAcA9BBFHH7eqzB_zW-VDZWuXDEkYUb=P1ocPn_UyaZZFZ3w@mail.gmail.com>
Message-ID: <c389b3a-bde6-9dae-557b-b8db541d1a@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-5-shentey@gmail.com>
 <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
 <CAFEAcA9BBFHH7eqzB_zW-VDZWuXDEkYUb=P1ocPn_UyaZZFZ3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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
Cc: =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Feb 2022, Peter Maydell wrote:
> On Sat, 12 Feb 2022 at 13:42, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> By the way the corresponding member in struct PIIXState in
>> include/hw/southbridge/piix.h has a comment saying:
>>
>>      /* This member isn't used. Just for save/load compatibility */
>>      int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>>
>> and only seems to be filled in piix3_pre_save() but never used. So what's
>> the point of this then? Maybe piix3 also uses a bitmap to store these
>> levels instead? There's a uint64_t pic_levels member above the unused
>> array but I haven't checked the implementation.
>
> I think what has happened here is that originally piix3 used
> the same implementation piix4 currently does -- where it stores
> locally the value of the (incoming) PCI IRQ levels, and then when it wants
> to know the value of the (outgoing) PIC IRQ levels it loops round
> to effectively OR together all the PCI IRQ levels for those PCI
> IRQs which are configured to that particular PIC interrupt.
>
> Then in commit e735b55a8c11 (in 2011) piix3 was changed to call
> pci_bus_get_irq_level() to get the value of a PCI IRQ rather than
> looking at its local cache of that information in the pci_irq_levels[]
> array. This is the source of the "save/load compatibility" thing --
> before doing a vmsave piix3_pre_save() fills in that field so that
> it appears in the outbound data stream and thus a migration from
> a new QEMU to an old pre-e735b55a8c11 QEMU will still work. (This
> was important at the time, but could probably be cleaned up now.)
>
> The next commit after that one is ab431c283e7055bcd, which
> is an optimization that fixes the equivalent of the "XXX: optimize"
> marker in the gt64120_pci_set_irq()/piix4 code -- this does
> something slightly more complicated involving the pic_levels
> field, in order to avoid having to do the "loop over all the
> PCI IRQ levels" whenever it needs to set/reset a PIC interrupt.
>
> We could pick up one or both (or none!) of these two changes
> for the piix4 code. (If we're breaking migration compat anyway
> we wouldn't need to include the save-load compat part of
> the first change.)

I'm not sure I fully get this. Currently (before this series) PIIX4State 
does not seem to have any fields to store irq state (in hw/isa/piix4.c):

struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;

     RTCState rtc;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
};

Patch 1 in this series introduces that by moving it from MaltaState. Then 
we could have a patch 2 to clean it up and change to the way piix3 does it 
and skip introducing the saving of this array into the migration state. It 
may still break migration but not sure if MaltaState was saved already so 
this may be already missing from migration anyway and if we do the same as 
piix3 then maybe we don't need to change the piix4 state either (as this 
is saved as part of the PCIHost state?) but I don't know much about this 
so maybe I'm wrong.

In any case PIIX3 and PIIX4 state seem to be different so there's no 
reason to worry aobut compatibility between them. It's just confusing that 
there's a common piix.h which defines a PIIXState that looks like it could 
be common but maybe it's not used by PIIX4 but only by PIIX3 or I've 
missed something as I've only looked at this briefly.

Regards,
BALATON Zoltan

