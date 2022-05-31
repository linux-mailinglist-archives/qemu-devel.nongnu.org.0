Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01E538B29
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 08:03:53 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvuyt-0004yD-Uq
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 02:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvuu3-00045I-8J
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:58:51 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvuu1-0001I4-C7
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:58:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D63E7105B0965;
 Tue, 31 May 2022 07:58:45 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 07:58:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001398db51b-0341-4f16-b9fe-1d04f759f6d8,
 46298A2EECAFD3CFAF4B3306687FD1921EC6068D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c3201b35-1679-d14e-01c4-64573d790762@kaod.org>
Date: Tue, 31 May 2022 07:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
CC: Vincent Palatin <vpalatin@chromium.org>, <qemu-block@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, <qemu-devel@nongnu.org>, Joel Stanley
 <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
 <bd3df6e1-62f9-04b6-f288-b12e6860ddaa@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bd3df6e1-62f9-04b6-f288-b12e6860ddaa@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3aa5b9b7-ecfb-4877-95be-912b3d590ecc
X-Ovh-Tracer-Id: 12579961134549732201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtheekleeitedvtdelgfevueehudehteelvddtgfefffelvdejkeejgeelvdekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/30/22 19:40, Philippe Mathieu-Daudé wrote:
> On 18/3/22 14:28, Cédric Le Goater wrote:
>> The initial eMMC support from Vincent Palatin was largely reworked to
>> match the current SD framework. The parameters mimick a real 4GB eMMC,
>> but it can be set to various sizes.
>>
>> This adds a new QOM object class for EMMC devices.
>>
>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>> Link: https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@chromium.org
>> [ jms: - Forward ported to QEMU 5.2 ]
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [ clg: - ported on aspeed-7.0 patchset
>>         - HPI activation ]
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
>>   include/hw/sd/sd.h     |   9 ++
>>   hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
>>   hw/sd/sdmmc-internal.c |   2 +-
>>   4 files changed, 311 insertions(+), 2 deletions(-)
> 
> 
>> +static void emmc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    SDCardClass *sc = SD_CARD_CLASS(klass);
>> +
>> +    dc->desc = "eMMC";
>> +    sc->proto = &sd_proto_emmc;
>> +    sc->spec_version = SD_PHY_SPECv3_01_VERS; /* eMMC requirement */
>> +    sc->set_csd = sd_emmc_set_csd;
>> +}
>> +
>> +static const TypeInfo emmc_info = {
>> +    .name = TYPE_EMMC,
>> +    .parent = TYPE_SD_CARD,
> 
> Hmm this is odd to have the model inheriting features from SD_CARD but then behaving differently (one could enumerate QDEV objects implementing
> TYPE_SD_CARD then use them expecting they match the SD card protocol).
> 
> Why do you need to have TYPE_SD_CARD as parent?

Simply for the initialization.
> Could we simply duplicate sd_class_init() assignations instead? That
> would likely make it easier to modify eMMC handlers.

May be we lack a base abstract class ?

It would clean up this section in the realize routine :

    sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;

     if (sc->proto) {
         sd->proto = sc->proto;
     }

Thanks,

C.

>> +    .class_init = emmc_class_init,
>> + };


