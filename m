Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0228D3FF0D8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:11:39 +0200 (CEST)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpJR-0000Uu-Eh
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLpG4-0005yC-9q
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLpG2-00023j-3v
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630598885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/RtGwwh3G9nvrE3auS/tDy7EVbBpvAbChB7o8ajWms=;
 b=Zy1oybS7SnBwdwMMVls9/dggXoucmAIx3ito8kb4lMBlZG+T2A7FHrgzBfsiXxHujAfhsf
 Fm24S0hu1U8yJ1JWBvEwHYL0oezhUVzpNaTjCUUj1hhNB0Cu00/DxBHCNDP1D3IIC3t0rr
 WoRhsIdcS6hTEjJKs/YwkyI4MBpxcrM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Wa4ks_bqNIWYrqqiJ9dw9A-1; Thu, 02 Sep 2021 12:08:04 -0400
X-MC-Unique: Wa4ks_bqNIWYrqqiJ9dw9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so867851wmr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/RtGwwh3G9nvrE3auS/tDy7EVbBpvAbChB7o8ajWms=;
 b=fdvUZCUNkbF9qiRaqCtf7zDIwTFmXbej2SnQecqvHWNWBkGaWvVxMVMLM81Q96Zpkd
 lXfo4Pp8J3SO6coShMSeXtnOvE1GKn7r7TUvWZxZpcTB42Bb5aKn5JF44p3gRvxkxxnU
 SCQj9tAcpc+H8kCA/11FAQBlZPlKBT1jjPMWs5mWMpbTEFJ5hIkg/r1s6pkXYqiYyLSM
 FZo+rGrl3dpwwB16e/x8k/FVnbwu1oMtCz2FaKC4kv+6vH8fS0r8aS5UxL4rb9tCmArD
 oyVy2M1rQXJid8EkyrRd2+za6YA9cJBPZeuIBkbxRcDJ825Su1ddAJCqb/knEfaD0zoi
 88oA==
X-Gm-Message-State: AOAM531/voAhKIqG22eo7gD8jTiURfWGfQXYkogqD9TkkSEms61XCorr
 XyHq1qayCSuN5f8ervnSWy7Fdt+Rk3ookNOvrGNRhLV5GNnFrZekFlOzqrF/AMIH0q80HWrXRP+
 YujcQRpxSlzTQMpI=
X-Received: by 2002:adf:c449:: with SMTP id a9mr4604988wrg.256.1630598878920; 
 Thu, 02 Sep 2021 09:07:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvy1Z95C56vbIDV1rdOdEB65I9p2mo07t7GHYV1cOL5u+21eDMa2HbBuL5Sor7LdmZc0esug==
X-Received: by 2002:adf:c449:: with SMTP id a9mr4604938wrg.256.1630598878599; 
 Thu, 02 Sep 2021 09:07:58 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m11sm2287120wrz.28.2021.09.02.09.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 09:07:57 -0700 (PDT)
Subject: Re: [PATCH v2 32/35] acpi: arm/virt: build_gtdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-33-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <3a7029be-78c5-91b0-5eaa-42aee6064929@redhat.com>
Date: Thu, 2 Sep 2021 18:07:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-33-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/8/21 5:46 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> while at it, replace packed structure with endian agnostic
> build_append_FOO() API.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> ---
>  include/hw/acpi/acpi-defs.h | 25 -------------
>  hw/arm/virt-acpi-build.c    | 75 ++++++++++++++++++++++++-------------
>  2 files changed, 48 insertions(+), 52 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 012c4ffb3a..0b375e7589 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -131,29 +131,4 @@ struct AcpiFacsDescriptorRev1 {
>  } QEMU_PACKED;
>  typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
>  
> -/*
> - * Generic Timer Description Table (GTDT)
> - */
> -#define ACPI_GTDT_INTERRUPT_MODE_LEVEL    (0 << 0)
> -#define ACPI_GTDT_INTERRUPT_MODE_EDGE     (1 << 0)
> -#define ACPI_GTDT_CAP_ALWAYS_ON           (1 << 2)
> -
> -struct AcpiGenericTimerTable {
> -    ACPI_TABLE_HEADER_DEF
> -    uint64_t counter_block_addresss;
> -    uint32_t reserved;
> -    uint32_t secure_el1_interrupt;
> -    uint32_t secure_el1_flags;
> -    uint32_t non_secure_el1_interrupt;
> -    uint32_t non_secure_el1_flags;
> -    uint32_t virtual_timer_interrupt;
> -    uint32_t virtual_timer_flags;
> -    uint32_t non_secure_el2_interrupt;
> -    uint32_t non_secure_el2_flags;
> -    uint64_t counter_read_block_address;
> -    uint32_t platform_timer_count;
> -    uint32_t platform_timer_offset;
> -} QEMU_PACKED;
> -typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
> -
>  #endif
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e8553dcae5..8f28e82760 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -455,40 +455,61 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_composed(linker, &table);
>  }
>  
> -/* GTDT */
> +/*
> + * ACPI spec, Revision 5.1
> + * 5.2.24 Generic Timer Description Table (GTDT)
> + */
>  static void
>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> -    int gtdt_start = table_data->len;
> -    AcpiGenericTimerTable *gtdt;
> -    uint32_t irqflags;
> -
> -    if (vmc->claim_edge_triggered_timers) {
> -        irqflags = ACPI_GTDT_INTERRUPT_MODE_EDGE;
> -    } else {
> -        irqflags = ACPI_GTDT_INTERRUPT_MODE_LEVEL;
> -    }
> -
> -    gtdt = acpi_data_push(table_data, sizeof *gtdt);
> -    /* The interrupt values are the same with the device tree when adding 16 */
> -    gtdt->secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_S_EL1_IRQ + 16);
> -    gtdt->secure_el1_flags = cpu_to_le32(irqflags);
> -
> -    gtdt->non_secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL1_IRQ + 16);
> -    gtdt->non_secure_el1_flags = cpu_to_le32(irqflags |
> -                                             ACPI_GTDT_CAP_ALWAYS_ON);
> +    /*
> +     * Table 5-117 Flag Definitions
> +     * set only "Timer interrupt Mode" and assume "Timer Interrupt
> +     * polarity" bit as '0: Interrupt is Active high'
> +     */
> +    uint32_t irqflags = vmc->claim_edge_triggered_timers ?
> +        1 : /* Interrupt is Edge triggered */
> +        0;  /* Interrupt is Level triggered  */
> +    AcpiTable table = { .sig = "GTDT", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> -    gtdt->virtual_timer_interrupt = cpu_to_le32(ARCH_TIMER_VIRT_IRQ + 16);
> -    gtdt->virtual_timer_flags = cpu_to_le32(irqflags);
> +    acpi_init_table(&table, table_data);
>  
> -    gtdt->non_secure_el2_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL2_IRQ + 16);
> -    gtdt->non_secure_el2_flags = cpu_to_le32(irqflags);
> +    /* CntControlBase Physical Address */
> +    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
> +    build_append_int_noprefix(table_data, 0, 8);
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    /*
> +     * FIXME: clarify comment:
> +     * The interrupt values are the same with the device tree when adding 16
> +     */
> +    /* Secure EL1 timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_S_EL1_IRQ + 16, 4);
> +    /* Secure EL1 timer Flags */
> +    build_append_int_noprefix(table_data, irqflags, 4);
> +    /* Non-Secure EL1 timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL1_IRQ + 16, 4);
> +    /* Non-Secure EL1 timer Flags */
> +    build_append_int_noprefix(table_data, irqflags |
> +                              1UL << 2, /* Always-on Capability */
> +                              4);
> +    /* Virtual timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_VIRT_IRQ + 16, 4);
> +    /* Virtual Timer Flags */
> +    build_append_int_noprefix(table_data, irqflags, 4);
> +    /* Non-Secure EL2 timer GSIV */
> +    build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL2_IRQ + 16, 4);
> +    /* Non-Secure EL2 timer Flags */
> +    build_append_int_noprefix(table_data, irqflags, 4);
> +    /* CntReadBase Physical address */
> +    build_append_int_noprefix(table_data, 0, 8);
> +    /* Platform Timer Count */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    /* Platform Timer Offset */
> +    build_append_int_noprefix(table_data, 0, 4);
>  
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + gtdt_start), "GTDT",
> -                 table_data->len - gtdt_start, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +    acpi_table_composed(linker, &table);
>  }
>  
>  /*
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


