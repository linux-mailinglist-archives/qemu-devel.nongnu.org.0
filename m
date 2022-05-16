Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1C529155
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:47:42 +0200 (CEST)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhcz-0001q6-2O
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhc2-00018s-4Q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhby-0005g5-Ri
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652733997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkovYDCUtIUV/nYTGN1Kmi/WoN6lXPEXP/iwOd0Dh7Y=;
 b=DOXPw7X5jo4AZlnqrkD2LKO4+PBTvmX7+XgGfTDL9Udhw4gULgMQsTPASrJHVp7JkpWOOL
 GFkfKY2mED11CjPbhYddeF3wehrbNxzTcqS33oHLTZp7L/Gt21S8DCstedjQFlY+ulDevl
 p8StcFNVshzJuODW9+Ee01ZrsMdHT3o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-ocmDntzHNAq27RREpnbH-g-1; Mon, 16 May 2022 16:46:35 -0400
X-MC-Unique: ocmDntzHNAq27RREpnbH-g-1
Received: by mail-ej1-f71.google.com with SMTP id
 re25-20020a170906d8d900b006f50701fbefso6345683ejb.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qkovYDCUtIUV/nYTGN1Kmi/WoN6lXPEXP/iwOd0Dh7Y=;
 b=dN36olTX1LhTzqojXdr3gBW6k8f/PaPbyV+CtPFc6GkV66iKmwj2ZzZTdmf/rNIp63
 XFjFuU6qc60/V8mf36lXH4rLJDY6uytYDRo/bYRLQAe4rP4zv6i3/EIPqMb0RjDhE/8Y
 AOmUT3PcqKGDxwpZ9XpuyhGGRqTX3e9y7iFyblXDvt5qp3UyWj1mXqh3JJkWm7RGAsW5
 GC++Ak526idQimvzLx/SthRydutozKqJhauxPVzLa4XeuLe8MyC49mPI30BAm+3BboXh
 sXtGRsUCcRBks7a/DlB49d1oZjYf916TjzghUog6JYYnxKwCAxJ+yyrHbMtRlTkClY46
 KSsw==
X-Gm-Message-State: AOAM5322XwICH11cfg9KfuD17z+Po/Y28tvi1R2ytM0hQq7O+8DPAWtv
 ZIV+YRNsQvVfm0PMcxt1hIotOsVXHY1gTW6wOxupwIzq5Z5MiYdpFCYFr8Ia92QId4+W/A5BgeF
 NJS/YG09SyhKYGQw=
X-Received: by 2002:a17:907:7d93:b0:6fe:21d9:4230 with SMTP id
 oz19-20020a1709077d9300b006fe21d94230mr10061901ejc.42.1652733994446; 
 Mon, 16 May 2022 13:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPcUQkOLbVo4jTIh+GduEBymmwhOccJSIWtLlJPNJsbC89QTUBbBJSSyrDEWNvAsMtf9yUWg==
X-Received: by 2002:a17:907:7d93:b0:6fe:21d9:4230 with SMTP id
 oz19-20020a1709077d9300b006fe21d94230mr10061877ejc.42.1652733994161; 
 Mon, 16 May 2022 13:46:34 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 hz19-20020a1709072cf300b006f3ef214e1bsm154907ejc.129.2022.05.16.13.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:46:33 -0700 (PDT)
Date: Mon, 16 May 2022 16:46:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 28/35] acpi: pvpanic-isa: use
 AcpiDevAmlIfClass:build_dev_aml to provide device's AML
Message-ID: <20220516163547-mutt-send-email-mst@kernel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-29-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516152610.1963435-29-imammedo@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 11:26:03AM -0400, Igor Mammedov wrote:
> .. and clean up not longer needed conditionals in DSTD build code
> pvpanic-isa AML will be fetched and included when ISA bridge will
> build its own AML code (including attached devices).
> 
> Expected AML change:
>    the device under separate _SB.PCI0.ISA scope is moved directly
>    under Device(ISA) node.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/misc/pvpanic.h |  9 ---------
>  hw/i386/acpi-build.c      | 37 ----------------------------------
>  hw/misc/pvpanic-isa.c     | 42 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 46 deletions(-)
> 
> diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
> index 7f16cc9b16..e520566ab0 100644
> --- a/include/hw/misc/pvpanic.h
> +++ b/include/hw/misc/pvpanic.h
> @@ -33,13 +33,4 @@ struct PVPanicState {
>  
>  void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size);
>  
> -static inline uint16_t pvpanic_port(void)
> -{
> -    Object *o = object_resolve_path_type("", TYPE_PVPANIC_ISA_DEVICE, NULL);
> -    if (!o) {
> -        return 0;
> -    }
> -    return object_property_get_uint(o, PVPANIC_IOPORT_PROP, NULL);
> -}
> -
>  #endif
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 517818cd9f..a42f41f373 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -30,7 +30,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/core/cpu.h"
>  #include "target/i386/cpu.h"
> -#include "hw/misc/pvpanic.h"
>  #include "hw/timer/hpet.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> @@ -117,7 +116,6 @@ typedef struct AcpiMiscInfo {
>  #endif
>      const unsigned char *dsdt_code;
>      unsigned dsdt_size;
> -    uint16_t pvpanic_port;
>  } AcpiMiscInfo;
>  
>  typedef struct AcpiBuildPciBusHotplugState {
> @@ -302,7 +300,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>  #ifdef CONFIG_TPM
>      info->tpm_version = tpm_get_version(tpm_find());
>  #endif
> -    info->pvpanic_port = pvpanic_port();
>  }
>  
>  /*
> @@ -1749,40 +1746,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dsdt, scope);
>      }
>  
> -    if (misc->pvpanic_port) {
> -        scope = aml_scope("\\_SB.PCI0.ISA");
> -
> -        dev = aml_device("PEVT");
> -        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> -
> -        crs = aml_resource_template();
> -        aml_append(crs,
> -            aml_io(AML_DECODE16, misc->pvpanic_port, misc->pvpanic_port, 1, 1)
> -        );
> -        aml_append(dev, aml_name_decl("_CRS", crs));
> -
> -        aml_append(dev, aml_operation_region("PEOR", AML_SYSTEM_IO,
> -                                              aml_int(misc->pvpanic_port), 1));
> -        field = aml_field("PEOR", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
> -        aml_append(field, aml_named_field("PEPT", 8));
> -        aml_append(dev, field);
> -
> -        /* device present, functioning, decoding, shown in UI */
> -        aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> -
> -        method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
> -        aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
> -        aml_append(method, aml_return(aml_local(0)));
> -        aml_append(dev, method);
> -
> -        method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
> -        aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
> -        aml_append(dev, method);
> -
> -        aml_append(scope, dev);
> -        aml_append(dsdt, scope);
> -    }
> -
>      sb_scope = aml_scope("\\_SB");
>      {
>          Object *pci_host;
> diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
> index b84d4d458d..ccec50f61b 100644
> --- a/hw/misc/pvpanic-isa.c
> +++ b/hw/misc/pvpanic-isa.c
> @@ -22,6 +22,7 @@
>  #include "qom/object.h"
>  #include "hw/isa/isa.h"
>  #include "standard-headers/linux/pvpanic.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>  
>  OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
>  
> @@ -63,6 +64,41 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
>      isa_register_ioport(d, &ps->mr, s->ioport);
>  }
>  
> +static void build_pvpanic_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +    Aml *crs, *field, *method;
> +    PVPanicISAState *s = PVPANIC_ISA_DEVICE(adev);
> +    Aml *dev = aml_device("PEVT");
> +
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> +
> +    crs = aml_resource_template();
> +    aml_append(crs,
> +        aml_io(AML_DECODE16, s->ioport, s->ioport, 1, 1)
> +    );
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    aml_append(dev, aml_operation_region("PEOR", AML_SYSTEM_IO,
> +                                          aml_int(s->ioport), 1));
> +    field = aml_field("PEOR", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
> +    aml_append(field, aml_named_field("PEPT", 8));
> +    aml_append(dev, field);
> +
> +    /* device present, functioning, decoding, shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> +
> +    method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
> +    aml_append(method, aml_return(aml_local(0)));
> +    aml_append(dev, method);
> +
> +    method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
> +    aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
> +    aml_append(dev, method);
> +
> +    aml_append(scope, dev);
> +}
> +
>  static Property pvpanic_isa_properties[] = {
>      DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
>      DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
> @@ -73,10 +109,12 @@ static Property pvpanic_isa_properties[] = {
>  static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
>  
>      dc->realize = pvpanic_isa_realizefn;
>      device_class_set_props(dc, pvpanic_isa_properties);
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    adevc->build_dev_aml = build_pvpanic_isa_aml;
>  }
>  
>  static const TypeInfo pvpanic_isa_info = {


So this really makes the device depend on ACPI.
What if the device is also built for a platform without ACPI?
Looks like it will fail to build.

E.g. mips has ISA too. What if one was to add pvpanic there?

I am not sure how important this is at the moment, but
I think the APIs should support this cleanly.

How about an inline function along the lines of:

acpi_set_build_dev_aml(DeviceClass *dc, ....)

the build function itself is static, so compiler will
remove it if unused.


> @@ -85,6 +123,10 @@ static const TypeInfo pvpanic_isa_info = {
>      .instance_size = sizeof(PVPanicISAState),
>      .instance_init = pvpanic_isa_initfn,
>      .class_init    = pvpanic_isa_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_ACPI_DEV_AML_IF },
> +        { },
> +    },
>  };
>  
>  static void pvpanic_register_types(void)
> -- 
> 2.31.1


