Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D24BC8DF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 15:35:21 +0100 (CET)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLQpT-00006K-WB
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 09:35:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLQnD-00070n-PI; Sat, 19 Feb 2022 09:32:59 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:32127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLQmP-0000TP-32; Sat, 19 Feb 2022 09:32:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 19F2B745706;
 Sat, 19 Feb 2022 15:32:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E33F97456FE; Sat, 19 Feb 2022 15:32:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E19017456E3;
 Sat, 19 Feb 2022 15:32:04 +0100 (CET)
Date: Sat, 19 Feb 2022 15:32:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH 1/1] hw/ide: share bmdma read and write functions between
 piix.c and via.c
In-Reply-To: <ba8fb8ae-9af0-a740-6451-1e12dba14691@gmail.com>
Message-ID: <c0736fce-7f4b-7d7b-22a0-4eb102a8572@eik.bme.hu>
References: <20220219080818.327683-1-liavalb@gmail.com>
 <20220219080818.327683-2-liavalb@gmail.com>
 <5b443413-5f5c-48f9-161-6573b79aa8e3@eik.bme.hu>
 <ba8fb8ae-9af0-a740-6451-1e12dba14691@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-210484558-1645281124=:74922"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-210484558-1645281124=:74922
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 19 Feb 2022, Liav Albani wrote:
> On 2/19/22 13:19, BALATON Zoltan wrote:
>> On Sat, 19 Feb 2022, Liav Albani wrote:
>>> Instead of letting each implementation to duplicate this code, we can
>>> share these functions between IDE PIIX3/4 and VIA implementations.
>> 
>> OK but there's a way to take this even further as cmd646 also uses similar 
>> functions just with more cases so you could remove the cases handled by 
>> these functions and only leave the difference and call the default function 
>> from the default case. E.g. (untested, just to show the idea):
>> 
>> hw/ide/cmd646.c:
>> static uint64_t bmdma_read(void *opaque, hwaddr addr,
>>                            unsigned size)
>> {
>>     BMDMAState *bm = opaque;
>>     PCIDevice *pci_dev = PCI_DEVICE(bm->pci_dev);
>>     uint32_t val;
>> 
>>     if (size != 1) {
>>         return ((uint64_t)1 << (size * 8)) - 1;
>>     }
>> 
>>     switch(addr & 3) {
>>     case 1:
>>         val = pci_dev->config[MRDMODE];
>>         break;
>>     case 3:
>>         if (bm == &bm->pci_dev->bmdma[0]) {
>>             val = pci_dev->config[UDIDETCR0];
>>         } else {
>>             val = pci_dev->config[UDIDETCR1];
>>         }
>>         break;
>>     default:
>>         val = bmdma_default_read(opaque, addr, size);
>>         break;
>>     }
>> 
>>     trace_bmdma_read_cmd646(addr, val);
>>     return val;
>> }
>> 
> Yeah, I see how I can do that for both bmdma write and read of cmd646. I'll 
> send a v2 right away with a fix.

Maybe even the first if that's already contained in the default function 
could be avoided with some reorganisation like

if (size == 1) {
     remaining switch cases to set val
} else {
     val = bmdma_default_read();
}

but I wasn't sure that won't change anything so may need a bit more 
thought.

>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>> ---
>>> hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
>>> hw/ide/piix.c        | 50 ++-----------------------------------------
>>> hw/ide/via.c         | 51 ++------------------------------------------
>>> include/hw/ide/pci.h |  4 ++++
>>> 4 files changed, 55 insertions(+), 97 deletions(-)
>>> 
>>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>>> index 84ba733548..c8b867659a 100644
>>> --- a/hw/ide/pci.c
>>> +++ b/hw/ide/pci.c
>>> @@ -502,6 +502,53 @@ static const struct IDEDMAOps bmdma_ops = {
>>>     .reset = bmdma_reset,
>>> };
>>> 
>>> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>> +                           unsigned size)
>> 
>> Indentation off? Also everywhere else, usually we indent not with the 
>> parenthesis but with the list within. (Auto indent in most editors does 
>> that probably.)
>> 
> I guess you mean that it should be:
>
> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
> +                                                unsigned size)
>
> Like this?

No, like the code you've moved had it. The split line should start after 
the ( not on the same column. So:

uint64_t bmdma_default_read(void *opaque, hwaddr addr,
                            unsigned size)

but this line does not need to be split at all as it fits within 80 chars 
so better to keep it one line and only split where needed.

> I'm using Visual Studio Code, so I might not have the correct settings for 
> this editor with QEMU.
> The checkpatch script doesn't complain on style issues, so what can I do to 
> make this correct?

If checkpatch is happy then probably not a problem but just look at how 
code is indented on other places and follow the same. The coding style doc 
may have some words on it too. I don't know what setting Visual Studio 
might need.

Regards,
BALATON Zoltan
--3866299591-210484558-1645281124=:74922--

