Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179503CC9F9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 18:57:40 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5A6k-0005z9-OR
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 12:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5A5Q-00059z-Ax; Sun, 18 Jul 2021 12:56:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:61672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5A5N-0006c8-AG; Sun, 18 Jul 2021 12:56:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2AF3074570C;
 Sun, 18 Jul 2021 18:56:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 07C3F74570B; Sun, 18 Jul 2021 18:56:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 058597456B7;
 Sun, 18 Jul 2021 18:56:09 +0200 (CEST)
Date: Sun, 18 Jul 2021 18:56:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] i2c/smbus_eeprom: Add feature bit to SPD data
In-Reply-To: <YPPJM7s6mA7BedBA@yekko>
Message-ID: <7ebbe6bb-8b1a-7e8b-8bb9-adbacc117ebc@eik.bme.hu>
References: <cover.1626367844.git.balaton@eik.bme.hu>
 <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
 <YPPJM7s6mA7BedBA@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021, David Gibson wrote:
> On Thu, Jul 15, 2021 at 06:50:44PM +0200, BALATON Zoltan wrote:
>> Add the differential clock input feature bit to the generated SPD
>> data. Most guests don't seem to care but pegasos2 firmware version 1.2
>> checks for this bit and stops with unsupported module type error if
>> it's not present. Since this feature is likely present on real memory
>> modules add it in the general code rather than patching the generated
>> SPD data in pegasos2 board only.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> I've tested it with the firmware of pegasos2, sam460ex, fuloong2e and
>> g3beige (latter is not upstream yet) that are the only ones using this
>> function currently. Probably this could go in via PPC tree with my
>> other pegasos2 fix if respective maitainers ack this patch.
>>
>>  hw/i2c/smbus_eeprom.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This isn't really my area, so I'd need acks to take it through my
> tree.

Since this is only used by fuloong2e apart from pegasos2 and sam460ex an 
ack from Philippe may be what's needed here. Technically it's in i2c 
because the SPD EEPROM is connected via i2c but other than that it has 
nothing to do with that so Corey is just included because a file in hw/i2c 
is changed so it could go in via any of you three. Since there's another 
pegasos2 related fix queued going via PPC tree would make sense I think.

Regards,
BALATON Zoltan

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
>
>

