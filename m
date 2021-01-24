Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A13301906
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 01:09:38 +0100 (CET)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3SyH-0001mo-48
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 19:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3SxJ-0001LN-QG
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:08:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3SxI-00075n-6R
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:08:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id m187so7437088wme.2
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 16:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DiFX+t53VNv79O/+e0SHJ2C+geixrADplmr6GVU8sN8=;
 b=p1zyZaARR29ubA7Zdc7vf5SWmZa3W4wOqLyTAzEf8kQ3cOipPX0fb7nFJkWBT68rRj
 fjJhRX4dPmUiO1K2VPkQ5Ed4Tb+Vn04kd8sAOybRcOraO8Sf0af7zIrvyG8aIbfnSk+l
 oYYo6G2Jq9CKRFNmwkrk/DB3NMOIXd97+JbmZC6oGq5ovfv1fMFuQlRCcsQA2ViHnG/0
 255HbgKwJrhLBbgPgRu0138szHYgO/Royl4a1RSuf/DFMmlMi7MFbfXt9QTCxnejFgiq
 howxSrogGoXRIEAp8fTe9V1CoALtv3++9hVWCALB6C0V+/ehKpBI37JeIiuGUqU+B6tK
 CJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DiFX+t53VNv79O/+e0SHJ2C+geixrADplmr6GVU8sN8=;
 b=FzBh07v03FF8ufMB4p+0aqvAjQXswmkzAivjB7kQGJZkDRSDJsltSO+ojatwv8SITm
 lQHx4CLO0os/X50MnjGhZWQKUzNewZ5kY7PMddPSVEm2PI2/tPm0URx+ofnDpqv/ZICc
 QOQ5KMI9z/BfQ0vFx0doDu17xiOQR/5BCLpA1/dK71McFv1lyxU7KQ9pWO+pFQ8La23k
 djWbefTY2D9/7gAimdP9emjm67Rq1VsQpPKoOobKCew2Ku+xqf1O3ZA1xA41/2psyFmx
 jKQOXEUB3f4SDDCp7UM1V5xRntibHNzVReQhqXIt7vWDWO3nZNC/GoniJmH24MvT6MO0
 QyMA==
X-Gm-Message-State: AOAM533OdXdmeBAFWAGaesDGvsymY4Fx62PyUw8aOr4e5dyTZYx5K+60
 HZD2c6HOLr/puuXVbA4yRD5DutDdHxw=
X-Google-Smtp-Source: ABdhPJxLtsYl7e6PZ3soSEnV7WsrzdNL6CmJJoXoPn1pBg2nTO4FtgjZV5uSnfy/XTCncLB6o4M2PA==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr9712585wmb.69.1611446913644;
 Sat, 23 Jan 2021 16:08:33 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j4sm7739723wru.20.2021.01.23.16.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 16:08:32 -0800 (PST)
Subject: Re: [PATCH v2 3/7] intc: add goldfish-pic
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f7e42372-d073-69a6-97cf-9d27e4679b0f@amsat.org>
Date: Sun, 24 Jan 2021 01:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-4-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
>  include/hw/intc/goldfish_pic.h |  33 +++++
>  hw/intc/goldfish_pic.c         | 214 +++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig                |   3 +
>  hw/intc/meson.build            |   1 +
>  hw/intc/trace-events           |   8 ++
>  5 files changed, 259 insertions(+)
>  create mode 100644 include/hw/intc/goldfish_pic.h
>  create mode 100644 hw/intc/goldfish_pic.c
> 
> diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
> new file mode 100644
> index 000000000000..26e7ca75a3ec
> --- /dev/null
> +++ b/include/hw/intc/goldfish_pic.h
> @@ -0,0 +1,33 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * Goldfish PIC
> + *
> + * (c) 2020 Laurent Vivier <laurent@vivier.eu>
> + *
> + */
> +
> +#ifndef HW_INTC_GOLDFISH_PIC_H
> +#define HW_INTC_GOLDFISH_PIC_H
> +
> +#define TYPE_GOLDFISH_PIC "goldfish_pic"
> +OBJECT_DECLARE_SIMPLE_TYPE(GoldfishPICState, GOLDFISH_PIC)
> +
> +#define GOLDFISH_PIC_IRQ_NB 32
> +
> +struct GoldfishPICState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t pending;
> +    uint32_t enabled;
> +
> +    /* statistics */
> +    uint64_t stats_irq_count[32];

GOLDFISH_PIC_IRQ_NB?

> +    /* for tracing */
> +    int idx;
> +};
> +
> +#endif
> diff --git a/hw/intc/goldfish_pic.c b/hw/intc/goldfish_pic.c

> +static const MemoryRegionOps goldfish_pic_ops = {
> +    .read = goldfish_pic_read,
> +    .write = goldfish_pic_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.max_access_size = 4,
> +    .impl.max_access_size = 4,

Missing:

       .impl.min_access_size = 4,

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +};
> +

