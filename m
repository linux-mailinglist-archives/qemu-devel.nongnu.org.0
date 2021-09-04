Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C4400CD8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 21:58:57 +0200 (CEST)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMboW-0007zv-3u
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 15:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMbnh-0007K6-NM
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 15:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMbnd-0003Fk-EW
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 15:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630785479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=InjSmOBcekPKvx1doXW3Mu8Detiw2KUTDa6Y5JbEswo=;
 b=OT+qNccrR8hM51dkjPi6V73AQtZ+MTxCbcgJGxRWgsXDaYYm2sui7usSdBxDfoDrn7FMFf
 D5k0F8e8O/fsOeVdJhtAoEHHBDnszP/7TOyaoKRQ6scetQRf1LKhCeexrIWeW0JnXqCG/X
 hXR3Gl80BDxQ8wzRlSUKYdUobTM54j4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-SBPprqyTN8CxXpweXyS-jQ-1; Sat, 04 Sep 2021 15:57:58 -0400
X-MC-Unique: SBPprqyTN8CxXpweXyS-jQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402270a00b003c8adc4d40cso1254209edd.15
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 12:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=InjSmOBcekPKvx1doXW3Mu8Detiw2KUTDa6Y5JbEswo=;
 b=RFmYArzsEYCKA2FBmhp/2uMJF12IrvJgYZF7wQoDJItXHDfoyc5azBbZ0ExCLa0lCY
 /s2KIwT/iobf3FwGsk+945Dlay96gpkd8yAlv/iSteVXBQDdX+odUxztFzv2wDfCRx3S
 osMxAP2HGgBR3k/jP46Omx0jK5f7dJ8jo8uE8OwVh5ryFPUfU+/sNuAYoc6gkRV5GJzM
 2Vjh2NInYB0nVig2riix0ZQ5YcBUx5c/RNzJvJ3wV6Anlgyyb87jpfR/mGasX8jZGxWr
 euyPLRhlMkj7GwbA9MmXRugDi1nxT9yTOxkWLhlxsAdlZUwSPhobgTXp17bxqBsfzDLW
 X3HQ==
X-Gm-Message-State: AOAM533HGAoqPZac92zVW2dWDYkVlMUDPTgxCQgEKeWNtfW172rhqS8k
 /r37Yj+tcRJFWpRanHczIkfLWsDYSh+I2Wal/3OqOoOWB7/qigmtxalCHNYkCzI0oO0IzV95IlS
 0EBswdjWXWXnjfB8=
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr5575025ejb.139.1630785477169; 
 Sat, 04 Sep 2021 12:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxytignMoUaWNnYgLoOHwDOQJvshY6Cfsbm7+nzeChHB3YBQsHAS7bB8efLfi29c1bpcsLSQ==
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr5575012ejb.139.1630785476950; 
 Sat, 04 Sep 2021 12:57:56 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id cb22sm1833075edb.5.2021.09.04.12.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 12:57:56 -0700 (PDT)
Date: Sat, 4 Sep 2021 15:57:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 01/35] acpi: add helper routines to initialize ACPI
 tables
Message-ID: <20210904155529-mutt-send-email-mst@kernel.org>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-2-imammedo@redhat.com>
 <03839787-0664-afcb-28fb-e95830138815@redhat.com>
 <20210903091221.407cc17e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903091221.407cc17e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Eric Auger <eauger@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 09:12:21AM +0200, Igor Mammedov wrote:
> On Thu, 2 Sep 2021 14:56:00 +0200
> Eric Auger <eauger@redhat.com> wrote:
> 
> > Hi Igor,
> > 
> > On 7/8/21 5:45 PM, Igor Mammedov wrote:
> > > Patch introduces acpi_init_table()/acpi_table_composed() API
> > > that hides pointer/offset arithmetic from user as opposed
> > > to build_header(), to prevent errors caused by it [1].
> > > 
> > >  acpi_init_table():
> > >      initializes table header and keeps track of
> > >      table data/offsets
> > >  acpi_table_composed():
> > >      sets actual table length and tells bios loader
> > >      where table is for the later initialization on
> > >      guest side.  
> > might be worth to put those comments in the code as doc comments since
> > "_composed" terminology is not self-explanatory?
> 
> I'll add doc comments as suggested.
> A better idea how to name function is welcome as well?

Aren't these a pair? acpi_init_table is called before you
start composing it, acpi_table_composed after it's composed?

Then one of the classical pairs will work well, e.g.
acpi_table_begin / acpi_table_end or maybe
acpi_table_compose_begin / acpi_table_compose_end .


> 
> > > 1) commits
> > >    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
> > >    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  include/hw/acpi/aml-build.h | 14 +++++++++
> > >  hw/acpi/aml-build.c         | 58 +++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 72 insertions(+)
> > > 
> > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > index 471266d739..d590660bd2 100644
> > > --- a/include/hw/acpi/aml-build.h
> > > +++ b/include/hw/acpi/aml-build.h
> > > @@ -413,6 +413,20 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
> > >  Aml *aml_object_type(Aml *object);
> > >  
> > >  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> > > +
> > > +typedef struct AcpiTable {
> > > +    const char *sig;
> > > +    const uint8_t rev;
> > > +    const char *oem_id;
> > > +    const char *oem_table_id;
> > > +    /* private vars tracking table state */
> > > +    GArray *array;
> > > +    unsigned table_offset;
> > > +} AcpiTable;
> > > +
> > > +void acpi_init_table(AcpiTable *desc, GArray *array);
> > > +void acpi_table_composed(BIOSLinker *linker, AcpiTable *table);
> > > +
> > >  void
> > >  build_header(BIOSLinker *linker, GArray *table_data,
> > >               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index d5103e6d7b..c598010144 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
> > >      g_array_append_val(array, val);
> > >  }
> > >  
> > > +static void build_append_padded_str(GArray *array, const char *str,
> > > +                                    size_t maxlen, char pad)
> > > +{
> > > +    size_t i;
> > > +    size_t len = strlen(str);
> > > +
> > > +    g_assert(len <= maxlen);
> > > +    g_array_append_vals(array, str, len);
> > > +    for (i = maxlen - len; i > 0; i--) {
> > > +        g_array_append_val(array, pad);
> > > +    }
> > > +}
> > > +
> > >  static void build_append_array(GArray *array, GArray *val)
> > >  {
> > >      g_array_append_vals(array, val->data, val->len);
> > > @@ -1692,6 +1705,51 @@ Aml *aml_object_type(Aml *object)
> > >      return var;
> > >  }
> > >  
> > > +void acpi_init_table(AcpiTable *desc, GArray *array)
> > > +{
> > > +
> > > +    desc->array = array;
> > > +    desc->table_offset = array->len;
> > > +
> > > +    /*
> > > +     * ACPI spec 1.0b
> > > +     * 5.2.3 System Description Table Header
> > > +     */
> > > +    g_assert(strlen(desc->sig) == 4);
> > > +    g_array_append_vals(array, desc->sig, 4); /* Signature */  
> > build_append_padded_str?
> 
> it will do the job even if it's a bit of overkill,
> signature must be 4 characters long so there is nothing to pad here
> (at least till this day).
> Using padded variant may confuse reader in the future,
> so I'd prefer to keep this line as is.
> 
> 
> > > +    build_append_int_noprefix(array, 0, 4); /* Length */
> > > +    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> > > +    build_append_int_noprefix(array, 0, 1); /* Checksum */
> > > +    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> > > +    /* OEM Table ID */
> > > +    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> > > +    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> > > +    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> 
> here we potentially can reuse build_append_padded_str() if we
> remove padding in ACPI_BUILD_APPNAME8, but that should wait till
> refactoring is complete (to avoid breaking incremental refactoring)
> 
> > > +    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> > > +}
> > > +
> > > +void acpi_table_composed(BIOSLinker *linker, AcpiTable *desc)
> > > +{
> > > +    /*
> > > +     * ACPI spec 1.0b
> > > +     * 5.2.3 System Description Table Header
> > > +     * Table 5-2 DESCRIPTION_HEADER Fields
> > > +     */
> > > +    const unsigned checksum_offset = 9;
> > > +    uint32_t table_len = desc->array->len - desc->table_offset;
> > > +    uint32_t table_len_le = cpu_to_le32(table_len);
> > > +    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
> > > +
> > > +    /* patch "Length" field that has been reserved by acpi_init_table()
> > > +     * to the actual length, i.e. accumulated table length from
> > > +     * acpi_init_table() till acpi_table_composed()
> > > +     */
> > > +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);  
> > can't you use a garray/build_append function instead to be homogeneous
> > with the rest of the code?
> those are for inserting/adding _new_ values, and won't work here,
> here we are patching value in place, comment above was supposed
> to clarify that (I guess it wasn't sufficient),
> Care to suggest a better comment?
> 
> > > +
> > > +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> > > +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
> > > +}
> > > +
> > >  void
> > >  build_header(BIOSLinker *linker, GArray *table_data,
> > >               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> > >   
> > 
> > Thanks
> > 
> > Eric
> > 


