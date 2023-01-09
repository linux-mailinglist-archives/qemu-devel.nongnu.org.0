Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34A66283D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEspA-0003VW-Mq; Mon, 09 Jan 2023 09:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pEsp5-0003Ub-GG
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:08:23 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pEsp3-0008WC-Tt
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:08:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1070374632B;
 Mon,  9 Jan 2023 15:06:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6CFF746324; Mon,  9 Jan 2023 15:06:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C58B37462DB;
 Mon,  9 Jan 2023 15:06:02 +0100 (CET)
Date: Mon, 9 Jan 2023 15:06:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 10/21] hw/sh4: Open-code pflash_cfi02_register()
In-Reply-To: <aea40df1-3467-ba52-20b4-0a3620e34329@linaro.org>
Message-ID: <ff0aeea2-b818-7f89-b3e4-f080cc53ca46@eik.bme.hu>
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-11-philmd@linaro.org>
 <088bef9e-b1e9-aef4-bb40-87b3b03172dd@eik.bme.hu>
 <aea40df1-3467-ba52-20b4-0a3620e34329@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-893555027-1673273162=:7264"
X-Spam-Probability: 9%
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-893555027-1673273162=:7264
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 9/1/23 14:40, BALATON Zoltan wrote:
>> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>>> pflash_cfi02_register() hides an implicit sysbus mapping of
>>> MMIO region #0. This is not practical in a heterogeneous world
>>> where multiple cores use different address spaces. In order to
>>> remove pflash_cfi02_register() from the pflash API, open-code it
>>> as a qdev creation call followed by an explicit sysbus mapping.
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> hw/sh4/r2d.c | 21 +++++++++++++++++----
>>> 1 file changed, 17 insertions(+), 4 deletions(-)
>>> 
>>> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
>>> index 6e0c65124a..9d31fad807 100644
>>> --- a/hw/sh4/r2d.c
>>> +++ b/hw/sh4/r2d.c
>>> @@ -303,10 +303,23 @@ static void r2d_init(MachineState *machine)
>>>      * addressable in words of 16bit.
>>>      */
>>>     dinfo = drive_get(IF_PFLASH, 0, 0);
>>> -    pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
>>> -                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>>> -                          FLASH_SECTOR_SIZE, 1, 2,
>>> -                          0x0001, 0x227e, 0x2220, 0x2200, 0x555, 0x2aa, 
>>> 0);
>>> +    dev = qdev_new(TYPE_PFLASH_CFI02);
>>> +    qdev_prop_set_string(dev, "name", "r2d.flash");
>>> +    qdev_prop_set_drive(dev, "drive",
>>> +                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
>>> +    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / 
>>> FLASH_SECTOR_SIZE);
>>> +    qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
>>> +    qdev_prop_set_uint8(dev, "device-width", 2);
>>> +    qdev_prop_set_uint8(dev, "mappings", 1);
>>> +    qdev_prop_set_uint8(dev, "big-endian", false);
>>> +    qdev_prop_set_uint16(dev, "id0", 0x0001);
>>> +    qdev_prop_set_uint16(dev, "id1", 0x227e);
>>> +    qdev_prop_set_uint16(dev, "id2", 0x2220);
>>> +    qdev_prop_set_uint16(dev, "id3", 0x2200);
>>> +    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
>>> +    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
>>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
>> 
>> Instead of 0x00000000 can you just write 0 or if you really want then maybe 
>> 0x0? With the lot of zeros it's hard to tell it's not 0x00008000 or 
>> something so it's best to keep is simple if there's no good reason to 
>> obfuscate it.
>
> OK, maybe 0x0 to differentiate between the MMIO index and the base address.

OK, you can also add:

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
--3866299591-893555027-1673273162=:7264--

