Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A94C8B8F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 13:28:22 +0100 (CET)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP1c5-00068E-Ey
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 07:28:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP1SQ-00060t-6Q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 07:18:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP1SL-0002yd-KG
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 07:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646137096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3TNIZ0TCKhtD835APHYFM5imkg8ZnWx7cE2qWamcHzo=;
 b=fTJwoq5ik5QK7qN1Jk9S9Yln1tt2bRQe9NxibZ8Ms43bRQJValqOFfdoVRox85wQoH4Iz1
 ighXbmr2gtl+NE5Jx6NX+9+MJtqxXPAvs9rDMlJmlIpTrcekLBM9yJxeem0WFThc+b2k0U
 4a60PpdMSbtzyQf4oic3/n/733NKeeo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-ibAECd_XOWGDfh8Z5YzpHQ-1; Tue, 01 Mar 2022 07:18:15 -0500
X-MC-Unique: ibAECd_XOWGDfh8Z5YzpHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so2249841wro.12
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 04:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3TNIZ0TCKhtD835APHYFM5imkg8ZnWx7cE2qWamcHzo=;
 b=E6HGBzTCR2D6bdkJoivV++fnIRfSDtNH0N3McrOpRthHjwA4BxDLckGh/ndrCRsGbV
 zZJupQsg+sKuvMwckbmAhPwxq0/fj7oZWmDGNvrdoyeccGFVcO7fEMNLzyvufJwmTA8E
 oKm/lkVjbwnplbsj1S1NewWi0CR0z6pqtw0Wm2WbRUc9yltVcvnkpNJv+n6iGLkQsf3+
 DrskPYTaSbFpRd2l48s0DiocbDmokE6p2a5EWjuagJ4Jh0nka5Ulo2UXy1BkC4nkfg4u
 A1VH0URw5OyByeLf688KSjArsD3zIn4PY6Oi+6BAexSrbO7NIVMpUlvwywAcdIMSNcxO
 V7bw==
X-Gm-Message-State: AOAM532ukPn89TMM7BFuWWi98UK4LDzB5uBu18A7yA8UyGo/17aIoMCd
 WvNylqS3+L5c3GGXW4JIOfpKbKhpx7MiuPI6pxZQj12Ox93/f15OUKoMukLgSLXZpEy6AD/7GGg
 N6DfU+rsy64O4uCg=
X-Received: by 2002:adf:90ca:0:b0:1ea:99dd:db45 with SMTP id
 i68-20020adf90ca000000b001ea99dddb45mr19264189wri.262.1646137093686; 
 Tue, 01 Mar 2022 04:18:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXAiGod4yPWhuyadlXw8yvT4DQm11/pvlI9uPrI/saf4IT6yAjThA2iCCZgG3XbYayD858hA==
X-Received: by 2002:adf:90ca:0:b0:1ea:99dd:db45 with SMTP id
 i68-20020adf90ca000000b001ea99dddb45mr19264166wri.262.1646137093319; 
 Tue, 01 Mar 2022 04:18:13 -0800 (PST)
Received: from redhat.com ([2.53.2.184]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm2697947wmb.48.2022.03.01.04.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 04:18:12 -0800 (PST)
Date: Tue, 1 Mar 2022 07:18:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220301071112-mutt-send-email-mst@kernel.org>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <20220301061131-mutt-send-email-mst@kernel.org>
 <20220301124757.61525849@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301124757.61525849@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: ani@anisinha.ca, shentey@gmail.com, Liav Albani <liavalb@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 12:47:57PM +0100, Igor Mammedov wrote:
> On Tue, 1 Mar 2022 06:19:51 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
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
> > > >  hw/acpi/aml-build.c         | 11 ++++++++++-
> > > >  hw/i386/acpi-build.c        |  9 +++++++++
> > > >  hw/i386/acpi-microvm.c      |  9 +++++++++  
> > > commit message says it's q35 specific, so wy it touched microvm anc piix4?
> > >   
> > > >  include/hw/acpi/acpi-defs.h |  1 +
> > > >  4 files changed, 29 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > > index 8966e16320..2085905b83 100644
> > > > --- a/hw/acpi/aml-build.c
> > > > +++ b/hw/acpi/aml-build.c
> > > > @@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > > >      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> > > >      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> > > >      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
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
> > > >      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> > > >      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> > > >  
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index ebd47aa26f..c72c7bb9bb 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -38,6 +38,7 @@
> > > >  #include "hw/nvram/fw_cfg.h"
> > > >  #include "hw/acpi/bios-linker-loader.h"
> > > >  #include "hw/isa/isa.h"
> > > > +#include "hw/input/i8042.h"
> > > >  #include "hw/block/fdc.h"
> > > >  #include "hw/acpi/memory_hotplug.h"
> > > >  #include "sysemu/tpm.h"
> > > > @@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
> > > >              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> > > >          },
> > > >      };
> > > > +    /*
> > > > +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> > > > +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> > > > +     * (the earliest acpi revision that supports this).  
> > > 
> > >  /* APCI spec version 2.0, Table 5-10 */
> > > 
> > > is sufficient, the rest could be read from spec/  
> > 
> > ACPI though, not APCI.
> > The comment can be shorter and more clearer,
> 
> > but I feel quoting spec
> > and including table name is a good idea actually, but pls quote verbatim:
> I don't do that  and don't ask it from others.
> 
> The reason being that pointing where to look in spec and having
> verbatim copy of field name is sufficient
> for looking it up and
> QEMU does not endup with half of spec copied in (+unintentional mistakes).
> (As reviewer I will check if whatever written in patch actually matches
> spec anyways)
> 
> That's why I typically use
>   'spec ver, verbatim field name[, chapter/table name]'
> policy. The later optional part is usually used for pointing
> to values description.


Ok but here the field name was not listed verbatim, and table name
is missing. It is actually 8042 and table name is Fixed ACPI Description
Table Boot Architecture Flags.


>  
> > /* ACPI spec version 2.0, Table 5-10: Fixed ACPI Description Table Boot Architecture Flags */
> > /* Bit offset 1 -  port 60 and 64 based keyboard controller, usually implemented as an 8042 or equivalent micro-controller. */
> > 
> > >   
> > > > +     */
> > > > +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> > > > +                            0x0002 : 0x0000;  
> > 
> > and make it 0x1 << 1 - clearer that this is bit 1. Leading zeroes are
> > not helpful since compiler does not check there's a correct number of
> > these.
> > 
> > > > +
> > > >      *data = fadt;
> > > >  }
> > > >  
> > > > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > > > index 68ca7e7fc2..4bc72b1672 100644
> > > > --- a/hw/i386/acpi-microvm.c
> > > > +++ b/hw/i386/acpi-microvm.c
> > > > @@ -31,6 +31,7 @@
> > > >  #include "hw/acpi/generic_event_device.h"
> > > >  #include "hw/acpi/utils.h"
> > > >  #include "hw/acpi/erst.h"
> > > > +#include "hw/input/i8042.h"
> > > >  #include "hw/i386/fw_cfg.h"
> > > >  #include "hw/i386/microvm.h"
> > > >  #include "hw/pci/pci.h"
> > > > @@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> > > >          .reset_val = ACPI_GED_RESET_VALUE,
> > > >      };
> > > >  
> > > > +    /*
> > > > +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> > > > +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> > > > +     * (the earliest acpi revision that supports this).
> > > > +     */
> > > > +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> > > > +                            0x0002 : 0x0000;
> > > > +  
> > 
> > let's avoid code duplication pls.
> > 
> > > >      table_offsets = g_array_new(false, true /* clear */,
> > > >                                          sizeof(uint32_t));
> > > >      bios_linker_loader_alloc(tables->linker,
> > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > index c97e8633ad..2b42e4192b 100644
> > > > --- a/include/hw/acpi/acpi-defs.h
> > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
> > > >      uint16_t plvl2_lat;        /* P_LVL2_LAT */
> > > >      uint16_t plvl3_lat;        /* P_LVL3_LAT */
> > > >      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> > > > +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
> > > >      uint8_t minor_ver;         /* FADT Minor Version */
> > > >  
> > > >      /*  
> > 


