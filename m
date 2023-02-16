Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207D699B64
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:38:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSiCx-0007uF-J9; Thu, 16 Feb 2023 12:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSiCv-0007tn-Gb
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:38:09 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSiCt-0002qG-An
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:38:09 -0500
Received: by mail-ed1-x52f.google.com with SMTP id n20so5916029edy.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2QER8VBygYImvV4HHi0mk3XEd/ARl6wH/4dMJx5v2O4=;
 b=o913dQ+E5LmFuFJnEmdXVd6ooPPxfL7FJKD8AuXShfGhri7FM5Gw9VjnvWG+mxGEvh
 rLis0VA/rYyolwVMVMANuFdCZTBEtjiFOG+0Qi+FuBNVUja//Wx5HqPlVAHkF7gZW+3u
 WvDVWEDnE3XlT3tPzt+/nHjnOBDdyi/J+oWcbuwNyI1ed44vRLQvTIYUjbG+mhUBuwip
 FU3mlStoYQDCWukYqCXFfOnNnl2Bd04GAuV1oKefxw0gTUqoPbCo5bjh2tBWbQvX5mFe
 oqqFb8ZHynaWJVItCz77+bwn8JOKAeDnTEzAAdF9rWkn1ws0k/WForYrUVNv70M67zca
 CDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QER8VBygYImvV4HHi0mk3XEd/ARl6wH/4dMJx5v2O4=;
 b=KI/DXJc+NRvNTgZ9veCePWPooAn0kdV9abOaVyTw+nQJF4cn94FL1f5fO66v8WhWes
 YU6EGKxVROILJTae8iZbm7jXk6HnUMZ7nbd8EaqqiFRalk1okJZIBRRZvxIa1b5Dmzwe
 16OxMAqIVWuOrJGemQbQWY017NE15Q/LNmwtBR1imEJP3vUw5nIAV//12UhfL7pUwMDB
 qNYqY9cu9fUK4qYBBM5DHG0qIEncwrJI476eXh5oJN+5sSNJ1q0DbG0JqumbYiHrRBJT
 AOPtHNi9SXMFd9BApx9mIz/HoGCm0rbzg6Fg3vh9ooQ9wGWl/lTRBTtx+3oRPe23yY6t
 iyKA==
X-Gm-Message-State: AO0yUKUuna7oML8JbXqB/tt5jDO7Oj90ckUsP+wph6T0meRMAjI+AbnL
 B9yWboG54fGmp5vzWqC0BKpFcQ==
X-Google-Smtp-Source: AK7set/2De/HBXqMZlsLpAjWxM/3rqWMhcVrxHGx2hx3J3k90DOFTOwFpif1Ch1ofwkXEmPtl9+kpw==
X-Received: by 2002:a17:906:493:b0:8b1:7e88:c20e with SMTP id
 f19-20020a170906049300b008b17e88c20emr290027eja.41.1676569085912; 
 Thu, 16 Feb 2023 09:38:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 lt13-20020a170906fa8d00b00888d593ce76sm1063711ejb.72.2023.02.16.09.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:38:05 -0800 (PST)
Date: Thu, 16 Feb 2023 18:38:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V3 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <20230216173804.zncvxsyqxokn5doo@orel>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
 <20230216164125.1945633-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216164125.1945633-6-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 10:11:22PM +0530, Sunil V L wrote:
> Add Multiple APIC Description Table (MADT) with the
> RINTC structure for each cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 30af974db3..58e49cd6d6 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -32,6 +32,7 @@
>  #include "sysemu/reset.h"
>  #include "migration/vmstate.h"
>  #include "hw/riscv/virt.h"
> +#include "hw/riscv/numa.h"
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> @@ -123,6 +124,46 @@ static void build_dsdt(GArray *table_data,
>      free_aml_allocator();
>  }
>  
> +/* MADT */
> +static void build_madt(GArray *table_data,
> +                       BIOSLinker *linker,
> +                       RISCVVirtState *s)
> +{
> +    MachineState *ms = MACHINE(s);
> +    int socket;
> +    uint16_t base_hartid = 0;
> +    uint32_t cpu_id = 0;
> +
> +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> +                        .oem_table_id = s->oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +    /* Local Interrupt Controller Address */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> +
> +    /* RISC-V Local INTC structures per HART */
> +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> +        base_hartid = riscv_socket_first_hartid(ms, socket);
> +
> +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> +            build_append_int_noprefix(table_data,
> +                                      (base_hartid + i), 8);   /* Hart ID  */
> +
> +            /* ACPI Processor UID  */
> +            build_append_int_noprefix(table_data, cpu_id, 4);
> +            cpu_id++;
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>  {
>      GArray *table_offsets;
> @@ -144,6 +185,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, s);
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

