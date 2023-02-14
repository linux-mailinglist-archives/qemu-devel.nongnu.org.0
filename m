Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54D696DFF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:36:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS15w-0003Mn-QA; Tue, 14 Feb 2023 14:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS15X-00034M-BM
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:35:41 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS15V-0001PL-EA
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:35:39 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 7B5FD5FCB6;
 Tue, 14 Feb 2023 22:35:31 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 RZp2h20RkiE1-5GVLmsOE; Tue, 14 Feb 2023 22:35:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403330; bh=qWU3QSgtaqBH6dvYmlTOMiu7iYOcxBIa2CVM+Guyl/E=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=y2TtNcbsI5kcVxkZIpQA9WqGy7McCkHZbjNEI0hIkZdJS5mvsi2DYxsthsNG4MH1X
 wC9FzrVz7sCqylsW5WKRxAOkg9aVHFe60kQSdi/liKJzvxThMm4phM6V2PCeNzBXx4
 09e/sT1/sHkiAcelxoXkNLtiW1PrJs+v814yzjng=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c0ef7e78-ad4b-44ea-d902-9396bfeb6188@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 05/16] pci/shpc: pass PCIDevice pointer to
 shpc_slot_command()
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-6-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-6-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/02/2023 16:00, Vladimir Sementsov-Ogievskiy wrote:
> We'll need it in further patch to report bridge in QAPI event.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/shpc.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index 959dc470f3..9f964b1d70 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -263,9 +263,10 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
>       return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
>   }
>   
> -static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
> +static void shpc_slot_command(PCIDevice *d, uint8_t target,
>                                 uint8_t state, uint8_t power, uint8_t attn)
>   {
> +    SHPCDevice *shpc = d->shpc;
>       int slot = SHPC_LOGICAL_TO_IDX(target);
>       uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
>       uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
> @@ -314,8 +315,9 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
>       }
>   }
>   
> -static void shpc_command(SHPCDevice *shpc)
> +static void shpc_command(PCIDevice *d)
>   {
> +    SHPCDevice *shpc = d->shpc;
>       uint8_t code = pci_get_byte(shpc->config + SHPC_CMD_CODE);
>       uint8_t speed;
>       uint8_t target;
> @@ -336,7 +338,7 @@ static void shpc_command(SHPCDevice *shpc)
>           state = (code & SHPC_SLOT_STATE_MASK) >> SHPC_SLOT_STATE_SHIFT;
>           power = (code & SHPC_SLOT_PWR_LED_MASK) >> SHPC_SLOT_PWR_LED_SHIFT;
>           attn = (code & SHPC_SLOT_ATTN_LED_MASK) >> SHPC_SLOT_ATTN_LED_SHIFT;
> -        shpc_slot_command(shpc, target, state, power, attn);
> +        shpc_slot_command(d, target, state, power, attn);
>           break;
>       case 0x40 ... 0x47:
>           speed = code & SHPC_SEC_BUS_MASK;
> @@ -354,10 +356,10 @@ static void shpc_command(SHPCDevice *shpc)
>           }
>           for (i = 0; i < shpc->nslots; ++i) {
>               if (!(shpc_get_status(shpc, i, SHPC_SLOT_STATUS_MRL_OPEN))) {
> -                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
> +                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
>                                     SHPC_STATE_PWRONLY, SHPC_LED_ON, SHPC_LED_NO);
>               } else {
> -                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
> +                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
>                                     SHPC_STATE_NO, SHPC_LED_OFF, SHPC_LED_NO);
>               }
>           }
> @@ -375,10 +377,10 @@ static void shpc_command(SHPCDevice *shpc)
>           }
>           for (i = 0; i < shpc->nslots; ++i) {
>               if (!(shpc_get_status(shpc, i, SHPC_SLOT_STATUS_MRL_OPEN))) {
> -                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
> +                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
>                                     SHPC_STATE_ENABLED, SHPC_LED_ON, SHPC_LED_NO);
>               } else {
> -                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
> +                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
>                                     SHPC_STATE_NO, SHPC_LED_OFF, SHPC_LED_NO);
>               }
>           }
> @@ -410,7 +412,7 @@ static void shpc_write(PCIDevice *d, unsigned addr, uint64_t val, int l)
>           shpc->config[a] &= ~(val & w1cmask); /* W1C: Write 1 to Clear */
>       }
>       if (ranges_overlap(addr, l, SHPC_CMD_CODE, 2)) {
> -        shpc_command(shpc);
> +        shpc_command(d);
>       }
>       shpc_interrupt_update(d);
>   }
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>

