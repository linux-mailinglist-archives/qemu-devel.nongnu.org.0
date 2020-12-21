Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C392E01A8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:52:52 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSAl-0003dH-QK
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krS4B-0008T8-Ty
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:46:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krS49-000790-RG
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:46:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id m5so12431817wrx.9
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HgTCdBGEotCkcgYtPUmro8Z2NIMcoKC1Ygqm22/2HN8=;
 b=MXEauyPdonjxUl53sYUHIUXT1ehG5ka6ppQjGTLRr3Yw9KDL7CmqfJWpfd4HOSLcp8
 iI2RMdDqtiUb/N3Hwc8+/sMTs4j/4ylL9AcFeoeTeffhNUt6i8gLjIffmS1iJE/sKrAS
 rxDddvqhI2Bxjmz9M2iXe/MxYpIByYyGKYLgbIyR3CPG6ufyo7qgttgWB5oxluX+EVrN
 9eHdb4f/ipfI+nON6tY6FOG6EXgGuYV781R7lYxqC3Ah+Rv9WyrKK9TiRR6PXUSo11nu
 mBlvhi25Shay6LJ+ktSkiaO2s79d1bmlgOpcCkrjezsVxO+gKS7AdfFZml1F2oZYMJIO
 02Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HgTCdBGEotCkcgYtPUmro8Z2NIMcoKC1Ygqm22/2HN8=;
 b=ONVX7xEw8QRzGZFQ3rt80Ua4zHDhXq1fxN9+bYecxPnSXUo4J3eTxaT+wJuYX6nBsR
 L05xJtJW3AimhTOps2SfU/6iPMA4cPMPuZZPrYDtcIpIKWlU6mqFP3m1wVNnuD059kph
 wrPWA4AOO5wZE+tisL+jwAwDSBLUCxsv1WGGeQtW/5dkFjvBEjVrDEpsE1hfn19LLZlG
 FExFB9gRyg6WmCQt6HpmsNlNuBQbwPuorum94cEmcKWXgi/tHPWAXj95vDrHdYTl7H4g
 /5LZve0xDEVhZsw6Q6v11aa7UIVoJOpcav9Ub47HgkRInAE222J2akG075PuaMmDv3Nw
 yWfw==
X-Gm-Message-State: AOAM531r6LQClzCF6p3kq1i2owe6kC7e71JrWYjt4ER3FN/5QABmcK+J
 X8TCcxgqx3adMbkCO7/3bOU=
X-Google-Smtp-Source: ABdhPJxd+8QxfWqf/NSRML7+zd+8YIz3wgZ263zPLHzaQzDfG050I2sQulVVXN8TnzotCDpPC5WNCw==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr19594253wrt.324.1608583560286; 
 Mon, 21 Dec 2020 12:46:00 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id g184sm25577343wma.16.2020.12.21.12.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:45:59 -0800 (PST)
Subject: Re: [PATCH v2 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071816.37963-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05d6819c-67dd-9275-e9df-1a26baf807ee@amsat.org>
Date: Mon, 21 Dec 2020 21:45:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219071816.37963-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:18 AM, Jiaxun Yang wrote:
> The original mapping had wrong base address.
> Fix by correct the base adress and merge three alias into
> a single.

Why merge? Beside, typo "address".

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/pci-host/bonito.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 43b79448a9..3a31ba42f2 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -608,7 +608,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>  {
>      PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>      BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
> -    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
> +    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
>  
>      memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
>      phb->bus = pci_register_root_bus(dev, "pci",
> @@ -616,16 +616,11 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>                                       dev, &bs->pci_mem, get_system_io(),
>                                       0x28, 32, TYPE_PCI_BUS);
>  
> -    for (size_t i = 0; i < 3; i++) {
> -        char *name = g_strdup_printf("pci.lomem%zu", i);
> -
> -        memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
> -                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
> -        memory_region_add_subregion(get_system_memory(),
> -                                    BONITO_PCILO_BASE + i * 64 * MiB,
> -                                    &pcimem_lo_alias[i]);
> -        g_free(name);
> -    }
> +    memory_region_init_alias(pcimem_lo_alias, OBJECT(dev), "pci.lomem",
> +                             &bs->pci_mem, BONITO_PCILO_BASE,
> +                             BONITO_PCILO_SIZE);

Why is your pci_mem mapped at 0?

> +    memory_region_add_subregion(get_system_memory(), BONITO_PCILO_BASE,
> +                                pcimem_lo_alias);
>  
>      create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
>  }
> 

