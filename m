Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE43CCAA3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 22:40:35 +0200 (CEST)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5DaT-0007GQ-JM
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 16:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5DZP-0006RM-Dj; Sun, 18 Jul 2021 16:39:27 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:56327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5DZM-0004Q7-Ay; Sun, 18 Jul 2021 16:39:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1041374570C;
 Sun, 18 Jul 2021 22:39:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8CEBF74570B; Sun, 18 Jul 2021 22:39:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8A68E7456B7;
 Sun, 18 Jul 2021 22:39:16 +0200 (CEST)
Date: Sun, 18 Jul 2021 22:39:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 2/2] i2c/smbus_eeprom: Add feature bit to SPD data
In-Reply-To: <20210718180329.GM3431@minyard.net>
Message-ID: <bc5ad55d-7bef-c7a9-fbea-9828e998f56b@eik.bme.hu>
References: <cover.1626367844.git.balaton@eik.bme.hu>
 <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
 <20210718180329.GM3431@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021, Corey Minyard wrote:
> On Thu, Jul 15, 2021 at 06:50:44PM +0200, BALATON Zoltan wrote:
>> Add the differential clock input feature bit to the generated SPD
>> data. Most guests don't seem to care but pegasos2 firmware version 1.2
>> checks for this bit and stops with unsupported module type error if
>> it's not present. Since this feature is likely present on real memory
>> modules add it in the general code rather than patching the generated
>> SPD data in pegasos2 board only.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> I checked this all out and it looks correct to me.  I can take it in my
> tree, if necessary.  Feature freeze is in two days, so probably not for
> 6.1, though it could be pushed into there if its needed in 6.1.
>
> Or:
>
> Acked-by: Corey Minyard <cminyard@mvista.com>

Thanks. As this fixes pegasos2 ROM 1.2 that some users may find instead of 
the 1.1 version I consider this a bugfix not a feature and would like to 
get merged for 6.1 if possible (hopefully can be in David's tree with the 
other patch that's also a bugfix) because that way it won't happen that 
some users will get problems if they find the wrong ROM. With this patch 
both versions available on line work so there should be no problem for 
anyone. Other firmware ROMs don't seem to care so they're unlikely to 
break and the only machines using it now are pegasos2, sam460ex and 
fuloong2e and only when using firmware ROM so this does not need to wait 
until 6.2 I think as 6.1 is the first version pegasos2 is available and 
it would be nice to get it working well in the first version.

Regards,
BALATON Zoltan

> if someone else wants to take it.  This particular code really doesn't
> belong in eeprom.c, I don't think, but I'm not sure where else to put
> it.  And I can look in the SPD tables as well as anyone :).
>
> corey
>
>> ---
>> I've tested it with the firmware of pegasos2, sam460ex, fuloong2e and
>> g3beige (latter is not upstream yet) that are the only ones using this
>> function currently. Probably this could go in via PPC tree with my
>> other pegasos2 fix if respective maitainers ack this patch.
>>
>>  hw/i2c/smbus_eeprom.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
>> index 4d2bf99207..12c5741f38 100644
>> --- a/hw/i2c/smbus_eeprom.c
>> +++ b/hw/i2c/smbus_eeprom.c
>> @@ -276,7 +276,7 @@ uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t ram_size)
>>      spd[18] = 12;   /* ~CAS latencies supported */
>>      spd[19] = (type == DDR2 ? 0 : 1); /* reserved / ~CS latencies supported */
>>      spd[20] = 2;    /* DIMM type / ~WE latencies */
>> -                    /* module features */
>> +    spd[21] = (type < DDR2 ? 0x20 : 0); /* module features */
>>                      /* memory chip features */
>>      spd[23] = 0x12; /* clock cycle time @ medium CAS latency */
>>                      /* data access time */
>> --
>> 2.21.4
>>
>
>

