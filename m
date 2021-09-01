Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8E3FD4CB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 09:58:51 +0200 (CEST)
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLL8z-0004wN-LV
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 03:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLL80-00046w-8j; Wed, 01 Sep 2021 03:57:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55676
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLL7y-0004kq-Je; Wed, 01 Sep 2021 03:57:48 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLL7O-0004dR-9h; Wed, 01 Sep 2021 08:57:14 +0100
To: Finn Thain <fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
 <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
 <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
 <88a445-398a-7566-171b-c551b61c38b@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <abc8ceff-8336-b3b1-d5f1-37d412a393ca@ilande.co.uk>
Date: Wed, 1 Sep 2021 08:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <88a445-398a-7566-171b-c551b61c38b@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/2021 23:44, Finn Thain wrote:

>> You mentioned that the OS may compensate for the fact that the 6522
>> doesn't have an overflow flag: can you explain more as to how this works
>> in Linux? Is the problem here that even if you read the counter value in
>> the interrupt handler to work out the latency, the counter may still
>> have already wrapped?
>>
> 
> Unbounded interrupt latency means that the guest kernel can not tell how
> many times the timer counter wrapped between timer interrupts. There will
> always be a race condition in the guest kernel.
> 
> It's possible to code around this in the kernel with a ratchet to prevent
> backwards movement in the clocksource counter (I had to do something
> similar for the Atari clocksource driver) but that would address only one
> symptom.
> 
> And that kind of hack certainly doesn't help any other guest operating
> system that's adversely affected by QEMU's design limitations (which is
> behavioural simulation rather than gate-level simulation).
> 
> This patch series doesn't solve the timer problem but it does improve the
> situation (for the reasons given in the cover letter).

I had a quick look at your via-timer branch at 
https://github.com/fthain/qemu/commits/via-timer and spotted that your work is based 
upon the v6.0 release. Before digging further into this, can you try using vanilla 
git master or the v6.1 tag instead as there are a couple of related fixes from the 
6.1 development cycle that you are missing:

82ff856fe7 ("mac_via: fix 60Hz VIA1 timer interval")
- This fixed the 60Hz VIA1 timer interval (it was running 100x too fast) and so could 
limit the virtual CPUs ability to process the 100Hz timer.

30ca7eddc4 ("mac_via: remove VIA1 timer optimisations")
- This fixed an issue whereby constant writes to portB would reset the 60Hz VIA1 
timer and 1Hz VIA1 timer (Probably not relevant here, but worth having).


ATB,

Mark.

