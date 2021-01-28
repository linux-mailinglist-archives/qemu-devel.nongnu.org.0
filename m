Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF02306E0D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:05:51 +0100 (CET)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51NG-0004vi-TT
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l51M5-0004O3-WB; Thu, 28 Jan 2021 02:04:38 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l51M2-0004RH-9m; Thu, 28 Jan 2021 02:04:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DB3877FEF114;
 Thu, 28 Jan 2021 08:04:30 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 08:04:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001750ca293-1c99-4969-ac9e-db9cf693b43e,
 E57BA53B85CD0AA8C573FC380C1E6825DC018892) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/3] hw/sd: sd: Move the sd_block_{read, write} and macros
 ahead
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
 <20210128064312.16085-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <da07ee87-7134-564b-3743-34e1dbbd7f67@kaod.org>
Date: Thu, 28 Jan 2021 08:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128064312.16085-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ec312c4b-9b6c-4374-96d5-b596546fb906
X-Ovh-Tracer-Id: 7061081268945062819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepsghmvghnghdrtghnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Bin,

On 1/28/21 7:43 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> These APIs and macros may be referenced by functions that are
> currently before them. Move them ahead a little bit.

We could also change fprintf() by qemu_log_mask()

Thanks,

C. 

 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/sd.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index a6a0b3dcc6..1886d4b30b 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -739,6 +739,27 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
>      qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
>  }
>  
> +static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
> +{
> +    trace_sdcard_read_block(addr, len);
> +    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
> +        fprintf(stderr, "sd_blk_read: read error on host side\n");
> +    }
> +}
> +
> +static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
> +{
> +    trace_sdcard_write_block(addr, len);
> +    if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
> +        fprintf(stderr, "sd_blk_write: write error on host side\n");
> +    }
> +}
> +
> +#define BLK_READ_BLOCK(a, len)  sd_blk_read(sd, a, len)
> +#define BLK_WRITE_BLOCK(a, len) sd_blk_write(sd, a, len)
> +#define APP_READ_BLOCK(a, len)  memset(sd->data, 0xec, len)
> +#define APP_WRITE_BLOCK(a, len)
> +
>  static void sd_erase(SDState *sd)
>  {
>      int i;
> @@ -1742,27 +1763,6 @@ send_response:
>      return rsplen;
>  }
>  
> -static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
> -{
> -    trace_sdcard_read_block(addr, len);
> -    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
> -        fprintf(stderr, "sd_blk_read: read error on host side\n");
> -    }
> -}
> -
> -static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
> -{
> -    trace_sdcard_write_block(addr, len);
> -    if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
> -        fprintf(stderr, "sd_blk_write: write error on host side\n");
> -    }
> -}
> -
> -#define BLK_READ_BLOCK(a, len)	sd_blk_read(sd, a, len)
> -#define BLK_WRITE_BLOCK(a, len)	sd_blk_write(sd, a, len)
> -#define APP_READ_BLOCK(a, len)	memset(sd->data, 0xec, len)
> -#define APP_WRITE_BLOCK(a, len)
> -
>  void sd_write_byte(SDState *sd, uint8_t value)
>  {
>      int i;
> 


