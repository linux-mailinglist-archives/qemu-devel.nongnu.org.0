Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681F2EE66D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:58:29 +0100 (CET)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbQS-00089W-LC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxbPi-0007ja-7K
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:57:42 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:65149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxbPd-0003L0-Aa
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:57:41 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 762527470DF;
 Thu,  7 Jan 2021 20:57:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 14E8F74646C; Thu,  7 Jan 2021 20:57:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 132BD74645B;
 Thu,  7 Jan 2021 20:57:34 +0100 (CET)
Date: Thu, 7 Jan 2021 20:57:34 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 05/12] vt82c686: Make vt82c686b-pm an abstract base class
 and add vt8231-pm based on it
In-Reply-To: <20210107115615.3cac27b3@redhat.com>
Message-ID: <91a57f0-9fd-9034-527d-d1f532f41878@eik.bme.hu>
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <c8fa8df147473c3ec5f3284b4a5d37fc9741e824.1609967638.git.balaton@eik.bme.hu>
 <bb288088-db7b-005d-db5a-5a41fb15f069@amsat.org>
 <93a8537e-64c1-1a3-8eeb-2114a46458d@eik.bme.hu>
 <20210107115615.3cac27b3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1809168621-1610049454=:37409"
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1809168621-1610049454=:37409
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 7 Jan 2021, Igor Mammedov wrote:
> On Thu, 7 Jan 2021 11:38:21 +0100 (CET)
> BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> On Thu, 7 Jan 2021, Philippe Mathieu-Daudé wrote:
>>> Hi Zoltan,
>>>
>>> On 1/6/21 10:13 PM, BALATON Zoltan wrote:
>>>> The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
>>>> only difference between the two is the device id in what we emulate so
>>>> make an abstract via-pm model by renaming appropriately and add types
>>>> for vt82c686b-pm and vt8231-pm based on it.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>  hw/isa/vt82c686.c         | 87 ++++++++++++++++++++++++++-------------
>>>>  include/hw/isa/vt82c686.h |  1 +
>>>>  2 files changed, 59 insertions(+), 29 deletions(-)
>>> ...
>>>
>>>> +typedef struct via_pm_init_info {
>>>> +    uint16_t device_id;
>>>> +} ViaPMInitInfo;
>>>> +
>>>>  static void via_pm_class_init(ObjectClass *klass, void *data)
>>>>  {
>>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>>>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>> +    ViaPMInitInfo *info = data;
>>>>
>>>> -    k->realize = vt82c686b_pm_realize;
>>>> +    k->realize = via_pm_realize;
>>>>      k->config_write = pm_write_config;
>>>>      k->vendor_id = PCI_VENDOR_ID_VIA;
>>>> -    k->device_id = PCI_DEVICE_ID_VIA_ACPI;
>>>> +    k->device_id = info->device_id;
>>>>      k->class_id = PCI_CLASS_BRIDGE_OTHER;
>>>>      k->revision = 0x40;
>>>> -    dc->reset = vt82c686b_pm_reset;
>>>> -    dc->desc = "PM";
>>>> +    dc->reset = via_pm_reset;
>>>
>>>> +    /* Reason: part of VIA south bridge, does not exist stand alone */
>>>> +    dc->user_creatable = false;
>>>>      dc->vmsd = &vmstate_acpi;
>>>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>
>>> Please do this change in a previous patch.
>>
>> OK, done.
>>
>>>>  }
>>>>
>>>>  static const TypeInfo via_pm_info = {
>>>> -    .name          = TYPE_VT82C686B_PM,
>>>> +    .name          = TYPE_VIA_PM,
>>>>      .parent        = TYPE_PCI_DEVICE,
>>>> -    .instance_size = sizeof(VT686PMState),
>>>> -    .class_init    = via_pm_class_init,
>>>> +    .instance_size = sizeof(ViaPMState),
>>>> +    .abstract      = true,
>>>>      .interfaces = (InterfaceInfo[]) {
>>>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>>          { },
>>>>      },
>>>>  };
>>>>
>>>> +static const ViaPMInitInfo vt82c686b_pm_init_info = {
>>>> +    .device_id = PCI_DEVICE_ID_VIA_ACPI,
>>>> +};
>>>> +
>>>> +static const TypeInfo vt82c686b_pm_info = {
>>>> +    .name          = TYPE_VT82C686B_PM,
>>>> +    .parent        = TYPE_VIA_PM,
>>>> +    .class_init    = via_pm_class_init,
>>>> +    .class_data    = (void *)&vt82c686b_pm_init_info,
>>>
>>> Igor said new code should avoid using .class_data:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg678305.html
>>> Can you convert to "leaf class"? Then this patch is good to go.
>>
>> That says for machines it is not advised (and Igor generally prefers init
>> funcs everywhere) but this is a device model. Is it still not allowed to
>> use class_data here? I think this is shorter this way than with an init
>> function but I may try to convert if absolutely necessary.
>
> For this simple case class_init would be cleaner as it doesn't need casting (void*).

Cast is only needed because of this:

../hw/isa/vt82c686.c:240:22: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      .class_data    = &vt82c686b_pm_init_info,
                       ^
../hw/isa/vt82c686.c:251:22: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      .class_data    = &vt8231_pm_init_info,
                       ^

Could be avoided by removing const from declaration, i.e.

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 604ab4a55e..14e9a4bf76 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -229,7 +229,7 @@ static const TypeInfo via_pm_info = {
      },
  };

-static const ViaPMInitInfo vt82c686b_pm_init_info = {
+static ViaPMInitInfo vt82c686b_pm_init_info = {
      .device_id = PCI_DEVICE_ID_VIA_ACPI,
  };

@@ -237,10 +237,10 @@ static const TypeInfo vt82c686b_pm_info = {
      .name          = TYPE_VT82C686B_PM,
      .parent        = TYPE_VIA_PM,
      .class_init    = via_pm_class_init,
-    .class_data    = (void *)&vt82c686b_pm_init_info,
+    .class_data    = &vt82c686b_pm_init_info,
  };

-static const ViaPMInitInfo vt8231_pm_init_info = {
+static ViaPMInitInfo vt8231_pm_init_info = {
      .device_id = 0x8235,
  };

@@ -248,7 +248,7 @@ static const TypeInfo vt8231_pm_info = {
      .name          = TYPE_VT8231_PM,
      .parent        = TYPE_VIA_PM,
      .class_init    = via_pm_class_init,
-    .class_data    = (void *)&vt8231_pm_init_info,
+    .class_data    = &vt8231_pm_init_info,
  };


Is that any better?

> But I'm fine with either approaches here.

In that case I'd just leave it as it is now unless you say otherwise.

>>
>>> A trivial example of conversion is commit f0eeb4b6154
>>> ("hw/arm/raspi: Avoid using TypeInfo::class_data pointer").
>>>
>>>> +};
>>>> +
>>>> +static const ViaPMInitInfo vt8231_pm_init_info = {
>>>> +    .device_id = 0x8235,
>
> Is it possible to replace magic number with a human readable macro?

Yes, I'll need to add these IDs where the other constants are defined in 
include/hw/pci/pci_ids.h but I did not want to touch that file until now 
as I tried to localise changes only to hw/isa/vt82c686.c but I can move 
these to there as new constants.

Regards,
BALATON Zoltan

>>>> +};
>>>> +
>>>> +static const TypeInfo vt8231_pm_info = {
>>>> +    .name          = TYPE_VT8231_PM,
>>>> +    .parent        = TYPE_VIA_PM,
>>>> +    .class_init    = via_pm_class_init,
>>>> +    .class_data    = (void *)&vt8231_pm_init_info,
>>>> +};
--3866299591-1809168621-1610049454=:37409--

