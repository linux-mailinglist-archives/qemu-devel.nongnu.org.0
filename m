Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA73BADB2
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 17:36:05 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m04A8-0001YA-Su
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 11:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m048z-0000qg-4w
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:34:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41718
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m048x-0006bL-Kr
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:34:52 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m048b-0004dh-Ay; Sun, 04 Jul 2021 16:34:33 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-3-f4bug@amsat.org>
 <88ef2d9c-7dcb-2e2e-037c-6af306ad2a12@ilande.co.uk>
 <6fb1c380-1a0c-9d0e-be20-b2a7baec3f51@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ebcc242d-cc66-0363-e135-81ca268d04e2@ilande.co.uk>
Date: Sun, 4 Jul 2021 16:34:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6fb1c380-1a0c-9d0e-be20-b2a7baec3f51@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/6] dp8393x: don't force 32-bit register access
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
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/2021 17:29, Philippe Mathieu-Daudé wrote:

> On 7/3/21 4:39 PM, Mark Cave-Ayland wrote:
>> On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:
>>
>>> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>
>>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that
>>> all accesses
>>> to the registers were 32-bit but this is actually not the case. The
>>> access size is
>>> determined by the CPU instruction used and not the number of physical
>>> address lines.
>>>
>>> The big_endian workaround applied to the register read/writes was
>>> actually caused
>>> by forcing the access size to 32-bit when the guest OS was using a
>>> 16-bit access.
>>> Since the registers are 16-bit then we can simply set .impl.min_access
>>> to 2 and
>>> then the memory API will automatically do the right thing for both
>>> 16-bit accesses
>>> used by Linux and 32-bit accesses used by the MacOS toolbox ROM.
>>
>> The change should work, but the commit message above needs a slight
>> tweak - maybe something like this?
>>
>> Since the registers are 16-bit then we can simply set both
>> .impl.min_access and .impl.max_access to 2 and then the memory API will
>> automatically do the right thing for both 16-bit accesses used by Linux
>> and 32-bit accesses used by the MacOS toolbox ROM.
> 
> Do you mind sending v3 of this patch reworded (and including the .valid
> fields)?

I've sent a v3 with the rewording but dropping the .valid fields since that breaks 
MacOS and removed Finn's T-b tag as it may be there is an issue here with mips64el - 
whilst it works for me on all of my test images, I'm struggling to keep up with all 
the patches flying around everywhere :/

Now that your MIPS PR has been applied, perhaps it is worth sending a rebased v2 of 
your RFC "dp8393x: Housekeeping" patchset to ensure that everyone is up to date with 
the latest fixes? I won't be able to have a look at the CRC patchset for a few days 
though.


ATB,

Mark.

