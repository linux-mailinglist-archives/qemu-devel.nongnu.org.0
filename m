Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089632B64B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:45:45 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHO4e-0001gK-9J
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHO33-0000w7-Td
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHO31-0008Em-HV
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614764642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eq4g+R5KwGDn8jG4TdZ7x6oFSn4oCjVCZTeRi8cnSF0=;
 b=guNSrgs1Mt/0+TMXPNzGG+XTdExVnpsHyRe9jatFqp992WjDy5C7OVfYp2QS/TrTUUypZP
 OK7oeXFL2h9/6jUhpj3in6RyLrb2QKW56kUyohSeI7Tyaugyzc5sGTyAVvKkK2MkbKpT1f
 O5g0jrDB1CZqZwmzOGCyNq40FewAv9k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-EqabWK6PMtKLGQTIRmLZAQ-1; Wed, 03 Mar 2021 04:44:01 -0500
X-MC-Unique: EqabWK6PMtKLGQTIRmLZAQ-1
Received: by mail-ed1-f69.google.com with SMTP id v27so4872945edx.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Eq4g+R5KwGDn8jG4TdZ7x6oFSn4oCjVCZTeRi8cnSF0=;
 b=M9sLPnnDjGxJlZL/0Vy4IQzzAazGc0CNtQCr2EQ43xzK2+v2QLYyobItEZ1WZ270HO
 6w/8cFDAYB1c1FIPu9vrKAdUGnHzeMhZ7bDfljHKxOftihcxz3+3lrFU9c/OZA8Pe/Yh
 EpE5bz9zwKr5mav8QzyuzfoT5A8DBivolPn4LXJQxRb8E5eqo6AbvbWia64TmI9mm7DG
 g9/ARlUxCSwxvmqgVRLax6lNhwiG3vJgFf47gguUWoYy0O8mL673m+sM16SSXmFuM73l
 tbKic2AkyflQJQpcHWWoGLDnzDmLdaronGVQOjrI1zfrgJIoCgCldeZy/tFuOy9P45iD
 4glw==
X-Gm-Message-State: AOAM532gtLswVRhse7v7Hb5DT7VcmmJNkm/bbDRkB7jkw1N2k+ozVU7n
 jRjjbucMLRm+aiQLAK59X9dLXmFtJZ5R45Cr5G10pLX8bCx8grFLLHoWB7Tvtk3OqtsQTi7XvQA
 d5bW84oPqaJBoeJ8=
X-Received: by 2002:a17:906:4442:: with SMTP id
 i2mr25366762ejp.41.1614764637841; 
 Wed, 03 Mar 2021 01:43:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOfZVqgtLMg5VWCKkEpmaaO1w5BP5mdQpymhXYrh2/AAHm6MVSwlyR33gya4XSIgLbqLN0Eg==
X-Received: by 2002:a17:906:4442:: with SMTP id
 i2mr25366732ejp.41.1614764637570; 
 Wed, 03 Mar 2021 01:43:57 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id k26sm5711957ejk.29.2021.03.03.01.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 01:43:56 -0800 (PST)
Date: Wed, 3 Mar 2021 04:43:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210303044336-mutt-send-email-mst@kernel.org>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 07:43:40PM +0100, David Hildenbrand wrote:
> > > > The resizeable memory region that is created for the cmd blob has a maximum
> > > > size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
> > 
> > The expression "ACPI_BUILD_ALIGN_SIZE - 4k" makes no sense to me.
> > ACPI_BUILD_ALIGN_SIZE is #defined in "hw/i386/acpi-build.c" as 0x1000,
> > so the difference (ACPI_BUILD_ALIGN_SIZE - 4k) is zero.
> > 
> > (1) Did you mean "ACPI_BUILD_ALIGN_SIZE -- 4k"? IOW, did you mean to
> > quote the value of the macro?
> > 
> > If you mean an em dash, then please use an em dash, not a hyphen (or
> > please use parens).
> 
> Yes, or rather use ACPI_BUILD_ALIGN_SIZE (4k).
> 
> > 
> > 
> > > > as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
> > > > we require more than 4k and can crash QEMU when trying to resize the
> > > > resizeable memory region beyond its maximum size:
> > > >    $ build/qemu-system-x86_64 --enable-kvm \
> > > >        -machine q35,nvdimm=on \
> > > >        -smp 1 \
> > > >        -cpu host \
> > > >        -m size=2G,slots=8,maxmem=4G \
> > > >        -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
> > > >        -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
> > > >        -nodefaults \
> > > >        -device vmgenid \
> > > >        -device intel-iommu
> > > > 
> > > > Results in:
> > > >    Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
> > > >    qemu-system-x86_64: Size too large: /rom@etc/table-loader:
> > > >      0x2000 > 0x1000: Invalid argument
> > > > 
> > > > We try growing the resizeable memory region (resizeable RAMBlock) beyond
> > > > its maximum size. Let's increase the maximum size from 4k to 64k, which
> > > > should be good enough for the near future.
> > 
> > The existent code calls acpi_align_size(), for resizing the ACPI blobs
> > (the GArray objects).
> > 
> > (Unfortunately, the acpi_align_size() function is duplicated between
> > "hw/i386/acpi-build.c" and "hw/arm/virt-acpi-build.c", which seems
> > unjustified -- but anyway, I digress.)
> > 
> > This seems to come from commit 868270f23d8d ("acpi-build: tweak acpi
> > migration limits", 2014-07-29) and commit 451b157041d2 ("acpi: Align the
> > size to 128k", 2020-12-08).
> > 
> > (2) Why is the logic added in those commits insufficient?
> 
> We are dealing with different blobs here (tables_blob vs. cmd_blob).
> 
> > 
> > What is the exact call tree that triggers the above error?
> 
> [...]
> 
> acpi_build_update()->acpi_build_update()->memory_region_ram_resize()->qemu_ram_resize()
> 
> A longer calltrace can be found in https://bugzilla.redhat.com/show_bug.cgi?id=1927159.
> 
> > > > +++ b/hw/i386/acpi-microvm.c
> > > > @@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
> > > >                         ACPI_BUILD_TABLE_MAX_SIZE);
> > > >       acpi_add_rom_blob(acpi_build_no_update, NULL,
> > > >                         tables.linker->cmd_blob,
> > > > -                      "etc/table-loader", 0);
> > > > +                      ACPI_BUILD_LOADER_FILE,
> > > > +                      ACPI_BUILD_LOADER_MAX_SIZE);
> > > >       acpi_add_rom_blob(acpi_build_no_update, NULL,
> > > >                         tables.rsdp,
> > > >                         ACPI_BUILD_RSDP_FILE, 0);
> > 
> > (3) Why are we using a different "tool" here, from the previous
> > approach? We're no longer setting the GArray sizes; instead, we make the
> > "rom->romsize" fields diverge from -- put differently, grow beyond --
> > "rom->datasize". Why is that useful? What are the consequences?
> 
> See ACPI_BUILD_TABLE_MAX_SIZE handling just in the acpi_add_rom_blob() above.
> 
> > 
> > Where is it ensured that data between "rom->datasize" and "rom->romsize"
> > reads as zeroes?
> We only expose the current memory_region_size() to our guest, which is
> always multiples of 4k pages.
> 
> rom->datasize and rom->romsize will be multiple of 4k AFAIKs.
> 
> acpi_align_size()-> g_array_set_size() will take care of zeroing out
> any unused parts within a single 4k page.
> 
> So all unused, guest-visible part should always be 0 I think.
> 
> > 
> > 
> > > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > > index 380d3e3924..93cdfd4006 100644
> > > > --- a/include/hw/acpi/aml-build.h
> > > > +++ b/include/hw/acpi/aml-build.h
> > > > @@ -6,6 +6,7 @@
> > > > 
> > > >   /* Reserve RAM space for tables: add another order of magnitude. */
> > > >   #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
> > > > +#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
> > > > 
> > > >   #define ACPI_BUILD_APPNAME6 "BOCHS "
> > > >   #define ACPI_BUILD_APPNAME8 "BXPC    "
> > > 
> > 
> > The commit message says "Let's increase the maximum size from 4k to
> > 64k", and I have two problems with that:
> > 
> > (4a) I have no idea where the current "4k" size comes from. (In case the
> > 4k refers to ACPI_BUILD_ALIGN_SIZE, then why are we not changing that
> > macro?)
> 
> Changing ACPI_BUILD_ALIGN_SIZE would affect the legacy_table_size in
> acpi_build() - so that can't be right.
> 
> What would also work is something like (to be improved)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 45ad2f9533..49cfedddc8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -81,6 +81,8 @@
>  #define ACPI_BUILD_LEGACY_CPU_AML_SIZE    97
>  #define ACPI_BUILD_ALIGN_SIZE             0x1000
> +#define ACPI_BUILD_LOADER_ALIGN_SIZE      0x2000
> +
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  /* #define DEBUG_ACPI_BUILD */
> @@ -2613,10 +2615,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              error_printf("Try removing CPUs, NUMA nodes, memory slots"
>                           " or PCI bridges.");
>          }
> -        acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
> +        acpi_align_size(tables_blob, ACPI_BUILD_ALIGN_SIZE);
>      }
> -    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
> +    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_LOADER_ALIGN_SIZE);
> 
> 
> At least for hw/i386/acpi-build.c.
> 
> We will end up creating the resizeable memory region/RAMBlock always with
> a size=maximum_size=8k. (could also go for 64k here)
> 
> The only downside is that we might expose a bigger area to the
> guest than necessary (e.g., 8k instead of 4k) and will e.g., migrate
> 8k instead of 4k (not that we care).
> 
> 
> On incoming migration from older QEMU versions, we should be able to just
> shrink back from 8k to 4k - so migration from older QEMY versions should
> continue working just fine.

what about migration to old qemu?

> > 
> > (4b) The new macro ACPI_BUILD_LOADER_MAX_SIZE does not express 64KB,
> > contrary to the commit message: it expresses 256KB.
> 
> Indeed, thanks for noticing that - not that it wouldn't really
> affect your testing in case the maximum size is bigger than necessary ;)
> 
> > 
> > ... The code is really difficult to understand; consider the following
> > macros:
> 
> Yes, it is.
> 
> Thanks!
> 
> -- 
> Thanks,
> 
> David / dhildenb


