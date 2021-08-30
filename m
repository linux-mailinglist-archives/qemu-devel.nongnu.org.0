Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB33FB1CA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:19:12 +0200 (CEST)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbZS-0006Vj-QG
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKbVX-0007Pc-C9
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:15:03 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:35537
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKbVV-0005lP-Ds
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:15:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 347CF13B3BF;
 Mon, 30 Aug 2021 07:14:58 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 Aug
 2021 09:14:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00225b027ac-1bf1-448a-82c5-23a1804e3287,
 A410DCCBFF6448DFF799E1C977766415213BDB3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH 05/26] ppc/pnv: Distribute RAM among the chips
To: Greg Kurz <groug@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-6-clg@kaod.org> <20210820160849.4ad703b1@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6085754e-dfef-6783-3bb9-6317efe6668b@kaod.org>
Date: Mon, 30 Aug 2021 09:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820160849.4ad703b1@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7f4e981a-4f31-46ca-9cda-bb3dec730641
X-Ovh-Tracer-Id: 9615466681195400160
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 4:08 PM, Greg Kurz wrote:
> On Mon, 9 Aug 2021 15:45:26 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> But always give the first 1GB to chip 0 as skiboot requires it.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/ppc/pnv.c | 33 +++++++++++++++++++++++++--------
>>  1 file changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 025f01c55744..2f5358b70c95 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -710,6 +710,23 @@ static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
>>      pnv_psi_pic_print_info(&chip10->psi, mon);
>>  }
>>  
>> +/* Always give the first 1GB to chip 0 else we won't boot */
>> +static uint64_t pnv_chip_get_ram_size(PnvMachineState *pnv, int chip_id)
>> +{
>> +    MachineState *machine = MACHINE(pnv);
>> +    uint64_t ram_per_chip;
>> +
>> +    assert(machine->ram_size >= 1 * GiB);
>> +
>> +    ram_per_chip = machine->ram_size / pnv->num_chips;
>> +    if (ram_per_chip >= 1 * GiB) {
>> +        return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
>> +    }
>> +
> 
> So this is only reached if pnv->num_chips is >= 2, since
> a single chip would have ram_per_chip == machine->ram_size
> and thus take the return branch above.
> 
> Maybe worth making it clear with an assert() ?
> 
>> +    ram_per_chip = (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1);
> 
> Suggesting that because I was looking for a potential divide by zero ^^

yes.

> 
>> +    return chip_id == 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
>> +}
>> +
>>  static void pnv_init(MachineState *machine)
>>  {
>>      const char *bios_name = machine->firmware ?: FW_FILE_NAME;
>> @@ -717,6 +734,7 @@ static void pnv_init(MachineState *machine)
>>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>>      char *fw_filename;
>>      long fw_size;
>> +    uint64_t chip_ram_start = 0;
>>      int i;
>>      char *chip_typename;
>>      DriveInfo *pnor = drive_get(IF_MTD, 0, 0);
>> @@ -821,17 +839,16 @@ static void pnv_init(MachineState *machine)
>>          char chip_name[32];
>>          Object *chip = OBJECT(qdev_new(chip_typename));
>>          int chip_id = i;
>> +        uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, chip_id);
>>  
>>          pnv->chips[i] = PNV_CHIP(chip);
>>  
>> -        /*
>> -         * TODO: put all the memory in one node on chip 0 until we find a
>> -         * way to specify different ranges for each chip
>> -         */
>> -        if (i == 0) {
>> -            object_property_set_int(chip, "ram-size", machine->ram_size,
>> -                                    &error_fatal);
>> -        }
>> +        /* Distribute RAM among the chips  */
>> +        object_property_set_int(chip, "ram-start", chip_ram_start,
>> +                                &error_fatal);
>> +        object_property_set_int(chip, "ram-size", chip_ram_size,
>> +                                &error_fatal);
> 
> Not really related but failing to set either of these looks
> like it should never happen so I'd rather pass &error_abort
> for debugging purpose.
All the other object_property_set* calls are using &error_fatal in this
routine (not the link ones). I rather be consistent and use the same error. 
But we can change all of it one day it necessary.

Thanks,


C.

> 
> Anyway,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>> +        chip_ram_start += chip_ram_size;
>>  
>>          snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
>>          object_property_add_child(OBJECT(pnv), chip_name, chip);
> 


