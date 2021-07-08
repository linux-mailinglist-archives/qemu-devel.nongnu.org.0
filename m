Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6183BF719
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:52:14 +0200 (CEST)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1PlT-0002a2-3U
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m1Pjb-0001m0-P6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:50:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51964
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m1PjW-0001nz-1w
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:50:15 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m1PjR-00081R-Vp; Thu, 08 Jul 2021 09:50:06 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
 <49104070-ee40-3bcf-f043-225f247a1de7@linux-m68k.org>
 <7b74db54-6afd-d20c-bd10-85bb6c3621cc@ilande.co.uk>
 <f21cfe37-872-67a6-983a-65664214aaf0@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ba38b5b5-1fa5-082b-8800-93da6547600b@ilande.co.uk>
Date: Thu, 8 Jul 2021 09:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f21cfe37-872-67a6-983a-65664214aaf0@linux-m68k.org>
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

On 08/07/2021 01:52, Finn Thain wrote:

> On Wed, 7 Jul 2021, Mark Cave-Ayland wrote:
> 
>> However this conflicts with what you mention above that the SONIC is
>> hard-coded into little-endian mode, in which case we would still need to
>> keep it.
>>
> 
> If you want to fully implement BMODE in QEMU then you'll need to abandon
> native endiannes for the device implementation. I was not proposing this
> as it implies more byte swapping.
> 
> In a real Magnum the SONIC chip is connected to a bus that's not modelled
> by QEMU. It follows that BMODE serves different purposes than big_endian.
> 
> I pointed out several semantic differences between BMODE and big_endian,
> but I think the most significant of those was that endianness is already a
> property of the memory device being accessed for DMA. Yet big_endian is a
> property of the dp8393x device.
> 
>> Certainly we can look to improve things in the future, but without
>> anyone having a working big-endian MIPS image to test against, I don't
>> think it's worth guessing what changes are required as we can easily
>> double the length of this thread and still have no idea if any changes
>> we've made are correct.
>>
> 
> That argument can be applied to other patches in this series also.
> 
> Anyway, if we agree that the aim is ultimately to remove the big_endian
> flag then patch 4/4 should probably be re-evaluated in light of that.

Other than fixing up the MMIO accesses to use the memory API, the patches in this 
series are just tidy-ups and refactorings i.e. no change in functionality related to 
the big_endian property. This is exactly the case for patch 4. If there were any 
changes to the big_endian logic required, then those would be handled by a separate 
patch (or patches) outside of this refactoring work.

As I said before I'm not opposed to this, but we're coming up to freeze in less than 
a week and no-one has been able to provide working MIPS big endian and little endian 
test images in a thread lasting 3 weeks. Therefore my recommendation would be to 
merge the series in its current form for 6.1 and then when someone has found time to 
generate working images and do the required analysis around the big_endian logic, we 
can consider further changes later.


ATB,

Mark.

