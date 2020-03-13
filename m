Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1C185091
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 21:51:59 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCrHi-000775-Ds
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 16:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrGq-0006bk-Bc
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 16:51:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrGp-0002Ir-7g
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 16:51:04 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:40099)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jCrGk-0002Ex-Mj; Fri, 13 Mar 2020 16:50:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B310274638A;
 Fri, 13 Mar 2020 21:50:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8FE617461AE; Fri, 13 Mar 2020 21:50:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8E29B74569F;
 Fri, 13 Mar 2020 21:50:56 +0100 (CET)
Date: Fri, 13 Mar 2020 21:50:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 0/7] via-ide: fixes and improvements
In-Reply-To: <842b7c37-74bc-d5e1-070d-69dd74bf8caf@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003132144350.64097@zero.eik.bme.hu>
References: <20200313082444.2439-1-mark.cave-ayland@ilande.co.uk>
 <842b7c37-74bc-d5e1-070d-69dd74bf8caf@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: qemu-block@nongnu.org, mst@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 amarkovic@wavecomp.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Mar 2020, John Snow wrote:
> On 3/13/20 4:24 AM, Mark Cave-Ayland wrote:
>> Following on from the earlier thread "Implement "non 100% native mode"
>> in via-ide", here is an updated patchset based upon the test cases
>> sent to me off-list.
>>
>> The VIA IDE controller is similar to early versions of the PIIX
>> controller in that the primary and secondary IDE channels are hardwired
>> to IRQs 14 and 15 respectively. Guest OSs typically handle this by
>> either switching the controller to legacy mode, or using native mode and
>> using a combination of PCI device/vendor ID and/or checking various
>> registers in PCI configuration space to detect this condition and apply
>> a special fixed IRQ 14/15 routing.
>>
>> This patchset effectively updates the VIA IDE PCI device to follow the
>> behaviour in the datasheet in two ways: fixing some PCI configuration
>> space register defaults and behaviours, and always using legacy IRQ 14/15
>> routing, and once applied allows all our known test images to boot
>> correctly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>>
>> BALATON Zoltan (2):
>>   ide/via: Get rid of via_ide_init()
>>   pci: Honour wmask when resetting PCI_INTERRUPT_LINE
>>
>> Mark Cave-Ayland (5):
>>   via-ide: move registration of VMStateDescription to DeviceClass
>>   via-ide: ensure that PCI_INTERRUPT_LINE is hard-wired to its default
>>     value
>>   via-ide: initialise IDE controller in legacy mode
>>   via-ide: allow guests to write to PCI_CLASS_PROG
>>   via-ide: always use legacy IRQ 14/15 routing
>>
>>  hw/ide/via.c            | 21 +++++----------------
>>  hw/mips/mips_fulong2e.c |  5 ++++-
>>  hw/pci/pci.c            |  5 ++++-
>>  include/hw/ide.h        |  1 -
>>  4 files changed, 13 insertions(+), 19 deletions(-)
>>
>
> Does this supersede everything else so far?

Yes, this includes all needed changes from my series (two patches directly 
and other changes split up in smaller commits) so none of my previous 
series is needed just this series.

> (Except the two cmd646
> related series, four patches total, which are already staged)

Yes those are not included here and independent changes that should stay. 
Your tree seemed to have the commits twice though at least on web 
interface of github.

I've also done some more clean ups that I'm polishing now and will submit 
soon but those are unrelated and a different series on top of this and the 
cmd646 clean up.

Regards,
BALATON Zoltan

