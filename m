Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F04C888D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:52:22 +0100 (CET)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzB7-0008ON-JF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOyBT-00042a-OW
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOyBR-00018H-UT
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZBtVG+He+pAKQ1/ihZjMS1AEjgfPM1DvhfSKGjW6MA=;
 b=AlRbt6zU8PPtRrAN/gxF/FAS4E8RcUbOnqncfIjVdTcu3tUBQNPflyIAqas1oBwUd9odFz
 h0lbrfdbio3j6SsLE0zY0IzhsKMbDm/2fDxRU6vt+9b/D3LWxwwOLFJTo3laHyAgcaEbhI
 /pSRu7i0AdpA+svXr5gQppNdPsRuo4E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-rzJoSP0uM9agobsdZ0RHYg-1; Tue, 01 Mar 2022 03:48:35 -0500
X-MC-Unique: rzJoSP0uM9agobsdZ0RHYg-1
Received: by mail-ed1-f71.google.com with SMTP id
 o5-20020a50c905000000b00410effbf65dso7391159edh.17
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZBtVG+He+pAKQ1/ihZjMS1AEjgfPM1DvhfSKGjW6MA=;
 b=ewd5Yo+nd2XnbA3uyvaof4S3biZHhzKwHq8sA/iwRATyjQVdo0on8GpOtZkX98KTQv
 DOQC+dRea9YN5C5eBgl2HKOVBaw98Ne4kwSmGQQi8k7r0qCrBIYtte1bVNheJrOtnef2
 P4jzNrRUXhH2wn/xInY6Ir/MrN+UuKx6TDpoa+i3ReYj9CnhwjyiNN1xL/ICqmeZ7I42
 488fm2S8HXgeu0Yx8S9BrESBIgz7T7sb1Qns2/C8VqsndbggZK0hGINSZrjkpgJ5Bxa9
 pct3viCbqcZAGAFDDW/zqP6bkTE1s6tk7Q+HkjpU+hBDgvP7/6aKPSbQlCRJXr5tt7/x
 uv7g==
X-Gm-Message-State: AOAM532piSfCd+Apyy3UNt/a8BqhAMwVg7pSQ8Yer0rpSXoam1oyAcFF
 la3AmFcClG5Axlm8Sr/0jMcWvRcBr8M1IbyYqvs+T3u6462eU+gC6i3UZFo5yYqBUy09hPZ23OR
 lx9GCyNGHx4vxvos=
X-Received: by 2002:a17:906:3587:b0:6d1:5043:9c1 with SMTP id
 o7-20020a170906358700b006d1504309c1mr18194327ejb.673.1646124513840; 
 Tue, 01 Mar 2022 00:48:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgfI0TQ+WE1WQALNO4jbYA4i2h0EmwAT/BuWWBw+vufdUo0b53bRizNjGZ0KOExdT+a08kJQ==
X-Received: by 2002:a17:906:3587:b0:6d1:5043:9c1 with SMTP id
 o7-20020a170906358700b006d1504309c1mr18194314ejb.673.1646124513604; 
 Tue, 01 Mar 2022 00:48:33 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ho12-20020a1709070e8c00b006ce3f158e87sm5100331ejc.2.2022.03.01.00.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 00:48:33 -0800 (PST)
Date: Tue, 1 Mar 2022 09:48:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220301094832.59fe2772@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2203010826360.1505325@anisinha-lenovo>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2203010826360.1505325@anisinha-lenovo>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Cc: mst@redhat.com, shentey@gmail.com, Liav Albani <liavalb@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 08:29:05 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, 28 Feb 2022, Liav Albani wrote:
> 
> > This can allow the guest OS to determine more easily if i8042 controller
> > is present in the system or not, so it doesn't need to do probing of the
> > controller, but just initialize it immediately, before enumerating the
> > ACPI AML namespace.
> >
> > This change only applies to the x86/q35 machine type, as it uses FACP
> > ACPI table with revision higher than 1, which should implement at least
> > ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> > flags register according to the ACPI 2.0 specification.
> >
> > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > ---
> >  hw/acpi/aml-build.c         | 11 ++++++++++-
> >  hw/i386/acpi-build.c        |  9 +++++++++
> >  hw/i386/acpi-microvm.c      |  9 +++++++++
> >  include/hw/acpi/acpi-defs.h |  1 +
> >  4 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 8966e16320..2085905b83 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> >      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> >      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> > -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> > +    /* IAPC_BOOT_ARCH */
> > +    /*
> > +     * This register is not defined in ACPI spec version 1.0, where the FACP  
> 
> I'd say "this IAPC_BOOT_ARCH register" to be more specific.
> 
> > +     * revision == 1 also applies. Therefore, just ignore setting this register.
> > +     */

I'd drop this comment altogether, like it's done with the rest of the fields  in this function

> > +    if (f->rev == 1) {
> > +        build_append_int_noprefix(tbl, 0, 2);
> > +    } else {
maybe add here
/* Since ACPI 2.0 */

> > +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> > +    }
> >      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> >      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index ebd47aa26f..c72c7bb9bb 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -38,6 +38,7 @@
> >  #include "hw/nvram/fw_cfg.h"
> >  #include "hw/acpi/bios-linker-loader.h"
> >  #include "hw/isa/isa.h"
> > +#include "hw/input/i8042.h"
> >  #include "hw/block/fdc.h"
> >  #include "hw/acpi/memory_hotplug.h"
> >  #include "sysemu/tpm.h"
> > @@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
> >              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> >          },
> >      };
> > +    /*
> > +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence  
> 
> again typo here.
> 
> > +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> > +     * (the earliest acpi revision that supports this).
> > +     */
> > +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> > +                            0x0002 : 0x0000;  
> 
> I thought I said we need to make sure the logic still applied when there
> are more than one device of this type. Please fix this.
> 
> > +
> >      *data = fadt;
> >  }
> >
> > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> > index 68ca7e7fc2..4bc72b1672 100644
> > --- a/hw/i386/acpi-microvm.c
> > +++ b/hw/i386/acpi-microvm.c
> > @@ -31,6 +31,7 @@
> >  #include "hw/acpi/generic_event_device.h"
> >  #include "hw/acpi/utils.h"
> >  #include "hw/acpi/erst.h"
> > +#include "hw/input/i8042.h"
> >  #include "hw/i386/fw_cfg.h"
> >  #include "hw/i386/microvm.h"
> >  #include "hw/pci/pci.h"
> > @@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> >          .reset_val = ACPI_GED_RESET_VALUE,
> >      };
> >
> > +    /*
> > +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> > +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> > +     * (the earliest acpi revision that supports this).
> > +     */
> > +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> > +                            0x0002 : 0x0000;  
> 
> 
> Ditto.
> 
> > +
> >      table_offsets = g_array_new(false, true /* clear */,
> >                                          sizeof(uint32_t));
> >      bios_linker_loader_alloc(tables->linker,
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index c97e8633ad..2b42e4192b 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
> >      uint16_t plvl2_lat;        /* P_LVL2_LAT */
> >      uint16_t plvl3_lat;        /* P_LVL3_LAT */
> >      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> > +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
> >      uint8_t minor_ver;         /* FADT Minor Version */
> >
> >      /*
> > --
> > 2.35.1
> >
> >  
> 


