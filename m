Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A371461E2DD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhFS-00006R-9y; Sun, 06 Nov 2022 10:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1orhFQ-00005h-EW
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:07:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1orhFO-00066Z-LM
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:07:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 187-20020a1c02c4000000b003cf9c3f3b80so684977wmc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 07:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNe97ObHsOKDPjXjNZAm6welPEXSsCCkpIQfB9gmsv8=;
 b=K7fcj5pSe0O7W/nFOJAg1hWBo1WhaNMS1cEiJsjU9AIdFGU5liyZIw4mkrl8nfsNEW
 KUaHGAQNhy+yagN32Pja4cjEJnUB/X7Oy+N6P5rMD8zydL7p4Ql6vImdXsQICrDqGt6S
 QZ5hPremAK/oM5CauEM/9QG+7Z0Jbqv9sfK6RcxqNNhPXWlKJqHPkXYra2hs0onjybr0
 Duif8qG+gV0++wgn/c2HqeSQc/Y72AwsAviZWkCT32fNqx6Md8HCxziuW5ZaOEdkBiho
 5r3DftsKfDMQ7IXenbAX8IJo68jh3Co5XDco+5S1pWJr6w0JxCk1bLvfcXdhZZTRMKTG
 ar5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNe97ObHsOKDPjXjNZAm6welPEXSsCCkpIQfB9gmsv8=;
 b=tGLQ+CHRCS3bj538C9dmEzdHvYMTlsvduN0N2ta7gUsn9HUE84lGX2b6XOWOhTJbbY
 QpJ0rzAI7crEVYCjij2GhJVWwZ+jY2ARrdrblNFabFkqORuDyI3EZGFi6i4x+xB3Z/oY
 oL2UPGXoC9AVVak9G7Thp2t4owblmjWkcwEaXiboZUFZWKZSD9a6S/KubBmg8TJjE/8m
 AiWUnG4Jtogm9/GaY2sIztbZWnmyorh2D/9lPVjsUjHDf52XYqu5Oe1JUDJ5JNXWMptv
 jaaJp4GVt+RT4bvGokMJnAHl512Apsddpv6ifpGgu3BoLJNGLi6LKmY+bTpFNJ/PxsfS
 YpyQ==
X-Gm-Message-State: ACrzQf2mAOcFKFaWAfe7eH48uDwOoJJhPcyf3gy//nxuY7khxdE9wlwQ
 JOvXEwKu6M8JhYrOSnGI06XewA==
X-Google-Smtp-Source: AMsMyM4Z5L4GGtyu6095X2kmtB2Zmyejv78V+qxnclXzgzpSJwNIhOg7CaS/mGQilsWKz1tLa3fT7g==
X-Received: by 2002:a05:600c:29a:b0:3cf:8e62:66f1 with SMTP id
 26-20020a05600c029a00b003cf8e6266f1mr12316559wmk.39.1667747260655; 
 Sun, 06 Nov 2022 07:07:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c12cb00b003cf75f56105sm6129573wmd.41.2022.11.06.07.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:07:40 -0800 (PST)
Date: Sun, 6 Nov 2022 16:07:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <20221106150739.lr5uunl75bnp56iv@kamzik>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 06, 2022 at 08:09:00PM +0530, Sunil V L wrote:
> The pflash implementation currently assumes fixed size of the
> backend storage. Due to this, the backend storage file needs to be
> exactly of size 32M. Otherwise, there will be an error like below.
> 
> "device requires 33554432 bytes, block backend provides 3145728 bytes"
> 
> Fix this issue by using the actual size of the backing store.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..aad175fa31 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -49,6 +49,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> +#include "sysemu/block-backend.h"
>  
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -144,10 +145,17 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>                              MemoryRegion *sysmem)
>  {
>      DeviceState *dev = DEVICE(flash);
> +    BlockBackend *blk;
> +    hwaddr real_size;
>  
> -    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
> -    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> -    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
> +    blk = pflash_cfi01_get_blk(flash);
> +
> +    real_size = blk ? blk_getlength(blk): size;
> +
> +    assert(real_size);
> +    assert(QEMU_IS_ALIGNED(real_size, VIRT_FLASH_SECTOR_SIZE));
> +    assert(real_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> +    qdev_prop_set_uint32(dev, "num-blocks", real_size / VIRT_FLASH_SECTOR_SIZE);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      memory_region_add_subregion(sysmem, base,
> @@ -971,15 +979,24 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
>  {
>      char *name;
>      MachineState *mc = MACHINE(s);
> -    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> -    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> +    MemoryRegion *flash_mem;
> +    hwaddr flashsize[2];
> +    hwaddr flashbase[2];
> +
> +    flash_mem = pflash_cfi01_get_memory(s->flash[0]);
> +    flashbase[0] = flash_mem->addr;
> +    flashsize[0] = flash_mem->size;
> +
> +    flash_mem = pflash_cfi01_get_memory(s->flash[1]);
> +    flashbase[1] = flash_mem->addr;
> +    flashsize[1] = flash_mem->size;
>  
> -    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
> +    name = g_strdup_printf("/flash@%" PRIx64, flashbase[0]);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
>      qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
> -                                 2, flashbase, 2, flashsize,
> -                                 2, flashbase + flashsize, 2, flashsize);
> +                                 2, flashbase[0], 2, flashsize[0],
> +                                 2, flashbase[1], 2, flashsize[1]);
>      qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
>      g_free(name);
>  }
> -- 
> 2.38.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

