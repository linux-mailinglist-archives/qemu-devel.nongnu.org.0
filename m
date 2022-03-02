Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4B34C9FD7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 09:50:56 +0100 (CET)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPKhB-0004ms-3f
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 03:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPKe1-00041P-6P
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPKdx-0006ZF-5v
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646210851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y8Q0H03vew/OC7mX0QluxD1SIYTYVIEkrUe+7xZyhpM=;
 b=SF3LsC4gI/B3djGNCmmH2NByMU6nDUcQNGA4Y4sP9bwQqDSbOMsl7XbvQhYsAXgcl8ypdX
 wJQa3KGQO+lhCpUIUzPKoHSQeT+kxxee16hy+KjMaEwfuDp3U9fxinuHpZkfyrWIzPFSpJ
 cQHsd/R8FJ5bAI85aUAtaTSiSI2j8dw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-srgFkDo0MHiptefsKn2WOA-1; Wed, 02 Mar 2022 03:47:30 -0500
X-MC-Unique: srgFkDo0MHiptefsKn2WOA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o21-20020a05600c511500b003818c4b98b5so292835wms.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 00:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y8Q0H03vew/OC7mX0QluxD1SIYTYVIEkrUe+7xZyhpM=;
 b=AsFqh6bO7dtVjl6Nr7W3Q5+x8komD0SJvysXhxxXSjm6Ktq8cxoFcGloW2AnPBe8DQ
 k5hVQRhNH+zpyL931lSYLoExIx336CUylY4aspXCUawe7a9CZSS1pnq8H7x++dOsr7/u
 tR+MuiIEZI72WNS7zFTDWrWF8HGIEdCU+zn9LS+llKypRLjq382OSJTsc3pLZBBlEi/Y
 Fa7cjnefforKl3MEAtYLloFANuV7vEs6mwElZoqX5bF0f67GjkwaFQXnzdbTIucGZWSL
 IcDydXUnNWOXTmqtmIZ2f7BObCMtUvdJfZeNKLTShHYIG78mI9baQ2qvcAOkacl7q7vj
 8PUw==
X-Gm-Message-State: AOAM530uXw9ZYFvtSggwQjIfHlZ8dM7ZbkEYgZp1rZtFP4jjM6anrzgT
 PbeHuOk95YN449ozEwvvj7IltTzVnFFqAqerrVQM7NB5SlX7n7ShJFnlG/yzm1Ol5wEbTYsFOLA
 FOC+pT2P1hEQsGgI=
X-Received: by 2002:adf:f8c2:0:b0:1ed:9ede:98a1 with SMTP id
 f2-20020adff8c2000000b001ed9ede98a1mr21782092wrq.48.1646210849315; 
 Wed, 02 Mar 2022 00:47:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7+zvPPBGbkwhiZ28u4Qcwg4FWYWfaPlLvoRw7Qz82mQdVCr9+C8FaIzucJeJXQATjq6pDxg==
X-Received: by 2002:adf:f8c2:0:b0:1ed:9ede:98a1 with SMTP id
 f2-20020adff8c2000000b001ed9ede98a1mr21782076wrq.48.1646210849023; 
 Wed, 02 Mar 2022 00:47:29 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm5994975wmb.3.2022.03.02.00.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 00:47:27 -0800 (PST)
Date: Wed, 2 Mar 2022 03:47:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220302034341-mutt-send-email-mst@kernel.org>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <20220301061131-mutt-send-email-mst@kernel.org>
 <b6934751-f513-d9b9-ae2e-106a736b3f57@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6934751-f513-d9b9-ae2e-106a736b3f57@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, Igor Mammedov <imammedo@redhat.com>, shentey@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 09:11:09PM +0200, Liav Albani wrote:
> 
> On 3/1/22 13:19, Michael S. Tsirkin wrote:
> > On Tue, Mar 01, 2022 at 09:43:54AM +0100, Igor Mammedov wrote:
> > > On Mon, 28 Feb 2022 22:17:32 +0200
> > > Liav Albani <liavalb@gmail.com> wrote:
> > > 
> > > > This can allow the guest OS to determine more easily if i8042 controller
> > > > is present in the system or not, so it doesn't need to do probing of the
> > > > controller, but just initialize it immediately, before enumerating the
> > > > ACPI AML namespace.
> > > > 
> > > > This change only applies to the x86/q35 machine type, as it uses FACP
> > > > ACPI table with revision higher than 1, which should implement at least
> > > > ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> > > > flags register according to the ACPI 2.0 specification.
> > > > 
> > > > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > > > ---
> > > >   hw/acpi/aml-build.c         | 11 ++++++++++-
> > > >   hw/i386/acpi-build.c        |  9 +++++++++
> > > >   hw/i386/acpi-microvm.c      |  9 +++++++++
> > > commit message says it's q35 specific, so wy it touched microvm anc piix4?
> > > 
> This affect only q35 machine type for now, but what happens if the MicroVM
> ACPI FACP table is updated to use a revision that supports IA-PC boot flags?
> > > >   include/hw/acpi/acpi-defs.h |  1 +
> > > >   4 files changed, 29 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > > index 8966e16320..2085905b83 100644
> > > > --- a/hw/acpi/aml-build.c
> > > > +++ b/hw/acpi/aml-build.c
> > > > @@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > > >       build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> > > >       build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> > > >       build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> > > > -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> > > > +    /* IAPC_BOOT_ARCH */
> > > > +    /*
> > > > +     * This register is not defined in ACPI spec version 1.0, where the FACP
> > > > +     * revision == 1 also applies. Therefore, just ignore setting this register.
> > > > +     */
> > > > +    if (f->rev == 1) {
> > > > +        build_append_int_noprefix(tbl, 0, 2);
> > > > +    } else {
> > > > +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> > > > +    }
> > > >       build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> > > >       build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index ebd47aa26f..c72c7bb9bb 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -38,6 +38,7 @@
> > > >   #include "hw/nvram/fw_cfg.h"
> > > >   #include "hw/acpi/bios-linker-loader.h"
> > > >   #include "hw/isa/isa.h"
> > > > +#include "hw/input/i8042.h"
> > > >   #include "hw/block/fdc.h"
> > > >   #include "hw/acpi/memory_hotplug.h"
> > > >   #include "sysemu/tpm.h"
> > > > @@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
> > > >               .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> > > >           },
> > > >       };
> > > > +    /*
> > > > +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> > > > +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> > > > +     * (the earliest acpi revision that supports this).
> > >   /* APCI spec version 2.0, Table 5-10 */
> > > 
> > > is sufficient, the rest could be read from spec/
> > ACPI though, not APCI.
> It will be fixed in version 5.
> > The comment can be shorter and more clearer, but I feel quoting spec
> > and including table name is a good idea actually, but pls quote verbatim:
> > 
> > /* ACPI spec version 2.0, Table 5-10: Fixed ACPI Description Table Boot Architecture Flags */
> > /* Bit offset 1 -  port 60 and 64 based keyboard controller, usually implemented as an 8042 or equivalent micro-controller. */
> > 
> > > > +     */
> > > > +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> > > > +                            0x0002 : 0x0000;
> > and make it 0x1 << 1 - clearer that this is bit 1. Leading zeroes are
> > not helpful since compiler does not check there's a correct number of
> > these.
> It will be fixed in version 5.
> > > > +
> > > >       *data = fadt;
> > > >   }
> > > > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > > > index 68ca7e7fc2..4bc72b1672 100644
> > > > --- a/hw/i386/acpi-microvm.c
> > > > +++ b/hw/i386/acpi-microvm.c
> > > > @@ -31,6 +31,7 @@
> > > >   #include "hw/acpi/generic_event_device.h"
> > > >   #include "hw/acpi/utils.h"
> > > >   #include "hw/acpi/erst.h"
> > > > +#include "hw/input/i8042.h"
> > > >   #include "hw/i386/fw_cfg.h"
> > > >   #include "hw/i386/microvm.h"
> > > >   #include "hw/pci/pci.h"
> > > > @@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> > > >           .reset_val = ACPI_GED_RESET_VALUE,
> > > >       };
> > > > +    /*
> > > > +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> > > > +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> > > > +     * (the earliest acpi revision that supports this).
> > > > +     */
> > > > +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> > > > +                            0x0002 : 0x0000;
> > > > +
> > let's avoid code duplication pls.
> > 
> What do you suggest to do with this? Creating a separate function to do this
> for us so we can call it from both locations?

Sounds reasonable.

> > > >       table_offsets = g_array_new(false, true /* clear */,
> > > >                                           sizeof(uint32_t));
> > > >       bios_linker_loader_alloc(tables->linker,
> > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > index c97e8633ad..2b42e4192b 100644
> > > > --- a/include/hw/acpi/acpi-defs.h
> > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
> > > >       uint16_t plvl2_lat;        /* P_LVL2_LAT */
> > > >       uint16_t plvl3_lat;        /* P_LVL3_LAT */
> > > >       uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> > > > +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
> > > >       uint8_t minor_ver;         /* FADT Minor Version */
> > > >       /*


