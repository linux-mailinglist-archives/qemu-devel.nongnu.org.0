Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2754ADF7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:11:00 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13Vj-0007hh-Ew
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o13Ft-0002aQ-Lg
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:54:38 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o13Fr-0002hW-Du
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:54:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 42A3E10BCCDA1;
 Tue, 14 Jun 2022 11:54:32 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 11:54:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003e48fc4e5-1856-4074-ab10-e47fa4cb6141,
 13435030B24A8B4E4D84E163F0172F78FE8A39D7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1961d80e-c09e-2a1b-c200-3ba5278d5424@kaod.org>
Date: Tue, 14 Jun 2022 11:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 06/11] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Henrique Barboza
 <danielhb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <mark.cave-ayland@ilande.co.uk>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-7-danielhb@linux.ibm.com>
 <deb180db-a6be-906d-dc86-f8c0830be22e@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <deb180db-a6be-906d-dc86-f8c0830be22e@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ca3d1b3c-1b2e-4c04-ae84-617da5cf0777
X-Ovh-Tracer-Id: 6545982059537140643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/14/22 11:24, Frederic Barrat wrote:
> 
> 
> On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
>> pnv_ics_resend() is scrolling through all the child objects of the chip
>> to search for the PHBs. It's faster and simpler to just use the phbs[]
>> array.
>>
>> pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
>> simple to justify its own function.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
>> ---
>>   hw/ppc/pnv.c | 22 +++++++---------------
>>   1 file changed, 7 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 05a8d5034f..d70deffa1d 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1993,28 +1993,20 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>>       return NULL;
>>   }
>> -static int pnv_ics_resend_child(Object *child, void *opaque)
>> -{
>> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
>> -
>> -    if (phb3) {
>> -        ics_resend(&phb3->lsis);
>> -        ics_resend(ICS(&phb3->msis));
>> -    }
>> -    return 0;
>> -}
>> -
>>   static void pnv_ics_resend(XICSFabric *xi)
>>   {
>>       PnvMachineState *pnv = PNV_MACHINE(xi);
>> -    int i;
>> +    int i, j;
>>       for (i = 0; i < pnv->num_chips; i++) {
>> -        PnvChip *chip = pnv->chips[i];
>>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>> -        ics_resend(&chip8->psi.ics);
> 
> 
> That line shouldn't be dropped, right?

yes. that's a typo, which should break the console.

C.


> 
>    Fred
> 
> 
>> -        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
>> +        for (j = 0; j < chip8->num_phbs; j++) {
>> +            PnvPHB3 *phb3 = &chip8->phbs[j];
>> +
>> +            ics_resend(&phb3->lsis);
>> +            ics_resend(ICS(&phb3->msis));
>> +        }
>>       }
>>   }


