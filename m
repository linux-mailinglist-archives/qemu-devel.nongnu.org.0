Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E29426D69
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:22:31 +0200 (CEST)
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrhe-0004rz-En
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrfr-0003CO-HJ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:20:39 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrfo-0001Ze-DP
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:20:39 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v17so30882416wrv.9
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5agtqILj6wbiAhAxlZtBSzhi/9gtCeT24zYTXd11dHA=;
 b=wF0pqLLu6VtjlAESt406DIXfZ3HM3jS2x1PkXliBQfRisnKR22HVVgaNhqOSAGRJFg
 xLhZmHRlL4CHCT9GlDPgGfUJAKtsCL+4AQIoZGz6ZSd/ODjLd111er1CZt7R7pIq7A8I
 dH0AKELYylOI9gEYE8B3qdwnnR+kytFc9JI37GIHu1W94PkKnJPr6L9uSwJJMA1gsGAQ
 kQ8vTN8cS0ZTazykNUZwHlNsOHOMPzKjQ5pQhqA4d8eq+8IIfY1BMJf7YhJfYI4HMUz/
 ddhnVgjFkSPhWYBnxYbNLF+tNT1xAm0oIxlRuZJVNxqMGzNUlIdq4UYOXxrJ7eIlie0c
 LfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5agtqILj6wbiAhAxlZtBSzhi/9gtCeT24zYTXd11dHA=;
 b=sZvslwLmx3r8SUTgWSU02HlDvB60vAa5G44LFo+5f0jaSA0AqgktPJCaNus6uk55Ow
 soWPMiTfEcoSwKpybRqcK7fZJOpgHMZ4o/BgxiaIQRTZtI1rqlePYQeXdMklxrtnThzr
 eZOfe3Td/1ginReDYAcBvzQOw0q8BtGTioV2N4/PVez7q8E+kbB6vfRmb/Zmby9TT0df
 688YM1kQY7psiP3xId9FJMB/fucUNWv5mJkqhKYHnH2V3JHOxcUkcHI0edDzSEtViWoB
 Nfj5cQSA1Ey4F8HopaFCsc7FJHc688tG65ZrFupRjF34RmXDV27msRaFoKckaipLYM2P
 2zKA==
X-Gm-Message-State: AOAM531Hn/TMKDW5Klmypx4xUylzqOJCpPP8HvOVrmxpXu5klO2XRbDu
 Y97kK8NQKtg9skKJZtnCoHct5w==
X-Google-Smtp-Source: ABdhPJxRGFM2RVVvlCkK90fBQDa9p/c6YWeaFJOo2uQPs2cLyCX2KBgBFmKvEvgddzoORrV+aUg4DQ==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr4134131wma.172.1633706434777; 
 Fri, 08 Oct 2021 08:20:34 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id u17sm2732779wrw.85.2021.10.08.08.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:20:34 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:20:11 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 01/11] hw/acpi: Add VIOT table
Message-ID: <YWBhq2T5oqeawJWW@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-2-jean-philippe@linaro.org>
 <20211006100950.12798a07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006100950.12798a07@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 ehabkost@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 10:09:50AM +0200, Igor Mammedov wrote:
> On Fri,  1 Oct 2021 18:33:49 +0100
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Add a function that generates a Virtual I/O Translation table (VIOT),
> > describing the topology of paravirtual IOMMUs. The table is created when
> > instantiating a virtio-iommu device. It contains a virtio-iommu node and
> 
> perhaps
> s/when instantiating ... ./if a virtio-iommu device present/
> 
> > PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> > node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> > machine option and "bypass_iommu" PXB option, only buses that do not
> > bypass the IOMMU are described by PCI Range nodes.
> 
> 
> modulo comments, patch looks fine to me from ACPI point of view.
> 
> but I don't know if values used for describing PCI structures
> make any sense so this might need an ACK from a person who knows
> PCI innards better.

For what it's worth I mainly looked at other similar tables (IORT, DMAR
and IVRS) to figure out what values I should use

[...]
> > +static int build_pci_range_node(Object *obj, void *opaque)
> > +{
> > +    struct viot_pci_ranges *pci_ranges = opaque;
> > +    GArray *blob = pci_ranges->blob;
> > +
> > +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> > +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> > +
> > +        if (bus && !pci_bus_bypass_iommu(bus)) {
> > +            int min_bus, max_bus;
> > +
> > +            pci_bus_range(bus, &min_bus, &max_bus);
> > +
> > +            /* Type (PCI range) */
> see [1] below
> 
> > +            build_append_int_noprefix(blob, 1, 1);
> > +            /* Reserved */
> > +            build_append_int_noprefix(blob, 0, 1);
> > +            /* Length */
> > +            build_append_int_noprefix(blob, 24, 2);
> 
> spec should be fixed to state length value for fixed length structures
> like it's done in ACPI specs, I who we should poke at to make this happen.

That doesn't seem to be applied rigorously. Several fixed-size structures
don't state their sizes, for example "5.2.25.7 NVDIMM Block Data Window
Region Structure", "5.2.25.9 Platform Capabilities Structure", "5.2.26.1.1
ACPI_NAMESPACE_DEVICE based Secure Device Structure".

> 
> zzzz
> > +            /* Endpoint start */
> > +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> > +            /* PCI Segment start */
> > +            build_append_int_noprefix(blob, 0, 2);
> > +            /* PCI Segment end */
> > +            build_append_int_noprefix(blob, 0, 2);
> zzzz
> see comment [2]
> 
> > +            /* PCI BDF start */
> > +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
> > +            /* PCI BDF end */
> > +            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
> > +            /* Output node */
> > +            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
> > +            /* Reserved */
> > +            build_append_int_noprefix(blob, 0, 6);
> > +
> > +            pci_ranges->count++;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> > + * endpoints.
> > + */
> 
> this comment needs to state spec name/version, otherwise it's not clear
> what code below is based on (example: build_dmar_q35).
> 
> Also since there is no final spec yet and spec doesn't have permanent
> hosting place (i.e. hosted by one of specs org), I'd consider
> link in cover letter 'dead' and not suitable for long term use.

Yes, I'll throw those documents out once the final spec is out

> So we should shovel spec docs/specs and point to it in this comment

I could write "Defined in the ACPI Specification (Version TBD)"
For all I know it could be version 6.5 or 7.0...

> 
> > +void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> > +                uint16_t virtio_iommu_bdf, const char *oem_id,
> > +                const char *oem_table_id)
> > +{
> > +    /* The virtio-iommu node follows the 48-bytes header */
> > +    int viommu_off = 48;
> > +    AcpiTable table = { .sig = "VIOT", .rev = 0,
> > +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> > +    struct viot_pci_ranges pci_ranges = {
> > +        .output_node = viommu_off,
> > +        .blob = g_array_new(false, true /* clear */, 1),
> > +    };
> > +
> > +    /* Build the list of PCI ranges that this viommu manages */
> > +    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
> > +                                   &pci_ranges);
> > +
> > +    /* ACPI table header */
> > +    acpi_table_begin(&table, table_data);
> > +    /* Node count */
> > +    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> > +    /* Node offset */
> > +    build_append_int_noprefix(table_data, viommu_off, 2);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8);
> > +
> > +    /* Virtio-iommu node */
> > +    /* Type (virtio-pci IOMMU)  */
> 
> (1)
> /* Type */
> > +    build_append_int_noprefix(table_data, 3, 1);
>   s:3,:3 /* virtio-pci IOMMU */,:
> 
> check-patch will spit out warning but that kind comment
> is common practice with ACPI code

> 
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 1);
> > +    /* Length */
> > +    build_append_int_noprefix(table_data, 16, 2);
> > +    /* PCI Segment */
> > +    build_append_int_noprefix(table_data, 0, 2);
> (2)
> can we fetch _SEG value from device instead of hard-codding value here?

Looking for "segment" and "domain" I couldn't find any dynamic segment
number, 0 seems to be hardcoded everywhere (hw/acpi/pci.c,
hw/i386/acpi-build.c, hw/arm/virt.c, hw/arm/virt-acpi-build.c).

> 
> I might be obvious to PCI folks,
> but it would be better have at least a comment explaining
> where these values come from

I could add that "QEMU only implements segment 0"

Thanks,
Jean

> 
> Michael,
> what do you think?
> 
> > +    /* PCI BDF number */
> > +    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8);
> > +
> > +    /* PCI ranges found above */
> > +    g_array_append_vals(table_data, pci_ranges.blob->data,
> > +                        pci_ranges.blob->len);
> > +    g_array_free(pci_ranges.blob, true);
> > +
> > +    acpi_table_end(linker, &table);
> > +}
> > +
> > diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> > index 3b5e118c54..622b0b50b7 100644
> > --- a/hw/acpi/Kconfig
> > +++ b/hw/acpi/Kconfig
> > @@ -51,6 +51,10 @@ config ACPI_VMGENID
> >      default y
> >      depends on PC
> >  
> > +config ACPI_VIOT
> > +    bool
> > +    depends on ACPI
> > +
> >  config ACPI_HW_REDUCED
> >      bool
> >      select ACPI
> > diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> > index 7d8c0eb43e..adf6347bc4 100644
> > --- a/hw/acpi/meson.build
> > +++ b/hw/acpi/meson.build
> > @@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files(
> >  acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> >  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
> >  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
> > +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
> >  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
> >  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
> >  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> 

