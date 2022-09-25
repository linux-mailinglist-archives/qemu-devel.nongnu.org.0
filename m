Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E435E91E4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:33:14 +0200 (CEST)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocO0f-0007zb-7e
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNrh-0000u5-BP; Sun, 25 Sep 2022 05:23:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:27135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNrY-0004zV-QF; Sun, 25 Sep 2022 05:23:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0398F75A166;
 Sun, 25 Sep 2022 11:23:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BD84A75A165; Sun, 25 Sep 2022 11:23:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BBD8E75A164;
 Sun, 25 Sep 2022 11:23:46 +0200 (CEST)
Date: Sun, 25 Sep 2022 11:23:46 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 07/10] hw/ppc/mac.h: Move macio specific atuff out from
 shared header
In-Reply-To: <c4b2659e-fece-87c4-dba9-83c90d9b7a8e@ilande.co.uk>
Message-ID: <8f173f3-6e4-a919-36c2-e74340e32046@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
 <c4b2659e-fece-87c4-dba9-83c90d9b7a8e@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
> On 17/09/2022 00:07, BALATON Zoltan wrote:
> Typo in subject: s/atuff/stuff/
>> Move the parts specific to and only used by macio out from the shared
>> mac.h into macio.c where they better belong.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/misc/macio/macio.c | 26 ++++++++++++++++++++++++--
>>   hw/ppc/mac.h          | 23 -----------------------
>>   2 files changed, 24 insertions(+), 25 deletions(-)
>> 
>> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
>> index c1fad43f6c..eca5983a4d 100644
>> --- a/hw/misc/macio/macio.c
>> +++ b/hw/misc/macio/macio.c
>> @@ -37,8 +37,30 @@
>>   #include "hw/intc/heathrow_pic.h"
>>   #include "trace.h"
>>   -/* Note: this code is strongly inspirated from the corresponding code
>> - * in PearPC */
>> +#define ESCC_CLOCK 3686400
>> +
>> +/* Old World IRQs */
>> +#define OLDWORLD_CUDA_IRQ      0x12
>> +#define OLDWORLD_ESCCB_IRQ     0x10
>> +#define OLDWORLD_ESCCA_IRQ     0xf
>> +#define OLDWORLD_IDE0_IRQ      0xd
>> +#define OLDWORLD_IDE0_DMA_IRQ  0x2
>> +#define OLDWORLD_IDE1_IRQ      0xe
>> +#define OLDWORLD_IDE1_DMA_IRQ  0x3
>> +
>> +/* New World IRQs */
>> +#define NEWWORLD_CUDA_IRQ      0x19
>> +#define NEWWORLD_PMU_IRQ       0x19
>> +#define NEWWORLD_ESCCB_IRQ     0x24
>> +#define NEWWORLD_ESCCA_IRQ     0x25
>> +#define NEWWORLD_IDE0_IRQ      0xd
>> +#define NEWWORLD_IDE0_DMA_IRQ  0x2
>> +#define NEWWORLD_IDE1_IRQ      0xe
>> +#define NEWWORLD_IDE1_DMA_IRQ  0x3
>> +#define NEWWORLD_EXTING_GPIO1  0x2f
>> +#define NEWWORLD_EXTING_GPIO9  0x37
>> +
>> +/* Note: this code is strongly inspired by the corresponding code in 
>> PearPC */
>
> These IRQ numbers are effectively hardcoded because of the board layout (and 
> at some point some of this wiring may move to the board), so I think macio.h 
> is the best place for these to allow for use in multiple places if needed.

They aren't needed anywhere else currently that's what I've moved them 
here and they could be moved elsewhere when needed but I can put it in the 
header too if you like just don't see the need for that.

Regards,
BALATON Zoltan

>>   /*
>>    * The mac-io has two interfaces to the ESCC. One is called 
>> "escc-legacy",
>> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
>> index e97087c7e7..55cb02c990 100644
>> --- a/hw/ppc/mac.h
>> +++ b/hw/ppc/mac.h
>> @@ -35,29 +35,6 @@
>>   #define KERNEL_LOAD_ADDR 0x01000000
>>   #define KERNEL_GAP       0x00100000
>>   -#define ESCC_CLOCK 3686400
>> -
>> -/* Old World IRQs */
>> -#define OLDWORLD_CUDA_IRQ      0x12
>> -#define OLDWORLD_ESCCB_IRQ     0x10
>> -#define OLDWORLD_ESCCA_IRQ     0xf
>> -#define OLDWORLD_IDE0_IRQ      0xd
>> -#define OLDWORLD_IDE0_DMA_IRQ  0x2
>> -#define OLDWORLD_IDE1_IRQ      0xe
>> -#define OLDWORLD_IDE1_DMA_IRQ  0x3
>> -
>> -/* New World IRQs */
>> -#define NEWWORLD_CUDA_IRQ      0x19
>> -#define NEWWORLD_PMU_IRQ       0x19
>> -#define NEWWORLD_ESCCB_IRQ     0x24
>> -#define NEWWORLD_ESCCA_IRQ     0x25
>> -#define NEWWORLD_IDE0_IRQ      0xd
>> -#define NEWWORLD_IDE0_DMA_IRQ  0x2
>> -#define NEWWORLD_IDE1_IRQ      0xe
>> -#define NEWWORLD_IDE1_DMA_IRQ  0x3
>> -#define NEWWORLD_EXTING_GPIO1  0x2f
>> -#define NEWWORLD_EXTING_GPIO9  0x37
>> -
>>   /* Grackle PCI */
>>   #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>
>
> ATB,
>
> Mark.
>
>

