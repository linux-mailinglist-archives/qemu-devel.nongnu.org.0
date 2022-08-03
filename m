Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFC2588AFD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 13:18:30 +0200 (CEST)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJCOS-0005F5-3O
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 07:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJCDA-0003JS-Jl; Wed, 03 Aug 2022 07:06:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJCD7-0003wT-Qn; Wed, 03 Aug 2022 07:06:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B334E74633E;
 Wed,  3 Aug 2022 13:06:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7F4957461AE; Wed,  3 Aug 2022 13:06:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7D007745702;
 Wed,  3 Aug 2022 13:06:42 +0200 (CEST)
Date: Wed, 3 Aug 2022 13:06:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH 15/19] ppc/ppc405: QOM'ify PLB
In-Reply-To: <ca69e7de-6369-0fd0-8f12-101fa3fbb8bd@gmail.com>
Message-ID: <1fc0f5fa-46e4-82e7-860-82945b5cfaed@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-16-clg@kaod.org>
 <ca69e7de-6369-0fd0-8f12-101fa3fbb8bd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-222875216-1659524802=:51013"
X-Spam-Probability: 11%
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-222875216-1659524802=:51013
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Daniel Henrique Barboza wrote:
> On 8/1/22 10:10, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/ppc/ppc405.h    | 14 ++++++++++
>>   hw/ppc/ppc405_uc.c | 67 +++++++++++++++++++++++++++++++++-------------
>>   2 files changed, 62 insertions(+), 19 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index d39d65cc86e4..4ff5cdcf5c65 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -65,6 +65,19 @@ struct ppc4xx_bd_info_t {
>>     typedef struct Ppc405SoCState Ppc405SoCState;
>>   +/* Peripheral local bus arbitrer */
>
> I wasn't aware that arbitrer is a word. Google says that 'arbitrer' is an
> old form of 'arbitrator'.
>
> I looked it up because I thought you misspelled 'arbiter', which is the name
> of a Protoss combat unit in Starcraft. And it happens to be a synonym of
> 'arbitrator' as well.
>
> 'arbitrer' is fine, don't worry about it.

I think that's what the chip docs call it so it comes from there.

Regards,
BALATON Zoltan
--3866299591-222875216-1659524802=:51013--

