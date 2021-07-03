Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8153BA75F
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 07:21:46 +0200 (CEST)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzY65-0004h0-AM
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 01:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzY5K-0003vu-4h
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 01:20:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40648
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzY5H-0000dJ-0G
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 01:20:57 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzY4n-0004wM-Fz; Sat, 03 Jul 2021 06:20:29 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210629053704.2584504-1-f4bug@amsat.org>
 <cd2c1fb2-200b-3f61-bc42-5cf24dcad751@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <be7d9d19-5d6a-3b75-c4f2-6bc5190236ef@ilande.co.uk>
Date: Sat, 3 Jul 2021 06:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cd2c1fb2-200b-3f61-bc42-5cf24dcad751@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/mips/jazz: Map the UART devices unconditionally
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/07/2021 22:21, Philippe Mathieu-Daudé wrote:

> On 6/29/21 7:37 AM, Philippe Mathieu-Daudé wrote:
>> When using the Magnum ARC firmware we can see accesses to the
>> UART1 beeing rejected, because the device is not mapped:
>>
>>    $ qemu-system-mips64el -M magnum -d guest_errors,unimp -bios NTPROM.RAW
>>    Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected
>>    Invalid access at addr 0x80007001, size 1, region '(null)', reason: rejected
>>    Invalid access at addr 0x80007002, size 1, region '(null)', reason: rejected
>>    Invalid access at addr 0x80007003, size 1, region '(null)', reason: rejected
>>    Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected
>>
>> Since both UARTs are present (soldered on the board) regardless there
>> are character devices connected, map them unconditionally.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/mips/jazz.c | 16 ++++++----------
>>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> Patch queued to mips-next (with Peter's corrections applied).

Looks good to me. For future reference serial_mm_init() was another candidate on my 
list of init functions that could be replaced with qdev at some point...


ATB,

Mark.

