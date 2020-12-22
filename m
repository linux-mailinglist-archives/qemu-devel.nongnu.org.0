Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1792E0E32
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 19:24:52 +0100 (CET)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krmL3-00046K-Ba
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 13:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1krmJh-0003cB-Fq
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 13:23:25 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42486
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1krmJf-00083I-99
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 13:23:25 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1krmJT-0001VD-3t; Tue, 22 Dec 2020 18:23:15 +0000
To: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
Date: Tue, 22 Dec 2020 18:23:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/2020 16:16, Guenter Roeck wrote:

> Hi,
> 
> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
> is indexed and sized by the number of interrupts.
> 
> However, as it turns out, the interrupt number passed to this function
> is the _mapped_ interrupt number. The result in assertion failures for various
> emulations.

That doesn't sound quite right. My understanding from the other boards I have been 
working on is that they use the map_irq() functions recursively so that the final 
set_irq() is on the physical pin, so it might just be that the assert() is simply 
exposing an existing bug.

> Examples (I don't know if there are others):
> 
> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>    that isn't a good thing to do for slot 0, and indeed results in an
>    assertion as soon as slot 0 is initialized (presumably that is the root
>    bridge). Changing the mapping to "slot" doesn't help because valid slots
>    are 0..4, and only four interrupts are allocated.
> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>    it does, it returns numbers starting with 32 for slots 5..12. With
>    a total number of 32 interrupts, this again results in an assertion
>    failure.
> 
> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
> correct mapping should be. slot  & 3, maybe ?

Yeah that doesn't look right. Certainly both the Mac PPC machines use 
((pci_dev->devfn >> 3)) & 3) plus the interrupt pin so I think you're right that this 
is missing an & 3 here. Does adding this allow your image to boot?

> I don't really have a good solution for pci_bonito_map_irq(). It may not
> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
> and afaics that is the only platform using it. Maybe it is just completely
> broken ?

It looks like you want this patchset posted last week: 
https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/ 
(specifically: 
https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/20201216022513.89451-4-jiaxun.yang@flygoat.com/). 
Zoltan was working on the VIA southbridge wiring at the start of the year and 
provided me a test case that would boot Linux on the fulong2e machine, so at that 
point in time it wasn't completely broken.

So far it does seem like these are existing bugs being exposed, but please do report 
back on whether the above suggestions fix the problems you are experiencing.


ATB,

Mark.

