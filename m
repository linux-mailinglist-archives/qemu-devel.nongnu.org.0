Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7F4CFF10
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:46:29 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCku-000172-9V
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:46:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nRBHk-0001P8-Ay
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nRBHg-00059d-R0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646651530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ce0kmEHgFFjq4O6qpgdioM/TjgIMI1cZRRCikfrYu4=;
 b=d3HMT01sNhQMAXuLhKSrfZNW0Pi+b2DbidgF4wrezmoVkLdOtPclUtEddbghLNzr1CH2ok
 53+JtmDxhONOmiwveGtjUj39ZywX3WYFpxIHf8lA2edeL3jGK80ogFJ44E8xqOI2HSVSS3
 J4NLwrB74RZFAlIU/dbSv0toYuGHVgA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-wcerX_XJObGP-9J9VxmtDA-1; Mon, 07 Mar 2022 06:12:09 -0500
X-MC-Unique: wcerX_XJObGP-9J9VxmtDA-1
Received: by mail-ed1-f72.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so2040107edq.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ce0kmEHgFFjq4O6qpgdioM/TjgIMI1cZRRCikfrYu4=;
 b=dDFVpIcgmNTkd535Lqp60PRov93NVS70cete4uo28eG3QoqOsoCm+vJmMPBuSJPwbr
 LNH3eTujjOSg2EkOyvexhn+y3oHgw36X5zwHM+h+93gCLVaQEAZ6+mdMx6Kmv7HOuwfW
 6GM5xkXxjfzBTattHALSBhLWcbjFFX5OyGOah1NLDaDtsI+9Ew7lkp+JolS6EytXtkML
 BIsTEG7piUfyZ/i7/AjrRvVE+sQZd8i7O8kSukxSdtnz5VLHIloiyJeAjc4joz1Wx2s8
 MlNuOtNasIWgGftMp50eW3E+frEW6YRLmhFXOuLdkSQM6nSJrVKvWvwhvoPn/oeyyzre
 gEhw==
X-Gm-Message-State: AOAM532ApmbVhp4DTyH19MgSpMH0BumUwq2iriOyvjS/f+pnvVXyi6O3
 c8k8BnmlDJx8e1zRAelDF1OOoYdMlbDEYfvM7cf8sMNQAGgn+03njMogmqfgQ9+jnSDhcLBi2fu
 2xL8JgEGm+HBy89s=
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr3264563ejb.737.1646651528374; 
 Mon, 07 Mar 2022 03:12:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVhpZ0bo0Csz9krZmzJtq5Yhoa3jML+7fOtx5MZQ/DvP8xm7tDcgWGModLAvTbq52/02oj/Q==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr3264540ejb.737.1646651528091; 
 Mon, 07 Mar 2022 03:12:08 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a1709061e4400b006db370920bbsm501503ejj.90.2022.03.07.03.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 03:12:07 -0800 (PST)
Date: Mon, 7 Mar 2022 12:12:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v7 2/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220307121205.0ca8adde@redhat.com>
In-Reply-To: <CAARzgwzvXL0D-7c+dWbHCiVcCBv47Jkf9zSAt-LURzgX2DFDAw@mail.gmail.com>
References: <20220304154032.2071585-1-ani@anisinha.ca>
 <20220304154032.2071585-3-ani@anisinha.ca>
 <20220306053131-mutt-send-email-mst@kernel.org>
 <CAARzgwzvXL0D-7c+dWbHCiVcCBv47Jkf9zSAt-LURzgX2DFDAw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 liavalb@gmail.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 19:56:04 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Sun, Mar 6, 2022 at 4:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Mar 04, 2022 at 09:10:30PM +0530, Ani Sinha wrote:  
> > > From: Liav Albani <liavalb@gmail.com>
> > >
> > > This can allow the guest OS to determine more easily if i8042 controller
> > > is present in the system or not, so it doesn't need to do probing of the
> > > controller, but just initialize it immediately, before enumerating the
> > > ACPI AML namespace.
> > >
> > > The 8042 bit in IAPC_BOOT_ARCH was introduced from ACPI spec v2 (FADT
> > > revision 2 and above). Therefore, in this change, we only enable this bit for
> > > x86/q35 machine types since x86/i440fx machines use FADT ACPI table with
> > > revision 1.
> > >
> > > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  hw/acpi/aml-build.c         |  8 +++++++-
> > >  hw/i386/acpi-build.c        |  8 ++++++++
> > >  include/hw/acpi/acpi-defs.h |  1 +
> > >  include/hw/input/i8042.h    | 15 +++++++++++++++
> > >  4 files changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index 8966e16320..1773cf55f1 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -2152,7 +2152,13 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > >      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> > >      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> > >      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> > > -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> > > +    /* IAPC_BOOT_ARCH */
> > > +    if (f->rev == 1) {
> > > +        build_append_int_noprefix(tbl, 0, 2);
> > > +    } else {
> > > +        /* since ACPI v2.0 */
> > > +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> > > +    }
> > >      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> > >      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index ebd47aa26f..4ad4d7286c 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -38,6 +38,7 @@
> > >  #include "hw/nvram/fw_cfg.h"
> > >  #include "hw/acpi/bios-linker-loader.h"
> > >  #include "hw/isa/isa.h"
> > > +#include "hw/input/i8042.h"
> > >  #include "hw/block/fdc.h"
> > >  #include "hw/acpi/memory_hotplug.h"
> > >  #include "sysemu/tpm.h"
> > > @@ -192,6 +193,13 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
> > >              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> > >          },
> > >      };
> > > +
> > > +    /*
> > > +     * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> > > +     * Flags, bit offset 1 - 8042.
> > > +     */  
> >
> > I think we should drop this comment (and one for microvm).
> > If you like, add
> >
> > /*
> > Table 5-8 Fixed ACPI Description Table (FADT) Format
> > IAPC_BOOT_ARCH
> > */
> >
> > instead.

I'd keep spec version though,
 all chapter/table numbering is version depended. 

> >
> >
> > Let's do that with a patch on top, we have a soft freeze to consider.  
> 
> Sure.
> 
> >  
> > > +    fadt.iapc_boot_arch = iapc_boot_arch_8042();
> > > +
> > >      *data = fadt;
> > >  }
> > >
> > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > index c97e8633ad..2b42e4192b 100644
> > > --- a/include/hw/acpi/acpi-defs.h
> > > +++ b/include/hw/acpi/acpi-defs.h
> > > @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
> > >      uint16_t plvl2_lat;        /* P_LVL2_LAT */
> > >      uint16_t plvl3_lat;        /* P_LVL3_LAT */
> > >      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> > > +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
> > >      uint8_t minor_ver;         /* FADT Minor Version */
> > >
> > >      /*
> > > diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> > > index 1d90432dae..e070f546e4 100644
> > > --- a/include/hw/input/i8042.h
> > > +++ b/include/hw/input/i8042.h
> > > @@ -23,4 +23,19 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
> > >  void i8042_isa_mouse_fake_event(ISAKBDState *isa);
> > >  void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
> > >
> > > +static inline bool i8042_present(void)
> > > +{
> > > +    bool amb = false;
> > > +    return object_resolve_path_type("", TYPE_I8042, &amb) || amb;
> > > +}
> > > +
> > > +/*
> > > + * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> > > + * Flags, bit offset 1 - 8042.
> > > + */
> > > +static inline uint16_t iapc_boot_arch_8042(void)
> > > +{
> > > +    return i8042_present() ? 0x1 << 1 : 0x0 ;
> > > +}
> > > +
> > >  #endif /* HW_INPUT_I8042_H */
> > > --
> > > 2.25.1  
> >  
> 


