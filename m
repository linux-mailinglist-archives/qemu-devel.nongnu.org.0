Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A91170D8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 16:49:38 +0100 (CET)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieLI1-000711-G1
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 10:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ieLGu-0006JW-HU
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ieLGt-0000qT-1J
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:48:28 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23787
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ieLGs-0000lo-S7
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575906506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKFum2NqapLS9dJIe2nqX+2wB4rxnOUF4CE5lGPi2bA=;
 b=dlq9ZeQaUUg2/vwRr2VOOasnkxcJ0fRo15c3jOFMQn2WfII6ffns1xtLF2tgXZ214GubdM
 AyETmXuz384f5q/CvAEEj/f2egPb2PXQ/m772aWLi3SvPEvAN7khAK6vFZ0tswZmYRygAw
 L3UlZ4+mLI0khIyKfsgyLuLwujNKHeM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-__6zeh-BMteHHaGqM8MZ4w-1; Mon, 09 Dec 2019 10:48:25 -0500
Received: by mail-wr1-f69.google.com with SMTP id z10so7606145wrt.21
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 07:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cKFum2NqapLS9dJIe2nqX+2wB4rxnOUF4CE5lGPi2bA=;
 b=JKAAWs/SD3fX0Z0eKGq3DpITF87BFsunIxR+je2dYQ8/rnqc3bT7GaIJj9/GwEfPUp
 TB+xPT1tFfRKzNykoTiJoorkGFo90DatYgV+MCzhynWbgYA9lAGgLiUL5wPj18GgV+Ph
 aLjYAs1KVg/oDwiZ/EB5w1xsBp14HgaeOU/iGfx+fjYHqQb5/2HqABMqvZQNoLqNE0q/
 hRJXiKMX+aE4H8rmUpZ5lwzT1yQzTWElsYN1phxjZMSYC0w42QAK6BvoV4T4N5cCgBYZ
 RIagh0a9A5MDz7xaEFZAFvckoRputfAnwb6fnmN+zqteFz1GaaAQl16eIooO6410gEcU
 t6iQ==
X-Gm-Message-State: APjAAAWAabhU/08kitUdgeeicgzWiNqGX2gAOre477BxhomalJheElg/
 gQe3IP88kkk/0Rx+pAW1nzDZT/gXe6U7ILCvBuMOxXeM8UscErC3r/wDN20g0R2mJZfhqxKaYxR
 VAtc1isOJ4hqoZBw=
X-Received: by 2002:adf:f606:: with SMTP id t6mr2812372wrp.85.1575906503993;
 Mon, 09 Dec 2019 07:48:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPLXw+YwHMvrySi606y5I18W+jaai3xi6AWIiylUBhOkpQgO1YrxyKpPdV0CkFhqfCr2/8mg==
X-Received: by 2002:adf:f606:: with SMTP id t6mr2812341wrp.85.1575906503599;
 Mon, 09 Dec 2019 07:48:23 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id u189sm128678wmg.40.2019.12.09.07.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 07:48:23 -0800 (PST)
Subject: Re: [PATCH v2 15/18] xen: convert "-machine igd-passthru" to an
 accelerator property
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
 <1575903705-12925-16-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1647db84-31e5-d1ba-79f1-eb56f6788ec0@redhat.com>
Date: Mon, 9 Dec 2019 16:48:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575903705-12925-16-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-MC-Unique: __6zeh-BMteHHaGqM8MZ4w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: thuth@redhat.com, elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/19 4:01 PM, Paolo Bonzini wrote:
> The first machine property to fall is Xen's Intel integrated graphics
> passthrough.  The "-machine igd-passthru" option does not set anymore
> a property on the machine object, but desugars to a GlobalProperty on
> accelerator objects.
> 
> The setter is very simple, since the value ends up in a
> global variable, so this patch also provides an example before the more
> complicated cases that follow it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/core/machine.c   | 20 --------------------
>   hw/xen/xen-common.c | 16 ++++++++++++++++
>   include/hw/boards.h |  1 -
>   qemu-options.hx     |  7 ++++---
>   vl.c                | 14 ++++----------
>   5 files changed, 24 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 45ddfb6..d7a0356 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -412,20 +412,6 @@ static void machine_set_graphics(Object *obj, bool value, Error **errp)
>       ms->enable_graphics = value;
>   }
>   
> -static bool machine_get_igd_gfx_passthru(Object *obj, Error **errp)
> -{
> -    MachineState *ms = MACHINE(obj);
> -
> -    return ms->igd_gfx_passthru;
> -}
> -
> -static void machine_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
> -{
> -    MachineState *ms = MACHINE(obj);
> -
> -    ms->igd_gfx_passthru = value;
> -}
> -
>   static char *machine_get_firmware(Object *obj, Error **errp)
>   {
>       MachineState *ms = MACHINE(obj);
> @@ -862,12 +848,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
>       object_class_property_set_description(oc, "graphics",
>           "Set on/off to enable/disable graphics emulation", &error_abort);
>   
> -    object_class_property_add_bool(oc, "igd-passthru",
> -        machine_get_igd_gfx_passthru, machine_set_igd_gfx_passthru,
> -        &error_abort);
> -    object_class_property_set_description(oc, "igd-passthru",
> -        "Set on/off to enable/disable igd passthrou", &error_abort);

So before this option was available in builds/targets ...

> -
>       object_class_property_add_str(oc, "firmware",
>           machine_get_firmware, machine_set_firmware,
>           &error_abort);
> diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
> index 5284b0d..6cba30c 100644
> --- a/hw/xen/xen-common.c
> +++ b/hw/xen/xen-common.c
> @@ -124,6 +124,16 @@ static void xen_change_state_handler(void *opaque, int running,
>       }
>   }
>   
> +static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
> +{
> +    return has_igd_gfx_passthru;
> +}
> +
> +static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
> +{
> +    has_igd_gfx_passthru = value;
> +}
> +
>   static void xen_setup_post(MachineState *ms, AccelState *accel)
>   {
>       int rc;
> @@ -177,6 +187,12 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
>       ac->compat_props = g_ptr_array_new();
>   
>       compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
> +
> +    object_class_property_add_bool(oc, "igd-passthru",
> +        xen_get_igd_gfx_passthru, xen_set_igd_gfx_passthru,
> +        &error_abort);
> +    object_class_property_set_description(oc, "igd-passthru",
> +        "Set on/off to enable/disable igd passthrou", &error_abort);

... and now it is only available when building with --enable-xen.

This is a good cleanup.

I wonder if ppl uses 'igd-passthru=off' without Xen, won't it break 
their command line?

>   }
>   
>   #define TYPE_XEN_ACCEL ACCEL_CLASS_NAME("xen")
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 36fcbda..cdcf481 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -287,7 +287,6 @@ struct MachineState {
>       bool mem_merge;
>       bool usb;
>       bool usb_disabled;
> -    bool igd_gfx_passthru;
>       char *firmware;
>       bool iommu;
>       bool suppress_vmdesc;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9775258..6f12b31 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -37,7 +37,6 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>       "                kvm_shadow_mem=size of KVM shadow MMU in bytes\n"
>       "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>       "                mem-merge=on|off controls memory merge support (default: on)\n"
> -    "                igd-passthru=on|off controls IGD GFX passthrough support (default=off)\n"
>       "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>       "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>       "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
> @@ -71,8 +70,6 @@ more than one accelerator specified, the next one is used if the previous one
>   fails to initialize.
>   @item kernel_irqchip=on|off
>   Controls in-kernel irqchip support for the chosen accelerator when available.
> -@item gfx_passthru=on|off
> -Enables IGD GFX passthrough support for the chosen machine when available.
>   @item vmport=on|off|auto
>   Enables emulation of VMWare IO port, for vmmouse etc. auto says to select the
>   value based on accel. For accel=xen the default is off otherwise the default
> @@ -120,6 +117,7 @@ ETEXI
>   DEF("accel", HAS_ARG, QEMU_OPTION_accel,
>       "-accel [accel=]accelerator[,prop[=value][,...]]\n"
>       "                select accelerator (kvm, xen, hax, hvf, whpx or tcg; use 'help' for a list)\n"

Here we could use:

#ifdef CONFIG_XEN_BACKEND

(not sure we want such #ifdefry although)

> +    "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"

#endif

>       "                tb-size=n (TCG translation block cache size)\n"
>       "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
>   STEXI
> @@ -130,6 +128,9 @@ kvm, xen, hax, hvf, whpx or tcg can be available. By default, tcg is used. If th
>   more than one accelerator specified, the next one is used if the previous one
>   fails to initialize.
>   @table @option
> +@item igd-passthru=on|off
> +When Xen is in use, this option controls whether Intel integrated graphics
> +devices can be passed through to the guest (default=off)
>   @item tb-size=@var{n}
>   Controls the size (in MiB) of the TCG translation block cache.
>   @item thread=single|multi
> diff --git a/vl.c b/vl.c
> index e6ff56b..ee872f2 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1257,13 +1257,6 @@ static void configure_msg(QemuOpts *opts)
>   }
>   
>   
> -/* Now we still need this for compatibility with XEN. */
> -bool has_igd_gfx_passthru;
> -static void igd_gfx_passthru(void)
> -{
> -    has_igd_gfx_passthru = current_machine->igd_gfx_passthru;
> -}
> -
>   /***********************************************************/
>   /* USB devices */
>   
> @@ -2642,6 +2635,10 @@ static int machine_set_property(void *opaque,
>       if (g_str_equal(qom_name, "accel")) {
>           return 0;
>       }

Similarly:

#ifdef CONFIG_XEN_BACKEND

> +    if (g_str_equal(qom_name, "igd-passthru")) {
> +        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
> +        return 0;
> +    }

#endif

>   
>       return object_parse_property_opt(opaque, name, value, "type", errp);
>   }
> @@ -4456,9 +4453,6 @@ int main(int argc, char **argv, char **envp)
>               exit(1);
>       }
>   
> -    /* Check if IGD GFX passthrough. */
> -    igd_gfx_passthru();
> -
>       /* init generic devices */
>       rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
>       qemu_opts_foreach(qemu_find_opts("device"),
> 


