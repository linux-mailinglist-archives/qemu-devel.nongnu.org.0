Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6899538C8A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:11:41 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwya-0006hz-VE
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvwpc-0001wT-Uq
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:02:24 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:43037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvwpa-000319-T8
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:02:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0A98826846;
 Tue, 31 May 2022 08:02:19 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 10:02:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029a4c1ad0-d548-4493-8312-729ba588692d,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dc1a1210-2265-c997-2cac-70794b9a3c63@kaod.org>
Date: Tue, 31 May 2022 10:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 13/25] hw/sd: Add sd_cmd_SET_BLOCK_COUNT() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-block@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <20220530193816.45841-14-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220530193816.45841-14-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 335800a0-bf40-4340-ab99-266815033c6f
X-Ovh-Tracer-Id: 14666535139943156585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
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

On 5/30/22 21:38, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>   hw/sd/sd.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index a9130155be..b2f16dbb73 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1078,6 +1078,21 @@ static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
>           return sd_r1;
>   }
>   
> +static sd_rsp_type_t sd_cmd_SET_BLOCK_COUNT(SDState *sd, SDRequest req)
> +{
> +        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> +            return sd_cmd_illegal(sd, req);
> +        }
> +
> +        if (sd->state != sd_transfer_state) {
> +            return sd_invalid_state_for_cmd(sd, req);
> +        }
> +
> +        sd->multi_blk_cnt = req.arg;
> +
> +        return sd_r1;
> +}
> +
>   static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>   {
>       uint32_t rca = 0x0000;
> @@ -1321,20 +1336,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>           }
>           break;
>   
> -    case 23:    /* CMD23: SET_BLOCK_COUNT */
> -        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> -            return sd_invalid_state_for_cmd(sd, req);
> -        }
> -        switch (sd->state) {
> -        case sd_transfer_state:
> -            sd->multi_blk_cnt = req.arg;
> -            return sd_r1;
> -
> -        default:
> -            break;
> -        }
> -        break;
> -
>       /* Block write commands (Class 4) */
>       case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
>       case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
> @@ -2158,6 +2159,7 @@ static const SDProto sd_proto_sd = {
>           [3]         = sd_cmd_SEND_RELATIVE_ADDR,
>           [5]         = sd_cmd_illegal,
>           [19]        = sd_cmd_SEND_TUNING_BLOCK,
> +        [23]        = sd_cmd_SET_BLOCK_COUNT,
>           [52 ... 54] = sd_cmd_illegal,
>           [58]        = sd_cmd_illegal,
>           [59]        = sd_cmd_illegal,


