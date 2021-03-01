Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DD327DDC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:08:45 +0100 (CET)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhLw-00031k-Nz
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGhL2-0001tJ-QY; Mon, 01 Mar 2021 07:07:48 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:39919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGhL0-0007E9-Tb; Mon, 01 Mar 2021 07:07:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id D998B92B854A;
 Mon,  1 Mar 2021 13:07:43 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 13:07:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001331e5c03-b6d9-4f68-9027-d827fe17b5ba,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 16/21] sd: emmc: Support boot area in emmc image
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-17-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9096c6e9-bb84-7220-e780-7d5265464cbd@kaod.org>
Date: Mon, 1 Mar 2021 13:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-17-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 80ad7066-cddd-4b64-bdc2-5fb631caf045
X-Ovh-Tracer-Id: 15640720033240877837
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 8:33 PM, Sai Pavan Boddu wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> This assumes a specially constructued image:
> 
>   dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
>   dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
>   dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
>   cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
>   truncate --size 16GB mmc.img
>   truncate --size 128MB mmc-bootarea.img
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [clg: - changes on the definition names ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> [spb: use data_start property to access right emmc partition,
>       Clean up PARTITION_ENABLE support as incomplete,
>       Fix commit message to be generic.]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/sd/sd.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 08b77ad..d311477 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1044,6 +1044,34 @@ static void sd_lock_command(SDState *sd)
>          sd->card_status &= ~CARD_IS_LOCKED;
>  }
>  
> +/*
> + * This requires a disk image that has two boot partitions inserted at the
> + * beginning of it. The size of the boot partitions are configured in the
> + * ext_csd structure, which is hardcoded in qemu. They are currently set to
> + * 1MB each.
> + */
> +static uint32_t sd_bootpart_offset(SDState *sd)
> +{
> +    unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG] &
> +        EXT_CSD_PART_CONFIG_ACC_MASK;
> +    unsigned int boot_capacity = sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
> +
> +    if (!sd->emmc) {
> +        return 0;
> +    }
> +
> +    switch (access) {
> +    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
> +        return boot_capacity * 2;
> +    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
> +        return 0;
> +    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
> +        return boot_capacity * 1;
> +    default:
> +         g_assert_not_reached();
> +    }
> +}
> +
>  static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  {
>      uint32_t rca = 0x0000;
> @@ -1359,6 +1387,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>                  return sd_r1;
>              }
>  
> +            if (sd->emmc) {
> +                addr += sd_bootpart_offset(sd);


This could be a class handler. The default behavior would be to return 0.

C.

> +            }
>              sd->state = sd_sendingdata_state;
>              sd->data_start = addr;
>              sd->data_offset = 0;
> @@ -1378,6 +1409,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>                  return sd_r1;
>              }
>  
> +            if (sd->emmc) {
> +                addr += sd_bootpart_offset(sd);
> +            }
>              sd->state = sd_sendingdata_state;
>              sd->data_start = addr;
>              sd->data_offset = 0;
> @@ -1434,6 +1468,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>                  return sd_r1;
>              }
>  
> +            if (sd->emmc) {
> +                addr += sd_bootpart_offset(sd);
> +            }
>              sd->state = sd_receivingdata_state;
>              sd->data_start = addr;
>              sd->data_offset = 0;
> @@ -1464,6 +1501,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>                  return sd_r1;
>              }
>  
> +            if (sd->emmc) {
> +                addr += sd_bootpart_offset(sd);
> +            }
>              sd->state = sd_receivingdata_state;
>              sd->data_start = addr;
>              sd->data_offset = 0;
> 


