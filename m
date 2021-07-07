Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C63BE61B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:03:37 +0200 (CEST)
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14P2-0000z1-4B
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m14OA-0000AV-IP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:02:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50586
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m14O7-0005gK-Iw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:02:42 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m14O2-000CSb-HA; Wed, 07 Jul 2021 11:02:35 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
 <49104070-ee40-3bcf-f043-225f247a1de7@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7b74db54-6afd-d20c-bd10-85bb6c3621cc@ilande.co.uk>
Date: Wed, 7 Jul 2021 11:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <49104070-ee40-3bcf-f043-225f247a1de7@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/4] dp8393x: don't force 32-bit register access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 00:51, Finn Thain wrote:

> On Mon, 5 Jul 2021, Mark Cave-Ayland wrote:
> 
>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
>> and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
>> 32-bit accesses.
>>
>> The problem with forcing the register access to 32-bit in this way is that since the
>> dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
>> endian machines with 32-bit accesses.
>>
>> For both access sizes and machine endians the QEMU memory API can do the right thing
>> automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
>> the dp8393x implements 16-bit registers.
>>
>> Normally .impl.max_access_size should also be set to 2, however that doesn't quite
>> work in this case since the register stride is specified using a (dynamic) it_shift
>> property which is applied during the MMIO access itself. The effect of this is that
>> for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
>> it_shift within the MMIO access itself causes the register value to be repeated in both
>> the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
>> zero-extended up to access size and therefore fails to correctly detect the dp8393x
>> device due to the extra data in the top 16-bits.
>>
>> The solution here is to remove .impl.max_access_size so that the memory API will
>> correctly zero-extend the 16-bit registers to the access size up to and including
>> it_shift. Since it_shift is never greater than 2 than this will always do the right
>> thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
>> the manual endian swap code to be removed.
>>
> 
> IIUC, this patch replaces an explicit word swap with an implicit byte
> swap. The explicit word swap was conditional on the big_endian flag.
> 
> This flag seems to work like the chip's BMODE pin which switches between
> Intel and Motorola bus modes (not just byte ordering but bus signalling in
> general). The BMODE pin or big_endian flag should effect a byte swap not a
> word swap so there must be a bug though it's not clear how that manifests.
> 
> Regardless of this patch, the big_endian flag also controls byte swapping
> during DMA by the device. IIUC, the flag is set to indicate that RAM is
> big_endian, so it's not actually a property of the dp8393x but of the
> RAM...
> 
> The Magnum hardware can run in big endian or little endian mode. But the
> SONIC chip must remain in little endian mode always because asserting
> BMODE would invoke Motorola signalling and that would contradict
> Philippe's datasheet which says that the SONIC device is attached to an
> "i386 compatible bus".
> 
> This seems contrary to mips_jazz_init(), which sets the dp8393x big_endian
> flag whenever TARGET_WORDS_BIGENDIAN is defined, i.e. risc/os guest.
> 
> QEMU's dp8393x device has native endianness, so perhaps a big endian guest
> or a big endian host could trigger the bug that's being addressed in this
> patch.
> 
> Anyway, I think that this patch is heading in the right direction but
> can't it go further? Shouldn't the big_endian flag disappear altogether so
> that the memory API can also take care of the byte swapping needed by
> dp8393x_get() and dp8393x_put() for DMA?

Currently in QEMU the dp8393x device is connected directly to the system bus i.e. in 
effect the CPU. The CPU issues either a big-endian or little-endian access, the 
device declares what it would like to receive, and the memory API handles all the 
intermediate layers. In this case DEVICE_NATIVE_ENDIAN specifies it expects to 
receive accesses in the same endian as the machine and so everything "just works".

For this reason MMIO accesses generally shouldn't need any explicit byte swapping: if 
you're doing this then it's a good indicator that something is wrong. There are some 
special cases around for things like virtio, but we can ignore those for now.

The dp8393x_get() and dp8393x_put() functions are for bus master accesses from the 
device to the RAM, and these accesses are controlled by the "big_endian" property and 
the DW bit. As you point out the "big_endian" property is effectively the BMODE bit: 
in my datasheet I see nothing about this pin changing the signalling, only that it 
affects the byte ordering for RAM accesses.

Now it is highly likely that the BMODE bit should match the target endian, in which 
case we could eliminate the "big_endian" property as you suggest. However this 
conflicts with what you mention above that the SONIC is hard-coded into little-endian 
mode, in which case we would still need to keep it.

I've sent a fix for the CAP registers, but other than that I'm happy that the first 
patchset works fine here, and the consolidation of most of the endian swaps is a good 
tidy-up. If this works for you then I suggest we merge the first patchset including 
the CAP fix in time for freeze next week and go from there.

Certainly we can look to improve things in the future, but without anyone having a 
working big-endian MIPS image to test against, I don't think it's worth guessing what 
changes are required as we can easily double the length of this thread and still have 
no idea if any changes we've made are correct.


ATB,

Mark.

