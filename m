Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38D6538CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:20:45 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvx7N-0007uQ-4g
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvx55-0006P6-HG
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:18:23 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:54509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvx53-0005jm-FK
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:18:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7AEC3105BEC57;
 Tue, 31 May 2022 10:18:18 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 10:18:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ca895fb5-6cee-43aa-8e43-2e0471f132a8,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6f7e3fbb-da40-51e3-02af-2ea0fb3c4e04@kaod.org>
Date: Tue, 31 May 2022 10:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: Vincent Palatin <vpalatin@chromium.org>, <qemu-block@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, <qemu-devel@nongnu.org>, Joel Stanley
 <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
 <bd3df6e1-62f9-04b6-f288-b12e6860ddaa@amsat.org>
 <c3201b35-1679-d14e-01c4-64573d790762@kaod.org>
 <13fcad78-c10c-a85c-25e9-607bcc35fdc4@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <13fcad78-c10c-a85c-25e9-607bcc35fdc4@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 076f8452-8539-44d6-b9ed-77e19116fde7
X-Ovh-Tracer-Id: 14936751116336597798
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehkeelieetvddtlefgveeuheduheetledvtdfgfeffledvjeekjeegledvkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/22 10:03, Philippe Mathieu-Daudé wrote:
> On 31/5/22 07:58, Cédric Le Goater wrote:
>> On 5/30/22 19:40, Philippe Mathieu-Daudé wrote:
>>> On 18/3/22 14:28, Cédric Le Goater wrote:
>>>> The initial eMMC support from Vincent Palatin was largely reworked to
>>>> match the current SD framework. The parameters mimick a real 4GB eMMC,
>>>> but it can be set to various sizes.
>>>>
>>>> This adds a new QOM object class for EMMC devices.
>>>>
>>>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>>>> Link: https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@chromium.org
>>>> [ jms: - Forward ported to QEMU 5.2 ]
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> [ clg: - ported on aspeed-7.0 patchset
>>>>         - HPI activation ]
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
>>>>   include/hw/sd/sd.h     |   9 ++
>>>>   hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
>>>>   hw/sd/sdmmc-internal.c |   2 +-
>>>>   4 files changed, 311 insertions(+), 2 deletions(-)
>>>
>>>
>>>> +static void emmc_class_init(ObjectClass *klass, void *data)
>>>> +{
>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>> +    SDCardClass *sc = SD_CARD_CLASS(klass);
>>>> +
>>>> +    dc->desc = "eMMC";
>>>> +    sc->proto = &sd_proto_emmc;
>>>> +    sc->spec_version = SD_PHY_SPECv3_01_VERS; /* eMMC requirement */
>>>> +    sc->set_csd = sd_emmc_set_csd;
>>>> +}
>>>> +
>>>> +static const TypeInfo emmc_info = {
>>>> +    .name = TYPE_EMMC,
>>>> +    .parent = TYPE_SD_CARD,
>>>
>>> Hmm this is odd to have the model inheriting features from SD_CARD but then behaving differently (one could enumerate QDEV objects implementing
>>> TYPE_SD_CARD then use them expecting they match the SD card protocol).
>>>
>>> Why do you need to have TYPE_SD_CARD as parent?
>>
>> Simply for the initialization.
>>> Could we simply duplicate sd_class_init() assignations instead? That
>>> would likely make it easier to modify eMMC handlers.
>>
>> May be we lack a base abstract class ?
> 
> I've been thinking about it but maybe not enough. I'll revisit.
> 
>> It would clean up this section in the realize routine :
>>
>>     sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
>>
>>      if (sc->proto) {
>>          sd->proto = sc->proto;
>>      }
> 
> In v2 I moved the 'proto' field from instance to class, so we don't need
> this hack anymore.

Indeed :

    static void sd_realize(DeviceState *dev, Error **errp)
    {
        SDState *sd = SD_CARD(dev);
        SDCardClass *sc = SD_CARD_GET_CLASS(sd);
        int ret;
    
        sc->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
        ...

but this is assigning a class attribute from an instance :/

C.





