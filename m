Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8687697B9C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGjf-0005jm-MS; Wed, 15 Feb 2023 07:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSGjd-0005iU-GH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:18:05 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSGjb-00019v-TX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:18:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso1463309wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FpXYn6ZWBWgNCykWouIMJ2761JJI/Gq0ax8lW8y3jVY=;
 b=AKWb8AvcOF2KDI53uoaxXu3uSv/Qr/Gc5QENaCLi5cn2Gqd/o2c0gKnQoIrAF19IUL
 9ffz2FFF7ozecjzx6Dm8GMyq9Yn3BpFvthIrQW9JoiIZU6S3LhN0h00eNM4BzGOX0AuQ
 BLHqupLEY76LmGg8MBgXqWrldFbKdvepOieno1wMi9gyDjJ9exPXMTHeukpkExyzpxf1
 fZ27dqPIOMZGyqo1z8tburXren6O86UZmrhdJv3c5aAFJYm3XewJw2obSYvc9uHr1MTd
 6DYGZbtfqFLnYhuM3wPSuWo7aFM6vqLcapBxry1gh0qtJLWHLH+2pXUeibca12xdfLFT
 xaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpXYn6ZWBWgNCykWouIMJ2761JJI/Gq0ax8lW8y3jVY=;
 b=jRXDUpygmZ9DmMF9uqYaoLyGAJO0XyotFxW4LzQw2CsvAEVBz25XeIvQ6Wu344u/Ok
 1ySTLlH3ArmYzgFSrdIudl+YNMo3w1Ie3OWONI5L+6oTTLJrmlC/+pHa/KF04CI4ABFM
 k2ltH397AvATctlmu1KxEV/6rqXlz/khpo6mEBftk9605tuzAXn+WkK9Zu3laV0HrztN
 nBAI983zw/PEubVoatwS5vor2nk86hQfkCRkRsAGgYbCv/lU3BFrPoehKayodiZbbW0c
 jt5KducNcZEMeBVoi4ZSa4mMErOvwX45von0CXSx6FdUvsOuceZIN3/4b/l/cFwuiAKs
 2u/A==
X-Gm-Message-State: AO0yUKXD92/ifoucbku9fXZiZRznRw+Ejnon+z0SltF6hPFtaaShZDM+
 pY8gJ7SDs5XY5myz26JmdZFSGQ==
X-Google-Smtp-Source: AK7set/4/mehkH2jN/oN8LIwb+3G3X/64lRyzNGq4cLorN5mjypjXOfjQjCu7LBWIM6bKjkwDN+rWw==
X-Received: by 2002:a05:600c:3d8a:b0:3e1:12d1:fde0 with SMTP id
 bi10-20020a05600c3d8a00b003e112d1fde0mr2490403wmb.6.1676463480816; 
 Wed, 15 Feb 2023 04:18:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a1cf018000000b003dfee43863fsm1941174wmb.26.2023.02.15.04.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:17:59 -0800 (PST)
Date: Wed, 15 Feb 2023 13:17:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 01/10] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Message-ID: <20230215121759.t3ae3xpjtb7t7h2z@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-2-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Feb 13, 2023 at 08:10:29PM +0530, Sunil V L wrote:
> ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
> in the RISCVVirtState structure and initialize with default values.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c         | 4 ++++
>  include/hw/riscv/virt.h | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 86c4adc0c9..fb68cf81e9 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -49,6 +49,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> +#include "hw/acpi/aml-build.h"
>  
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -1504,6 +1505,9 @@ static void virt_machine_init(MachineState *machine)
>      }
>      virt_flash_map(s, system_memory);
>  
> +    s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> +    s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +

arm and x86 do this at instance init time, because then it can be
overridden in machine class init. loongarch also does this at instance
init time, probably because arm and x86 do. If riscv doesn't plan to
allow overriding, then it could be done in acpi setup. Otherwise, it
should probably follow the other architectures' example.

>      /* create device tree */
>      create_fdt(s, memmap);
>  
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index b3d26135c0..6c7885bf89 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -56,6 +56,8 @@ struct RISCVVirtState {
>      bool have_aclint;
>      RISCVVirtAIAType aia_type;
>      int aia_guests;
> +    char *oem_id;
> +    char *oem_table_id;
>  };

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

