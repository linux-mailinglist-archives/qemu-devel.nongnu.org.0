Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61A3FFB5E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:54:37 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM420-00035C-E3
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mM40U-0001bR-9U
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mM40R-0003yp-RB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630655578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szReUzIlkd883pysBc+qwuSmiys228eCTB1/144n2ro=;
 b=fT3KcCBH+Hk1UBSoGJjK/jVMltXBEwJsfzRlrnSSg1Jj0epp3L4yj7dQpPQPag64RNcttY
 FdQ/A7/iSoOqHqs+TSItAIQu5LxiJ3RQc1dR5F4pcJxDmWMXJeACGJlUaEsszDnZ5/fPP5
 3apXlZ03EW8FhpjaV9vz63fPRO6BP+U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-qlrn53p1MS6WHdCXubPlmw-1; Fri, 03 Sep 2021 03:52:55 -0400
X-MC-Unique: qlrn53p1MS6WHdCXubPlmw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1291115wrw.22
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szReUzIlkd883pysBc+qwuSmiys228eCTB1/144n2ro=;
 b=j5guF16NTrjv1W5vm8TNg85elIpvioEEVEphxQY0VRS1BZjZKZ6HeIPOJm6wsiSje1
 TzriPKqswuexaOitBVYrDYgtwTV99CvHwwPAAiNt7M5VY87cBWz+KZcvR3uIBwlv+qWw
 uW3VSaBkwPfyMjZ7GHDiqAexAg5xOCKfaaCO3PwOSam8Vg/o/QUzDl3gMYPbFtAM6uYL
 zUU13/j0QQh8quqCpQXVRyZUeL63Ea+651uUCNzThdQCSwoOBp9W7Wjeyl4DENqNULs8
 1HEXdUcCEwbVfm8Zw0VxxsrzDsCc8Ndb8wokIpAPSF35kTqiYZPjeRrXIUB3jx0xFcPT
 fAUQ==
X-Gm-Message-State: AOAM532C3mK7Pv2Zt3S7a0skAIn83rCD6qOltTOeKNwJN/dN/P2LksVK
 GGfkoufv/pmJi8oOGwei0mh5k2ibqabDuTXtyON4qZEJ1PNzsZQMq55phUurhxJMTI+fX4U0+no
 WQAvHYkj15Js1IQM=
X-Received: by 2002:a1c:a783:: with SMTP id q125mr1937497wme.77.1630655574439; 
 Fri, 03 Sep 2021 00:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHxO3RBerioa34b5JqEw13WeaiHwKkYIDdtcaFap5LNJEFZId8G2lf2Cyzs0iWED2ujMCwaw==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr1937483wme.77.1630655574190; 
 Fri, 03 Sep 2021 00:52:54 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f20sm3563185wml.38.2021.09.03.00.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 00:52:53 -0700 (PDT)
Date: Fri, 3 Sep 2021 09:52:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 31/35] acpi: arm/virt: build_spcr: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Message-ID: <20210903095252.5408f43b@redhat.com>
In-Reply-To: <9c3ae446-3ed4-7a49-721a-95ad3e6d66cf@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-32-imammedo@redhat.com>
 <9c3ae446-3ed4-7a49-721a-95ad3e6d66cf@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sep 2021 17:49:55 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi Igor,
> 
> On 7/8/21 5:46 PM, Igor Mammedov wrote:
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offsets magic from API user.
> > 
> > while at it, replace packed structure with endian agnostic
> > build_append_FOO() API.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: drjones@redhat.com
> > CC: peter.maydell@linaro.org
> > CC: shannon.zhaosl@gmail.com
> > CC: qemu-arm@nongnu.org
> > ---
> >  include/hw/acpi/acpi-defs.h | 32 -----------------
> >  hw/arm/virt-acpi-build.c    | 68 ++++++++++++++++++++++---------------
> >  2 files changed, 41 insertions(+), 59 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 6f2f08a9de..012c4ffb3a 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -117,38 +117,6 @@ typedef struct AcpiFadtData {
> >  #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
> >  #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
> >  
> > -/*
> > - * Serial Port Console Redirection Table (SPCR), Rev. 1.02
> > - *
> > - * For .interface_type see Debug Port Table 2 (DBG2) serial port
> > - * subtypes in Table 3, Rev. May 22, 2012
> > - */
> > -struct AcpiSerialPortConsoleRedirection {
> > -    ACPI_TABLE_HEADER_DEF
> > -    uint8_t  interface_type;
> > -    uint8_t  reserved1[3];
> > -    struct AcpiGenericAddress base_address;
> > -    uint8_t  interrupt_types;
> > -    uint8_t  irq;
> > -    uint32_t gsi;
> > -    uint8_t  baud;
> > -    uint8_t  parity;
> > -    uint8_t  stopbits;
> > -    uint8_t  flowctrl;
> > -    uint8_t  term_type;
> > -    uint8_t  reserved2;
> > -    uint16_t pci_device_id;
> > -    uint16_t pci_vendor_id;
> > -    uint8_t  pci_bus;
> > -    uint8_t  pci_slot;
> > -    uint8_t  pci_func;
> > -    uint32_t pci_flags;
> > -    uint8_t  pci_seg;
> > -    uint32_t reserved3;
> > -} QEMU_PACKED;
> > -typedef struct AcpiSerialPortConsoleRedirection
> > -               AcpiSerialPortConsoleRedirection;
> > -
> >  /*
> >   * ACPI 1.0 Firmware ACPI Control Structure (FACS)
> >   */
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index a07540affb..e8553dcae5 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -349,39 +349,53 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >      acpi_table_composed(linker, &table);
> >  }
> >  
> > +/*
> > + * Serial Port Console Redirection Table (SPCR)
> > + * Rev: 1.07
> > + */  
> was
> /*
>  * Serial Port Console Redirection Table (SPCR), Rev. 1.02
>  */
> 
> By the way
> https://uefi.org/acpi/specs does not list 1.02 nor 1.07
> https://docs.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> ?

That's problem with using MS 'specifications', which is a web page
pointing to the current revision only. (I wasn't able to find
1.02 revision to use doc comments).
So I had to use currently available, which is 1.07 currently,
which seems to be binary compatible with our original 1.02
(that's why it passes bios-tables-test).

> 
> >  static void
> >  build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  {
> > -    AcpiSerialPortConsoleRedirection *spcr;
> > -    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
> > -    int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
> > -    int spcr_start = table_data->len;
> > -
> > -    spcr = acpi_data_push(table_data, sizeof(*spcr));
> > -
> > -    spcr->interface_type = 0x3;    /* ARM PL011 UART */
> > -
> > -    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
> > -    spcr->base_address.bit_width = 8;
> > -    spcr->base_address.bit_offset = 0;
> > -    spcr->base_address.access_width = 1;
> > -    spcr->base_address.address = cpu_to_le64(uart_memmap->base);
> > -
> > -    spcr->interrupt_types = (1 << 3); /* Bit[3] ARMH GIC interrupt */
> > -    spcr->gsi = cpu_to_le32(irq);  /* Global System Interrupt */
> > +    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = vms->oem_id,
> > +                        .oem_table_id = vms->oem_table_id };
> >  
> > -    spcr->baud = 3;                /* Baud Rate: 3 = 9600 */
> > -    spcr->parity = 0;              /* No Parity */
> > -    spcr->stopbits = 1;            /* 1 Stop bit */
> > -    spcr->flowctrl = (1 << 1);     /* Bit[1] = RTS/CTS hardware flow control */
> > -    spcr->term_type = 0;           /* Terminal Type: 0 = VT100 */
> > +    acpi_init_table(&table, table_data);
> >  
> > -    spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
> > -    spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
> > +    /* Interface Type */
> > +    build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
> > +    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
> > +    /* Base Address */
> > +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> > +                     vms->memmap[VIRT_UART].base);
> > +    /* Interrupt Type */
> > +    build_append_int_noprefix(table_data,
> > +        (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
> > +    build_append_int_noprefix(table_data, 0, 1); /* IRQ */
> > +    /* Global System Interrupt */
> > +    build_append_int_noprefix(table_data,
> > +                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
> > +    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
> > +    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
> > +    /* Stop Bits */
> > +    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
> > +    /* Flow Control */
> > +    build_append_int_noprefix(table_data,
> > +        (1 << 1) /* RTS/CTS hardware flow control */, 1);
> > +    /* Terminal Type */
> > +    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
> > +    build_append_int_noprefix(table_data, 0, 1); /* Language */  
> reserved2 -> language in 1.07? but that's fine
> maybe just mention it in the commit msg?

sure, I'll add that into commit message.

> > +    /* PCI Device ID  */
> > +    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
> > +    /* PCI Vendor ID */
> > +    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
> > +    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
> > +    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
> > +    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number */
> > +    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
> > +    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> >  
> > -    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
> > -                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
> > -                 vms->oem_table_id);
> > +    acpi_table_composed(linker, &table);
> >  }
> >  
> >  /*
> >   
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 


