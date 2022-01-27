Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BD49E26F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:36:34 +0100 (CET)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD40v-000602-3k
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nD3x8-0002H3-F8; Thu, 27 Jan 2022 07:32:38 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:54079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nD3x4-0002jw-Fw; Thu, 27 Jan 2022 07:32:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8AE6B746369;
 Thu, 27 Jan 2022 13:32:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5EBFA7457EF; Thu, 27 Jan 2022 13:32:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5D39B7456E3;
 Thu, 27 Jan 2022 13:32:31 +0100 (CET)
Date: Thu, 27 Jan 2022 13:32:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/2] ppc/pnv: use a do-while() loop in
 pnv_phb3_translate_tve()
In-Reply-To: <171f02a2-cf95-fd79-4dc7-94a667f3ef81@gmail.com>
Message-ID: <b527bfc8-50e-c4e7-a0e6-baf3121699de@eik.bme.hu>
References: <20220126201438.822457-1-danielhb413@gmail.com>
 <20220126201438.822457-2-danielhb413@gmail.com>
 <5b9fc0c6-f6b4-64e1-9126-de54229d05c1@eldorado.org.br>
 <171f02a2-cf95-fd79-4dc7-94a667f3ef81@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1211127618-1643286751=:43575"
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1211127618-1643286751=:43575
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 27 Jan 2022, Daniel Henrique Barboza wrote:
> On 1/27/22 08:41, Matheus K. Ferst wrote:
>> On 26/01/2022 17:14, Daniel Henrique Barboza wrote:
>>> The 'taddr' variable is left unintialized, being set only inside the
>>> "while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
>>> is an int32_t that is being initiliazed by the GETFIELD() macro, which
>>> returns an uint64_t.
>>> 
>>> For a human reader this means that 'lev' will always be positive or zero.
>>> But some compilers may beg to differ. 'lev' being an int32_t can in theory
>>> be set as negative, and the "while ((lev--) >= 0)" loop might never be
>>> reached, and 'taddr' will be left unitialized. This can cause phb3_error()
>>> to use 'taddr' uninitialized down below:
>>> 
>>> if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>>>      phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
>>> 
>>> A quick way of fixing it is to use a do/while() loop. This will keep the
>>> same semanting as the existing while() loop does and the compiler will
>>> understand that 'taddr' will be initialized at least once.
>>> 
>>> Suggested-by: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/573
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/pci-host/pnv_phb3.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>>> index 7fb35dc031..39a6184419 100644
>>> --- a/hw/pci-host/pnv_phb3.c
>>> +++ b/hw/pci-host/pnv_phb3.c
>>> @@ -792,7 +792,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace 
>>> *ds, hwaddr addr,
>>>           sh = tbl_shift * lev + tce_shift;
>>> 
>>>           /* TODO: Multi-level untested */
>>> -        while ((lev--) >= 0) {
>>> +        do {
>>>               /* Grab the TCE address */
>>>               taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 
>>> 3);
>>>               if (dma_memory_read(&address_space_memory, taddr, &tce,
>>> @@ -813,7 +813,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace 
>>> *ds, hwaddr addr,
>>>               }
>>>               sh -= tbl_shift;
>>>               base = tce & ~0xfffull;
>>> -        }
>>> +        } while ((lev--) >= 0);
>> 
>> This changes the number of iterations in this loop.
>
> ooofff
>
>> We'd need "while ((--lev) >= 0)" to keep it the same, but then we would be 
>> checking "!(tce & 3)" for the last iteration. Is that a problem?

When you're at it, you could also drop the extra () around lev--. I don't 
think we need that and does not add to readability IMO.

I don't really know what's the original problem but if it's a while with 
missing init then often what you want is for (init, while clause, inc) 
instead but not sure that's applicable in this case so just disregard 
this comment if not relevant.

Regards,
BALATON Zoltan
--3866299591-1211127618-1643286751=:43575--

