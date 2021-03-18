Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2D340CD7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:23:22 +0100 (CET)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxIn-0005oO-3T
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMx7T-0006t6-UX; Thu, 18 Mar 2021 14:11:39 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMx7R-0000bj-2H; Thu, 18 Mar 2021 14:11:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 797A27462E1;
 Thu, 18 Mar 2021 19:11:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 526EC7462D3; Thu, 18 Mar 2021 19:11:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 503887456B4;
 Thu, 18 Mar 2021 19:11:33 +0100 (CET)
Date: Thu, 18 Mar 2021 19:11:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] intc/i8259: avoid (false positive) gcc warning
In-Reply-To: <c9515297-2472-c5d8-e85b-9b2741862c83@redhat.com>
Message-ID: <43db99e-5896-8852-8b5-f4d34ca38efa@eik.bme.hu>
References: <20210318154738.27094-1-borntraeger@de.ibm.com>
 <69bb59c7-1f97-ba07-5150-d94d03210920@redhat.com>
 <bb7ec2df-db8e-2d3e-e392-1d2e16ce81e6@de.ibm.com>
 <c9515297-2472-c5d8-e85b-9b2741862c83@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-352136561-1616091093=:14061"
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-352136561-1616091093=:14061
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 18 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/18/21 5:11 PM, Christian Borntraeger wrote:
>> On 18.03.21 17:03, Paolo Bonzini wrote:
>>> On 18/03/21 16:47, Christian Borntraeger wrote:
>>>> some copiler versions are smart enough to detect a potentially
>>>> uninitialized variable, but are not smart enough to detect that this
>>>> cannot happen due to the code flow:
>>>>
>>>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>>>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in
>>>> this function [-Werror=maybe-uninitialized]
>>>>     203 |         irq = irq2 + 8;
>>>>         |         ~~~~^~~~~~~~~~
>>>>
>>>> Let us initialize irq2 to -1 to avoid this warning as the most simple
>>>> solution.
>>>
>>> What about:
>>
>> This also works, but if you want to go down that path then it would be
>> good if you
>> could do this patch as I do not have the testing infrastructure to do
>> proper x86
>> changes.
>>>
>>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>>> index 344fd04db1..bf28c179de 100644
>>> --- a/hw/intc/i8259.c
>>> +++ b/hw/intc/i8259.c
>>> @@ -189,20 +189,18 @@ int pic_read_irq(DeviceState *d)
>>>                   irq2 = 7;
>>>               }
>>>               intno = slave_pic->irq_base + irq2;
>>> +            irq = irq2 + 8;
>>> +            pic_intack(s, 2);
>>>           } else {
>>>               intno = s->irq_base + irq;
>>> +            pic_intack(s, irq);
>>>           }
>>> -        pic_intack(s, irq);
>>>       } else {
>>>           /* spurious IRQ on host controller */
>>>           irq = 7;
>>>           intno = s->irq_base + irq;
>>>       }
>>>
>>> -    if (irq == 2) {
>>> -        irq = irq2 + 8;
>>> -    }
>>> -
>
> This looks like the patch I just sent :)

Except this is simpler and more straightforward. I like this better FWIW.

Regards,
BALATON Zoltan
--3866299591-352136561-1616091093=:14061--

