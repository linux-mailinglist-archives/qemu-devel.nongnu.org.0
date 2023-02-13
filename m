Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45B693F20
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:53:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRTci-0006bM-Fh; Mon, 13 Feb 2023 02:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRTcg-0006ao-QL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:51:38 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRTcf-0005oW-6j
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:51:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so8073180wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bcsbnV9vc+kbO5m5Vdyev0JtRRSRfp8MZF8sgXdpDeQ=;
 b=UOWQNkjy7i4empEDAqyOePdUO5v7zUufOH79hIIXEfcs2OJ2OlHZj3fmUhQ58h9jD5
 eEY4enleIBFcfz+bes7XspwTiWnEz+xY1MTxzSncYZ/7V7LKx9ZG4r6U1btvm0QIHERW
 GT7UMyrrnssx25O7hA6horQhkxosL9hxG6oI8j8eVgzK824N0nCly7zzW+3deHG91XfG
 2DNq5up1xQGhPXcQoEh1RvSF/sb4GOEW/MhmUG98CjV+U9fI4HnJmDZ900KiEinnY7N4
 Dq0xFr5iitjzd4V1Ctm5ChHm6zigZX9YQSSP2wVF1OtEYiEsrx39GbBFbbmjXSAivXAZ
 rSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bcsbnV9vc+kbO5m5Vdyev0JtRRSRfp8MZF8sgXdpDeQ=;
 b=25AW4rN+K9y0S0j0hhYAEfVnG0zVjXGnWcLFHMz2CXKD5MZW28ecXaAwbr5dooTDsC
 cKm/E/+LF2IJXvp+dTzI6OPQ17aKPOHanH0NajgJ2AWge4NsFkFLlT7WxnmI29MeALRK
 IpBshiUe6Xie1v/RUMGzNKH3zgMcw8l9hTZBETrl1+r+j76+SLfwyXM5UEKRrmJg1Cue
 Hird34sR57GhKMv/WBJmZSD9/f0s+xACnZdjsENFV4qqT0irG7n0u6RGs1wWLs8zNzUG
 pMVL3eOu8a2avxlB1Yybe9LPBeuP9MmiAUy7IgueCXwu/SBcI5jvO6TKDs9Cc6JpkxK4
 aKiA==
X-Gm-Message-State: AO0yUKU74nV0FHkNMRsnOa5T2njwXQS3y5b2euzC0cCJ4J1uTOriEuYK
 u0d7kWsShIJZ3aDP0tdAJ3FsOMLewWskXgpM
X-Google-Smtp-Source: AK7set+BoYIfuAKKgCopjqIAd+/UJj51LZ9C/JtCPPW3xzeB5euRhf2//zdexp5WU9EXiB88t+dNqw==
X-Received: by 2002:a05:600c:4b1d:b0:3de:3ee3:4f6f with SMTP id
 i29-20020a05600c4b1d00b003de3ee34f6fmr18625243wmp.8.1676274694639; 
 Sun, 12 Feb 2023 23:51:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003e001119927sm15722236wmc.24.2023.02.12.23.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 23:51:34 -0800 (PST)
Message-ID: <2c09261e-01e1-38c0-6556-0c42580425be@linaro.org>
Date: Mon, 13 Feb 2023 08:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 03/19] hw/char/serial-pci-multi: Introduce
 PCI_MULTISERIAL QOM abstract parent
Content-Language: en-US
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213070820.76881-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/2/23 08:08, Philippe Mathieu-Daudé wrote:
> Introduce PCI_MULTISERIAL ("pci-serial"), QOM abstract parent of
> "pci-serial-2x" and "pci-serial-4x".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/serial-pci-multi.c | 35 ++++++++++++++++++++---------------
>   1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
> index 54768d3d53..faeb0a9476 100644
> --- a/hw/char/serial-pci-multi.c
> +++ b/hw/char/serial-pci-multi.c
> @@ -38,8 +38,15 @@
>   
>   #define PCI_SERIAL_MAX_PORTS 4
>   
> -typedef struct PCIMultiSerialState {
> +#define TYPE_PCI_MULTISERIAL  "pci-serial"

Ouch, copy/paste mistake, this should be "pci-serial-multi".

> +
> +OBJECT_DECLARE_SIMPLE_TYPE(PCIMultiSerialState, PCI_MULTISERIAL)
> +
> +struct PCIMultiSerialState {
> +    /*< private >*/
>       PCIDevice    dev;
> +    /*< public >*/
> +
>       MemoryRegion iobar;
>       uint32_t     ports;
>       char         *name[PCI_SERIAL_MAX_PORTS];
> @@ -47,7 +54,7 @@ typedef struct PCIMultiSerialState {
>       uint32_t     level[PCI_SERIAL_MAX_PORTS];
>       qemu_irq     *irqs;
>       uint8_t      prog_if;
> -} PCIMultiSerialState;
> +};
>   
>   static void multi_serial_pci_exit(PCIDevice *dev)
>   {
> @@ -191,25 +198,23 @@ static void multi_serial_init(Object *o)
>   
>   static const TypeInfo multi_serial_pci_types[] = {
>       {
> -        .name          = "pci-serial-2x",
> -        .parent        = TYPE_PCI_DEVICE,
> -        .instance_size = sizeof(PCIMultiSerialState),
> -        .instance_init = multi_serial_init,
> -        .class_init    = multi_2x_serial_pci_class_initfn,
> -        .interfaces = (InterfaceInfo[]) {
> +        .name           = TYPE_PCI_MULTISERIAL,
> +        .parent         = TYPE_PCI_DEVICE,
> +        .instance_size  = sizeof(PCIMultiSerialState),
> +        .instance_init  = multi_serial_init,
> +        .abstract       = true,
> +        .interfaces     = (InterfaceInfo[]) {
>               { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>               { },
>           },
> +    }, {
> +        .name          = "pci-serial-2x",
> +        .parent        = TYPE_PCI_MULTISERIAL,
> +        .class_init    = multi_2x_serial_pci_class_initfn,
>       }, {
>           .name          = "pci-serial-4x",
> -        .parent        = TYPE_PCI_DEVICE,
> -        .instance_size = sizeof(PCIMultiSerialState),
> -        .instance_init = multi_serial_init,
> +        .parent        = TYPE_PCI_MULTISERIAL,
>           .class_init    = multi_4x_serial_pci_class_initfn,
> -        .interfaces = (InterfaceInfo[]) {
> -            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> -            { },
> -        },
>       }
>   };
>   


