Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5791D6A4783
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:04:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgsy-0007k1-Sc; Mon, 27 Feb 2023 12:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWgsd-0007Os-Dl; Mon, 27 Feb 2023 12:01:43 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWgsb-0002b8-QQ; Mon, 27 Feb 2023 12:01:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E9DF7457E7;
 Mon, 27 Feb 2023 18:01:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CB1C1745720; Mon, 27 Feb 2023 18:01:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C9E65745706;
 Mon, 27 Feb 2023 18:01:35 +0100 (CET)
Date: Mon, 27 Feb 2023 18:01:35 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
In-Reply-To: <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
Message-ID: <b006d7e3-22fb-54cf-d05e-45f15457032f@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
 <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-284891471-1677517295=:35244"
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

--3866299591-284891471-1677517295=:35244
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 3/2/23 15:55, Philippe Mathieu-Daudé wrote:
>> Since now PCI and SysBus properties are identical, unify them.
>> 
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/display/sm501.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>> 
>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>> index efebd93f1e..98375138b2 100644
>> --- a/hw/display/sm501.c
>> +++ b/hw/display/sm501.c
>> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, 
>> Error **errp)
>>       /* TODO : chain irq to IRL */
>>   }
>>   -static Property sm501_sysbus_properties[] = {
>> +static Property sm501_common_properties[] = {
>>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>
>
>> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error 
>> **errp)
>>                        &s->state.mmio_region);
>>   }
>>   -static Property sm501_pci_properties[] = {
>> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),

Oops, indeed the defaults are different so maybe just drop this patch for 
now.

Regards,
BALATON Zoltan

>
> Patch is invalid:
>
> $ ./qemu-system-ppc -S -M sam460ex
> qemu-system-ppc: Invalid VRAM size, nearest valid size is 2097152
>
>> -    DEFINE_PROP_END_OF_LIST(),
>> -};
>
>
>
>
--3866299591-284891471-1677517295=:35244--

