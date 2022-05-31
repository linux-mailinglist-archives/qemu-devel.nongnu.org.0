Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F611538B30
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 08:07:17 +0200 (CEST)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvv2C-0006th-Jj
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 02:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvuxQ-0005Af-7T
 for qemu-devel@nongnu.org; Tue, 31 May 2022 02:02:24 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvuxJ-0001dp-PA
 for qemu-devel@nongnu.org; Tue, 31 May 2022 02:02:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CE797105B0B18;
 Tue, 31 May 2022 08:01:25 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 08:01:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006164e9db0-1328-48b9-9a33-b16959217a7c,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <afd114ef-5f1b-bbb2-e3d1-00f2c989bda0@kaod.org>
Date: Tue, 31 May 2022 08:01:24 +0200
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
 <74bd7e0f-807a-f43a-a282-d6d4db2a39e7@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <74bd7e0f-807a-f43a-a282-d6d4db2a39e7@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8eb20c3a-fbc4-48a3-9255-b9e2aae67fd0
X-Ovh-Tracer-Id: 12624997132365368102
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtheekleeitedvtdelgfevueehudehteelvddtgfefffelvdejkeejgeelvdekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/30/22 20:29, Philippe Mathieu-Daudé wrote:
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
>>   static void sd_instance_init(Object *obj)
>>   {
>>       SDState *sd = SD_CARD(obj);
>> @@ -2162,10 +2338,19 @@ static void sd_instance_finalize(Object *obj)
>>   static void sd_realize(DeviceState *dev, Error **errp)
>>   {
>>       SDState *sd = SD_CARD(dev);
>> +    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
>>       int ret;
>>       sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
>> +    if (sc->proto) {
>> +        sd->proto = sc->proto;
>> +    }
>> +
>> +    if (sc->spec_version) {
>> +        sd->spec_version = sc->spec_version;
>> +    }
>> +
>>       switch (sd->spec_version) {
>>       case SD_PHY_SPECv1_10_VERS
>>        ... SD_PHY_SPECv3_01_VERS:
> 
> 
> Instead I'd use:


Yes. This is better.

Thanks,

C.

> -- >8 --
> @@ -2301,14 +2297,26 @@ static const TypeInfo sd_info = {
>       .instance_finalize = sd_instance_finalize,
>   };
> 
> +static void emmc_realize(DeviceState *dev, Error **errp)
> +{
> +    SDState *sd = SD_CARD(dev);
> +
> +    if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> +            error_setg(errp, "Minimum spec for eMMC is v3.01");
> +            return;
> +    }
> +
> +    sd_realize(dev, errp);
> +}
> +
>   static void emmc_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       SDCardClass *sc = SD_CARD_CLASS(klass);
> 
>       dc->desc = "eMMC";
> +    dc->realize = emmc_realize;
>       sc->proto = &sd_proto_emmc;
>   }
> 
> ---
> 
> 


