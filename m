Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03393337D6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:52:01 +0100 (CET)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuZU-0003AC-VC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuXc-0001CI-R6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:50:04 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:40243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuXa-0000AX-Id
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:50:04 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MC2o9-1lRusf3zHp-00CPGY; Wed, 10 Mar 2021 09:50:01 +0100
Subject: Re: [PATCH 7/7] mac_via: remove VIA1 timer optimisations
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <86256653-8c39-b1cd-6d33-f2df58b45eee@vivier.eu>
Date: Wed, 10 Mar 2021 09:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310080908.11861-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8VW26ptSVU3HFfuqXARlopWlfaFryDKG7dUSrqnKf/+mVZbZwtf
 EVtY2lv+da5Tz4xpj38mAFxjFd82gKURhJG1rvCS7DGqBGtTw2Q9S+LQYBUdVVyNjZFyYI2
 m7klSuEck0uiiFe15R0TUVBTXPOpof3yFWI0LVdbb3ZeyuOEum9vPOZVgOCGuV4c4JbXlqu
 mDZgeOxowkaeES9AyRlOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AM6RRkt4wmE=:X9MqQ26KY6CpAVTBccCHxd
 MHUn5lTaa3bN/wpmdu8qWm9rz+BiI+AaaVbHcNexYVmzga4jjjf9O9R+wrZCaUhistqg3HHDg
 m5ZlEvMj2xWqicu+EEpiCkGzJlNMx/tr5esjXefRDJTaPA43cieEefGahSs4hl7zl2gyFPBS9
 D5k2Pz7O2rgPMk9C+geSrNEY/fWr+qgOWGgfBp3PBOckqpgjDinTG5dc7W8LwciYYQscaVYS5
 76zpxBNb7Z+RpCKKsBqNGJIOTGwiNt1akCbtN4jm3/o/Gjo8FUDI9n3zX/WOUYJ6n+Z0ZhTAn
 a/ppOa0dFi3W4yKZ87CBFTB12+dCrzr14sTIuB4h54mbv6OOh2HBl4rsqNrlI9cbabRUji93g
 UEHf33pO/+ZiQRVqLaLtCSTAHMLDypupYcfSCw1BbAsIy6ZoskXbcRs+nAhm9
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
> The original implementation of the Macintosh VIA devices in commit 6dca62a000
> "hw/m68k: add VIA support" used timer optimisations to reduce high CPU usage on
> the host when booting Linux. These optimisations worked by waiting until VIA1
> port B was accessed before re-arming the timers.
> 
> The MacOS toolbox ROM constantly writes to VIA1 port B which calls
> via1_one_second_update() and via1_sixty_hz_update() to calculate the new expiry
> time, causing the timers to constantly reset and never fire. The effect of this
> is that the Ticks (0x16a) global variable holding the number of 60Hz timer ticks
> since reset is never incremented by the interrupt causing time to stand still.
> 
> Whilst the code was introduced as a performance optimisation, it is likely that
> the high CPU usage was actually caused by the incorrect 60Hz timer interval
> fixed in the previous patch. Remove the optimisation to keep everything simple
> and enable the MacOS toolbox ROM to start keeping time.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 43 ++++---------------------------------------
>  1 file changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index c6e1552a59..23b11dd522 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -299,30 +299,17 @@ enum {
>  
>  static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>  {
> -    MOS6522State *s = MOS6522(v1s);
> -
>      /* 60 Hz irq */
>      v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630000) /
>                            16630000 * 16630000;
> -
> -    if (s->ier & VIA1_IRQ_60HZ) {
> -        timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
> -    } else {
> -        timer_del(v1s->sixty_hz_timer);
> -    }
> +    timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
>  }
>  
>  static void via1_one_second_update(MOS6522Q800VIA1State *v1s)
>  {
> -    MOS6522State *s = MOS6522(v1s);
> -
>      v1s->next_second = (qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1000) /
>                         1000 * 1000;
> -    if (s->ier & VIA1_IRQ_ONE_SECOND) {
> -        timer_mod(v1s->one_second_timer, v1s->next_second);
> -    } else {
> -        timer_del(v1s->one_second_timer);
> -    }
> +    timer_mod(v1s->one_second_timer, v1s->next_second);
>  }
>  
>  static void via1_sixty_hz(void *opaque)
> @@ -893,21 +880,6 @@ static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
>      MOS6522State *ms = MOS6522(s);
> -    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> -
> -    /*
> -     * If IRQs are disabled, timers are disabled, but we need to update
> -     * VIA1_IRQ_60HZ and VIA1_IRQ_ONE_SECOND bits in the IFR
> -     */
> -
> -    if (now >= s->next_sixty_hz) {
> -        ms->ifr |= VIA1_IRQ_60HZ;
> -        via1_sixty_hz_update(s);
> -    }
> -    if (now >= s->next_second) {
> -        ms->ifr |= VIA1_IRQ_ONE_SECOND;
> -        via1_one_second_update(s);
> -    }
>  
>      addr = (addr >> 9) & 0xf;
>      return mos6522_read(ms, addr, size);
> @@ -931,9 +903,6 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
>          v1s->last_b = ms->b;
>          break;
>      }
> -
> -    via1_one_second_update(v1s);
> -    via1_sixty_hz_update(v1s);
>  }
>  
>  static const MemoryRegionOps mos6522_q800_via1_ops = {
> @@ -978,16 +947,10 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
>  static void mac_via_reset(DeviceState *dev)
>  {
>      MacVIAState *m = MAC_VIA(dev);
> -    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
>      ADBBusState *adb_bus = &m->adb_bus;
>  
>      adb_set_autopoll_enabled(adb_bus, true);
>  
> -    timer_del(v1s->sixty_hz_timer);
> -    v1s->next_sixty_hz = 0;
> -    timer_del(v1s->one_second_timer);
> -    v1s->next_second = 0;
> -
>      m->cmd = REG_EMPTY;
>      m->alt = REG_EMPTY;
>  }
> @@ -1026,9 +989,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
>      m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
>                                                       via1_one_second,
>                                                       &m->mos6522_via1);
> +    via1_one_second_update(&m->mos6522_via1);
>      m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                                    via1_sixty_hz,
>                                                    &m->mos6522_via1);
> +    via1_sixty_hz_update(&m->mos6522_via1);
>  
>      qemu_get_timedate(&tm, 0);
>      m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

