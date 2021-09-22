Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83783414616
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 12:22:43 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSzOk-0002bx-4x
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 06:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSzNN-0001xI-5Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSzN6-0003Qd-SJ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632306058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sVWZIGhhZMhSIMXGJ+YICTAzSqwNwW4Ai3M70AUxsk=;
 b=BS0RVzVYQOQYHwatcmGm+ujz77S2dKFeovd3NGk9986x3hDhpra7kM9ZEqnXEXZs1LYZM2
 wn1y03gUTCCTdHlqhNtKRFpUOyW/zvmKAhHaZizzU/6WKnUmX9CX1qVBQxgLTQBJYpIpPm
 cOtaqzqlIsXxV+eeVcGKjGU0qL7Ga5c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-5N-YnKJhPDy6TlvQ2voEtw-1; Wed, 22 Sep 2021 06:20:57 -0400
X-MC-Unique: 5N-YnKJhPDy6TlvQ2voEtw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso1725414wra.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 03:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3sVWZIGhhZMhSIMXGJ+YICTAzSqwNwW4Ai3M70AUxsk=;
 b=7fGW8eo5jQdeK3R0GZnSauSrmny+AZeqMZ1CNkg0ClVoxdq59Ni/8vrTB9oOKThl1q
 Zak+CDQIGCZVxwiFWkeN9PludVsa00eACYU8yQjAsysVcUU73r1ifduFhSx6DOK28fJG
 f/5P9cu9daoIKkZ659233YOE1IZ6qwNtaLmXsaXYN+dKHlGUCn63TQV8w2oCzmtQ6Sds
 wIOOd7KL7iLq1yFJQuvjpnevh1zYQ9IDT0f1UPxF3lvkE9KyWHaAz6SFaWdtfO60exe5
 ONMuY1HYbI/bKsFTDrHPvz7EP/niwZFRL3kIC86/N5vUo0EKzTOPgUSpJp+7Syc6c08s
 k8MA==
X-Gm-Message-State: AOAM531PgLy/Imavu9KxBcxgxoAwg2YUsNrfg9Weprt5W99wPfcy/xfK
 +luI/3LaDWQ+TjI6oIwN4N/53+iooGV5r8IJlAuJ7qoFCAd+JazAdxV7mxvP0ik9LyOnE5cUC8I
 /aOe0VvkF4tP9N18=
X-Received: by 2002:a1c:984c:: with SMTP id a73mr9384015wme.171.1632306056454; 
 Wed, 22 Sep 2021 03:20:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwon4nfVf8Ugud2DKn9RTLacd7eWdFMvTdgrir13KW/yly7GDh90cHX0oGuBqMKosTZvHWv/Q==
X-Received: by 2002:a1c:984c:: with SMTP id a73mr9383992wme.171.1632306056168; 
 Wed, 22 Sep 2021 03:20:56 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l19sm1815081wrc.16.2021.09.22.03.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:20:55 -0700 (PDT)
Subject: Re: [PATCH v3 24/35] acpi: x86: madt: use build_append_int_noprefix()
 API to compose MADT table
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-25-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <0cfb534a-afb4-ff3e-2359-6906eaf16d8a@redhat.com>
Date: Wed, 22 Sep 2021 12:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-25-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> Drop usage of packed structures and explicit endian conversions
> when building MADT table for arm/x86 and use endian agnostic
> build_append_int_noprefix() API to build it.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: marcel.apfelbaum@gmail.com
> CC: eauger@redhat.com
> ---
>  include/hw/acpi/acpi-defs.h |  64 ------------------
>  hw/i386/acpi-common.c       | 127 ++++++++++++++++++------------------
>  2 files changed, 65 insertions(+), 126 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af4fa412a5..3f174ba208 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -165,17 +165,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
>  
>  /* Values for Type in APIC sub-headers */
>  
> -#define ACPI_APIC_PROCESSOR          0
> -#define ACPI_APIC_IO                 1
> -#define ACPI_APIC_XRUPT_OVERRIDE     2
> -#define ACPI_APIC_NMI                3
> -#define ACPI_APIC_LOCAL_NMI          4
> -#define ACPI_APIC_ADDRESS_OVERRIDE   5
> -#define ACPI_APIC_IO_SAPIC           6
> -#define ACPI_APIC_LOCAL_SAPIC        7
> -#define ACPI_APIC_XRUPT_SOURCE       8
> -#define ACPI_APIC_LOCAL_X2APIC       9
> -#define ACPI_APIC_LOCAL_X2APIC_NMI      10
>  #define ACPI_APIC_GENERIC_CPU_INTERFACE 11
>  #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
>  #define ACPI_APIC_GENERIC_MSI_FRAME     13
> @@ -192,59 +181,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
>  
>  /* Sub-structures for MADT */
>  
> -struct AcpiMadtProcessorApic {
> -    ACPI_SUB_HEADER_DEF
> -    uint8_t  processor_id;           /* ACPI processor id */
> -    uint8_t  local_apic_id;          /* Processor's local APIC id */
> -    uint32_t flags;
> -} QEMU_PACKED;
> -typedef struct AcpiMadtProcessorApic AcpiMadtProcessorApic;
> -
> -struct AcpiMadtIoApic {
> -    ACPI_SUB_HEADER_DEF
> -    uint8_t  io_apic_id;             /* I/O APIC ID */
> -    uint8_t  reserved;               /* Reserved - must be zero */
> -    uint32_t address;                /* APIC physical address */
> -    uint32_t interrupt;              /* Global system interrupt where INTI
> -                                 * lines start */
> -} QEMU_PACKED;
> -typedef struct AcpiMadtIoApic AcpiMadtIoApic;
> -
> -struct AcpiMadtIntsrcovr {
> -    ACPI_SUB_HEADER_DEF
> -    uint8_t  bus;
> -    uint8_t  source;
> -    uint32_t gsi;
> -    uint16_t flags;
> -} QEMU_PACKED;
> -typedef struct AcpiMadtIntsrcovr AcpiMadtIntsrcovr;
> -
> -struct AcpiMadtLocalNmi {
> -    ACPI_SUB_HEADER_DEF
> -    uint8_t  processor_id;           /* ACPI processor id */
> -    uint16_t flags;                  /* MPS INTI flags */
> -    uint8_t  lint;                   /* Local APIC LINT# */
> -} QEMU_PACKED;
> -typedef struct AcpiMadtLocalNmi AcpiMadtLocalNmi;
> -
> -struct AcpiMadtProcessorX2Apic {
> -    ACPI_SUB_HEADER_DEF
> -    uint16_t reserved;
> -    uint32_t x2apic_id;              /* Processor's local x2APIC ID */
> -    uint32_t flags;
> -    uint32_t uid;                    /* Processor object _UID */
> -} QEMU_PACKED;
> -typedef struct AcpiMadtProcessorX2Apic AcpiMadtProcessorX2Apic;
> -
> -struct AcpiMadtLocalX2ApicNmi {
> -    ACPI_SUB_HEADER_DEF
> -    uint16_t flags;                  /* MPS INTI flags */
> -    uint32_t uid;                    /* Processor object _UID */
> -    uint8_t  lint;                   /* Local APIC LINT# */
> -    uint8_t  reserved[3];            /* Local APIC LINT# */
> -} QEMU_PACKED;
> -typedef struct AcpiMadtLocalX2ApicNmi AcpiMadtLocalX2ApicNmi;
> -
>  struct AcpiMadtGenericCpuInterface {
>      ACPI_SUB_HEADER_DEF
>      uint16_t reserved;
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 7983a13a93..aa7b5c357e 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,7 +38,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         bool force_enabled)
>  {
>      uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 : 0;
> +    /* Flags – Local APIC Flags */
nit: move that comment at the place of the build_append_int_noprefix
> +    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> +                     1 /* Enabled */ : 0;
>  
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -47,24 +49,47 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>       * should be put in MADT but kept disabled.
>       */
>      if (apic_id < 255) {
> -        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
> -
> -        apic->type = ACPI_APIC_PROCESSOR;
> -        apic->length = sizeof(*apic);
> -        apic->processor_id = uid;
> -        apic->local_apic_id = apic_id;
> -        apic->flags = cpu_to_le32(flags);
> +        /* Rev 1.0b, Table 5-13 Processor Local APIC Structure */
> +        build_append_int_noprefix(entry, 0, 1);       /* Type */
> +        build_append_int_noprefix(entry, 8, 1);       /* Length */
> +        build_append_int_noprefix(entry, uid, 1);     /* ACPI Processor ID */
nit s/ID/UID
> +        build_append_int_noprefix(entry, apic_id, 1); /* APIC ID */
> +        build_append_int_noprefix(entry, flags, 4); /* Flags */
>      } else {
> -        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
> -
> -        apic->type = ACPI_APIC_LOCAL_X2APIC;
> -        apic->length = sizeof(*apic);
> -        apic->uid = cpu_to_le32(uid);
> -        apic->x2apic_id = cpu_to_le32(apic_id);
> -        apic->flags = cpu_to_le32(flags);
> +        /* Rev 4.0, 5.2.12.12 Processor Local x2APIC Structure */
> +        build_append_int_noprefix(entry, 9, 1);       /* Type */
> +        build_append_int_noprefix(entry, 16, 1);      /* Length */
> +        build_append_int_noprefix(entry, 0, 2);       /* Reserved */
> +        build_append_int_noprefix(entry, apic_id, 4); /* X2APIC ID */
> +        build_append_int_noprefix(entry, flags, 4);   /* Flags */
> +        build_append_int_noprefix(entry, uid, 4);     /* ACPI Processor UID */
>      }
>  }
>  
> +static void build_ioapic(GArray *entry, uint8_t id, uint32_t addr, uint32_t irq)
> +{
> +    /* Rev 1.0b, 5.2.8.2 IO APIC */
> +    build_append_int_noprefix(entry, 1, 1);    /* Type */
> +    build_append_int_noprefix(entry, 12, 1);   /* Length */
> +    build_append_int_noprefix(entry, id, 1);   /* IO APIC ID */
> +    build_append_int_noprefix(entry, 0, 1);    /* Reserved */
> +    build_append_int_noprefix(entry, addr, 4); /* IO APIC Address */
> +    build_append_int_noprefix(entry, irq, 4);  /* System Vector Base */
> +}
> +
> +static void
> +build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_t flags)
> +{
> +    /* Rev 1.0b, 5.2.8.3.1 Interrupt Source Overrides */
> +    build_append_int_noprefix(entry, 2, 1);  /* Type */
> +    build_append_int_noprefix(entry, 10, 1); /* Length */
> +    build_append_int_noprefix(entry, 0, 1);  /* Bus */
> +    build_append_int_noprefix(entry, src, 1);  /* Source */
> +    /* Global System Interrupt Vector */
> +    build_append_int_noprefix(entry, gsi, 4);
> +    build_append_int_noprefix(entry, flags, 2);  /* Flags */
> +}
> +
>  /*
>   * ACPI spec, Revision 1.0b
>   * 5.2.8 Multiple APIC Description Table
> @@ -73,14 +98,11 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
>                       const char *oem_id, const char *oem_table_id)
>  {
> +    int i;
> +    bool x2apic_mode = false;
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>      AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> -    bool x2apic_mode = false;
> -
> -    AcpiMadtIoApic *io_apic;
> -    AcpiMadtIntsrcovr *intsrcovr;
> -    int i;
>      AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
>  
> @@ -96,30 +118,14 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>          }
>      }
>  
> -    io_apic = acpi_data_push(table_data, sizeof *io_apic);
> -    io_apic->type = ACPI_APIC_IO;
> -    io_apic->length = sizeof(*io_apic);
> -    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
> -    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
> -    io_apic->interrupt = cpu_to_le32(0);
> -
> +    build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID, IO_APIC_DEFAULT_ADDRESS, 0);
>      if (x86ms->ioapic2) {
> -        AcpiMadtIoApic *io_apic2;
> -        io_apic2 = acpi_data_push(table_data, sizeof *io_apic);
> -        io_apic2->type = ACPI_APIC_IO;
> -        io_apic2->length = sizeof(*io_apic);
> -        io_apic2->io_apic_id = ACPI_BUILD_IOAPIC_ID + 1;
> -        io_apic2->address = cpu_to_le32(IO_APIC_SECONDARY_ADDRESS);
> -        io_apic2->interrupt = cpu_to_le32(IO_APIC_SECONDARY_IRQBASE);
> +        build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID + 1,
> +                     IO_APIC_SECONDARY_ADDRESS, IO_APIC_SECONDARY_IRQBASE);
>      }
>  
>      if (x86ms->apic_xrupt_override) {
> -        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
> -        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> -        intsrcovr->length = sizeof(*intsrcovr);
> -        intsrcovr->source = 0;
> -        intsrcovr->gsi    = cpu_to_le32(2);
> -        intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
> +        build_xrupt_override(table_data, 0, 2, 0);
lost /* conforms to bus specifications */ comment for the flag during
the battle/ Don't know if it is useful though
>      }
>  
>      for (i = 1; i < 16; i++) {
> @@ -127,32 +133,29 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>              /* No need for a INT source override structure. */
>              continue;
>          }
> -        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
> -        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> -        intsrcovr->length = sizeof(*intsrcovr);
> -        intsrcovr->source = i;
> -        intsrcovr->gsi    = cpu_to_le32(i);
> -        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
> +        build_xrupt_override(table_data, i, i, 0xd);
Lost for the flag /* active high, level triggered */
>      }
>  
>      if (x2apic_mode) {
> -        AcpiMadtLocalX2ApicNmi *local_nmi;
> -
> -        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
> -        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
> -        local_nmi->length = sizeof(*local_nmi);
> -        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
> -        local_nmi->flags  = cpu_to_le16(0);
> -        local_nmi->lint   = 1; /* ACPI_LINT1 */
> +        /* Rev 4.0, 5.2.12.13 Local x2APIC NMI Structure*/
> +        build_append_int_noprefix(table_data, 0xA, 1); /* Type */
> +        build_append_int_noprefix(table_data, 12, 1);  /* Length */
> +        build_append_int_noprefix(table_data, 0, 2);   /* Flags */
> +        /* ACPI Processor UID */
> +        build_append_int_noprefix(table_data, 0xFFFFFFFF /* all processors */,
> +                                  4);
> +        /* Local x2APIC INTI# */
Local x2APIC LINT#
> +        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
> +        build_append_int_noprefix(table_data, 0, 3);
/* reserved */
>      } else {
> -        AcpiMadtLocalNmi *local_nmi;
> -
> -        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
> -        local_nmi->type         = ACPI_APIC_LOCAL_NMI;
> -        local_nmi->length       = sizeof(*local_nmi);
> -        local_nmi->processor_id = 0xff; /* all processors */
> -        local_nmi->flags        = cpu_to_le16(0);
> -        local_nmi->lint         = 1; /* ACPI_LINT1 */
> +        /* Rev 1.0b, 5.2.8.3.3 Local APIC NMI */
> +        build_append_int_noprefix(table_data, 4, 1);  /* Type */
> +        build_append_int_noprefix(table_data, 6, 1);  /* Length */
> +        /* ACPI Processor ID */
> +        build_append_int_noprefix(table_data, 0xff /* all processors */, 1);
0xFF
> +        build_append_int_noprefix(table_data, 0, 2);  /* Flags */
> +        /* Local APIC INTI# */
Local APIC LINT#
> +        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
>      }
>  
>      acpi_table_end(linker, &table);
> 

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


