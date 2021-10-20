Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A3434E92
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:04:49 +0200 (CEST)
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdD96-0000zW-Of
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdD3W-0004eh-9v
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:59:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdD3U-00067h-IB
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:59:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CF52C756044;
 Wed, 20 Oct 2021 16:58:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A2EAF756041; Wed, 20 Oct 2021 16:58:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A0E94756036;
 Wed, 20 Oct 2021 16:58:58 +0200 (CEST)
Date: Wed, 20 Oct 2021 16:58:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] via-ide: Avoid expensive operations in irq handler
In-Reply-To: <20211020143626.dvthmwizsljuwqz4@habkost.net>
Message-ID: <b1447f19-7bb3-c070-abd9-bfcc7c94aa84@eik.bme.hu>
References: <20211018014059.13E65746353@zero.eik.bme.hu>
 <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
 <a36736da-32a0-84fe-f33-32b2f31126bf@eik.bme.hu>
 <31027ddc-b618-9628-d725-1516f7bfd098@amsat.org>
 <20211020143626.dvthmwizsljuwqz4@habkost.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-322337946-1634741938=:45829"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-322337946-1634741938=:45829
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 20 Oct 2021, Eduardo Habkost wrote:
> On Mon, Oct 18, 2021 at 12:10:04PM +0200, Philippe Mathieu-Daudé wrote:
>> On 10/18/21 11:51, BALATON Zoltan wrote:
>>> On Mon, 18 Oct 2021, Philippe Mathieu-Daudé wrote:
>>>> On 10/18/21 03:36, BALATON Zoltan wrote:
>>>>> Cache the pointer to PCI function 0 (ISA bridge, that this IDE device
>>>>> has to use for IRQs) in the PCIIDEState and pass that as the opaque
>>>>> data for the interrupt handler to eliminate both the need to look up
>>>>> function 0 at every interrupt and also a QOM type cast of the opaque
>>>>> pointer as that's also expensive (mainly due to qom-debug being
>>>>> enabled by default).
>>>>>
>>>>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> ---
>>>>>  hw/ide/via.c         | 11 ++++++-----
>>>>>  include/hw/ide/pci.h |  1 +
>>>>>  2 files changed, 7 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>>>> index 82def819c4..30566bc409 100644
>>>>> --- a/hw/ide/via.c
>>>>> +++ b/hw/ide/via.c
>>>>> @@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState *d)
>>>>>
>>>>>  static void via_ide_set_irq(void *opaque, int n, int level)
>>>>>  {
>>>>> -    PCIDevice *d = PCI_DEVICE(opaque);
>>>>> +    PCIIDEState *d = opaque;
>>>>>
>>>>>      if (level) {
>>>>> -        d->config[0x70 + n * 8] |= 0x80;
>>>>> +        d->parent_obj.config[0x70 + n * 8] |= 0x80;
>>>>>      } else {
>>>>> -        d->config[0x70 + n * 8] &= ~0x80;
>>>>> +        d->parent_obj.config[0x70 + n * 8] &= ~0x80;
>>>>>      }
>>>>
>>>> Better not to access parent_obj, so I'd rather keep the previous
>>>> code as it. The rest is OK, thanks. If you don't want to respin
>>>> I can fix and take via mips-next.
>>>
>>> Why not? If it's OK to access other fields why not parent_obj? That
>>> avoids the QOM cast PCI_DEVICE(opaque) or PCI_DEVICE(d) after this
>>> patch. We know it's a PCIIDEState and has PCIDevice parent_obj field
>>> because we set the opaque pointer when adding this callback so I think
>>> this works and is the less expensive way. But feel free to change it any
>>> way you like and use it that way. I'd keep it as it is.
>>
>> My understanding of QOM is we shouldn't access internal states that
>> way, because 1/ this makes object refactors harder and 2/ this is
>> not the style/example we want in the codebase, but it doesn't seem
>> documented, so Cc'ing Markus/Eduardo for confirmation.
>
> `PCI_DEVICE(d)` is preferred instead `of d.parent_obj` (parent_obj is
> just a QOM implementation detail).  If there are real performance
> reasons to avoid it, we need numbers to support that.

OK I can try to do some measurement or go back to PCI_DEVICE() then.

> Also, note that `OBJECT_CHECK(obj)` is just `return obj` if
> CONFIG_QOM_CAST_DEBUG is disabled.

But configure enables it by default even without --enable-debug so I think 
most people don't even know and it's enabled practically everywhere 
(probably even in distros). Why can't we have it disabled by default if 
it's a developer debug option and enable it only for developers where 
it's useful to catch bugs?

Regards,
BALATON Zoltan
--3866299591-322337946-1634741938=:45829--

