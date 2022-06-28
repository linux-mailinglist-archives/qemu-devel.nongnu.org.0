Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42F55E5D5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:55:51 +0200 (CEST)
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DZ7-0006c9-1l
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o6DWg-0003eM-2L; Tue, 28 Jun 2022 11:53:18 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:56651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o6DWc-0002ua-2x; Tue, 28 Jun 2022 11:53:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F259511240C77;
 Tue, 28 Jun 2022 17:52:53 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 17:52:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00146efc0c2-c73b-4916-806b-182288e832c4,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <61a77a3a-ca38-f4d1-8c18-5d240360e0ba@kaod.org>
Date: Tue, 28 Jun 2022 17:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Content-Language: en-US
To: Francisco Iglesias <frasse.iglesias@gmail.com>, Iris Chen
 <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>, Iris
 Chen <irischenlj@gmail.com>
References: <20220621202427.2680413-1-irischenlj@fb.com>
 <20220622094542.GE10629@fralle-msi>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220622094542.GE10629@fralle-msi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b2ee8012-9f0f-4cf9-b5d0-f702f46dd25d
X-Ovh-Tracer-Id: 2581969961602157514
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepihhrihhstghhvghnlhhjsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehvdel
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

Alistair, Francisco,

On 6/22/22 11:45, Francisco Iglesias wrote:
> On [2022 Jun 21] Tue 13:24:27, Iris Chen wrote:
>> From: Iris Chen <irischenlj@gmail.com>
>>
>> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> 
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

I am planning to include this patch in the next aspeed PR if that's
OK with you.

Thanks,

C.

> 
>> ---
>> Fixed .needed for subsection and suggestions from Francisco
>>
>>   hw/block/m25p80.c | 82 ++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 67 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 81ba3da4df..3045dda53b 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -472,11 +472,13 @@ struct Flash {
>>       uint8_t spansion_cr2v;
>>       uint8_t spansion_cr3v;
>>       uint8_t spansion_cr4v;
>> +    bool wp_level;
>>       bool write_enable;
>>       bool four_bytes_address_mode;
>>       bool reset_enable;
>>       bool quad_enable;
>>       bool aai_enable;
>> +    bool status_register_write_disabled;
>>       uint8_t ear;
>>   
>>       int64_t dirty_page;
>> @@ -723,6 +725,8 @@ static void complete_collecting_data(Flash *s)
>>           flash_erase(s, s->cur_addr, s->cmd_in_progress);
>>           break;
>>       case WRSR:
>> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
>> +
>>           switch (get_man(s)) {
>>           case MAN_SPANSION:
>>               s->quad_enable = !!(s->data[1] & 0x02);
>> @@ -1165,22 +1169,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>           break;
>>   
>>       case WRSR:
>> -        if (s->write_enable) {
>> -            switch (get_man(s)) {
>> -            case MAN_SPANSION:
>> -                s->needed_bytes = 2;
>> -                s->state = STATE_COLLECTING_DATA;
>> -                break;
>> -            case MAN_MACRONIX:
>> -                s->needed_bytes = 2;
>> -                s->state = STATE_COLLECTING_VAR_LEN_DATA;
>> -                break;
>> -            default:
>> -                s->needed_bytes = 1;
>> -                s->state = STATE_COLLECTING_DATA;
>> -            }
>> -            s->pos = 0;
>> +        /*
>> +         * If WP# is low and status_register_write_disabled is high,
>> +         * status register writes are disabled.
>> +         * This is also called "hardware protected mode" (HPM). All other
>> +         * combinations of the two states are called "software protected mode"
>> +         * (SPM), and status register writes are permitted.
>> +         */
>> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
>> +            || !s->write_enable) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "M25P80: Status register write is disabled!\n");
>> +            break;
>> +        }
>> +
>> +        switch (get_man(s)) {
>> +        case MAN_SPANSION:
>> +            s->needed_bytes = 2;
>> +            s->state = STATE_COLLECTING_DATA;
>> +            break;
>> +        case MAN_MACRONIX:
>> +            s->needed_bytes = 2;
>> +            s->state = STATE_COLLECTING_VAR_LEN_DATA;
>> +            break;
>> +        default:
>> +            s->needed_bytes = 1;
>> +            s->state = STATE_COLLECTING_DATA;
>>           }
>> +        s->pos = 0;
>>           break;
>>   
>>       case WRDI:
>> @@ -1195,6 +1211,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>   
>>       case RDSR:
>>           s->data[0] = (!!s->write_enable) << 1;
>> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
>> +
>>           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>>               s->data[0] |= (!!s->quad_enable) << 6;
>>           }
>> @@ -1484,6 +1502,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>>       return r;
>>   }
>>   
>> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
>> +{
>> +    Flash *s = M25P80(opaque);
>> +    /* WP# is just a single pin. */
>> +    assert(n == 0);
>> +    s->wp_level = !!level;
>> +}
>> +
>>   static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>   {
>>       Flash *s = M25P80(ss);
>> @@ -1515,12 +1541,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>           s->storage = blk_blockalign(NULL, s->size);
>>           memset(s->storage, 0xFF, s->size);
>>       }
>> +
>> +    qdev_init_gpio_in_named(DEVICE(s),
>> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
>>   }
>>   
>>   static void m25p80_reset(DeviceState *d)
>>   {
>>       Flash *s = M25P80(d);
>>   
>> +    s->wp_level = true;
>> +    s->status_register_write_disabled = false;
>> +
>>       reset_memory(s);
>>   }
>>   
>> @@ -1587,6 +1619,25 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
>>       }
>>   };
>>   
>> +static bool m25p80_wp_level_srwd_needed(void *opaque)
>> +{
>> +    Flash *s = (Flash *)opaque;
>> +
>> +    return !s->wp_level || s->status_register_write_disabled;
>> +}
>> +
>> +static const VMStateDescription vmstate_m25p80_write_protect = {
>> +    .name = "m25p80/write_protect",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = m25p80_wp_level_srwd_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_BOOL(wp_level, Flash),
>> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   static const VMStateDescription vmstate_m25p80 = {
>>       .name = "m25p80",
>>       .version_id = 0,
>> @@ -1618,6 +1669,7 @@ static const VMStateDescription vmstate_m25p80 = {
>>       .subsections = (const VMStateDescription * []) {
>>           &vmstate_m25p80_data_read_loop,
>>           &vmstate_m25p80_aai_enable,
>> +        &vmstate_m25p80_write_protect,
>>           NULL
>>       }
>>   };
>> -- 
>> 2.30.2
>>
>>


