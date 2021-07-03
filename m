Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF33BA78B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 08:33:52 +0200 (CEST)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzZDr-00078b-K8
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 02:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZCd-0006Qk-Cw
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 02:32:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40720
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZCW-0002Qz-9C
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 02:32:35 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZC0-0005Lu-BT; Sat, 03 Jul 2021 07:32:00 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, jasowang@redhat.com,
 fthain@telegraphics.com.au, laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <b4487676-d04e-14a4-2cdf-5c3aaa78212d@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <70ea194a-af86-454e-d9cc-494805d953eb@ilande.co.uk>
Date: Sat, 3 Jul 2021 07:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b4487676-d04e-14a4-2cdf-5c3aaa78212d@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/10] dp8393x: fixes for MacOS toolbox ROM
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/07/2021 14:03, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
>> Here is the next set of patches from my attempts to boot MacOS under QEMU's
>> Q800 machine related to the Sonic network adapter.
>>
>> Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros to
>> trace-events.
>>
>> The discussion for the v1 patchset concluded that the dp8393x device does
>> NOT have its own NVRAM (there is no mention of it on the datasheet) and so
>> patches 3 to 5 move the generation of the PROM to the q800 and jazz boards
>> separately to allow the formats to diverge.
>>
>> Patch 6 adds an implementation of bitrev8 to bitops.h in preparation for
>> changing the q800 PROM storage format, whilst patch 7 updates the MAC address
>> storage and checksum for the q800 machine to match the format expected by the
>> MacOS toolbox ROM.
>>
>> Patch 8 ensures that the CPU loads/stores are correctly converted to 16-bit
>> accesses for the network card and patch 9 fixes a bug when selecting the
>> index specified for CAM entries.
>>
>> Finally since the MIPS magnum machine exists for both big-endian (mips64) and
>> little-endian (mips64el) configurations, patch 10 sets the dp8393x big_endian
>> property accordingly using a similar technique already used for the MIPS malta
>> machines.
>>
>> Migration notes: the changes to the dp8393x PROM are a migration break, but we
>> don't care about this for now since a) the q800 machine will have more
>> breaking migration changes as further MacOS toolbox ROM support is upstreamed
>> and b) the magnum machine migration is currently broken (and has been for
>> quite some time).
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>>
>> v2:
>> - Move PROM generation from dp8393x to q800 and magnum machines and remove
>>    the existing code from the device itself
>> - Add bitrev8 implementation to bitops.h so it can be used elsewhere in
>>    future. Use a shift/merge technique rather than a massive table lookup
>>    as we don't care about speed
>> - Add patch to set the big_endian property correctly depending upon whether
>>    a big-endian or little-endian configuration is being used
>>
>>
>> Mark Cave-Ayland (10):
>>    dp8393x: checkpatch fixes
>>    dp8393x: convert to trace-events
>>    hw/mips/jazz: move PROM and checksum calculation from dp8393x device
>>      to board
>>    hw/m68k/q800: move PROM and checksum calculation from dp8393x device
>>      to board
>>    dp8393x: remove onboard PROM containing MAC address and checksum
>>    qemu/bitops.h: add bitrev8 implementation
>>    hw/m68k/q800: fix PROM checksum and MAC address storage
>>    dp8393x: don't force 32-bit register access
>>    dp8393x: fix CAM descriptor entry index
>>    hw/mips/jazz: specify correct endian for dp8393x device
> 
> Since a MIPS machine is involved, I'm queuing patches 1-7,10
> (PROM cksum) to mips-next. I'm leaving 8-9 for further discussion
> after seeing the guest memory traces.

Thanks for picking these up - I've been AFK for the past week :)

What was the issue with patch 9 "dp8393x: fix CAM descriptor entry index"? That patch 
ensures that the CAM index is read from the descriptor, and not taken from the for() 
loop i.e. it is unrelated to register access size. See section 4.1.1 "The Load CAM 
Command" in the DP83932C datasheet for more information.


ATB,

Mark.

