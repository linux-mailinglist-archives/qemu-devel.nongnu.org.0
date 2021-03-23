Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A73346DC7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:16:24 +0100 (CET)
Received: from localhost ([::1]:56960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqG7-0001Ow-CZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOqDx-0007jo-Eg; Tue, 23 Mar 2021 19:14:09 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:21056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOqDt-0004lY-JJ; Tue, 23 Mar 2021 19:14:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4E4147462BD;
 Wed, 24 Mar 2021 00:13:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 16E1A74581E; Wed, 24 Mar 2021 00:13:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1301C7456E3;
 Wed, 24 Mar 2021 00:13:57 +0100 (CET)
Date: Wed, 24 Mar 2021 00:13:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 1/8] vt82c686: Implement control of serial port io
 ranges via config regs
In-Reply-To: <ef7a0bc6-3150-2f16-492f-5138fcee0b52@ilande.co.uk>
Message-ID: <46fd3c7b-3211-47d7-ac1c-b82d322f52f6@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <8cf90aad5a9fce1a20cbf49e4ef71c51ba04faed.1615345138.git.balaton@eik.bme.hu>
 <a112d264-7540-9e4b-bc10-fe8e4518d828@eik.bme.hu>
 <ef7a0bc6-3150-2f16-492f-5138fcee0b52@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021, Mark Cave-Ayland wrote:
> On 23/03/2021 12:54, BALATON Zoltan wrote:
>> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>>> In VIA super south bridge the io ranges of superio components
>>> (parallel and serial ports and FDC) can be controlled by superio
>>> config registers to set their base address and enable/disable them.
>>> This is not easy to implement in QEMU because ISA emulation is only
>>> designed to set io base address once on creating the device and io
>>> ranges are registered at creation and cannot easily be disabled or
>>> moved later.
>>> 
>>> In this patch we hack around that but only for serial ports because
>>> those have a single io range at port base that's relatively easy to
>>> handle and it's what guests actually use and set address different
>>> than the default.
>>> 
>>> We do not attempt to handle controlling the parallel and FDC regions
>>> because those have multiple io ranges so handling them would be messy
>>> and guests either don't change their deafult or don't care. We could
>>> even get away with disabling and not emulating them, but since they
>>> are already there, this patch leaves them mapped at their default
>>> address just in case this could be useful for a guest in the future.
>>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> 
>> Could this patch be reviewed now please? I've dropped it from later 
>> versions to avoid this holding back the series but now that it won't be in 
>> 6.0 I'd like to go back to this. This is implementing the behaviour of the 
>> real hardware better than the unsettable default value we have as a 
>> replacement. That approach also works for the guests I've tried (MorphOS 
>> and Linux) but if we can do better than why not do it?
>
> Do bear in mind that several people have already looked at this patch and 
> haven't felt comfortable enough to review it, and I've also said in a

I haven't heard back from many people (mostly only Philippe and you and 
maybe David looked at it but I did not expect him to review it as it's not 
his area) so I had the impression nobody cared or had time to look at it. 
That's why I've raised this again to get a clear answer about it. Now that 
at least you dislike this patch it's good enough reason to drop it for now 
and go with the default value instead until a guest is found to need this 
functionality.

> previous email that this isn't the right approach. Given that the ISA bus 
> partly uses the ioport address to reference the device, manually moving the 
> memory regions around for devices on the bus without the ISA bus seeing those 
> changes is going to cause issues.

The ioport_id you refer to is only used to print device name so the only 
issue is that the device may be currently mapped to a different address 
than its name might suggest when you query it but that should not break 
any functionality so maybe only cosmetic. The current ISA bus emulation in 
QEMU does not care about ISA devices after they are created, they are just 
initialised once and then the bus seems to forget about them. At least 
there are no functions to enable/disable or control them afterwards, only 
to register them at startup. So it's static and does not allow dynamically 
changing devices like we have in these VTxxx chips. (By the way, this is 
the same problem via-ide has that required hacks instead of actually 
emulating what the chip does because we can't have both ISA IDE and PCI 
IDE as the ISA one cannot be moved or disabled once created.) That's what 
this patch tried to circumvent at least for serial ports but without 
completly changing ISA emulation which might be a better approach but well 
beyond the effort I'm willing to put into this.

> IIRC the ability to dynamically change the standard ISA addresses was present 
> in several motherboards from that era, and given that this functionality 
> hasn't been implemented in QEMU this already tells us that no firmware is 
> currently is using it.

QEMU only supports SeaBIOS and on PC the ports are usually at their 
default address at startup so it's probably not firmware but guests that 
could change it. I don't know what other BIOSes might do as those don't 
run on QEMU. But these VTxxx chips are not used on PC machine models. The 
fuloong2e PMON and pegasos2 SmartFirtmware seem to poke the regs enabling 
and setting port address of these at startup (otherwise the chip seems to 
start without these enabled) so I've tried to emulate that. On pegasos2 it 
even uses different than usual standard value (as it only has one serial 
port) and guests boot with that so we can use that default. It's not 
exactly how the real device works but satisfies guests that rely on 
firmware to set up these and don't touch it later.

> I don't understand why using the hard-coded addresses in the v10 is a problem 
> here? The addresses you added in the comments representing the programmed 
> values are the standard ISA device addresses, so if those are what the 
> firmware is programming then there will be no change. You also reported that 
> it works fine with both your MorphOS and Linux test images, indicating that 
> neither of these guest OSs require the feature.

For now the default address will do until a guest is found actually 
needing this. I just wanted to salvage this patch before dismissing it 
without a good reason.

> If you find a guest OS that needs the functionality then certainly we can 
> talk about trying to come up with a solution, but for me the extra complexity 
> of this approach and the fact that you're overriding the management of the 
> device by the ISA bus is why I haven't given it a R-B tag (I should add that 
> my R-B for v10 using the hard-coded ISA addresses still stands).

OK then forget it, at least this is a clear vote against this patch and if 
others don't care that means it should be dropped. Thanks for explaining 
it again.

Regards,
BALATON Zoltan

