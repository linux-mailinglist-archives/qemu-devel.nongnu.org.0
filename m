Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377416EC2EB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 00:26:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqi9M-0000Zq-Sd; Sun, 23 Apr 2023 18:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqi9J-0000Z2-P0; Sun, 23 Apr 2023 18:25:37 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqi9H-0005GZ-P8; Sun, 23 Apr 2023 18:25:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E8357746D65;
 Mon, 24 Apr 2023 00:23:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AD4D87466FF; Mon, 24 Apr 2023 00:23:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id ABB8074645F;
 Mon, 24 Apr 2023 00:23:49 +0200 (CEST)
Date: Mon, 24 Apr 2023 00:23:49 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
In-Reply-To: <1A105E4E-4F2E-4C06-8434-4A3349D45618@gmail.com>
Message-ID: <39b9b699-1a60-4b65-9691-b71a10c9e036@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-6-shentey@gmail.com>
 <9a25912c-a494-9efc-62ee-1de83b69a060@linaro.org>
 <1A105E4E-4F2E-4C06-8434-4A3349D45618@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-986648545-1682288629=:58399"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-986648545-1682288629=:58399
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 23 Apr 2023, Bernhard Beschow wrote:
> Am 23. April 2023 17:41:33 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> On 22/4/23 17:07, Bernhard Beschow wrote:
>>> Resolves redundant code in every PCI IDE device model.
>>> ---
>>>   include/hw/ide/pci.h |  1 -
>>>   hw/ide/cmd646.c      | 15 ---------------
>>>   hw/ide/pci.c         | 25 ++++++++++++++++++++++++-
>>>   hw/ide/piix.c        | 19 -------------------
>>>   hw/ide/sii3112.c     |  3 ++-
>>>   hw/ide/via.c         | 15 ---------------
>>>   6 files changed, 26 insertions(+), 52 deletions(-)
>>
>>
>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>> index 5dd3d03c29..0af897a9ef 100644
>>> --- a/hw/ide/sii3112.c
>>> +++ b/hw/ide/sii3112.c
>>> @@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
>>>       pd->class_id = PCI_CLASS_STORAGE_RAID;
>>>       pd->revision = 1;
>>>       pd->realize = sii3112_pci_realize;
>>> +    pd->exit = NULL;
>>>       dc->reset = sii3112_reset;
>>> +    dc->vmsd = NULL;
>>>       dc->desc = "SiI3112A SATA controller";
>>
>> The SiI3112A doesn't have these regions?
>
> Yeah, it ignores a lot of stuff in the base class. This gets changed in 
> the last part of this series though. This seems why there is no exit 
> method. Furthermore -- probably due to additional custom fields -- there 
> is no migration description.

Probably there's no state descriptor because I did not bother to implement 
it back then when I did not even know how that worked. I've considered 
extending this to a 4 port version before adding migration/save support 
but that did not happen. This is only used on sam460ex by default and 
likely nobody wants to migrate that anyway.

However why do you need to explicitly set these to NULL? Aren't those 
structs allocated 0 filled so you'd only need to set non-NULL members.

As for ignoting stuff in the base class, this isn't really a PCI IDE 
controller. It's a SATA controller that for compatibility with older 
drivers looks a lot like an IDE controller but handles only one device per 
channel and has some additional SATA stuff that we mostly don't model. 
This way I could reuse code that was already there but still had some 
duplication that you're now resolving.

Regards,
BALATON Zoltan
--3866299591-986648545-1682288629=:58399--

