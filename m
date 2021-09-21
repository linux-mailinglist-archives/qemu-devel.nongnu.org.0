Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142241309C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:14:38 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSbrI-0001V6-Qt
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSbqA-0000o1-1j
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSbq2-0003Ef-9s
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632215595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJSrV1/OzoNnKDM0bRr7bj+s6nSGCNsLUFx0LTDgjSI=;
 b=EXjmOdCIA1kz/hQG+qh8d5mgNRXkcrU2+M5fqLOBbr8g5lMgTYAUyYsUGMMkJVfBY5h3sB
 wMJoXEx2gK/1A/jNNn2k02x2Z3hBNMrnimCIllY6NmacZPJRfUbQnQDMEyz3jBB3RH8XXd
 D947KJDNwlf/Q0gHNwhaw6rJQX69sdg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-hKAKfjJWNhWQ2mG8GCN3pw-1; Tue, 21 Sep 2021 05:13:13 -0400
X-MC-Unique: hKAKfjJWNhWQ2mG8GCN3pw-1
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso7123003edx.2
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJSrV1/OzoNnKDM0bRr7bj+s6nSGCNsLUFx0LTDgjSI=;
 b=fFITkxYwSHH0FM+uDcWBQASAIFcfrRm1Sg2/IDXnrRaeaGuGapGgazYF4d6rxs42cY
 04BytBLU5ff4taGuTAituKAMW2XOxaR4wJwkdi3O2QHLMZzQDr55az9AaLYf8GFFsLQw
 O1x+UC+m2gAjFuFqCchEZrocW1ynaapgzkSSyCC8zmsGe72E+tnm8+ccK/p7oC7SF3iu
 ND88nYDnZudTaY7uIcIgLGC8j+bkLStJnWsVl4rA0Om+hiFi93M/gF3CmOL13ZMkcDCM
 5HDKxm2jzWov9Z/xVvsh2NbkGyUU+VmlJlFzmkSqF05dHfPiPDalPU4RA7ZNBwYgS8DO
 bjBA==
X-Gm-Message-State: AOAM532NIfnQYVLY0uJHgpV2lW5K7UG3OixDII6TAE8VIr7BbktRz1Sq
 rIt3Zvjc0N/Wl5rVMg9bJwptllKOK3VfOCqdvMairO2ihOY3LcDye750llUT4/hImY39vMt43N7
 okmDRWhBIJcOmwq4=
X-Received: by 2002:a17:906:6a21:: with SMTP id
 qw33mr34403120ejc.326.1632215592575; 
 Tue, 21 Sep 2021 02:13:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/SRbUOgFhLjHKL+4kZxfRXjuv9vSsJ2IPmgqwmmgYZeH2S1uKh9bSJV0mP9QY7kWYQYxz0w==
X-Received: by 2002:a17:906:6a21:: with SMTP id
 qw33mr34403100ejc.326.1632215592311; 
 Tue, 21 Sep 2021 02:13:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s3sm8192519edw.38.2021.09.21.02.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 02:13:11 -0700 (PDT)
Date: Tue, 21 Sep 2021 11:13:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 02/35] acpi: build_rsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20210921111311.32990f59@redhat.com>
In-Reply-To: <61d3f4da-d0ba-399e-d851-fa7aa90365d8@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-3-imammedo@redhat.com>
 <61d3f4da-d0ba-399e-d851-fa7aa90365d8@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sep 2021 18:21:22 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi,
> 
> On 9/7/21 4:47 PM, Igor Mammedov wrote:
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offests magic from API user.
> > 
> > While at it switch to build_append_int_noprefix() to build
> > entries to other tables (which also removes some manual offset
> > calculations).
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> > ---
> > v3:
> >  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> > ---
> >  include/hw/acpi/acpi-defs.h | 10 ----------
> >  hw/acpi/aml-build.c         | 27 ++++++++++++---------------
> >  2 files changed, 12 insertions(+), 25 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index cf9f44299c..ccfa3382aa 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -149,16 +149,6 @@ struct AcpiSerialPortConsoleRedirection {
> >  typedef struct AcpiSerialPortConsoleRedirection
> >                 AcpiSerialPortConsoleRedirection;
> >  
> > -/*
> > - * ACPI 1.0 Root System Description Table (RSDT)  
> nit: you may move that comment to aml-build.c

yep, existing build_rsdt/build_xsdt are missing expected spec
reference comment. I'll post an additional patch to fix it.

> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

> 
> Eric
> > - */
> > -struct AcpiRsdtDescriptorRev1 {
> > -    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
> > -    uint32_t table_offset_entry[];  /* Array of pointers to other */
> > -    /* ACPI tables */
> > -} QEMU_PACKED;
> > -typedef struct AcpiRsdtDescriptorRev1 AcpiRsdtDescriptorRev1;
> > -
> >  /*
> >   * ACPI 2.0 eXtended System Description Table (XSDT)
> >   */
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 229a3eb654..32f14d4a78 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -1890,27 +1890,24 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> >             const char *oem_id, const char *oem_table_id)
> >  {
> >      int i;
> > -    unsigned rsdt_entries_offset;
> > -    AcpiRsdtDescriptorRev1 *rsdt;
> > -    int rsdt_start = table_data->len;
> > -    const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
> > -    const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
> > -    const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
> > -
> > -    rsdt = acpi_data_push(table_data, rsdt_len);
> > -    rsdt_entries_offset = (char *)rsdt->table_offset_entry - table_data->data;
> > +    AcpiTable table = { .sig = "RSDT", .rev = 1,
> > +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> > +
> > +    acpi_table_begin(&table, table_data);
> >      for (i = 0; i < table_offsets->len; ++i) {
> >          uint32_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
> > -        uint32_t rsdt_entry_offset = rsdt_entries_offset + rsdt_entry_size * i;
> > +        uint32_t rsdt_entry_offset = table.array->len;
> > +
> > +        /* reserve space for entry */
> > +        build_append_int_noprefix(table.array, 0, 4);
> >  
> > -        /* rsdt->table_offset_entry to be filled by Guest linker */
> > +        /* mark position of RSDT entry to be filled by Guest linker */
> >          bios_linker_loader_add_pointer(linker,
> > -            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, rsdt_entry_size,
> > +            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, 4,
> >              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
> > +
> >      }
> > -    build_header(linker, table_data,
> > -                 (void *)(table_data->data + rsdt_start),
> > -                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
> > +    acpi_table_end(linker, &table);
> >  }
> >  
> >  /* Build xsdt table */
> >   
> 


