Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC158BB8E
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 17:20:02 +0200 (CEST)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKi4O-0003us-9V
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 11:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKi2i-0002UK-BC
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 11:18:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:53761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKi2f-0008N4-7w
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 11:18:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F3AFE74633F;
 Sun,  7 Aug 2022 17:18:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8081A746307; Sun,  7 Aug 2022 17:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7E509745702;
 Sun,  7 Aug 2022 17:18:09 +0200 (CEST)
Date: Sun, 7 Aug 2022 17:18:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Elliot Nunn <elliot@nunn.io>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 kraxel@redhat.com, hsp.cat7@gmail.com
Subject: Re: VGA hardware cursor query
In-Reply-To: <939C7085-9CA8-426B-A00B-DD059F845161@nunn.io>
Message-ID: <8d243637-e124-b7ae-f758-fe7cdf37ff4@eik.bme.hu>
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
 <4513db25-fc55-5884-f345-36d1510ff175@ilande.co.uk>
 <939C7085-9CA8-426B-A00B-DD059F845161@nunn.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 7 Aug 2022, Elliot Nunn wrote:
>>> I want to give Mac OS 9 clients access to hardware cursor support, to improve
>>> responsiveness in absolute-cursor mode.
>>> Would it be acceptable to add a hardware cursor interface to the VGA device?
>>> And if so, can anyone advise on an appropriate register layout?
>>> This is an example of such a patch. Because it alters the Bochs VBE interface
>>> it is ONLY an example, NOT fit for acceptance. I have omitted the changes to
>>> the binary driver qemu_vga.ndrv.
>>> Kind regards,
>>> Elliot Nunn
>> Nice work! Have you been in contact with the Bochs developers to see 
>> what their thoughts are to your proposed changes? Generally QEMU 
>> prefers to implement documented specifications, so this would be the 
>> best route to go.
>
> Thanks! I don't think it would be appropriate to update the Bochs 
> standard with a feature that they don't use. And on reflection, perhaps 
> the compatibility-oriented VGA device is big enough already.
>
> My plan is to write a Mac OS 9/X "ndrv" targeting virtio-gpu. All going 
> this well, this might become the default mac99 GPU until ati-vga is 
> ready.

Once you have a full virtio driver there's likely not much reason to use 
ati-vga as virtio-gpu should be better with no legacy stuff that ati-vga 
has to emulate which may limit its performance and make it more complex 
than it could be without all those compatibility layers. The ati-vga 
approach is good if you have a legacy guest which already has an ATI 
driver but can't or don't want to write a new driver for it. If you can 
write a new guest driver then you could put the effort there and target 
virtio instead. Both ways are probably a lot of work, virtio might give 
better end results but will be specific to the guests you write the driver 
for while ati-vga would be usable for all guests without needing to change 
them. Since I have three Amiga like guests of which two are closed source 
and no published driver API the best option for me was ati-vga but for Mac 
OS virtio might be a good option if somebody puts in the needed effort.

> But virtio-gpu is not compiled into qemu-system-ppc by default. What is 
> the difference between CONFIG_VIRTIO_(GPU|PCI|VGA)? And is 
> configs/devices/ppc-softmmu/default.mak the correct place to declare 
> them?

Probably Gerd can provide better advice but in my (very limited) 
understanding the difference between them is what interfaces do they 
provide. VIRTIO_GPU is likely the base which selected by the other two. 
This plain device needs some way to let the guest know about it (could use 
some firware specific way and then the devices tree for example) but 
there's a more standard way: the PCI one appears to the guest as a PCI 
device so it can detect/configure it via standard methods it already 
knows. The VGA one also has VGA compatibility so you don't need a firmware 
driver but can boot it as a normal VGA device then your driver can switch 
it into virtio mode once the guest started. Maybe you can start with this 
last one then see if it can be simplified later or works well enough.

Here are some info I've found that may help to get started:

https://www.linux-kvm.org/images/0/09/Qemu-gfx-2016.pdf
https://www.studiopixl.com/2017-08-27/3d-acceleration-using-virtio.html

The course of action to follow in my opinion might be:

1. Get vitio-vga to compile with mac99
2. Try if guest still boots with it (due to the VGA compatibility it 
probably should but won't use the virtio part yet)
3. Start writing the driver so that it detects the card but does nothing 
with it yet
4. Enhance the driver so it can switch the card in virtio mode and can 
communicate with it
5. Set up framebuffer and hwcutsor via virtio and get some basic graphics 
going
6. Add 2D accel if applicable
7. Explore adding 3D support (this is far away yet, maybe don't even 
consider it before all the above steps to cut down complexity; even if 
this is the final goal the basis should be there first so concentrate on 
those now).

But you know better what and how you want to do, I just shared my thoughts 
in the hope it might be useful. If not you're free to ignore it.

Regards,
BALATON Zoltan

