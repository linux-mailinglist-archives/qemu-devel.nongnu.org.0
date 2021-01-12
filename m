Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B52F2560
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 02:27:54 +0100 (CET)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz8TQ-0007Pl-W1
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 20:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kz8Rk-0006Ul-2E; Mon, 11 Jan 2021 20:26:08 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:59608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1kz8Rf-0004ab-Bq; Mon, 11 Jan 2021 20:26:07 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id ABDC2A00F9; Tue, 12 Jan 2021 02:25:58 +0100 (CET)
Date: Tue, 12 Jan 2021 02:25:58 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] hw/intc/ppc-uic: Make default dcr-base 0xc0, not 0x30
In-Reply-To: <20210112001257.GG3051@yekko.fritz.box>
Message-ID: <alpine.LMD.2.03.2101120224300.11445@eik.bme.hu>
References: <20210111213007.7381-1-peter.maydell@linaro.org>
 <20210112001257.GG3051@yekko.fritz.box>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021, David Gibson wrote:
> On Mon, Jan 11, 2021 at 09:30:07PM +0000, Peter Maydell wrote:
>> In commit 34d0831f38fd8 the ppc-uic device was added, with a dcr-base
>> property. The intention was that the default value of dcr-base should be
>> the one that most of our boards need, so that in the common case they
>> don't need to specify a property value.
>>
>> All QEMU boards with a UIC use a dcr-base of 0xc0, with the exception of
>> sam460ex which has four UICs and so puts them at 0xc0, 0xd0, 0xe0, 0xf0.
>> So 0xc0 is the obvious right choice for the default dcr-base.
>>
>> The board code conversions in commits 0270d74ef88623505 (bamboo) and
>> c5ac9dc64fa552a6 (virtex_ml507) assumed that default was 0xc0. Unfortunately
>> the actual default in 34d0831f38fd8 was 0x30, by mistake, so the
>> bamboo and virtex_ml507 boards were broken as they were converted
>> away from ppcuic_init() (which always specifies the dcr_base property
>> value explicitly).
>>
>> Set the default dcr-base to 0xc0 as was intended, fixing bamboo and
>> virtex_ml507.
>>
>> Fixes: 34d0831f38fd8
>> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Applied, thanks.

Will you take my series too?

http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223439

I've cc'd you but your DNS seems to not return an MX record most of the 
time still so these are bouncing back.

Regards,
BALATON Zoltan

>> ---
>> This is the right way to fix the bug I was trying to fix with
>> "hw/ppc/ppc400_bamboo: Set dcr-base correctly when creating UIC".
>>
>> David: you probably want to put this patch in your ppc queue
>> before "hw/ppc/ppc405_uc: Drop use of ppcuic_init()", as that patch
>> also assumes the 0xc0 default.
>
> Done.
>
>>
>>  hw/intc/ppc-uic.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
>> index b21951eea83..7171de7b355 100644
>> --- a/hw/intc/ppc-uic.c
>> +++ b/hw/intc/ppc-uic.c
>> @@ -274,7 +274,7 @@ static void ppc_uic_realize(DeviceState *dev, Error **errp)
>>
>>  static Property ppc_uic_properties[] = {
>>      DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
>> -    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0x30),
>> +    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0xc0),
>>      DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
>>      DEFINE_PROP_END_OF_LIST()
>>  };
>
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

