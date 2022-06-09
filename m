Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FEE544E23
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:56:41 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIeO-0001E1-J2
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nzGPA-00010z-Lw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:32:48 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:33117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nzGP8-0007Bs-Gm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:32:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7BE1F289E9;
 Thu,  9 Jun 2022 11:32:31 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 9 Jun 2022
 13:32:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003e2829381-84b6-4d5d-aba9-152f874ae2a8,
 376DE8092D82845C1A21469494DE4B9390A12E85) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5581ada3-958c-ebc5-71b8-71fa08465bae@kaod.org>
Date: Thu, 9 Jun 2022 13:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, Iris Chen
 <irischenlj@gmail.com>
References: <20220609031320.2212468-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220609031320.2212468-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cab5aaf0-755c-4fdf-93e5-a98715db6ff1
X-Ovh-Tracer-Id: 15730792026717522820
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehirhhishgthhgvnhhljhesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/9/22 05:13, Iris Chen wrote:
> From: Iris Chen <irischenlj@gmail.com>
> 
> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> ---
> Addressed all comments from V1. The biggest change: removed object_class_property_add.


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> 
>   hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
>   tests/qtest/aspeed_smc-test.c |  2 ++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 81ba3da4df..1a20bd55d4 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -27,12 +27,14 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
>   #include "hw/ssi/ssi.h"
> +#include "hw/irq.h"
>   #include "migration/vmstate.h"
>   #include "qemu/bitops.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
>   #include "qapi/error.h"
> +#include "qapi/visitor.h"
>   #include "trace.h"
>   #include "qom/object.h"
>   
> @@ -472,11 +474,13 @@ struct Flash {
>       uint8_t spansion_cr2v;
>       uint8_t spansion_cr3v;
>       uint8_t spansion_cr4v;
> +    bool wp_level;
>       bool write_enable;
>       bool four_bytes_address_mode;
>       bool reset_enable;
>       bool quad_enable;
>       bool aai_enable;
> +    bool status_register_write_disabled;
>       uint8_t ear;
>   
>       int64_t dirty_page;
> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
>           flash_erase(s, s->cur_addr, s->cmd_in_progress);
>           break;
>       case WRSR:
> +        /*
> +         * If WP# is low and status_register_write_disabled is high,
> +         * status register writes are disabled.
> +         * This is also called "hardware protected mode" (HPM). All other
> +         * combinations of the two states are called "software protected mode"
> +         * (SPM), and status register writes are permitted.
> +         */
> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> +            || !s->write_enable) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: Status register write is disabled!\n");
> +            break;
> +        }
> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +
>           switch (get_man(s)) {
>           case MAN_SPANSION:
>               s->quad_enable = !!(s->data[1] & 0x02);
> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>   
>       case RDSR:
>           s->data[0] = (!!s->write_enable) << 1;
> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +
>           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>               s->data[0] |= (!!s->quad_enable) << 6;
>           }
> @@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>       return r;
>   }
>   
> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> +{
> +    Flash *s = M25P80(opaque);
> +    /* WP# is just a single pin. */
> +    assert(n == 0);
> +    s->wp_level = !!level;
> +}
> +
>   static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>   {
>       Flash *s = M25P80(ss);
> @@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>           s->storage = blk_blockalign(NULL, s->size);
>           memset(s->storage, 0xFF, s->size);
>       }
> +
> +    qdev_init_gpio_in_named(DEVICE(s),
> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
>   }
>   
>   static void m25p80_reset(DeviceState *d)
>   {
>       Flash *s = M25P80(d);
>   
> +    s->wp_level = true;
> +    s->status_register_write_disabled = false;
> +
>       reset_memory(s);
>   }
>   
> @@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 = {
>           VMSTATE_UINT8(needed_bytes, Flash),
>           VMSTATE_UINT8(cmd_in_progress, Flash),
>           VMSTATE_UINT32(cur_addr, Flash),
> +        VMSTATE_BOOL(wp_level, Flash),
> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
>           VMSTATE_BOOL(write_enable, Flash),
>           VMSTATE_BOOL(reset_enable, Flash),
>           VMSTATE_UINT8(ear, Flash),
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index ec233315e6..c5d97d4410 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -56,7 +56,9 @@ enum {
>       BULK_ERASE = 0xc7,
>       READ = 0x03,
>       PP = 0x02,
> +    WRSR = 0x1,
>       WREN = 0x6,
> +    SRWD = 0x80,
>       RESET_ENABLE = 0x66,
>       RESET_MEMORY = 0x99,
>       EN_4BYTE_ADDR = 0xB7,


