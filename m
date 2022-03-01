Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316934C869B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:36:20 +0100 (CET)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOxzX-0001tN-AF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOxut-0006VW-6b
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:31:31 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:54141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nOxur-0006PG-9N
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:31:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.241])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 40D2227A3B;
 Tue,  1 Mar 2022 08:31:21 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 09:31:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00147057e41-0399-446b-96b6-5353dcbcd227,
 24806437EA66095D5A0A0E3C988328111B43E697) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dc554c0a-23b1-3bf4-39b1-dccbc24841d9@kaod.org>
Date: Tue, 1 Mar 2022 09:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/22] hw/ppc/pnv: Determine ns16550's IRQ number from
 QOM property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 <qemu-devel@nongnu.org>
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-6-shentey@gmail.com>
 <5c0787e4-7271-93d4-1a82-d2ad1f29aaca@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5c0787e4-7271-93d4-1a82-d2ad1f29aaca@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: de011c73-4c01-44b4-8829-9691afaf0afd
X-Ovh-Tracer-Id: 15697577978828786656
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtuddguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
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
Cc: "open list:PowerNV Non-Virt..." <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/22 23:17, Philippe Mathieu-Daudé wrote:
> On 22/2/22 20:34, Bernhard Beschow wrote:
>> Determine the IRQ number in the same way as for isa-ipmi-bt. This resolves
>> the last usage of ISADevice::isairq[] which allows it to be removed.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/ppc/pnv.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 837146a2fb..1e9f6b0690 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -380,9 +380,12 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
>>           cpu_to_be32(io_base),
>>           cpu_to_be32(8)
>>       };
>> +    uint32_t irq;
>>       char *name;
>>       int node;
>> +    irq = object_property_get_int(OBJECT(d), "irq", &error_fatal);
> 
> object_property_get_[u]int(), otherwise:

Fixed it.
  
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Applied to ppc-7.0.

Thanks,

C.

> 
>>       name = g_strdup_printf("%s@i%x", qdev_fw_name(DEVICE(d)), io_base);
>>       node = fdt_add_subnode(fdt, lpc_off, name);
>>       _FDT(node);
>> @@ -394,7 +397,7 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
>>       _FDT((fdt_setprop_cell(fdt, node, "clock-frequency", 1843200)));
>>       _FDT((fdt_setprop_cell(fdt, node, "current-speed", 115200)));
>> -    _FDT((fdt_setprop_cell(fdt, node, "interrupts", d->isairq[0])));
>> +    _FDT((fdt_setprop_cell(fdt, node, "interrupts", irq)));
>>       _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent",
>>                              fdt_get_phandle(fdt, lpc_off))));
> 


