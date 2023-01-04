Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7D165CEDB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 09:56:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCzYX-0008V4-VR; Wed, 04 Jan 2023 03:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCzYW-0008Uc-IV
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:55:28 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCzYU-0003F4-LD
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fsiLtbd9rvYxQGzsFTyaFZu15TNhKoAUdGdaaXNM1eA=; b=yRbD7i4vXPYh1gerJ8YbT3fvqG
 T6OFOXBwHsc/59Quh/ToGuohkM7fCGKMcNkb6y33Orqb52Ia3rjbLg7l7oyukGeooSN6zzAbZGsQ4
 OMyFSWv5lubRAT5EdQNLaRRyTtThB4HtbBdf+BMmyTq1JyxFTrutcDkWM0Q69YOxUwg4yMUrI+/qo
 XbyUE/8RMdHaCZ+w38TW/C23VyACt/vFC1EyGUDK4OBoW9bM8OvRU3C0GcPVoFOfU7WC0+UgQIHl7
 Bb2O8eOT76gwZVqllqLw3/sXcVgeGNFJ7lQGddJjUYQMswoK5M5Sfh+UNCCKx6H85OqviRAfiUoeO
 srfcXY0zEOViIK7hWLVNfFeEF62Dhtxp7AD1XBgGujBz1v+RDIZ4d80LjMayqZXo3u8YqXdx4Rx2V
 zdgJWxFIrUUBEOQMQyu4C7WOyEbBvuyCcWCZ7S7tX9SnNQMjbw6VhoVnE8GqwVDjsQKkJZD9KfK8q
 E2qcVI+S0zpheACrPndJoeS4nycApAtOsAvQKK3l1Iqz7IS8KKdQl45/HjqxpU4YvwxFPyNpXBl9s
 yBFBN3j/uImWDqhWQHCsZl2CtodST5vxxihbKgfLDa6pehkANVJPsdLOytHfdXuOnxPr/vBlJ7+op
 TX885qG9D/ruu/k//vknrRs3/yEMbc9CgCxJLz3Xk=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCzY2-0007Pv-8R; Wed, 04 Jan 2023 08:55:02 +0000
Message-ID: <1bd2f34b-2364-1ce7-a3f4-946e76594344@ilande.co.uk>
Date: Wed, 4 Jan 2023 08:55:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230103084801.20437-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/6] hw/rtc/mc146818rtc: Add a property for the
 availability of the slew tick policy
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 03/01/2023 08:47, Thomas Huth wrote:

> We want to get rid of the "#ifdef TARGET_I386" statements in the mc146818
> code, so we need a different way to decide whether the slew tick policy
> is available or not. Introduce a new property "slew-tick-policy-available"
> which can be set by the machines that support this tick policy.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/rtc/mc146818rtc.h |  1 +
>   hw/i386/pc_piix.c            |  1 +
>   hw/isa/lpc_ich9.c            |  1 +
>   hw/isa/piix3.c               |  1 +
>   hw/rtc/mc146818rtc.c         | 16 ++++++++++------
>   5 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 1db0fcee92..54af63d091 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -45,6 +45,7 @@ struct RTCState {
>       QEMUTimer *coalesced_timer;
>       Notifier clock_reset_notifier;
>       LostTickPolicy lost_tick_policy;
> +    bool slew_tick_policy_available;
>       Notifier suspend_notifier;
>       QLIST_ENTRY(RTCState) link;
>   };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index bc9ea8cdae..382c6add3b 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,
>   
>           rtc_state = isa_new(TYPE_MC146818_RTC);
>           qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
> +        qdev_prop_set_bit(DEVICE(rtc_state), "slew-tick-policy-available", true);
>           isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
>   
>           i8257_dma_init(isa_bus, 0);
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 498175c1cc..aeab4d8549 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
>   
>       /* RTC */
>       qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
> +    qdev_prop_set_bit(DEVICE(&lpc->rtc), "slew-tick-policy-available", true);
>       if (!qdev_realize(DEVICE(&lpc->rtc), BUS(isa_bus), errp)) {
>           return;
>       }
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index c68e51ddad..825b1cbee2 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>   
>       /* RTC */
>       qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
> +    qdev_prop_set_bit(DEVICE(&d->rtc), "slew-tick-policy-available", true);
>       if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
>           return;
>       }
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 947d68c257..86381a74c3 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>       rtc_set_date_from_host(isadev);
>   
>       switch (s->lost_tick_policy) {
> -#ifdef TARGET_I386
> -    case LOST_TICK_POLICY_SLEW:
> -        s->coalesced_timer =
> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
> -        break;
> -#endif
>       case LOST_TICK_POLICY_DISCARD:
>           break;
> +    case LOST_TICK_POLICY_SLEW:
> +#ifdef TARGET_I386
> +        if (s->slew_tick_policy_available) {
> +            s->coalesced_timer = timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
> +            break;
> +        }
> +#endif
> +        /* fallthrough */
>       default:
>           error_setg(errp, "Invalid lost tick policy.");
>           return;
> @@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] = {
>       DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
>       DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>                                  lost_tick_policy, LOST_TICK_POLICY_DISCARD),
> +    DEFINE_PROP_BOOL("slew-tick-policy-available", RTCState,
> +                     slew_tick_policy_available, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };

My first thought when looking at the new "slew-tick-policy-available" property 
introduced above was that it seems to overlap with the "lost_tick_policy" property 
defined just above it using DEFINE_PROP_LOSTTICKPOLICY().

This made me wonder if a better approach here would be to move the logic that 
determines if LOST_TICK_POLICY_SLEW is available into the "lost_tick_policy" property 
setter defined at 
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/core/qdev-properties-system.c#L558.

If you look at the code directly below the link above you can see how set_blocksize() 
overrides the .set function for qdev_prop_blocksize to provide additional validation, 
which is similar to what we are trying to do here.

I think it may be possible to come up with a similar solution for 
qdev_prop_losttickpolicy which makes use of the logic you suggested before i.e.

     MachineState *ms = MACHINE(qdev_get_machine());

     if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
         ....
     }

which can then emit a suitable warning or return an error accordingly. A quick glance 
at hw/core/qdev-properties-system.c suggests there are a number of similar examples 
showing how this could be done.


ATB,

Mark.

