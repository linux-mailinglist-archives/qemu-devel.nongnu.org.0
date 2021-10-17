Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D0430BDB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 21:42:22 +0200 (CEST)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcC32-0002oR-Qg
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 15:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcC0b-0000ma-Br
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 15:39:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:16915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcC0W-0005Q6-Un
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 15:39:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8A403748F52;
 Sun, 17 Oct 2021 21:39:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1414F748F51; Sun, 17 Oct 2021 21:39:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1252F748F4B;
 Sun, 17 Oct 2021 21:39:41 +0200 (CEST)
Date: Sun, 17 Oct 2021 21:39:41 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
In-Reply-To: <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
Message-ID: <643d88e9-30aa-7fb-8f5b-de25473ed6b1@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
 <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1590540385-1634499581=:48984"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1590540385-1634499581=:48984
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 17 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/15/21 03:06, BALATON Zoltan wrote:
>> Use via_isa_set_irq() which better encapsulates irq handling in the
>> vt82xx model and avoids using isa_get_irq() that has a comment saying
>> it should not be used.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/ide/via.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index 94cc2142c7..252d18f4ac 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -29,7 +29,7 @@
>>  #include "migration/vmstate.h"
>>  #include "qemu/module.h"
>>  #include "sysemu/dma.h"
>> -
>> +#include "hw/isa/vt82c686.h"
>>  #include "hw/ide/pci.h"
>>  #include "trace.h"
>>
>> @@ -112,7 +112,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>>          d->config[0x70 + n * 8] &= ~0x80;
>>      }
>>
>> -    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
>> +    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
>
> Since pci_get_function_0() is expensive, we should cache
> 'PCIDevice *func0' in PCIIDEState, setting the pointer in
> via_ide_realize(). Do you mind sending a follow-up patch?

On the other hand, IMO PCIIDEState should be about PCI IDE stuff so to 
keep this clean this would need subclassing it to VIAIDEState and put the 
func0 pointer there. But then we probably need to cast between VIAIDE and 
PCIIDE and likely we're back to the same level of expensiveness. The main 
source why of pci_get_function_0 is expensive is probably the QOM cast to 
PCI_BUS in pci_get_bus() the rest is just pointer and array index 
dereferences which should not be too bad. And the reason why QOM casts are 
expensive is because we have --enable-qom-debug enabled by default. I've 
tried to send a patch before to disable this on release builds and only 
enable it with --enable-debug or when explicitly asked but it was rejected 
saying that these asserts are useful. Maybe we can just live with 
qemu_set_irq and not bother and drop this series. (You can cherry pick the 
first patch removing code duplication from via isa if you want.)

Regards,
BALATON Zoltan
--3866299591-1590540385-1634499581=:48984--

