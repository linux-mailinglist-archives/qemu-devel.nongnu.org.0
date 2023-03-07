Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA426AE43C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZ2o-0003c9-6Q; Tue, 07 Mar 2023 10:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZZ2b-0003Z5-T6; Tue, 07 Mar 2023 10:15:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZZ2Z-0000CF-Vl; Tue, 07 Mar 2023 10:15:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 811C67457E7;
 Tue,  7 Mar 2023 16:15:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 46632745720; Tue,  7 Mar 2023 16:15:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 44F3D7456E3;
 Tue,  7 Mar 2023 16:15:34 +0100 (CET)
Date: Tue, 7 Mar 2023 16:15:34 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de
Subject: Re: [PATCH v9 1/7] hw/display/sm501: Add debug property to control
 pixman usage
In-Reply-To: <58f899e1-71f6-1ec9-e990-047511e2a84e@linaro.org>
Message-ID: <03faaacd-ea81-136e-caf0-266cd2327414@eik.bme.hu>
References: <cover.1678188711.git.balaton@eik.bme.hu>
 <61768ffaefa71b65a657d1365823bd43c7ee9354.1678188711.git.balaton@eik.bme.hu>
 <58f899e1-71f6-1ec9-e990-047511e2a84e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-532070767-1678202134=:65948"
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

--3866299591-532070767-1678202134=:65948
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 7 Mar 2023, Philippe Mathieu-Daudé wrote:
> On 7/3/23 12:42, BALATON Zoltan wrote:
>> Add a property to allow disabling pixman and always use the fallbacks
>> for different operations which is useful for testing different drawing
>> methods or debugging pixman related issues.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> ---
>>   hw/display/sm501.c | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>
>
>>   static Property sm501_sysbus_properties[] = {
>>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>> +    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, 7),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   @@ -2122,6 +2126,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error 
>> **errp)
>>     static Property sm501_pci_properties[] = {
>>       DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
>> +    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, 7),
>
> FYI, alternatively:
>
> DEFINE_PROP_BIT("x-pixman-fill", SM501PCIState, state.use_pixman, 0, 1),
> DEFINE_PROP_BIT("x-pixman-blit", SM501PCIState, state.use_pixman, 1, 1),
> DEFINE_PROP_BIT("x-pixman-overlap-blit", SM501PCIState,
>                state.use_pixman, 2, 1),

Hmm, interesting but this would result in harder to use longer command 
lines. In this case when for a debug property expected to be used by 
experienced users a single value is easier to use.

Regards,
BALATON Zoltan

>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   @@ -2162,11 +2167,18 @@ static void sm501_pci_class_init(ObjectClass 
>> *klass, void *data)
>>       dc->vmsd = &vmstate_sm501_pci;
>>   }
>>   +static void sm501_pci_init(Object *o)
>> +{
>> +    object_property_set_description(o, "x-pixman", "Use pixman for: "
>> +                                    "1: fill, 2: blit, 4: overlap blit");
>> +}
>
>
>
--3866299591-532070767-1678202134=:65948--

