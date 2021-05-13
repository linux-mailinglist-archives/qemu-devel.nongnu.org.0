Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC07137FD3C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:26:59 +0200 (CEST)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhG30-0000lk-Kn
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lhFzc-0006d0-Ss; Thu, 13 May 2021 14:23:28 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:55540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lhFzT-0001bx-Hi; Thu, 13 May 2021 14:23:28 -0400
Received: from fwd19.aul.t-online.de (fwd19.aul.t-online.de [172.20.27.65])
 by mailout07.t-online.de (Postfix) with SMTP id 73BE548FE9;
 Thu, 13 May 2021 20:23:11 +0200 (CEST)
Received: from [192.168.211.200]
 (VrypukZr8hgbKGyhQXt1h23VkHDuwbbnB5XFoilpvDD-9pcAxGT33gmHMQROdJ0ZK3@[79.208.18.63])
 by fwd19.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhFzG-1VPP2O0; Thu, 13 May 2021 20:23:06 +0200
Subject: Re: [PATCH] hw/input/ps2: Use ps2_raise_irq() instead of open coding
 it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210513171244.3940519-1-f4bug@amsat.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <709e2305-39b4-d727-f551-ed38c059290a@t-online.de>
Date: Thu, 13 May 2021 20:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513171244.3940519-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: VrypukZr8hgbKGyhQXt1h23VkHDuwbbnB5XFoilpvDD-9pcAxGT33gmHMQROdJ0ZK3
X-TOI-EXPURGATEID: 150726::1620930186-0000782A-9055CC5E/0/0 CLEAN NORMAL
X-TOI-MSGID: b3adbde5-8d9a-4975-94fd-91279f273b53
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Inspired-by: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/input/ps2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 72cdb80ae1c..02d7e5da723 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -213,7 +213,7 @@ void ps2_raise_irq(PS2State *s)
>   void ps2_queue(PS2State *s, int b)
>   {
>       ps2_queue_noirq(s, b);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>   }
>   
>   void ps2_queue_2(PS2State *s, int b1, int b2)
> @@ -224,7 +224,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)
>   
>       ps2_queue_noirq(s, b1);
>       ps2_queue_noirq(s, b2);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>   }
>   
>   void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
> @@ -236,7 +236,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
>       ps2_queue_noirq(s, b1);
>       ps2_queue_noirq(s, b2);
>       ps2_queue_noirq(s, b3);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>   }
>   
>   void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
> @@ -249,7 +249,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
>       ps2_queue_noirq(s, b2);
>       ps2_queue_noirq(s, b3);
>       ps2_queue_noirq(s, b4);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>   }
>   
>   /* keycode is the untranslated scancode in the current scancode set. */

Hi Philippe,

can you read my local qemu repository? :-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

