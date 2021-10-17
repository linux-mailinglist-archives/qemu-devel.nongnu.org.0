Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23547430B94
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 20:47:08 +0200 (CEST)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcBBa-0005cP-Md
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 14:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcB9G-0004hw-PT
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 14:44:42 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcB9D-0006Df-Uf
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 14:44:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1AC54746353;
 Sun, 17 Oct 2021 20:44:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E81FD746333; Sun, 17 Oct 2021 20:44:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E64AD7462D3;
 Sun, 17 Oct 2021 20:44:32 +0200 (CEST)
Date: Sun, 17 Oct 2021 20:44:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
In-Reply-To: <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
Message-ID: <2f3756a-a968-2d16-f238-1dd16647cc9@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
 <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1434617930-1634496272=:34016"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1434617930-1634496272=:34016
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

I can do that but waiting for a decision on how to proceed. Will Gerd take 
my first series this is based on as is then this should be a separate 
series doing the clean up using pci_get_function_0 or should these two 
series be merged? I'd also squash setting user_creatable = false into this 
patch (and do similar for the usb one) unless you guys think it should be 
a separate patch?

Regards,
BALATON Zoltan
--3866299591-1434617930-1634496272=:34016--

