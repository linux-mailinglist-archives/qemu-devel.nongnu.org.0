Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23166C680
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSDt-0000g7-VP; Mon, 16 Jan 2023 11:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSDk-0000fT-77
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:20:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSDi-0000kT-Dk
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:20:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so8257779wms.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G7t664h0qFOt/H2sZaLpzI97KdaR9Ed5qwqcEcYdNb0=;
 b=BUcJML9XRnSvbiYHS+qMf1m7DmELfVG7wrbuypldBRxUMi3SumqQxlKkcIvWiTeW4l
 SqOu0zRrFGIL7BIoyuu6vGztSo1WaCyOXatzVmopz+D9kbAZDBp7hllsbYCjcr5NxOPo
 reDzkgZrwSgAm/wYKosq88oOhnjKdQ9UrNnv/WwPmEfgvlSsQTPcw/cphvE97Tc2iRJe
 UNxE3nv9wPjJfJpb7Y+r/YgXO6Ues1zNMFjTbX5tbcTxt64NCWmxzlbsqsoaxig9nAf+
 c5CQDtfdbPAfTMe9TS1GOamp601NT/QOi0/UcqzPS4nJK3OYZmiUwk8GD+NHO4pPbbNk
 Yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7t664h0qFOt/H2sZaLpzI97KdaR9Ed5qwqcEcYdNb0=;
 b=773VSdbBm36dVPu2E4morSvlWs9YJdCq9WnkjMZmfer6vykYM+ehzBLVG0UhhXGCB5
 8b23oGd2jeJMidA/UUjjiDidQGH0RTlGnjjnJp22rx3PYsUNsvugQ9r6O0bwM+4peIfE
 naTY1EILJAGVB9vciQtQI1NAJhc2p2WGTOOS0iei2S/dBHj5bWIRYzlbaqZ7yc0WiKLr
 dga0gQcpxXlVuzChYVfTHQPBFqDwT6SQoe33Mm46Z52oIcn3N5ZWbbfLgcjMVL37E3bX
 1y7Y5tcW8XHf5IDKhig+9AohXADc7O9L1npNBQRgxtPJVTWu6z7IvS5NXqsb5SiBhcIR
 M8Ig==
X-Gm-Message-State: AFqh2kpPOI5v9ut2TRa+iMmsaYB9NS2OIsSGhOMHmgGmCmxinPvgk1sI
 1kpFPBIDWwOYTDK+Hlr7fjw=
X-Google-Smtp-Source: AMrXdXvc0MOEsG8aneQQZI/3wfgNYLufY1icohgAAxgw4ZpGNbwcvHiDKUPY2TcZVNoKoouAOnXpYQ==
X-Received: by 2002:a05:600c:4e05:b0:3d3:5a4a:9103 with SMTP id
 b5-20020a05600c4e0500b003d35a4a9103mr34530wmq.31.1673886024654; 
 Mon, 16 Jan 2023 08:20:24 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1c7515000000b003d995a704fdsm33640739wmc.33.2023.01.16.08.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 08:20:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4cab3d11-aa47-086c-852d-c58795ae35e3@xen.org>
Date: Mon, 16 Jan 2023 16:20:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 08/51] xen-platform: allow its creation with
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:19, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> The only thing we need to handle on KVM side is to change the
> pfn from R/W to R/O.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/meson.build    |  5 ++++-
>   hw/i386/xen/xen_platform.c | 39 +++++++++++++++++++++++++-------------
>   2 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
> index be84130300..79d75cc927 100644
> --- a/hw/i386/xen/meson.build
> +++ b/hw/i386/xen/meson.build
> @@ -2,6 +2,9 @@ i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>     'xen-hvm.c',
>     'xen-mapcache.c',
>     'xen_apic.c',
> -  'xen_platform.c',
>     'xen_pvdevice.c',
>   ))
> +
> +i386_ss.add(when: 'CONFIG_XENFV_MACHINE', if_true: files(
> +  'xen_platform.c',
> +))
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 50174c2269..00f0527b30 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -28,9 +28,9 @@
>   #include "hw/ide.h"
>   #include "hw/ide/pci.h"
>   #include "hw/pci/pci.h"
> -#include "hw/xen/xen_common.h"
>   #include "migration/vmstate.h"
> -#include "hw/xen/xen-legacy-backend.h"
> +#include "hw/xen/xen.h"
> +#include "net/net.h"
>   #include "trace.h"
>   #include "sysemu/xen.h"
>   #include "sysemu/block-backend.h"
> @@ -38,6 +38,11 @@
>   #include "qemu/module.h"
>   #include "qom/object.h"
>   
> +#ifdef CONFIG_XEN
> +#include "hw/xen/xen_common.h"
> +#include "hw/xen/xen-legacy-backend.h"
> +#endif
> +
>   //#define DEBUG_PLATFORM
>   
>   #ifdef DEBUG_PLATFORM
> @@ -280,18 +285,26 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>       PCIXenPlatformState *s = opaque;
>   
>       switch (addr) {
> -    case 0: /* Platform flags */ {
> -        hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
> -            HVMMEM_ram_ro : HVMMEM_ram_rw;
> -        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
> -            DPRINTF("unable to change ro/rw state of ROM memory area!\n");
> -        } else {
> +    case 0: /* Platform flags */
> +        if (xen_mode == XEN_EMULATE) {
> +            /* XX: Use i440gx/q35 PAM setup to do this? */
>               s->flags = val & PFFLAG_ROM_LOCK;

Given that this is not RFC, do you have a definite plan? TBH I think 
only ancient (Bochs) ROMBIOS messes with this; I can't find any trace in 
SeaBIOS anyway. So maybe we just don't care.

   Paul

> -            DPRINTF("changed ro/rw state of ROM memory area. now is %s state.\n",
> -                    (mem_type == HVMMEM_ram_ro ? "ro":"rw"));
> +#ifdef CONFIG_XEN
> +        } else {
> +            hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
> +                HVMMEM_ram_ro : HVMMEM_ram_rw;
> +
> +            if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
> +                DPRINTF("unable to change ro/rw state of ROM memory area!\n");
> +            } else {
> +                s->flags = val & PFFLAG_ROM_LOCK;
> +                DPRINTF("changed ro/rw state of ROM memory area. now is %s state.\n",
> +                        (mem_type == HVMMEM_ram_ro ? "ro" : "rw"));
> +            }
> +#endif
>           }
>           break;
> -    }
> +
>       case 2:
>           log_writeb(s, val);
>           break;
> @@ -509,8 +522,8 @@ static void xen_platform_realize(PCIDevice *dev, Error **errp)
>       uint8_t *pci_conf;
>   
>       /* Device will crash on reset if xen is not initialized */
> -    if (!xen_enabled()) {
> -        error_setg(errp, "xen-platform device requires the Xen accelerator");
> +    if (xen_mode == XEN_DISABLED) {
> +        error_setg(errp, "xen-platform device requires a Xen guest");
>           return;
>       }
>   


