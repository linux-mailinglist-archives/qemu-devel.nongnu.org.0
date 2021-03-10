Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C20333CAD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:34:10 +0100 (CET)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJy2T-0000pn-A1
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJy1O-0008Us-VG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:33:02 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJy1M-00084j-2P
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:33:02 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 025977462FD;
 Wed, 10 Mar 2021 13:32:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D96BF7462E1; Wed, 10 Mar 2021 13:32:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D82547462D6;
 Wed, 10 Mar 2021 13:32:55 +0100 (CET)
Date: Wed, 10 Mar 2021 13:32:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
In-Reply-To: <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
Message-ID: <78a760-65e9-3689-b0b7-cb80b7af81a@eik.bme.hu>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
> The 60Hz timer is initialised using timer_new_ns() meaning that the timer
> interval should be measured in ns, and therefore its period is a thousand
> times too short.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/misc/mac_via.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index f994fefa7c..c6e1552a59 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -302,8 +302,8 @@ static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>     MOS6522State *s = MOS6522(v1s);
>
>     /* 60 Hz irq */
> -    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
> -                          16630 * 16630;
> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630000) /
> +                          16630000 * 16630000;

Can you put this magic number in a #define maybe also rewriting it in a 
way that shows it corresponds to a 60 Hz interval. (There's 
NANOSECONDS_PER_SECOND defined in include/qemu/timer.h that could be used 
for that, there's also SCALE_MS that might replace 1000 * 1000 elsewhere 
in this file). Also NANOSECONDS_PER_SECOND / 60 is 16666666, should that 
value be used here instead?

Regards,
BALATON Zoltan

>
>     if (s->ier & VIA1_IRQ_60HZ) {
>         timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
>

