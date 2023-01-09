Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4A662861
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:24:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEt1N-00017x-PQ; Mon, 09 Jan 2023 09:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pEt0w-0000vr-AF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:20:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pEt0u-0006sf-BR
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:20:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A457E74632B;
 Mon,  9 Jan 2023 15:18:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 69C12746324; Mon,  9 Jan 2023 15:18:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 680637462DB;
 Mon,  9 Jan 2023 15:18:15 +0100 (CET)
Date: Mon, 9 Jan 2023 15:18:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
In-Reply-To: <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
Message-ID: <477d20c7-4973-9290-09db-e3877b76c806@eik.bme.hu>
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-553828547-1673273895=:7264"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-553828547-1673273895=:7264
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 9/1/23 14:33, BALATON Zoltan wrote:
>> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>>> Use the same property name than the TYPE_PFLASH_CFI01 model.
>> 
>> Nothing uses it? Can this break command lines and if so do we need 
>> deprecation or some compatibility function until everybody changed their 
>> usage?
>
> Good point... I missed that :/
>
> How deprecation works in that case, can I simply add an extra
> property with DEFINE_PROP_UINT8()? I'm worried about an user
> doing:
>
> -device cfi.pflash02,device-width=4,width=2,...

Or maybe just leave it alone to avoid further problems. Cfi02 only has 
width and 4 sector lengths with corresponding sizes, while cfi01 has 
width, device-width and max-device-width so these just seem to be 
describing geometry differently so maybe no need to try to use same 
property names. Width is also shorter than device-width so I'd keep that 
for brevity.

Regards,
BALATON Zoltan

> and the processing order of the properties, besides property
> overwritten isn't warned to the user.
>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> hw/block/pflash_cfi02.c | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>>> index 2a99b286b0..55ddd0916c 100644
>>> --- a/hw/block/pflash_cfi02.c
>>> +++ b/hw/block/pflash_cfi02.c
>>> @@ -949,7 +949,7 @@ static Property pflash_cfi02_properties[] = {
>>>     DEFINE_PROP_UINT32("sector-length2", PFlashCFI02, sector_len[2], 0),
>>>     DEFINE_PROP_UINT32("num-blocks3", PFlashCFI02, nb_blocs[3], 0),
>>>     DEFINE_PROP_UINT32("sector-length3", PFlashCFI02, sector_len[3], 0),
>>> -    DEFINE_PROP_UINT8("width", PFlashCFI02, width, 0),
>>> +    DEFINE_PROP_UINT8("device-width", PFlashCFI02, width, 0),
>>>     DEFINE_PROP_UINT8("mappings", PFlashCFI02, mappings, 0),
>>>     DEFINE_PROP_UINT8("big-endian", PFlashCFI02, be, 0),
>>>     DEFINE_PROP_UINT16("id0", PFlashCFI02, ident0, 0),
>>> @@ -1014,7 +1014,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>>>     assert(QEMU_IS_ALIGNED(size, sector_len));
>>>     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>>>     qdev_prop_set_uint32(dev, "sector-length", sector_len);
>>> -    qdev_prop_set_uint8(dev, "width", width);
>>> +    qdev_prop_set_uint8(dev, "device-width", width);
>>>     qdev_prop_set_uint8(dev, "mappings", nb_mappings);
>>>     qdev_prop_set_uint8(dev, "big-endian", !!be);
>>>     qdev_prop_set_uint16(dev, "id0", id0);
>>> 
>
>
--3866299591-553828547-1673273895=:7264--

