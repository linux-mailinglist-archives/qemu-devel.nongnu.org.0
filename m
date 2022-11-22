Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96A633CB7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 13:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxSXL-0001Wy-R0; Tue, 22 Nov 2022 07:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxSXI-0001Wm-JE
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 07:38:00 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxSXG-0007Av-1f
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 07:38:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 60CBF74811B;
 Tue, 22 Nov 2022 13:37:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 22047747FAB; Tue, 22 Nov 2022 13:37:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 20913746E06;
 Tue, 22 Nov 2022 13:37:19 +0100 (CET)
Date: Tue, 22 Nov 2022 13:37:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v2 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
In-Reply-To: <B64DB06E-A125-47E7-9E11-828A763AD590@gmail.com>
Message-ID: <0de95136-0683-75e2-3191-1686b7ad6d60@eik.bme.hu>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
 <29561bcc-a8d2-639a-8662-cf15fbeb5928@linaro.org>
 <B64DB06E-A125-47E7-9E11-828A763AD590@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-354303429-1669120639=:24723"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-354303429-1669120639=:24723
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Mon, 21 Nov 2022, Bernhard Beschow wrote:
> Am 21. November 2022 22:43:50 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 21/11/22 16:34, Bernhard Beschow wrote:
>>> Am 27. Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>> Linux kernel expects the northbridge & southbridge chipsets
>>>> configured by the BIOS firmware. We emulate that by writing
>>>> a tiny bootloader code in write_bootloader().
>>>>
>>>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>>> the PIIX4 configuration space included values specific to
>>>> the Malta board.
>>>>
>>>> Set the Malta-specific IRQ routing values in the embedded
>>>> bootloader, so the next commit can remove the Malta specific
>>>> bits from the PIIX4 PCI-ISA bridge and make it generic
>>>> (matching the real hardware).
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> FIXME: Missing the nanoMIPS counter-part!
>>>
>>> Who will be taking care of this? I have absolutely no clue how the write_bootloader functions work, so I don't see how to fix it.
>>
>> Oh actually I wrote that and tested it but context switched and forgot
>> about it... I'll look back when I get some time, probably around the
>> release.

Unrelated to this but found it while looking at malta.c now: another 
possible clean up is to replace the local generate_eeprom_spd() func with 
spd_data_generate() from hw/i2c/smbus_eeprom.c that other boards use 
already but I did not change malta because I could not test it. If you can 
test malta then it should be an easy change and simplify malta.c a bit.

>>> Couldn't we just do it like in pegasos2_init() where the registers are initialized by QEMU directly if there is no bootloader binary configured? I could do that.
>> I rather mimic bootloaders... maybe a matter of taste?

Is that a bootloader or a replacement firmware? To me bootloader is some 
OS specific binary that is loaded by firware to boot an OS. But there are 
OS independent bootloaders like grub so maybe you could emulate something 
like that, I don't know what malta does.

If there's no firmware binary QEMU should provide something to replace it 
to give the expected environment for the binary loaded by -kernel. In case 
of pegasos2 the init method sets up regs to init devices as done by the 
firmware and the rest is implemented by VOF (loaded from pc-bios) that 
provices the OpenFirmware client interface. The device setup in init is 
needed because VOF does not do that.

> I don't mind either way. I meant that I could help with the second 
> approach but not with the current one since I have no clue whatsoever 
> how it works. There are just too many magic constants that don't make 
> any sense to me, and too many layers of indirection, for example.

If malta has a replacement firmware for this case maybe it could be stored 
in a binary in pc-bios and loaded from there instead of writing it in hex 
to guest memory. That binary could even be assembled from source which 
should make it simpler to write and change. Or is YAMON open source? 
According to this page it is: 
https://www.mips.com/develop/tools/boot-loaders/ so maybe it could be 
included as a firmware binary instead of being emulated?

Regards,
BALATON Zoltan

> Anyway, I'm asking for the current state because I'm pretty much ready for posting a v3 of my PIIX consolidation series which now depends on this series.
>
> Best regards,
> Bernhard
>
>>
>> Regards,
>>
>> Phil.
>
>
--3866299591-354303429-1669120639=:24723--

