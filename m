Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670412C17BA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:36:43 +0100 (CET)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJVq-0005om-7h
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIot-0000Ub-Ew
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:52:19 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIoq-0003ux-8I
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:52:19 -0500
Received: by mail-ej1-x644.google.com with SMTP id gj5so25291350ejb.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CAJCrfLjjrW0Dm+9OR6o6KVtk2zyhRl7vmu86ekN1uc=;
 b=tw6rri+/k2VJZq6rMJpfWZ7S3s9SLckAMZkK52Jn1upYUIJ5e9jhAfRe1ZLxoC6RTP
 N/qPDfVIZYj7hkeQI4znpGzcHR7WULxe+W3PrlpyXKiAHANmrk9zoaZWE6QPG4n2FmC1
 GjzaEv27vZBFYgMDyS39HzJxWKCaZ+TPSjt6TTT7wd5fMKPic1rte3/F9JzqgThVvSMM
 TAlopKuoU2oj//31mIy2HLi9MAamt2ozBboto3UzIWkhe/LBjsdFdBXzcjdZLoWwCENa
 hR5j4DRAPyiFahY7dY1UPk3ytEvVnPE+PPY05U3MTffb5Em8pZ5POJ4HbPIke26deCUm
 1pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAJCrfLjjrW0Dm+9OR6o6KVtk2zyhRl7vmu86ekN1uc=;
 b=HAnw6nKoGu2DaTWv2YtL8nbeAQo21EZ639KkH5rEqcY7/lzLrwUprbXdB+GpT8z/5g
 nKc2O4tmuDSD9HbUnN1h6jJSAIf+y4s8KFx4BmGjF84A1Lv/CeJzfXkHAGRkFvX9fAp/
 KLPGqJpJBX0dN+uXy6RYO+/rF1gyx9BvvMWp+ouE3Gz7T+rRBbXJA2gmZBIAVVJjPW5O
 FJqCqfBA0m7hZcNb8xC903zTNAcmfcnvWr+pZPhnPblGupJFiiZGFxppi7DYnzUKj1AE
 62c8XuX1DwDHn12+prSq5By4s033/0sHZUMJW/GDNFwUZOfabUm34sNrqJeBnIp2Snzt
 Y2uQ==
X-Gm-Message-State: AOAM530dqpZgRrpK1oObgi3kBX4LokGCUUkpG53uiuLu3Ij/5Q/uJSg+
 n2awKhqZunln7Opwuzu52YU=
X-Google-Smtp-Source: ABdhPJxiX6hVtKu3RZmQRmomNCqN4tZU7FlV01PSIcrGp5oJ9S+MRib0YFW3i11BbgLzhKZsf3pDIg==
X-Received: by 2002:a17:906:2b81:: with SMTP id
 m1mr1259687ejg.251.1606164734143; 
 Mon, 23 Nov 2020 12:52:14 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c30sm5653026edd.68.2020.11.23.12.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 12:52:13 -0800 (PST)
Subject: Re: [PATCH V17 2/6] hw/intc: Rework Loongson LIOINTC
To: Huacai Chen <zltjiangshi@gmail.com>
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-3-git-send-email-chenhc@lemote.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a70dae49-2a47-12bc-f580-640f032b78fd@amsat.org>
Date: Mon, 23 Nov 2020 21:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1604636510-8347-3-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/20 5:21 AM, Huacai Chen wrote:
> As suggested by Philippe Mathieu-Daudé, rework Loongson's liointc:
> 1, Move macro definitions to loongson_liointc.h;
> 2, Remove magic values and use macros instead;
> 3, Replace dead D() code by trace events.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  hw/intc/loongson_liointc.c         | 49 +++++++++++---------------------------
>  include/hw/intc/loongson_liointc.h | 39 ++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 35 deletions(-)
>  create mode 100644 include/hw/intc/loongson_liointc.h
> 
> diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
> index fbbfb57..be29e2f 100644
> --- a/hw/intc/loongson_liointc.c
> +++ b/hw/intc/loongson_liointc.c
> @@ -1,6 +1,7 @@
>  /*
>   * QEMU Loongson Local I/O interrupt controler.
>   *
> + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
>   * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
>   *
>   * This program is free software: you can redistribute it and/or modify
> @@ -19,33 +20,11 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/sysbus.h"
>  #include "qemu/module.h"
> +#include "qemu/log.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> -#include "qom/object.h"
> -
> -#define D(x)
> -
> -#define NUM_IRQS                32
> -
> -#define NUM_CORES               4
> -#define NUM_IPS                 4
> -#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> -#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> -
> -#define R_MAPPER_START          0x0
> -#define R_MAPPER_END            0x20
> -#define R_ISR                   R_MAPPER_END
> -#define R_IEN                   0x24
> -#define R_IEN_SET               0x28
> -#define R_IEN_CLR               0x2c
> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> -#define R_END                   0x64
> -
> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> -                         TYPE_LOONGSON_LIOINTC)
> +#include "hw/intc/loongson_liointc.h"
>  
>  struct loongson_liointc {
>      SysBusDevice parent_obj;
> @@ -123,14 +102,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>          goto out;
>      }
>  
> -    /* Rest is 4 byte */
> +    /* Rest are 4 bytes */
>      if (size != 4 || (addr % 4)) {
>          goto out;
>      }
>  
> -    if (addr >= R_PERCORE_ISR(0) &&
> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> -        int core = (addr - R_PERCORE_ISR(0)) / 8;
> +    if (addr >= R_START && addr < R_END) {
> +        int core = (addr - R_START) / R_ISR_SIZE;
>          r = p->per_core_isr[core];
>          goto out;
>      }
> @@ -147,7 +125,8 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>      }
>  
>  out:
> -    D(qemu_log("%s: size=%d addr=%lx val=%x\n", __func__, size, addr, r));
> +    qemu_log_mask(CPU_LOG_INT, "%s: size=%d addr=%lx val=%x\n",
> +                  __func__, size, addr, r);
>      return r;
>  }
>  
> @@ -158,7 +137,8 @@ liointc_write(void *opaque, hwaddr addr,
>      struct loongson_liointc *p = opaque;
>      uint32_t value = val64;
>  
> -    D(qemu_log("%s: size=%d, addr=%lx val=%x\n", __func__, size, addr, value));
> +    qemu_log_mask(CPU_LOG_INT, "%s: size=%d, addr=%lx val=%x\n",
> +                  __func__, size, addr, value);
>  
>      /* Mapper is 1 byte */
>      if (size == 1 && addr < R_MAPPER_END) {
> @@ -166,14 +146,13 @@ liointc_write(void *opaque, hwaddr addr,
>          goto out;
>      }
>  
> -    /* Rest is 4 byte */
> +    /* Rest are 4 bytes */
>      if (size != 4 || (addr % 4)) {
>          goto out;
>      }
>  
> -    if (addr >= R_PERCORE_ISR(0) &&
> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> -        int core = (addr - R_PERCORE_ISR(0)) / 8;
> +    if (addr >= R_START && addr < R_END) {
> +        int core = (addr - R_START) / R_ISR_SIZE;
>          p->per_core_isr[core] = value;
>          goto out;
>      }
> @@ -224,7 +203,7 @@ static void loongson_liointc_init(Object *obj)
>      }
>  
>      memory_region_init_io(&p->mmio, obj, &pic_ops, p,
> -                         "loongson.liointc", R_END);
> +                         TYPE_LOONGSON_LIOINTC, R_END);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
>  }
>  
> diff --git a/include/hw/intc/loongson_liointc.h b/include/hw/intc/loongson_liointc.h
> new file mode 100644
> index 0000000..e11f482
> --- /dev/null
> +++ b/include/hw/intc/loongson_liointc.h
> @@ -0,0 +1,39 @@
> +/*
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + *
> + * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
> + * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + */
> +
> +#ifndef LOONSGON_LIOINTC_H
> +#define LOONGSON_LIOINTC_H
> +
> +#include "qemu/units.h"
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define NUM_IRQS                32
> +
> +#define NUM_CORES               4
> +#define NUM_IPS                 4
> +#define NUM_PARENTS             (NUM_CORES * NUM_IPS)
> +#define PARENT_COREx_IPy(x, y)  (NUM_IPS * x + y)
> +
> +#define R_MAPPER_START          0x0
> +#define R_MAPPER_END            0x20
> +#define R_ISR                   R_MAPPER_END
> +#define R_IEN                   0x24
> +#define R_IEN_SET               0x28
> +#define R_IEN_CLR               0x2c
> +#define R_ISR_SIZE              0x8
> +#define R_START                 0x40
> +#define R_END                   0x64

Can we keep the R_* definitions local in the .c?
(if you agree I can amend that when applying).

Thanks for cleaning!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> +DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> +                         TYPE_LOONGSON_LIOINTC)
> +
> +#endif /* LOONGSON_LIOINTC_H */
> 

