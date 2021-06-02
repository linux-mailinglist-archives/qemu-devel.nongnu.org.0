Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5F2399664
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 01:33:00 +0200 (CEST)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loaM7-0002WG-HR
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 19:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nolan@sigbus.net>) id 1loaLM-0001ir-RL
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:32:12 -0400
Received: from phong.sigbus.net ([71.19.155.206]:38346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nolan@sigbus.net>) id 1loaLK-0002d3-Oo
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigbus.net; s=2020;
 t=1622676728; bh=EUtIMZUj4vexH9WITndRzrOGcKbc9pZdOrpXaPQ0q4I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Fb1TP5DJEuzTQSW13gy9R3sWVmnWGpgUjVIQ1YF/upKOK87OC31Q3sHxBotuZn3Wf
 FvqpsHNHaXeu4H2lFoSUbCJYwcvFUQbEK5aOkaoX8fFIzp5Iu/DWgpNI+xxWW+Ho22
 TPqOV6rjVfemIPta3Sqns7VHy2exkEr4EAQsdTe0VQhbyYm/58h+oMnaKVfZk08R8B
 V0Qq3OiIQfraVI+fyVCdvnQLgrXT4bZ6TZbZoJtENxYwgrn299k2DDg0qE+SuypsHa
 PSAy+voHGkud718vq4B3J0piV4uJHtRWLNKd9VVc9Aez0T8XwIvwgxglTX09Uaibnv
 hlV9FGUM6TPvQ==
Subject: Re: [PATCH qemu] Add basic power management to raspi.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <162137039825.30884.2445825798240809194-0@git.sr.ht>
 <65187b48-2449-e2b4-2d13-ed9ffb6fe2a8@amsat.org>
 <7669dd87-e040-a049-e953-9f31a4557ee5@sigbus.net>
 <596d4b19-a1b8-4ae3-d449-376bcd88cbe5@amsat.org>
From: Nolan <nolan@sigbus.net>
Message-ID: <9f24edda-8c09-052e-cd3d-fb84946511fa@sigbus.net>
Date: Wed, 2 Jun 2021 16:32:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <596d4b19-a1b8-4ae3-d449-376bcd88cbe5@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=71.19.155.206; envelope-from=nolan@sigbus.net;
 helo=phong.sigbus.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 4:22 PM, Philippe Mathieu-Daudé wrote:
> On 6/2/21 11:33 PM, Nolan wrote:
>> On 5/31/21 4:23 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Nolan,
>>>
>>> Thanks for your patch!
>>>
>>> There is something odd with your email address, which apparently
>>> became sourcehut@sigbus.net instead of nolan@sigbus.net.
>>
>> Ugh, oops. I was trying out sourcehut for this, and reflexively gave
>> them a marker email. I'm pretty sure sourcehut won't sell my email
>> address, so I'll just change it.
>>
>>> On 5/18/21 10:24 PM, ~nolanl wrote:
>>>> From: Nolan Leake <nolan@sigbus.net>
>>>>
>>>> This is just enough to make reboot and poweroff work.
>>>
>>> Please precise "for Linux kernels", since this doesn't work
>>> with firmwares (ideally we should implement the FIRMWARE_NOTIFY_REBOOT
>>> property - which Linux sends - to handle the machine reboot/halt
>>> via the videocore firmware model).
>>
>> Thanks, good point re: this being tuned to what Linux (and u-boot) do.
>> Poking around a bit, it looks like
>> "trusted-firmware-a"/"arm-trusted-firmware" uses the same method, as do
>> a couple of bare-metal/hobby OSes. Couldn't immediately figure out what
>> FreeBSD does.
>>
>> I'm not sure I understand your point about FIRMWARE_NOTIFY_REBOOT, my
>> understanding is that message is there to tell the GPU firmware that
>> we're about to reboot, so it can do things like reload the PCIe USB
>> chip's firmware. In my testing without the watchdog module loaded, my
>> physical pi4 does not reboot, so it appears that sending
>> FIRMWARE_NOTIFY_REBOOT is not enough on its own.
> 
>  From the ARM core point of view, once it sent the FIRMWARE_NOTIFY_REBOOT
> message, it can't really power-off itself, it waits in a busy loop for
> the VC to disable its power domain.
> 
> hw/misc/bcm2835_property.c is our model of the VC behavior. IMO this
> should be where QEMU shuts down. How I'd model it is:
> 
> - ARM: sends FIRMWARE_NOTIFY_REBOOT and loops
> 
> - VC emulated via property: delays (200ms?) then calls
>    SHUTDOWN_CAUSE_GUEST_RESET.
> 
> (it helps to see hw/misc/bcm2835_property.c as an external component).

This is not what I see on my hardware pi4. With the following kernel config:
...
CONFIG_RASPBERRYPI_FIRMWARE=y
...
CONFIG_BCM2835_WDT=m
...

if I reboot the machine without the WDT module (but with the firmware 
module), I get this:
#  echo b > /proc/sysrq-trigger
[   54.498768] sysrq: Resetting
[   54.501713] SMP: stopping secondary CPUs
[   54.505701] Reboot failed -- System halted

and it hangs forever there.

If I load the WDT module, it reboots successfully.

>>>> qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>>>> +            } else {
>>>> +                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>>>> +            }
>>>> +        }
>>>
>>> Shouldn't we log the unsupported bits?
>>
>> I can add that, I didn't originally because the unsupported writes are
>> expected.
> 
> I'd prefer we log them, even if unsupported, so in case something
> behaves oddly we could look at those bits.

In v2, I log the writes, since any side effects they have (notably the 
watchdog register) are unimplemented. I didn't log the reads, since they 
actually behave exactly as the real hardware does...

>>>> +static void bcm2835_powermgt_reset(DeviceState *dev)
>>>> +{
>>>> +    BCM2835PowerMgtState *s = BCM2835_POWERMGT(dev);
>>>> +
>>>> +    s->rstc = 0x00000102;
>>>> +    s->rsts = 0x00001000;
>>>> +    s->wdog = 0x00000000;
>>>
>>> Where these bits come from?
>>
>>  From my pi4. https://elinux.org/BCM2835_registers agrees (processed from
>> Broadcom source code).
> 
> OK, so please add a comment referring to
> https://elinux.org/BCM2835_registers#PM.
> 
> Looking forward for v2 :)

Already sent. Is the link comment here worth a v3?


