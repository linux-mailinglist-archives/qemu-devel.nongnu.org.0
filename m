Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38AC31A4C8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:53:49 +0100 (CET)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdZd-0005CO-2F
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdQc-0005Dy-T2
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:44:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdQa-0005eX-UR
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:44:30 -0500
Received: by mail-wr1-x434.google.com with SMTP id v1so368048wrd.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6C/izwFkWp23Druh1nd9igvqKArCMQNv7EO93XFr/6s=;
 b=kn51c7MXH8UCzZIwAiNMn5ip35K1k7rix22A8wbVYHhg3cjmZb5EVKSUKXH6yBMZ68
 RVEHfK68dh+YFaREvhnfEajcF8mGd0uO5clSOFn9umDAV8r/69hv0jG2nJ9MemL5SwGL
 12Xeca0996lQmiLMqAH57ifNynnaDPHMNCztIuriF7Mk6d6Oxo6IO6byVpNerz0IwZaW
 KISIP/1s1st/Gv6D5QGVCk1iU6utXly/l27boC6Pd1T85VLFtuZnJ8WVVNeoLXKa8Sde
 oy77suYnwQimK1D43LotujNX8rOdSEnBIm/Vmewr6K0BSV+DI1ixOsETidVLWSdt+lAK
 EBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6C/izwFkWp23Druh1nd9igvqKArCMQNv7EO93XFr/6s=;
 b=gBNY+Wlm0etMIeKiNjXx8niDbLOCIYfzDG15qDc3yRkYqTIkue9MYibKwNKcsBnddq
 jnDxcttv4cS/hQDBZALLCHZtW41QfmHBuL8pHj3nDtUUnFx3yysXuyKwxbIPIbr0tYxi
 m6/t52fksp2wlaEcBFOTHNdr3l0+5JrqX7jx4sDbVA+nViBcnxr1B8s9tT8y6Pzp4Lkw
 6Mm0BuZhBlUmHlQHC7XYCKw/wQ2goHcSl90Z1dcgjIhlRBrUNIeb7QhiqfnSbJh+eOu6
 Vkah3Y++KVC/Yig23RYKPoDPmuoAOJzmKLxysDAG/ektqw9j2o7O2hgOIWF8T4xMmCrR
 xPIg==
X-Gm-Message-State: AOAM531MPir0SDKYWXFBkQ8ot1R0d4jkTbF00+xX1HTlFuaswRitk7DY
 K+daRPBxQWK3+g8HICdNT++CKKn06kk=
X-Google-Smtp-Source: ABdhPJxDkzMrBYYI9drxBzlHBCGlw7I+bPRTYHPoKqEXza8n/RLnxblb5bovZ2+gujN/JUKUYjSRKw==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr5119236wrq.121.1613155466823; 
 Fri, 12 Feb 2021 10:44:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z4sm11281936wrw.38.2021.02.12.10.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:44:25 -0800 (PST)
Subject: Re: [PATCH v2 4/7] m68k: add an interrupt controller
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-5-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2c094c3b-dfba-db71-369b-3391d97883bd@amsat.org>
Date: Fri, 12 Feb 2021 19:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-5-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/20/20 12:26 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/intc/m68k_irqc.h |  28 +++++++++
>  hw/intc/m68k_irqc.c         | 120 ++++++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig             |   3 +
>  hw/intc/meson.build         |   1 +
>  4 files changed, 152 insertions(+)
>  create mode 100644 include/hw/intc/m68k_irqc.h
>  create mode 100644 hw/intc/m68k_irqc.c
> 
> diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
> new file mode 100644
> index 000000000000..c40b1b4df8fa
> --- /dev/null
> +++ b/include/hw/intc/m68k_irqc.h
> @@ -0,0 +1,28 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * QEMU Motorla 680x0 IRQ Controller
> + *
> + * (c) 2020 Laurent Vivier <laurent@vivier.eu>
> + *
> + */
> +
> +#ifndef M68K_IRQC_H
> +#define M68K_IRQC_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_M68K_IRQC "m68k-irq-controller"
> +#define M68K_IRQC(obj) OBJECT_CHECK(M68KIRQCState, (obj), \
> +                                    TYPE_M68K_IRQC)
> +
> +typedef struct M68KIRQCState {
> +    SysBusDevice parent_obj;
> +
> +    uint8_t ipr;
> +
> +    /* statistics */
> +    uint64_t stats_irq_count[7];

So we have 8 IRQs, one is NMI. Is that correct?

Could you add #definitions? Patch LGTM but I'll wait for
definitions to give a R-b ;)

> +} M68KIRQCState;
> +
> +#endif

