Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B32E8388
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 12:08:30 +0100 (CET)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvIIH-0006H0-Pg
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 06:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvIH4-0005ng-KL
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 06:07:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvIH2-0008GB-Pj
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 06:07:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a12so21772375wrv.8
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Km/0KHdZXQ0Nj+EUzVVyBeVLfcQKujVir2MpxaVOLKk=;
 b=TzsbGKBbpHQYoyEpp1LEaTHh71NNRffwTsEpZenEXTGhOe3wHz3octupBO3VY1zYQ+
 TFkOS7zESh98I3DzG33icDDeWjnc0WQL481pMHizUlx5ROBqhGKI3MxH2IUoWYloEPgP
 o0jpmy9En36XWP3DxsSjTNd7IRpfcqQiU2Ta5j184I4YzgzVLXn3PjR/wq5CXaHfgKAi
 u5TfEJWz7c88vsc9bH0pbWeT875Qwi1ErG3gGE00Tuhj5b7DMyFFQQikS5CugkV5WBB2
 BmoDxwVuQ+149RbZE6abFMXvIELDdJguicODUAZ7WFST0eQFkGuXig7lTL+wJdJZNsif
 UoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Km/0KHdZXQ0Nj+EUzVVyBeVLfcQKujVir2MpxaVOLKk=;
 b=E7d5hwDo1aBIYMRySG0kKo0yhmlBtURKSzU1ngfFd98xUoWeU6+2V5mU18xHoWZE0t
 iYBuEzAgvPb5mlJyHY2EjC4Z0XhyDltf0kyeuhaIJl3xkDEaluAnl382VNBdyt/ewNQ9
 odQkgRbRzadITGP6ia1zCP+wY6B9ej9JRkOjSy6nlGvZj5yq8qROGwE8Owx1v8xcrCi6
 2Ru/ZBSfqswxeBBHi96of3S2jLPm01dVWVO84wypVdzHJhE12ecHPWBDV3zCj6XZ20Vq
 XXioOJjY0ge0nZCCWZ1pe8cd+Kd9D30lWu2lYdeEWqlXjCTYmF3i9T/s04k6pU1XRufY
 KEjg==
X-Gm-Message-State: AOAM530mRV35za4LF9Wu5WFmz+GaMh5ctucmmp3IYfLzNXweWp1qKoNq
 /Ll0AfUTX76f6Ia9pwoEqv5BzGM2sH0=
X-Google-Smtp-Source: ABdhPJxBZIzuZh6Mw4yoDbHLsIKbjfaPHHtB2D+9MFVKraOOwv3Cy0gHjnEcaRlRrCFydtmpbUY36Q==
X-Received: by 2002:adf:97dd:: with SMTP id t29mr68122944wrb.357.1609499230727; 
 Fri, 01 Jan 2021 03:07:10 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id p7sm1346240wmp.3.2021.01.01.03.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 03:07:09 -0800 (PST)
Subject: Re: [PATCH v3 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-5-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <835ce7dc-9efb-3b67-d324-b9891a87eed2@amsat.org>
Date: Fri, 1 Jan 2021 12:07:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201224031750.52146-5-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.399,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/20 4:17 AM, Jiaxun Yang wrote:
> The original mapping had wrong base address.

TBO this rational is a bit scarce ;)

I sent a patch implementing the REMAP register:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg769751.html

If this isn't enough with a Linux kernel because it expects
the the Bonito being configured by the bootloader, then we
need to do the mapping in write_bootloader().

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/pci-host/bonito.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 3fad470fc6..737ee131e1 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -85,9 +85,8 @@
>  #define BONITO_PCILO_BASE_VA    0xb0000000
>  #define BONITO_PCILO_SIZE       0x0c000000
>  #define BONITO_PCILO_TOP        (BONITO_PCILO_BASE + BONITO_PCILO_SIZE - 1)
> -#define BONITO_PCILO0_BASE      0x10000000
> -#define BONITO_PCILO1_BASE      0x14000000
> -#define BONITO_PCILO2_BASE      0x18000000
> +#define BONITO_PCILOx_BASE(x)   (BONITO_PCILO_BASE + BONITO_PCILOx_SIZE * x)
> +#define BONITO_PCILOx_SIZE      0x04000000
>  #define BONITO_PCIHI_BASE       0x20000000
>  #define BONITO_PCIHI_SIZE       0x60000000
>  #define BONITO_PCIHI_TOP        (BONITO_PCIHI_BASE + BONITO_PCIHI_SIZE - 1)
> @@ -610,7 +609,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>  {
>      PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>      BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
> -    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
> +    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
>  
>      memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
>      phb->bus = pci_register_root_bus(dev, "pci",
> @@ -622,9 +621,10 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>          char *name = g_strdup_printf("pci.lomem%zu", i);
>  
>          memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
> -                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
> +                                 &bs->pci_mem, BONITO_PCILOx_BASE(i),
> +                                 BONITO_PCILOx_SIZE);
>          memory_region_add_subregion(get_system_memory(),
> -                                    BONITO_PCILO_BASE + i * 64 * MiB,
> +                                    BONITO_PCILOx_BASE(i),
>                                      &pcimem_lo_alias[i]);
>          g_free(name);
>      }
> 

