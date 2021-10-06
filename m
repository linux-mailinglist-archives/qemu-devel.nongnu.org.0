Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B441C423F97
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:48:46 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7Hp-0003Uc-GA
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY7Fm-00027V-Mh
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY7Fk-0006GX-TV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633527996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2M75C17tT7mt5I/zArCCXm+9bGDOhnIqeSIjzdiMWH0=;
 b=h5g2y33UWrOq9DCTYdHS4+oCtiAXaLeKfocmhE2abs2x/QW43Tjwr4WAocprDg1kQuhJmv
 +c4M8ASBHwpGd/sLNAtbA7dC4mUgejLPaFkTRYccXGyLGMg0aiWPQck+PJaAxbn34l0Fdr
 pPRlO4j6apeP5WmuMPO+S2d4l+nvj5g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-NBTpQ2y-MSO_MVJHnbVPzA-1; Wed, 06 Oct 2021 09:46:33 -0400
X-MC-Unique: NBTpQ2y-MSO_MVJHnbVPzA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2095949wrc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 06:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2M75C17tT7mt5I/zArCCXm+9bGDOhnIqeSIjzdiMWH0=;
 b=1QhUr2ooKXcRHLWv6D6VMq5Et9ZPqgklW0UP+68yLe5b6dHnyuCfoefv8iJrx8LZO+
 wIM+EIXVAaHAC2+TVA4/uqr3ucSwSWJKdxEUrJkCMpBo0NqCKjksjgJ3QFqyvZuYuz9N
 b2H486G2DRekmi5So6feNaFZzwC5lejE6r7gFZsC3p4xxRFRmlF/BQ21PstWUWdmvVX7
 sCHPxrsYYZ+38lcP2ZB4ciLqpmaJS/P2mxxOafQxMDdpN+mL6LSYSKksBlJMP716u+oZ
 gW/n4J53Tv1+lxYUAEirL69XUNeBd3u37Z68IYUBXyhn0j617PpT8lIZr6kagQz+bdQh
 uVHg==
X-Gm-Message-State: AOAM531TnA+RmplzidH834X6Ewo89i4FeprN7DYtm006FDumzMpSuC5B
 xPpgfYajtQUz9tSy7vODzvviN/DSZER6ghEPO2aINjQP/e19XMozpZK8RIOp6u/OZyJQZiTKEGd
 MWUNSBNGM5iDnutc=
X-Received: by 2002:adf:a101:: with SMTP id o1mr28338471wro.379.1633527992034; 
 Wed, 06 Oct 2021 06:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygZ5f5d2i+xbIBIwFFyCdYKGfVXiLGzFVkz60yZQ7hBwAJSIfyyib5DLFUcIIrtYm4AfTb7Q==
X-Received: by 2002:adf:a101:: with SMTP id o1mr28338427wro.379.1633527991765; 
 Wed, 06 Oct 2021 06:46:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d7sm21176404wrh.13.2021.10.06.06.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 06:46:31 -0700 (PDT)
Date: Wed, 6 Oct 2021 15:46:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211006154630.0acd896d@redhat.com>
In-Reply-To: <2b284309-1dd6-6d73-225d-f83ad4af8657@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
 <20210927131732.63801-3-eric.auger@redhat.com>
 <20211006091523.qaub5xg3kxuwjmlh@gator.home>
 <2b284309-1dd6-6d73-225d-f83ad4af8657@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, philmd@redhat.com,
 ardb@kernel.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Oct 2021 11:57:07 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi,
> 
> On 10/6/21 11:15 AM, Andrew Jones wrote:
> > On Mon, Sep 27, 2021 at 03:17:31PM +0200, Eric Auger wrote:  
> >> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
> >> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
> >>
> >> The DBG2 table allows to describe one or more debug ports.
> >>
> >> Generate an DBG2 table featuring a single debug port, the PL011.
> >>
> >> The DBG2 specification can be found at
> >> "Microsoft Debug Port Table 2 (DBG2)"
> >> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v2 -> v3:
> >> Took into account all comments from Igor on v2:
> >> mostly style adjustment, revision references
> >>
> >> v1 -> v2:
> >> - rebased on Igor's refactoring
> >> ---
> >>  hw/arm/virt-acpi-build.c | 62 +++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 61 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 6cec97352b..257d0fee17 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -616,6 +616,63 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      acpi_table_end(linker, &table);
> >>  }
> >>  
> >> +/* Debug Port Table 2 (DBG2) */
> >> +static void
> >> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)  
> > nit: I didn't think QEMU liked this style, i.e. QEMU prefers
> >
> >  static void build_dbg2(GArray *table_data, BIOSLinker *linker,
> >                         VirtMachineState *vms)
> >
> > Eh, I see that hw/arm/virt-acpi-build.c is full of the format you have
> > here, so never mind.
> >  
> >> +{
> >> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,  
> > Can you explain where the .rev = 3 comes from? The spec says "For this
> > version of the specification, this value is 0."  
> The above revision field belongs to the acpi table header. Not to be
> mixed with the Revision field of the DBG2 table
> which is set below (set to 0):
> 
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> 
> Besides that's a good question. I have rev=3 here but that must come from a copy/paste. when googling I
> found
> 
> https://lists.denx.de/pipermail/u-boot/2015-June/217134.html
> /header->revision = 1; /* ACPI 1.0/2.0: 1, ACPI 3.0: 2, ACPI 4.0: 3 */
> Not sure if 3 is the right value though? Igor, please could you advise?
> Thanks Eric /
> 

"Table 1. Debug Port Table 2 format"
says table revision must be 0

> >
> >  
> >> +                        .oem_table_id = vms->oem_table_id };
> >> +    int dbg2devicelength;
> >> +    const char name[] = "COM0";
> >> +    const int namespace_length = sizeof(name);
> >> +
> >> +    acpi_table_begin(&table, table_data);
> >> +
> >> +    dbg2devicelength = 22 /* BaseAddressRegister[] offset */ +
> >> +                       12 /* BaseAddressRegister[] */ +
> >> +                       4 /* AddressSize[] */ +  
> > I'd personally prefer the '+' before the comment, but maybe Igor has a
> > special ACPI code format preference here.

indeed '+' before comment should look better

> >  
> >> +                       namespace_length /* NamespaceString[] */;
> >> +
> >> +    /* OffsetDbgDeviceInfo */
> >> +    build_append_int_noprefix(table_data, 44, 4);
> >> +    /* NumberDbgDeviceInfo */
> >> +    build_append_int_noprefix(table_data, 1, 4);
> >> +
> >> +    /* Table 2. Debug Device Information structure format */
> >> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> >> +    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
> >> +    /* NumberofGenericAddressRegisters */
> >> +    build_append_int_noprefix(table_data, 1, 1);
> >> +    /* NameSpaceStringLength */
> >> +    build_append_int_noprefix(table_data, namespace_length, 2);
> >> +    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
> >> +    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
> >> +    /* OemDataOffset (0 means no OEM data) */
> >> +    build_append_int_noprefix(table_data, 0, 2);
> >> +
> >> +    /* Port Type */
> >> +    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
> >> +    /* Port Subtype */
> >> +    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
> >> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> >> +    /* BaseAddressRegisterOffset */
> >> +    build_append_int_noprefix(table_data, 22, 2);
> >> +    /* AddressSizeOffset */
> >> +    build_append_int_noprefix(table_data, 34, 2);
> >> +
> >> +    /* BaseAddressRegister[] */
> >> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> >> +                     vms->memmap[VIRT_UART].base);
> >> +
> >> +    /* AddressSize[] */
> >> +    build_append_int_noprefix(table_data, 0x1000 /* Register Space */, 4);
> >> +
> >> +    /* NamespaceString[] */
> >> +    g_array_append_vals(table_data, name, namespace_length);
> >> +
> >> +    acpi_table_end(linker, &table);
> >> +};
> >> +
> >>  /*
> >>   * ACPI spec, Revision 5.1 Errata A
> >>   * 5.2.12 Multiple APIC Description Table (MADT)
> >> @@ -875,7 +932,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      dsdt = tables_blob->len;
> >>      build_dsdt(tables_blob, tables->linker, vms);
> >>  
> >> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> >> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
> >>  
> >> @@ -898,6 +955,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_spcr(tables_blob, tables->linker, vms);
> >>  
> >> +    acpi_add_table(table_offsets, tables_blob);
> >> +    build_dbg2(tables_blob, tables->linker, vms);
> >> +
> >>      if (vms->ras) {
> >>          build_ghes_error_table(tables->hardware_errors, tables->linker);
> >>          acpi_add_table(table_offsets, tables_blob);
> >> -- 
> >> 2.26.3
> >>  
> > Thanks,
> > drew 
> >  
> 


