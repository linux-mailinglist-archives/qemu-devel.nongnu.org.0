Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F7D565EA6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:51:44 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8T2l-0007FQ-2m
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o8T1S-0006Bj-6V; Mon, 04 Jul 2022 16:50:22 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:56091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o8T1P-0008Ej-Oh; Mon, 04 Jul 2022 16:50:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DEA2711448CA3;
 Mon,  4 Jul 2022 22:50:14 +0200 (CEST)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 4 Jul 2022
 22:50:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00324955e44-bb79-43c9-a3c9-0f56b08f63bd,
 37F03A08AC6718E95FD3DEE1BCAFFD005826E168) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <edf73253-3cdd-4bf9-9b3b-8f7dc7a4f567@kaod.org>
Date: Mon, 4 Jul 2022 22:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] hw: m25p80: Add Block Protect and Top Bottom bits for
 write protect
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
References: <20220627185234.1911337-1-irischenlj@fb.com>
 <20220627185234.1911337-2-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627185234.1911337-2-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 70ad59a5-073b-4cc9-a4bc-96a96db26ef9
X-Ovh-Tracer-Id: 5946440358893423492
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehledgudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeguiieglhhishhtsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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

On 6/27/22 20:52, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
>   hw/block/m25p80.c | 74 +++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 62 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 50b523e5b1..0156a70f5e 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -38,21 +38,19 @@
>   #include "trace.h"
>   #include "qom/object.h"
>   
> -/* Fields for FlashPartInfo->flags */
> -
> -/* erase capabilities */
> -#define ER_4K 1
> -#define ER_32K 2
> -/* set to allow the page program command to write 0s back to 1. Useful for
> - * modelling EEPROM with SPI flash command set
> - */
> -#define EEPROM 0x100
> -
>   /* 16 MiB max in 3 byte address mode */
>   #define MAX_3BYTES_SIZE 0x1000000
> -
>   #define SPI_NOR_MAX_ID_LEN 6
>   
> +/* Fields for FlashPartInfo->flags */
> +enum spi_nor_option_flags {
> +    ER_4K                  = BIT(0),
> +    ER_32K                 = BIT(1),
> +    EEPROM                 = BIT(2),
> +    SNOR_F_HAS_SR_TB       = BIT(3),
> +    SNOR_F_HAS_SR_BP3_BIT6 = BIT(4),
> +};
> +
>   typedef struct FlashPartInfo {
>       const char *part_name;
>       /*
> @@ -253,7 +251,8 @@ static const FlashPartInfo known_devices[] = {
>       { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
>       { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>       { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
> +           ER_4K | SNOR_F_HAS_SR_BP3_BIT6 | SNOR_F_HAS_SR_TB) },
>       { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>       { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>       { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
> @@ -480,6 +479,11 @@ struct Flash {
>       bool reset_enable;
>       bool quad_enable;
>       bool aai_enable;
> +    bool block_protect0;
> +    bool block_protect1;
> +    bool block_protect2;
> +    bool block_protect3;
> +    bool top_bottom_bit;
>       bool status_register_write_disabled;
>       uint8_t ear;
>   
> @@ -630,6 +634,29 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
>           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
>           return;
>       }
> +    uint32_t block_protect_value = (s->block_protect3 << 3) |
> +                                   (s->block_protect2 << 2) |
> +                                   (s->block_protect1 << 1) |
> +                                   (s->block_protect0 << 0);
> +
> +     uint32_t num_protected_sectors = 1 << (block_protect_value - 1);

Something wrong will occur if all block_protect[0123] are zeroes.

C.

> +     uint32_t sector = addr / s->pi->sector_size;
> +
> +     /* top_bottom_bit == 0 means TOP */
> +    if (!s->top_bottom_bit) {
> +        if (block_protect_value > 0 &&
> +            s->pi->n_sectors <= sector + num_protected_sectors) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: write with write protect!\n");
> +            return;
> +        }
> +    } else {
> +        if (block_protect_value > 0 && sector < num_protected_sectors) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: write with write protect!\n");
> +            return;
> +        }
> +    }
>   
>       if ((prev ^ data) & data) {
>           trace_m25p80_programming_zero_to_one(s, addr, prev, data);
> @@ -728,6 +755,15 @@ static void complete_collecting_data(Flash *s)
>           break;
>       case WRSR:
>           s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +        s->block_protect0 = extract32(s->data[0], 2, 1);
> +        s->block_protect1 = extract32(s->data[0], 3, 1);
> +        s->block_protect2 = extract32(s->data[0], 4, 1);
> +        if (s->pi->flags & SNOR_F_HAS_SR_TB) {
> +            s->top_bottom_bit = extract32(s->data[0], 5, 1);
> +        }
> +        if (s->pi->flags & SNOR_F_HAS_SR_BP3_BIT6) {
> +            s->block_protect3 = extract32(s->data[0], 6, 1);
> +        }
>   
>           switch (get_man(s)) {
>           case MAN_SPANSION:
> @@ -1213,6 +1249,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>       case RDSR:
>           s->data[0] = (!!s->write_enable) << 1;
>           s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +        s->data[0] |= (!!s->block_protect0) << 2;
> +        s->data[0] |= (!!s->block_protect1) << 3;
> +        s->data[0] |= (!!s->block_protect2) << 4;
> +        if (s->pi->flags & SNOR_F_HAS_SR_TB) {
> +            s->data[0] |= (!!s->top_bottom_bit) << 5;
> +        }
> +        if (s->pi->flags & SNOR_F_HAS_SR_BP3_BIT6) {
> +            s->data[0] |= (!!s->block_protect3) << 6;
> +        }
>   
>           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>               s->data[0] |= (!!s->quad_enable) << 6;
> @@ -1553,6 +1598,11 @@ static void m25p80_reset(DeviceState *d)
>   
>       s->wp_level = true;
>       s->status_register_write_disabled = false;
> +    s->block_protect0 = false;
> +    s->block_protect1 = false;
> +    s->block_protect2 = false;
> +    s->block_protect3 = false;
> +    s->top_bottom_bit = false;
>   
>       reset_memory(s);
>   }


