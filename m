Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1660F71D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:25:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1uN-0000kX-Q7; Thu, 27 Oct 2022 08:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oo1u6-00009r-Cl; Thu, 27 Oct 2022 08:22:36 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oo1ty-0004Bl-Ks; Thu, 27 Oct 2022 08:22:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CA43D74638A;
 Thu, 27 Oct 2022 14:22:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 83E5F74633D; Thu, 27 Oct 2022 14:22:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 81D3974632B;
 Thu, 27 Oct 2022 14:22:21 +0200 (CEST)
Date: Thu, 27 Oct 2022 14:22:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v4 00/19] Misc ppc/mac machines clean up
In-Reply-To: <CABLmASFGAS-ck2XN2FOTKqTB346UB_+j+BhpumhFj0eomAjp4A@mail.gmail.com>
Message-ID: <173f8ca1-78ff-5e37-46dd-d61c14fba064@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <CABLmASFGAS-ck2XN2FOTKqTB346UB_+j+BhpumhFj0eomAjp4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022, Howard Spoelstra wrote:
> I applied these patches and they seem to work as expected. I like the way
> this makes it clearer which machine is actually emulated, even though it is
> still not easy to understand which default hardware the emulated machine
> actually presents.

Thanks for the feed back and testing. The emulation is not perfect so 
there are some differences from the actual machines. These could be 
documented in qemu/docs/system/ppc/powermac.rst patches are welcome). Some 
of these are not yet implemented like sound or i2c (see: 
https://osdn.net/projects/qmiga/wiki/SubprojectMac99I2C and 
https://patchew.org/QEMU/cover.1593456926.git.balaton@eik.bme.hu/93758f65ef21d977fe835364bb1386fb4c03a6ce.1593456926.git.balaton@eik.bme.hu/ 
if anybody is interested to finish these) or some are missing due to 
OpenBIOS can't yet handle it like a PCI bridge on some PCI bus which was 
there in code commented out for a while but looks like it's gone now or I 
couldn't find it. But the presented hardware should be close enough to 
these machines for OSes and it also shows what machines we should aim for 
so it's not an undefined machine any more. The mac99 machine may not be an 
actual existing config, according to

http://macos9lives.com/smforum/index.php/topic,2408.msg28843.html?PHPSESSID=ce15448df7a74e13c82c59eedf624db7#msg28843

which says no Mac had Uninorth, Keylargo and CUDA, although this forum 
post may not list every machine, e.g. powermac1,2 (the first PCI Power Mac 
G4) according to <https://en.wikipedia.org/wiki/Power_Mac_G4> had CUDA but 
used Grackle (the same motherboard as the Blue&White G3 PowerMac 
powermac1,1 <https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)> )
but had no ADB ports so you could not have ADB keyboard and mouse attached 
to it like we have in mac99. The powermac1,2 is maybe more similar to 
g3beige but g3beige has old world ROM while the B&W G3 powermac1,1 is the 
first new world ROM machine but may have more differences I don't know 
about. (That also means maybe our naming mac_oldworld and mac_newworld is 
misleading but that's OK for now as it's only in the source code and not 
user visible.)

> I also like the more consistent way a new rom file for a VGA device can be
> added. The deprecation warnings are clear.

Some more info on this last ndrv via romfile patch: OpenBIOS has two ways 
to add an NDRV in the device tree for MacOS to a vga card:

1. It adds it in openbios/drivers/pci.c::vga_config_cb() if the ROM 
contains an NDRV

2. Then in vga-driver-fcode defined in vga.fs (that OpenBIOS 
unconditionally calls for vga devices it knows about) it also checks for a 
file called ndrv/qemu_vga.ndrv in fw_cfg and adds that to the device tree. 
The vga-ndrv? option controls this second way and defaults to true.

Problems with 2.

- The ndrv/qemu_vga.ndrv is added by the machine not the card so it will 
be used for other cards (liek ati-vga) that it shouldn't be used for and 
there's no good way to control or fix it other than the user having to set 
vga-ndrv? to false when adding -device ati-vga.

- It's too complex for no good reason so after my patch this could be 
dropped altogether simpifying the code both in QEMU and OpenBIOS.

My patch sets the default value for the romfile property of the VGA device 
to qemu_vga.ndrv instead so QEMU will put the ndrv in the ROM and OpenBIOS 
detects that and adds it to the property without going through fw_cfg (it 
still checks fw_cfg but since we don't add the ndrv there any more that 
part won't do anything so that can be dropped later from OpenBIOS together 
with the vga-ndrv? option. If you want to disable the ndrv with my patch 
you can use -device VGA,romfile="" instead which replaces the default with 
empty romfile so OpenBIOS won't find it neither in the ROM not in fw_cfg. 
Additionally you can pass a real FCode ROM or different NDRV the same way 
via romfile now without having to replace the file in QEMU install which 
might come handy for someone developing NDRVs or experimenting with ROMs 
or pass-thorugh. So I think this simple patch really helps users and makes 
the code overall simpler too.

> Qemu-system-ppc defaults to the g3beige machine, which does not reflect the
> (in my opinion) main use case of running Mac OS/X with the powermac3_1
> machine and will not boot the main versions of ppc Mac OS/X anyway.

We can't easily change the default wihtout breaking existing commands and 
it's also debatable what should be a new default so I think we're stuck 
with that now. In any case we need an at least 2 release long deprecation 
period so what we could do is to deprecare g3beige as the default to 
require users to always specify a machine option explicitly so we can do 
something with it in the future but I don't know how to add such warning, 
i.e. how to detect if g3beige was chosen via -M or by default. Maybe this 
warning should be issued by command line parsing not the g3beige board 
code? So I've only added warnings for the mac99 with via option and G5 CPU 
for now and left qemu-system-ppc -M mac99 and g3beige alone for now. If 
you think these also need some warnings added now then we should find out 
how and what should be done instead. I could not decide on those so opted 
for preserving backwards compatibility for these.

Regards,
BALATON Zoltan

> So for qemu-system-ppc:
>
> Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
>
> Best,
> Howard


