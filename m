Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92613AA4E5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:02:52 +0200 (CEST)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbkR-00028j-HA
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbj7-0000vV-Jq; Wed, 16 Jun 2021 16:01:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:50359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbj4-0006Av-7T; Wed, 16 Jun 2021 16:01:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F20C774570E;
 Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CEB5A7456E3; Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CCF637456B4;
 Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
Date: Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
Message-ID: <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-882278050-1623873681=:48693"
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

--3866299591-882278050-1623873681=:48693
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/16/21 9:16 PM, Corey Minyard wrote:
>> On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
>>> Instead of using the confuse i2c_send_recv(), rewrite to directly
>>> call i2c_recv() & i2c_send(), resulting in code easire to review.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
>>> index f4c5bc12d36..b3d3da56e38 100644
>>> --- a/hw/i2c/ppc4xx_i2c.c
>>> +++ b/hw/i2c/ppc4xx_i2c.c
>>> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
>>>                          i2c->sts &= ~IIC_STS_ERR;
>>>                      }
>>>                  }
>>> -                if (!(i2c->sts & IIC_STS_ERR) &&
>>> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
>>> -                    i2c->sts |= IIC_STS_ERR;
>>> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
>>> -                    break;
>>> +                if (!(i2c->sts & IIC_STS_ERR)) {
>>> +                    if (recv) {
>>> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
>>> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
>>
>> In the previous patch you checked < 0, it would be nice to be
>> consistent.
>
> I did that first but thought Zoltan wouldn't be happy, then went back :)
>
> I'll fix for the next iteration, thanks.

I generally had no problem with i2c_send_recv only that its argument that 
decides which operation to do was inverted compared to other similar i2c 
functions so my original patch just corrected that for consistency and I 
was happy with that. Having a send_recv in one func allowed to avoid 
if-else in some places like these but if you think it's better without 
this function at all I can work with that too. I'll have to check if these 
changes could break anything. At first sight I'm not sure errors are 
handled as before if recv fails but it was years ago I did the sm501 and 
ati parts and I forgot how they work so I need to check again. I'll wait 
for the final version of the series then and test that. I remember I had 
to tweak these a lot because each guest OS had drivers that did things 
slightly differently so if I've fixed one, another broke until I've found 
a way that worked for all.

Regards,
BALATON Zoltan
--3866299591-882278050-1623873681=:48693--

