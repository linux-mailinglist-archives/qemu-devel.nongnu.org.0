Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EC3337CB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:49:21 +0100 (CET)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuWu-0007UU-42
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuV0-0006Zp-UF
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:47:24 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:35393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuUz-0007BT-EQ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:47:22 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSqbe-1lAfO51kVy-00UKtB; Wed, 10 Mar 2021 09:47:19 +0100
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5d6ba4c7-0ad8-1987-890a-2faea335827c@vivier.eu>
Date: Wed, 10 Mar 2021 09:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ui5KyukR4w5lSPgcA8o1jowOH5kpR5bCeCYLBkMUk9VgVec6pKc
 IlSxAs0Q8YO5OycqjsgveUGPVaJQU5ffuL3N5X+N6Ce90ZQrhQ17YlK//pM7g8fUUpQB4c6
 9Xs82pjfZrq2xo+EnzErQQM9vDBVvVXf8YRmj75bgB4WYv/OYLkCHGWncWZEkwQ70hcqgBE
 W+h7Ox0SLHfat08k6V2AQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ESYoYX39Isw=:YGTheJCq5Vya5VWimT50cQ
 6waau1Pct+oXkNdhv2yRaAZaghoi6JatgXmXUW5M46A4i5w0HGiuEvFPiHaNDDEeC4XPnRDa0
 SkPnLuua8r8LpO/msCSLnytNBSWoSoIBBrVFVGf3oqH8XA8ALQTbtC4CoJuU/IV5t0M7DKECA
 MuEUll2+i8qCVavrU56oSJFb3I6HKuJQIsBnzVpfDcs97JG2OZQCzvJYd+bNPsU8XZSO8SxtM
 z99SMNDtx6L/QBn0vE81ZXVa5pID6KPxAUK+OhWYSCNFtk2iiL1FPUt8NosPIrDsjSPgzBldo
 hT7LP18UZdPqzZaR2Ax7smKtO09i3XqM4pA+NRnb/hgBtV1hr6LzFZuXlR1/aHRBrxVF7GLfI
 rBr+BOzZXxvVrEUKbVrDY5s/9QY58PXVrY81YAHX9C4V/rswh3RJD/kQyb4Ea
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2021 à 09:09, Mark Cave-Ayland a écrit :
> The 60Hz timer is initialised using timer_new_ns() meaning that the timer
> interval should be measured in ns, and therefore its period is a thousand
> times too short.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index f994fefa7c..c6e1552a59 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -302,8 +302,8 @@ static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>      MOS6522State *s = MOS6522(v1s);
>  
>      /* 60 Hz irq */
> -    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
> -                          16630 * 16630;
> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630000) /
> +                          16630000 * 16630000;
>  
>      if (s->ier & VIA1_IRQ_60HZ) {
>          timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.Eu>

