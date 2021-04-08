Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA36357EA0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:01:29 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQXY-0001pS-Bn
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lUQUg-0000nX-KH
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:58:30 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lUQUe-0006Fq-NS
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:58:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 469BD25AC68;
 Thu,  8 Apr 2021 10:58:23 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 8 Apr 2021
 10:58:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054fefcc1c-32c4-4bd0-a769-8359aec65141,
 A36169EE3079FEED08DC2049B229DAFE10CEC3BC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 88.167.138.64
Subject: Re: [PATCH 03/24] aspeed/i2c: Fix DMA address mask
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-4-clg@kaod.org>
 <aeee3229-19fc-1bbb-19b4-a72be1c454c6@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <544318aa-f737-e3da-35d7-5d98b6d78611@kaod.org>
Date: Thu, 8 Apr 2021 10:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <aeee3229-19fc-1bbb-19b4-a72be1c454c6@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3b0503ca-dd32-49a9-9849-c370e80d47b7
X-Ovh-Tracer-Id: 14244604149084490534
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 11:22 PM, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 4/7/21 7:16 PM, Cédric Le Goater wrote:
>> The RAM memory region is now used for DMAs accesses instead of the
>> memory address space region. Mask off the top bits of the DMA address
>> to reflect this change.
>>
>> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/i2c/aspeed_i2c.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>> index 518a3f5c6f9d..e7133528899f 100644
>> --- a/hw/i2c/aspeed_i2c.c
>> +++ b/hw/i2c/aspeed_i2c.c
>> @@ -601,7 +601,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>>              break;
>>          }
>>  
>> -        bus->dma_addr = value & 0xfffffffc;
>> +        bus->dma_addr = value & 0x3ffffffc;
> 
> This field is migrated (aspeed_i2c_bus_vmstate).

yes.
> Does the first patch "aspeed/smc: Use the RAM memory region for DMAs"
> break the migration?

You are right it does. Maintaining migration compatibility is overkill 
for this machine, but I should mention the first patch is breaking it.

Thanks,

C.
 


