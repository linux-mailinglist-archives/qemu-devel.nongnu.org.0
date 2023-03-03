Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353486A91EB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY08V-00081I-Fj; Fri, 03 Mar 2023 02:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pY081-0007vc-Ko; Fri, 03 Mar 2023 02:46:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pY07z-0006nE-U6; Fri, 03 Mar 2023 02:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GHw/ChPLxcvX2RvI84yLaN4zpxu1Wy6anYnRia/X6w=; b=lUVNMN0PVcP1S3zGgpBwzVaWVT
 mnBWmLk1XzU88E1O+ZbEhNKphjEHmlWsJsrA6pq1EhQF81zwoyA0gOLMe/SbNTKrE8Omwz2fgL7Eo
 iNHwq7Q2c5YXfkJLNvv68HiRhJCCDvLFDdTNIf9V3zoJZ+VWLHbRCkHSykYpThFfmMjooCfFKcTeh
 OlaYA2thEHEAYq7JgWOtiu0HB4xb73AVGI4P+AU9hrQKGTzur6Aqveq35IxUwcNgk+U4I7AeRmrMK
 SeTKRBU0+HHQMa62Esign48ZCZnRHfomeKqG2rroVDrqoIQBTWRwTtnG5eTkjkWJxjEhrinwCLQR5
 U1sCuELwHhHq6+QGyQBdcBvOgqOJnobtartRj91SMmWtJh+cyCNST1JoPcnDIyZJQRZCYZhZgBVBW
 KRviSvrYxYCOMj8vihN5pe1+pGPjuNuejtrQVMTeItYzAqk55778tKNYssqrIUOPT/GroN+w36p65
 E6HcP6/jGwBUVcWsNZcW1J7gTqw4Ff3EvpmvUR1EqRzC8NqSq5SSg32EGFmw25HalrpOuTX3DsnGk
 2q75Azn6Th9J3pOy/L/X9PW2JUHIt7uIZ0RHi7h/MEqetxprPHqsD5bGEnUlJvrve7wm398VmESIH
 KXMmCKU9SxSjyB4yCsjt6YZeH1aWj5Vbf2byRGA48=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pY073-000A5q-HY; Fri, 03 Mar 2023 07:46:01 +0000
Message-ID: <152836d8-d417-df05-4819-cd3d7756732a@ilande.co.uk>
Date: Fri, 3 Mar 2023 07:46:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 03/03/2023 06:58, David Woodhouse wrote:

> On 2 March 2023 22:40:40 GMT, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> Since v2: rebased
>>
>> I'm posting this series as it to not block Bernhard's PIIX
>> cleanup work. I don't have code change planned, but eventually
>> reword / improve commit descriptions.
>>
>> Tested commit after commit to be sure it is bisectable. Sadly
>> this was before Zoltan & Thomas report a problem with commit
>> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
> 
> However much I stare at the partial revert which fixes it, I just cannot believe that the change could make any difference at all. There's got to be something weird going on there.
> 
> I was going to ask if the level mode for the PIT made any difference, but this is the output IRQ from the PIT to the CPU itself so I don't see how it would.
> 
> Would like to see a report with tracing from pic_update_irq, the CPU interrupt "handler" and the intermediate IRQ handler. With the intermediate present and without it. To compare the two.

I suspect it's related to the removal of the allocation of the qemu_irq: qdev gpios 
work by adding a child IRQ object to the device, so it could be possible that 
something in the gpio internals isn't being updated correctly when the value is 
overwritten directly.

Is the problem picked up when running a binary built with --enable-sanitizers? That's 
normally quite good at detecting this kind of issue.


ATB,

Mark.

