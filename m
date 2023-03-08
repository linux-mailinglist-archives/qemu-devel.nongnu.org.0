Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0DB6B003E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 08:52:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZoab-0000E9-Pc; Wed, 08 Mar 2023 02:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZoaa-0000Dg-1w
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZoaY-0004JV-Eu
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678261913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+LZqj9M9XfJAp5M+pzniSD4HdHHal6gae0oPqogZt4=;
 b=XiZBur7f5rmJowTMtNQ1EFesWuOhdDDyoBRY6R8vfqXfND8eRWzZoRvIZSuX+vD/7HnVNj
 pxW+0Iq+PE7kO49HjzibvGB+GsXpfNd2uVvmVZL+1YkkipW3Z8jC3v2brYnCN4J+qyxUOk
 4d595FBmEsB7WkEya6RiLJhXygqiEow=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-3a5c29KtMJeYZhrCjYyZHw-1; Wed, 08 Mar 2023 02:51:52 -0500
X-MC-Unique: 3a5c29KtMJeYZhrCjYyZHw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so5574220wml.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 23:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678261911;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+LZqj9M9XfJAp5M+pzniSD4HdHHal6gae0oPqogZt4=;
 b=tHHZNCd02zRNoQ3TXT78OradLFbgrP5thErEzgeANIDLq2DjsNHlxyn5cFf8k0/2I3
 r2jxsLGwTc2R4SpThTGpXuQPj3g2PaTmUpV2FS+NK+5JCYgVMtnOsSTtb2x/ItiSUXxB
 eMAgcRgILpjGxXd/frfDkrgjE+N5eINCYpVpI8a/Z3X2bW82GCR3WoJgbJz1O663Z2lM
 I7m/NlUGeo3dsChi735/eeVZ7A6uy2KMVrFfA0kDgHvaTIDR81PnJ7DwaOYPFwHSh0fa
 /efc/5nzUdM7s5bno6NQfnNtsLkQB6ouibFgA9hIOPARtvXSsy9K2yk2DTofO9U9MVv0
 HOpQ==
X-Gm-Message-State: AO0yUKWpk64dCz395V+ORmA+ViX1HVHtHcfxPTArKe38hiTdfcmy3zdq
 6auHMTViHtxqRCcUfeYLulXJFxcEBfvbQu8zMbHc55+/o2dHYjLK2V5c3Hcg1T/XlGGU9uv86Bf
 O0nuCEcTWTGLIT24y6NTz65vmAg==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id
 k30-20020a05600c1c9e00b003eaf8830180mr15120355wms.7.1678261911535; 
 Tue, 07 Mar 2023 23:51:51 -0800 (PST)
X-Google-Smtp-Source: AK7set98JiZyiWRFnJz6uGdQW6xAGFGJqbUL1s9E+ejP7CXzB4pLBkKKVrM0KsMb6FJXMxsC0wACJA==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id
 k30-20020a05600c1c9e00b003eaf8830180mr15120346wms.7.1678261911274; 
 Tue, 07 Mar 2023 23:51:51 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-166.web.vodafone.de.
 [109.43.179.166]) by smtp.gmail.com with ESMTPSA id
 m7-20020a7bcb87000000b003dc4a47605fsm18763871wmi.8.2023.03.07.23.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 23:51:50 -0800 (PST)
Message-ID: <a49d66c6-dac4-34c4-cb81-3d54615225c1@redhat.com>
Date: Wed, 8 Mar 2023 08:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/4] hw/misc: Add MIPS Trickbox device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230308000745.56394-1-philmd@linaro.org>
 <20230308000745.56394-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230308000745.56394-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/03/2023 01.07, Philippe Mathieu-Daudé wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> MIPS Trickbox is a emulated device present in MIPS's IASIM simulator
> for decades. It's capable of managing simulator status, signaling
> interrupts, doing DMA and EJTAG signal stimulations.
> 
> For now we just use definition of this device and implement power
> management related functions.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Message-Id: <20230304223803.55764-2-jiaxun.yang@flygoat.com>
> [PMD: Remove pointless mask in mips_trickbox_write(),
>        declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/Kconfig                 |  3 +
>   hw/misc/meson.build             |  1 +
>   hw/misc/mips_trickbox.c         | 97 +++++++++++++++++++++++++++++++++
>   hw/misc/trace-events            |  4 ++
>   include/hw/misc/mips_trickbox.h | 39 +++++++++++++
>   5 files changed, 144 insertions(+)
>   create mode 100644 hw/misc/mips_trickbox.c
>   create mode 100644 include/hw/misc/mips_trickbox.h
> 
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 2ef5781ef8..9f09da23c1 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -85,6 +85,9 @@ config STM32F4XX_EXTI
>   config MIPS_ITU
>       bool
>   
> +config MIPS_TRICKBOX
> +    bool
> +
>   config MPS2_FPGAIO
>       bool
>       select LED
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index a40245ad44..4b6c50832c 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -136,6 +136,7 @@ specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
>   
>   specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
>   specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
> +specific_ss.add(when: 'CONFIG_MIPS_TRICKBOX', if_true: files('mips_trickbox.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
>   
> diff --git a/hw/misc/mips_trickbox.c b/hw/misc/mips_trickbox.c
> new file mode 100644
> index 0000000000..86b00a8c0d
> --- /dev/null
> +++ b/hw/misc/mips_trickbox.c
> @@ -0,0 +1,97 @@
> +/*
> + * SPDX-License-Identifier: LGPL-2.0-or-later
> + *
> + * MIPS Trickbox

I'd maybe add the description from the commit message here to tell the one 
who's looking at this source code what this file is all about.

> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "trace.h"
> +#include "sysemu/runstate.h"
> +#include "hw/misc/mips_trickbox.h"
> +
> +static uint64_t mips_trickbox_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    uint64_t value = 0;
> +
> +    qemu_log_mask(LOG_UNIMP,
> +                    "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
> +                    __func__, addr);
> +    trace_mips_trickbox_read(size, value);

Does it really make sense to have both, a trace point and a log for the same 
thing?

  Thomas


