Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1001538D84
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:13:07 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxw2-0000el-HH
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nvxov-00043D-Tm; Tue, 31 May 2022 05:05:46 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nvxot-0004Kq-IK; Tue, 31 May 2022 05:05:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EEAC922C7C;
 Tue, 31 May 2022 09:05:37 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 11:05:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001301cfe7f-9f82-4d51-8e5d-7250450c9e19,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad706330-0103-cad4-6782-d5482a69adaa@kaod.org>
Date: Tue, 31 May 2022 11:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 14/25] hw/sd: Basis for eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-block@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <20220530193816.45841-15-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220530193816.45841-15-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4877540f-02a5-4473-a0be-d4a3bd2dd618
X-Ovh-Tracer-Id: 15735858577153493865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/30/22 21:38, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The initial eMMC support from Vincent Palatin was largely reworked to
> match the current SD framework.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> TODO: Do not inherit TYPE_SD_CARD, duplicate sd_class_init()
> ---
>   hw/sd/sd.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/sd/sd.h |  3 +++
>   2 files changed, 45 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index b2f16dbb73..8b178aa261 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2166,6 +2166,19 @@ static const SDProto sd_proto_sd = {
>       },
>   };
>   
> +static const SDProto sd_proto_emmc = {
> +    .name = "eMMC",
> +    .cmd = {
> +        [0]         = sd_cmd_GO_IDLE_STATE,
> +        [5]         = sd_cmd_illegal,


And this needed an extra :

+        [23]        = sd_cmd_SET_BLOCK_COUNT,


Thanks,

C.


> +        [19]        = sd_cmd_SEND_TUNING_BLOCK,
> +        [41]        = sd_cmd_illegal,
> +        [52 ... 54] = sd_cmd_illegal,
> +        [58]        = sd_cmd_illegal,
> +        [59]        = sd_cmd_illegal,
> +    },
> +};
> +
>   static void sd_instance_init(Object *obj)
>   {
>       SDState *sd = SD_CARD(obj);
> @@ -2284,9 +2297,38 @@ static const TypeInfo sd_info = {
>       .instance_finalize = sd_instance_finalize,
>   };
>   
> +static void emmc_realize(DeviceState *dev, Error **errp)
> +{
> +    SDState *sd = SD_CARD(dev);
> +
> +    if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> +            error_setg(errp, "Minimum spec for eMMC is v3.01");
> +            return;
> +    }
> +
> +    sd_realize(dev, errp);
> +}
> +
> +static void emmc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SDCardClass *sc = SD_CARD_CLASS(klass);
> +
> +    dc->desc = "eMMC";
> +    dc->realize = emmc_realize;
> +    sc->proto = &sd_proto_emmc;
> +}
> +
> +static const TypeInfo emmc_info = {
> +    .name = TYPE_EMMC,
> +    .parent = TYPE_SD_CARD,
> +    .class_init = emmc_class_init,
> + };
> +
>   static void sd_register_types(void)
>   {
>       type_register_static(&sd_info);
> +    type_register_static(&emmc_info);
>   }
>   
>   type_init(sd_register_types)
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 0d94e1f346..e52436b7a5 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -93,6 +93,9 @@ typedef struct {
>   #define TYPE_SD_CARD "sd-card"
>   OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
>   
> +#define TYPE_EMMC "emmc"
> +DECLARE_INSTANCE_CHECKER(SDState, EMMC, TYPE_EMMC)
> +
>   struct SDCardClass {
>       /*< private >*/
>       DeviceClass parent_class;


