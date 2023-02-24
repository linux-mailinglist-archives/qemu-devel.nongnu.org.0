Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E26A1C80
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXaG-0007a5-M1; Fri, 24 Feb 2023 07:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXaF-0007Zv-Ei
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVXaD-0003kx-B0
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677243232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJcbME7ttucEmFY/ggwcocRddQ3yO+IDhjI8lavuKLk=;
 b=SF7l69UInwqUyR4DzZPKO2u1uxISsgsz5gXNMX9eWLAkjUYKXEd9ZinTm3oq5w6fdkW9LY
 ooWVhyAC9mXpZM5YdtBjmoKeFiqo/yCqZWVDsYho5c8xqLHACMbu5W8gD0keXSog0II/7m
 cH2DlDU0gMZ2qZgPI2TF2pOczE1KIV0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-f0PLb1zmN0ySQaEXOB88iQ-1; Fri, 24 Feb 2023 07:53:46 -0500
X-MC-Unique: f0PLb1zmN0ySQaEXOB88iQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso922907wms.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 04:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJcbME7ttucEmFY/ggwcocRddQ3yO+IDhjI8lavuKLk=;
 b=UkjOP6K3ofwgQxyxxZjQshZ2SrN/xF6eyFdWuvsKgWPAl7wIDoDHMLVOLdwcKENHbx
 DtESQMe5XUjhmze0PN3oLMgLdjC8kjUZoZCXmZcKYvp5J/O6vqzMAPUhsLoj20MlDfQn
 wG0pasAcjBNGiHEDev8fQBpXI7ymaYvuL+fLmsro7aIuW4HBmnbbKx+QKeY7MkTAvaJa
 aeyrL41uz02ZSHQkvntZ3UPIAPlYbZS2xrRFtLxltZn+kowCXJxY+sxzeAgt3bIgLBQ1
 IqQezY6OIFyFF/LjaDOwymqREJl7g0JVTKOW0a6OI/JMVuoI5fbhJrELS+2+vatkkyca
 Cq6Q==
X-Gm-Message-State: AO0yUKUacr2ABnJXAhmC1VCyGuJjPkeyXXiF/Kk0fkpW7z/4wZ+KDaLN
 8Kgmzhtl1IBUioCm+Li3othZGzf2g5pHKTQUs2aKmqhwAfqlXWzUtX159yTSNznx1pHOcBLjWbJ
 MXFgiQpqoHM57kaQ=
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr3387993wrp.13.1677243225680; 
 Fri, 24 Feb 2023 04:53:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+bFJkK1oQrAgntC+DSkgjz3TgGtgDlhLRKLcR153cIVHOiMVNg2o+yOPWiOeLYSEEP0r0iLQ==
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id
 e4-20020adff344000000b002c71740629bmr3387980wrp.13.1677243225343; 
 Fri, 24 Feb 2023 04:53:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b002c53cc7504csm9811482wrv.78.2023.02.24.04.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 04:53:44 -0800 (PST)
Date: Fri, 24 Feb 2023 13:53:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230224083701.2657063-6-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, 24 Feb 2023 14:06:58 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Add Multiple APIC Description Table (MADT) with the
> RINTC structure for each cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 3a5e2e6d53..8b85b34c55 100644
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
> @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
>      free_aml_allocator();
>  }
>  
> +/* MADT */

see build_srat() how this comment must look like

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

cpu_id here seems to be unrelated to one in DSDT.
Could you explain how socket/hartid and cpu_id are related to each other?

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
> @@ -153,6 +194,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, s);
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,


