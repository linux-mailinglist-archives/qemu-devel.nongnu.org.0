Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6435E29C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:22:47 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWKsI-0003Bp-A0
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWKr2-0001z7-GF
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:21:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lWKqx-0004MI-Io
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618327281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06C3+D6RZL2iorVFI+3JpAEshv7qYhszSL0lAB9b34s=;
 b=fAd2fklAYGebnYPOQsFKG4hQzBCItwC+MVx/9agI/uFFkEp/WKDx5GoanMug9fnobu5RmM
 wSTykruuQmI+SzKVzpyqV2fSzFGdWxaXyCFR1Oijudt8/lzR7J8MttZsM4MafhvXJGU1kn
 fm81bJAp2IiiLROsCjLghfD17GsCbDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-gv4KZLuzNKmPIy5PXYQwLQ-1; Tue, 13 Apr 2021 11:21:18 -0400
X-MC-Unique: gv4KZLuzNKmPIy5PXYQwLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9807381431F;
 Tue, 13 Apr 2021 15:21:17 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D52719D9F;
 Tue, 13 Apr 2021 15:21:11 +0000 (UTC)
Date: Tue, 13 Apr 2021 17:21:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH for-6.0] x86: acpi: use offset instead of pointer when
 using build_header()
Message-ID: <20210413172110.25da8cd3@redhat.com>
In-Reply-To: <20210413095106-mutt-send-email-mst@kernel.org>
References: <20210413111400.3778820-1-imammedo@redhat.com>
 <20210413081423-mutt-send-email-mst@kernel.org>
 <20210413151816.0257b829@redhat.com>
 <20210413095106-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 09:53:17 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Apr 13, 2021 at 03:18:16PM +0200, Igor Mammedov wrote:
> > On Tue, 13 Apr 2021 08:14:56 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, Apr 13, 2021 at 07:14:00AM -0400, Igor Mammedov wrote:  
> > > > Do the same as in commit
> > > >  (4d027afeb3a97 Virt: ACPI: fix qemu assert due to re-assigned table data address)  
> 
> Format:
> 
> commit 4d027afeb3a97 ("Virt: ACPI: fix qemu assert due to re-assigned table data address")
> 
> > > > for remaining tables that happen to use saved at
> > > > the beginning pointer to build header to avoid assert
> > > > when table_data is relocated due to implicit re-size.
> > > > 
> > > > Reported-in: https://bugs.launchpad.net/bugs/1923497    
> > > 
> > > Doesn't this fix the bug? If so -
> > > Isn't this Fixes: ?  
> > that's buried in history
> > 
> > Fixes: 243bdb79fb0b2ed hw/arm/virt-acpi-build: Generate RSDT table
> > Fixes: cb51ac2ffe3649e hw/arm/virt: generate 64-bit addressable ACPI objects
> > Fixes: 4338416064303aa acpi: Move build_tpm2() in the generic part
> > Fixes: 72c194f7e75cb64 i386: ACPI table generation code from seabios
> > Fixes: 711b20b479aa96e Add ACPI tables for TPM  
> 
> 
> I just mean:
> 
>     Buglink: https://bugs.launchpad.net/qemu/+bug/1921138
> 
> as opposed to Reported.
> 
> Also do we CC stable for this?
Given it's reported on 5.1, it is a good idea to cc stable.

Shall I repost with fixed: "Fixes:..."?

> 
> >    
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> 
> patch itself ok:
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> > > > ---
> > > > PS:
> > > >  I have build_header() refactoring patch that requires offset
> > > >  instead of pointer, to make it harder to misuse but it's
> > > >  a bit intrusive for last minute fixes. So here goes simplified
> > > >  variant, and I'll post refactoring patch for 6.1. later.
> > > > ---
> > > >  hw/acpi/aml-build.c  | 15 +++++++++------
> > > >  hw/i386/acpi-build.c |  8 ++++++--
> > > >  2 files changed, 15 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > > index d33ce8954a..f0035d2b4a 100644
> > > > --- a/hw/acpi/aml-build.c
> > > > +++ b/hw/acpi/aml-build.c
> > > > @@ -1830,6 +1830,7 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> > > >      int i;
> > > >      unsigned rsdt_entries_offset;
> > > >      AcpiRsdtDescriptorRev1 *rsdt;
> > > > +    int rsdt_start = table_data->len;
> > > >      const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
> > > >      const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
> > > >      const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
> > > > @@ -1846,7 +1847,8 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> > > >              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
> > > >      }
> > > >      build_header(linker, table_data,
> > > > -                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
> > > > +                 (void *)(table_data->data + rsdt_start),
> > > > +                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
> > > >  }
> > > >  
> > > >  /* Build xsdt table */
> > > > @@ -1857,6 +1859,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> > > >      int i;
> > > >      unsigned xsdt_entries_offset;
> > > >      AcpiXsdtDescriptorRev2 *xsdt;
> > > > +    int xsdt_start = table_data->len;
> > > >      const unsigned table_data_len = (sizeof(uint64_t) * table_offsets->len);
> > > >      const unsigned xsdt_entry_size = sizeof(xsdt->table_offset_entry[0]);
> > > >      const size_t xsdt_len = sizeof(*xsdt) + table_data_len;
> > > > @@ -1873,7 +1876,8 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> > > >              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
> > > >      }
> > > >      build_header(linker, table_data,
> > > > -                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
> > > > +                 (void *)(table_data->data + xsdt_start),
> > > > +                 "XSDT", xsdt_len, 1, oem_id, oem_table_id);
> > > >  }
> > > >  
> > > >  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> > > > @@ -2053,10 +2057,9 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> > > >      uint64_t control_area_start_address;
> > > >      TPMIf *tpmif = tpm_find();
> > > >      uint32_t start_method;
> > > > -    void *tpm2_ptr;
> > > >  
> > > >      tpm2_start = table_data->len;
> > > > -    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > >  
> > > >      /* Platform Class */
> > > >      build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
> > > > @@ -2095,8 +2098,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> > > >                                     log_addr_offset, 8,
> > > >                                     ACPI_BUILD_TPMLOG_FILE, 0);
> > > >      build_header(linker, table_data,
> > > > -                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, oem_id,
> > > > -                 oem_table_id);
> > > > +                 (void *)(table_data->data + tpm2_start),
> > > > +                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
> > > >  }
> > > >  
> > > >  Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index de98750aef..daaf8f473e 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -1816,6 +1816,7 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> > > >             const char *oem_table_id)
> > > >  {
> > > >      Acpi20Hpet *hpet;
> > > > +    int hpet_start = table_data->len;
> > > >  
> > > >      hpet = acpi_data_push(table_data, sizeof(*hpet));
> > > >      /* Note timer_block_id value must be kept in sync with value advertised by
> > > > @@ -1824,13 +1825,15 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> > > >      hpet->timer_block_id = cpu_to_le32(0x8086a201);
> > > >      hpet->addr.address = cpu_to_le64(HPET_BASE);
> > > >      build_header(linker, table_data,
> > > > -                 (void *)hpet, "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
> > > > +                 (void *)(table_data->data + hpet_start),
> > > > +                 "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
> > > >  }
> > > >  
> > > >  static void
> > > >  build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> > > >                 const char *oem_id, const char *oem_table_id)
> > > >  {
> > > > +    int tcpa_start = table_data->len;
> > > >      Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
> > > >      unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
> > > >      unsigned log_addr_offset =
> > > > @@ -1849,7 +1852,8 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> > > >          ACPI_BUILD_TPMLOG_FILE, 0);
> > > >  
> > > >      build_header(linker, table_data,
> > > > -                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
> > > > +                 (void *)(table_data->data + tcpa_start),
> > > > +                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
> > > >  }
> > > >  
> > > >  #define HOLE_640K_START  (640 * KiB)
> > > > -- 
> > > > 2.27.0    
> > >   
> 


