Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9238DC14
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 19:10:35 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkrcX-0007px-VQ
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 13:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkrba-00074W-G4; Sun, 23 May 2021 13:09:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:32624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkrbX-00053Z-Bz; Sun, 23 May 2021 13:09:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3A4B2745709;
 Sun, 23 May 2021 19:09:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BD577745708; Sun, 23 May 2021 19:09:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BBC2E7456B4;
 Sun, 23 May 2021 19:09:26 +0200 (CEST)
Date: Sun, 23 May 2021 19:09:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
Message-ID: <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 23 May 2021, BALATON Zoltan wrote:
> On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
>> One thing to note about PCI is that normally I think the client expects the 
>> firmware to do PCI probing and SLOF does it. But VOF does not and Linux 
>> scans PCI bus(es) itself. Might be a problem for you kernel.
>
> I'm not sure what info does MorphOS get from the device tree and what it 
> probes itself but I think it may at least need device ids and info about the 
> PCI bus to be able to access the config regs, after that it should set the 
> devices up hopefully. I could add these from the board code to device tree so 
> VOF does not need to do anything about it. However I'm not getting to that 
> point yet because it crashes on something that it's missing and couldn't yet 
> find out what is that.
>
> I'd like to get Linux working now as that would be enough to test this and 
> then if for MorphOS we still need a ROM it's not a problem if at least we can 
> boot Linux without the original firmware. But I can't make Linux open a 
> serial console and I don't know what it needs for that. Do you happen to 
> know? I've looked at the sources in Linux/arch/powerpc but not sure how it 
> would find and open a serial port on pegasos2. It seems to work with the 
> board firmware and now I can get it to boot with VOF but then it does not 
> open serial so it probably needs something in the device tree or expects the 
> firmware to set something up that we should add in pegasos2.c when using VOF.

I've now found that Linux uses rtas methods read-pci-config and 
write-pci-config for PCI access on pegasos2 so this means that we'll 
probably need rtas too (I hoped we could get away without it if it were 
only used for shutdown/reboot or so but seems Linux needs it for PCI as 
well and does not scan the bus and won't find some devices without it).

While VOF can do rtas, this causes a problem with the hypercall method 
using sc 1 that goes through vhyp but trips the assert in ppc_store_sdr1() 
so cannot work after guest is past quiesce. So the question is why is that 
assert there and would using sc 1 for hypercalls on pegasos2 cause other 
problems later even if the assert could be removed? Can somebody who knows 
more about it explain this please? If this cannot be resolved then we may 
need a different hypercall method on pegasos2 (I've considered MOL OSI or 
are there other options? I may use some advice from people who know it 
better, especially the possible interaction with KVM later as the long 
term goal with pegasos2 is to be able to run with KVM on PPC hardware 
eventually.) But this also means that if that assert cannot be dropped or 
there may be other problems with sc 1 hypercalls then we maybe cannot have 
the same vof.bin and we'll need a separate version that I would like to 
avoid if possible so if there's a simple way to keep it working or make 
vof.bin use alternate hypercall method without needing a separate binary 
that would be the direction I'd tend to go. Even if we need a seoarate 
version I'd like to keep as much common as possible.

I've tested that the missing rtas is not the reason for getting no output 
via serial though, as even when disabling rtas on pegasos2.rom it boots 
and I still get serial output just some PCI devices are not detected (such 
as USB, the video card and the not emulated ethernet port but these are 
not fatal so it might even work as a first try without rtas, just to boot 
a Linux kernel for testing it would be enough if I can fix the serial 
output). I still don't know why it's not finding serial but I think it may 
be some missing or wrong info in the device tree I generat. I'll try to 
focus on this for now and leave the above rtas question for later.

Regards,
BALATON Zoltan

