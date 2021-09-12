Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5165407ED2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:57:53 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSng-0003Z9-Bg
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSmZ-0002ni-DY
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:56:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35446
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSmX-0000bX-Kt
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:56:43 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSmS-0006jh-FE; Sun, 12 Sep 2021 17:56:36 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <65a6ebbf-5f5a-8a47-ff68-b48c9079bf01@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5a4fe371-96aa-85f4-cee9-1f39b12de067@ilande.co.uk>
Date: Sun, 12 Sep 2021 17:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <65a6ebbf-5f5a-8a47-ff68-b48c9079bf01@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/20] nubus: bus, device, bridge, IRQ and address space
 improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/09/2021 16:47, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
>> This patchset is the next set of changes required to boot MacOS on the q800 machine. The
>> main aim of these patches is to improve the Nubus support so that devices can be plugged
>> into the Nubus from the command line i.e.
>>
>>      -device nubus-macfb[,romfile=decl.rom]
>>
>> At the moment the only device that can be plugged into the Nubus is the macfb framebuffer
>> however with these changes it is possible to take a ROM from a real Nubus card and
>> attempt to use it in QEMU, and also allow for future interfaces such as virtio.
>>
>> Patches 1 to 6 move the logic which manages bus addresses from the NubusDevice into
>> the NubusBus itself, including the introduction of a bitmap to manage available
>> slots on the bus.
>>
>> Patches 7 and 8 change the handling for unassigned (empty) slots to generate a bus
>> fault and add trace events to allow logging of empty slot accesses during Nubus
>> enumeration.
>>
>> Patches 9 to 11 remove the existing stubs for generating the format block (the epilogue
>> of the Nubus device embedded ROM consisting of metadata and a checksum) and replace them
>> with a romfile device property to allow the entire Nubus ROM to be loaded from a file
>> into the ROM area, similar to a PCI option ROM.
>>
>> Patch 12 moves the Nubus into its own separate address space whilst patches 13 to 17
>> update the NubusBridge (and MacNubusBridge) devices to allow machines to map the
>> required slots from the Nubus address space using sysbus_mmio_map().
>>
>> Finally patches 18 to 20 add support for Nubus IRQs and wire them up appropriately for
>> the q800 machine through VIA2, which is required for the next set of macfb updates.

Thanks for the review so far :)

> Some questions:
> 
> - TYPE_NUBUS_BRIDGE is not abstract. So far, beside
>    TYPE_MAC_NUBUS_BRIDGE, no other code use it. Could it
>    be use as it? If so, shouldn't the code in
>    mac_nubus_bridge_init() be moved to nubus_bridge_realize(),
>    creating the slot alias regions generically using the
>    slot range from slot_available_mask or using another
>    property?

Not yet, but Nubus was available on non-Apple machines. Given that TYPE_NUBUS_BRIDGE 
and TYPE_MAC_NUBUS_BRIDGE are already there, it seems a shame to prevent anyone who 
wanted to experiment with Nubus in other ways by hard-coding in the Macintosh 
restrictions.

> - Why is "slot-available-mask" a bridge device property and
>    not a bus one?

Architecturally a Nubus always has 16 slots with 1 IRQ per slot (you can compare this 
with PCI always having 32 slots with 4 possible IRQs per slot). In the Macintosh 
design Apple restricted the available address space by mapping a partial address 
range onto the CPU bus, so I'd argue that this is an implementation property of the 
bridge. And of course device properties already exist which helps make things easier 
too :)


ATB,

Mark.

