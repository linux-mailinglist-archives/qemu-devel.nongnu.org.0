Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B6678CB2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6yi-0002ay-T6; Mon, 23 Jan 2023 19:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK6yg-0002aM-T5; Mon, 23 Jan 2023 19:15:54 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pK6yd-0004Nv-PW; Mon, 23 Jan 2023 19:15:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9C9CF746377;
 Tue, 24 Jan 2023 01:13:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 73E94746376; Tue, 24 Jan 2023 01:13:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 72EF674635C;
 Tue, 24 Jan 2023 01:13:23 +0100 (CET)
Date: Tue, 24 Jan 2023 01:13:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 3/7] mac_{old,new}world: Pass MacOS VGA NDRV in card
 ROM instead of fw_cfg
In-Reply-To: <3da914a8-ca58-e578-ae8d-0a82b28a6cbf@ilande.co.uk>
Message-ID: <f245ead8-2ff8-55eb-3884-01e8d791d672@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <e8d6aa41eeb0461d285fa4c12e0fff05d366e8fa.1672868854.git.balaton@eik.bme.hu>
 <8e775600-f394-0e9c-9ee9-15dd635275e9@ilande.co.uk>
 <a7d27169-97fd-2cb2-e6d1-a050dbf76e30@eik.bme.hu>
 <78fff8b3-d1c1-74ec-94bf-8d5ae220c4e2@ilande.co.uk>
 <8ef24b01-534a-fd8f-ad99-abebff6197c8@eik.bme.hu>
 <3da914a8-ca58-e578-ae8d-0a82b28a6cbf@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 23 Jan 2023, Mark Cave-Ayland wrote:
> On 22/01/2023 22:16, BALATON Zoltan wrote:
>>> The problem you are ultimately trying to solve though is that OpenBIOS is 
>>> loading the NDRV for all VGA PCI devices, so why not just fix 
>>> drivers/vga.fs so that the NDRV is loaded only for the QEMU VGA device?
>>> 
>>>> So this patch neither adds new dependency to QEMU nor repends on any 
>>>> change in OpenBIOS. It just gets rid of passing files via fw_cfg.
>>> 
>>> Unfortunately that still doesn't solve the problem of building a 
>>> self-contained OpenBIOS ROM, so this patch isn't the right way forward.
>> 
>> It does take a step to make it possible to eventually add a self contained 
>> ROM and remove the vga.fs from OpenBIOS but it's not doing that fully. It 
>> just simplifies QEMU and OpenBIOS vga.fs for now and making the ROM also 
>> contain the FCode will be a further step but we can't get there if you 
>> don't allow to make smaller steps or don't merge my patches for OpenBIOS 
>> which would allow it to run FCode ROMs. If you're waiting for all this to 
>> be finished I'll give up and it will never be finished. If you allow to 
>> progress in smaller steps then maybe we'll get there.
>
> You can already add a self-contained rom using the romfile= property, so 
> that's not preventing you from doing anything though? Even once OpenBIOS can

Except that OpenBIOS will break the device tree by adding the 
qemu_vga.ndrv to the video card node so the card rom I pass via romfile 
will see it's already there and won't install its owm. Then MacOS will try 
to use the wrong driver and it does not work and I spend a lot of time to 
find out I also need -prom env vga-ndrv?=false to avoid this problem which 
I always forget and somebody trying this for the first time won't even 
know.

What's more, all this complication is not needed. With this patch 
everything works as before for std VGA as it will have the qemu_vga.ndrv 
as its romfile but ati-vga won't so OpenBIOS only installs it for std VGA 
without adding anything to OpenBIOS to handle this. Adding a romfile to 
ati-vga will work without further hassle and the romfile option can also 
be used to replace or disable the qemu_vga.ndrv for std VGA as -device 
VGA,romdile="" (or add your FCode in development here). Due to the way 
standard VGA works adding -device VGA,romfile= to the command line won't 
add a second VGA device just set the option for the default one (actually 
it omits the default and adds the specified one but the point is this 
just works).

Then we not only not need to add anythig to OpenBIOS but we can drop the 
vga-ndrv? option (which does not exist on real machines anyway) and also 
all the code in vga.fs to get the driver from fw_cfg so simplifying it 
leaving only the code which will eventually need to be part of the FCode 
ROM. Once this patch is accepted it fixes the above problem and allows to 
simplify OpenBIOS later and when we're there you just have to replace 
qemu_vga.ndrv with the version that prepends the FCode from vga.fs before 
it so I don't see what's your problem with this patch. Can you give a 
reason why it can't be accepted?

> read PCI option ROMs, the option ROM will still need to contain OpenBIOS's 
> vga.fs as a payload, and it will still need to be able to inject 
> qemu_vga.ndrv because OpenBIOS cannot have an external dependency upon 
> QemuMacDrivers.

The way real card ROMs work is that they embed the driver binary and have 
some FCode that adds that to the device tree. It should be the same for 
QEMU emulated cards so if you say that you want only vga.fs as the card 
ROM which then downloads the qemu_vga.ndrv from QEMU that makes no sense 
at all. Currently the qemu_vga.ndrv is build from QemuMacDrivers and added 
as a binary to QEMU. You can add it as a binary the same way to OpenBIOS 
then build the FCOde ROM from vga.fs and qemu_vga.ndrv bin that results in 
the FCode ROM that will replace qemu_vga.ndrv binaty in QEMU. You just say 
this is not possible because you're OK with adding the qemu_vga,ndrv 
binary to QEMU but doing the same with OpenBIOS cannot be done?

Regards,
BALATON Zoltan

