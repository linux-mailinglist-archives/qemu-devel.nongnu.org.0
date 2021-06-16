Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F743AA748
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 01:10:24 +0200 (CEST)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltefu-0005H9-Vz
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 19:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lteeo-0004Fl-4p; Wed, 16 Jun 2021 19:09:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lteek-0002uI-LK; Wed, 16 Jun 2021 19:09:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 28CD274570E;
 Thu, 17 Jun 2021 01:09:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D6B7574570B; Thu, 17 Jun 2021 01:09:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D4ABF7456B4;
 Thu, 17 Jun 2021 01:09:05 +0200 (CEST)
Date: Thu, 17 Jun 2021 01:09:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
Message-ID: <9ecae65d-e554-3e95-2ecf-3e2c866d718@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
 <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
 <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-938073621-1623883457=:97089"
Content-ID: <cfb4efd-e175-13b8-8e27-6c433cdf7fdb@eik.bme.hu>
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
Cc: cminyard@mvista.com,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-938073621-1623883457=:97089
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <b04b4022-9c26-ace8-aa1-198b3b9faba@eik.bme.hu>

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/16/21 10:01 PM, BALATON Zoltan wrote:
>> On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
>>> On 6/16/21 9:16 PM, Corey Minyard wrote:
>>>> On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> Instead of using the confuse i2c_send_recv(), rewrite to directly
>>>>> call i2c_recv() & i2c_send(), resulting in code easire to review.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
>>>>> index f4c5bc12d36..b3d3da56e38 100644
>>>>> --- a/hw/i2c/ppc4xx_i2c.c
>>>>> +++ b/hw/i2c/ppc4xx_i2c.c
>>>>> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque,
>>>>> hwaddr addr, uint64_t value,
>>>>>                          i2c->sts &= ~IIC_STS_ERR;
>>>>>                      }
>>>>>                  }
>>>>> -                if (!(i2c->sts & IIC_STS_ERR) &&
>>>>> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
>>>>> -                    i2c->sts |= IIC_STS_ERR;
>>>>> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
>>>>> -                    break;
>>>>> +                if (!(i2c->sts & IIC_STS_ERR)) {
>>>>> +                    if (recv) {
>>>>> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
>>>>> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
>>>>
>>>> In the previous patch you checked < 0, it would be nice to be
>>>> consistent.
>>>
>>> I did that first but thought Zoltan wouldn't be happy, then went back :)
>>>
>>> I'll fix for the next iteration, thanks.
>>
>> I generally had no problem with i2c_send_recv only that its argument
>> that decides which operation to do was inverted compared to other
>> similar i2c functions so my original patch just corrected that for
>> consistency and I was happy with that.
>
> But we have to make the maintainer happy too to get patch merged ;)

Getting this series in actually means more work for me as I have to 
rewrite my unfinfshed patch to not use send_recv so just leaving it as it 
is would be less work. I mean this patch:

https://lists.nongnu.org/archive/html/qemu-ppc/2020-06/msg00682.html

Where having send_recv is actually nice as I can write it without too much 
if-else clauses but having send_recv and start_transfer with opposite 
sense recv argument is confusing. This is where the orignal patch comes 
from and the point was to just correct this inconsistency between 
start_transfer and send_recv because I got it wrong first but it went 
overboard now removing the whole function instead of just correcting it so 
I'll have to rewrite this patch and make it longer and also have to 
rethink what can fail and how. I also have to review and test all other 
places I've used send_recv before so at this point I would not mind if it 
was left as it is now, then I could just drop my original patch and 
reverse the last argument of send_recv in the above WIP patch and be done 
with it. Much less work than going through this series so I almost regret 
bringing this up again. But if it makes you happy so be it.

>> Having a send_recv in one func
>> allowed to avoid if-else in some places like these but if you think it's
>> better without this function at all I can work with that too. I'll have
>> to check if these changes could break anything. At first sight I'm not
>> sure errors are handled as before if recv fails but it was years ago I
>> did the sm501 and ati parts and I forgot how they work so I need to
>> check again. I'll wait for the final version of the series then and test
>> that.
>
> Thanks, that would be great!
>
>> I remember I had to tweak these a lot because each guest OS had
>> drivers that did things slightly differently so if I've fixed one,
>> another broke until I've found a way that worked for all.
>
> I wish Avocado (or any other testing framework) could help you with
> your testing, and you could contribute your tests even if you can not
> contribute your firmware blob due to incompatible license.
> That would help us understand how you use your firmware, and save you
> time while testing.

Unfortunately it's not only firmware but there's also AmigaOS which is not 
freely available so that would be hard to automate. Other than that 
testing sam460ex and pegasos2 with Linux and MorphOS could be done but I'm 
more comfortable with running a few commands that I already have than 
setting up and learning a testing framework for this so it won't be me who 
makes these test cases. It's not that many boards and OSes that I care 
about to need it automated but I've shared the commands before, they are 
on my web pages about these boards.

Regards,
BALATON Zoltan
--3866299591-938073621-1623883457=:97089--

