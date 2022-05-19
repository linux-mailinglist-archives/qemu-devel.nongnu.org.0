Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C852DC6E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:09:38 +0200 (CEST)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkaf-0001VG-5q
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrkNz-00029f-MZ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrkNw-0003g5-5v
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652982987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SsTZoX2bwKTrCHD08JXmVcitY2fQqIfRa/uQUDTWlLg=;
 b=dcJIyFlkGui5od07i0ocfL1SRecYx8WgcWPwVgEBaAIzpKxJRJAGj/6wBWZTkBQa891WDA
 krm5r2lMCBX7AwTyTA8P+CCD4V7WBWwiUzzqS8/ixXDReoEuCva0ovjqhV2PrfRd7rPORZ
 9klIq/N3vUn22UWHkGhxAY2E2XbF3Wg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-hprbpoL_M-CR48B1EL-KzA-1; Thu, 19 May 2022 13:56:25 -0400
X-MC-Unique: hprbpoL_M-CR48B1EL-KzA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r83-20020a1c4456000000b003972daa86deso879865wma.4
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SsTZoX2bwKTrCHD08JXmVcitY2fQqIfRa/uQUDTWlLg=;
 b=L9i50ED91HmdtIl5+cuEml72EtB8vana3sNB8c8girQLUUadRhWvTpPZvtgdMf9bb3
 4oythzMgZKZ/0tSd4p+XhwO0/AWkAmNqYJwgWQygYMEJZtaRkVllFLWeETF3Jbezwhzf
 JPmqecgZdSwRYw1N2oHtv3nhayuXpFVtLV4iX8NbfSUaYteiLSqo6sSayTDtDuWOVzR8
 nRWsyQ1TGNUp8lE1lUxrMI4ec5G0YLhFwNIzj3pHr5tHz6XEVKV/g6qLKiphPePywEsb
 iPgwKue8c0HXPDy/hMEuA0iO92ZY9SHmcDX8KF5RcWrHiHn0mWc6hCdAyRshVLb5e1Pk
 tD/Q==
X-Gm-Message-State: AOAM532CxEo/TeykoZ0ps6OmlcQXwLMSF6Jn/vxpdKs67d3gJYqRYNX0
 XkVrMKHNrebLhuO/VUxi0AuUiIegX3Y8uX41R+6z0DIx7GHd0gvgPEdUsok6KciXB1Cpt7ZDd6d
 0sEDU5P9pYAMCxCs=
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr5080925wrf.678.1652982984210; 
 Thu, 19 May 2022 10:56:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDV0EFxTAm8Tf4iK9IwPtz3ih0xNaDgiYHV1DRJbcc/MN7FUJwCM6QwTCriso06F2sabrLfg==
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr5080909wrf.678.1652982983891; 
 Thu, 19 May 2022 10:56:23 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a1c7508000000b003942a244f2fsm216584wmc.8.2022.05.19.10.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:56:23 -0700 (PDT)
Date: Thu, 19 May 2022 19:56:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 28/35] acpi: pvpanic-isa: use
 AcpiDevAmlIfClass:build_dev_aml to provide device's AML
Message-ID: <20220519195621.121bfbb8@redhat.com>
In-Reply-To: <20220516163547-mutt-send-email-mst@kernel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-29-imammedo@redhat.com>
 <20220516163547-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 16 May 2022 16:46:29 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, May 16, 2022 at 11:26:03AM -0400, Igor Mammedov wrote:
> > .. and clean up not longer needed conditionals in DSTD build code
> > pvpanic-isa AML will be fetched and included when ISA bridge will
> > build its own AML code (including attached devices).
> > 
> > Expected AML change:
> >    the device under separate _SB.PCI0.ISA scope is moved directly
> >    under Device(ISA) node.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/misc/pvpanic.h |  9 ---------
> >  hw/i386/acpi-build.c      | 37 ----------------------------------
> >  hw/misc/pvpanic-isa.c     | 42 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 42 insertions(+), 46 deletions(-)
> > 
> > diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
> > index 7f16cc9b16..e520566ab0 100644
> > --- a/include/hw/misc/pvpanic.h
> > +++ b/include/hw/misc/pvpanic.h
> > @@ -33,13 +33,4 @@ struct PVPanicState {
> >  
> >  void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size);
> >  
> > -static inline uint16_t pvpanic_port(void)
> > -{
> > -    Object *o = object_resolve_path_type("", TYPE_PVPANIC_ISA_DEVICE, NULL);
> > -    if (!o) {
> > -        return 0;
> > -    }
> > -    return object_property_get_uint(o, PVPANIC_IOPORT_PROP, NULL);
> > -}
> > -
> >  #endif
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 517818cd9f..a42f41f373 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -30,7 +30,6 @@
> >  #include "hw/pci/pci.h"
> >  #include "hw/core/cpu.h"
> >  #include "target/i386/cpu.h"
> > -#include "hw/misc/pvpanic.h"
> >  #include "hw/timer/hpet.h"
> >  #include "hw/acpi/acpi-defs.h"
> >  #include "hw/acpi/acpi.h"
> > @@ -117,7 +116,6 @@ typedef struct AcpiMiscInfo {
> >  #endif
> >      const unsigned char *dsdt_code;
> >      unsigned dsdt_size;
> > -    uint16_t pvpanic_port;
> >  } AcpiMiscInfo;
> >  
> >  typedef struct AcpiBuildPciBusHotplugState {
> > @@ -302,7 +300,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
> >  #ifdef CONFIG_TPM
> >      info->tpm_version = tpm_get_version(tpm_find());
> >  #endif
> > -    info->pvpanic_port = pvpanic_port();
> >  }
> >  
> >  /*
> > @@ -1749,40 +1746,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >          aml_append(dsdt, scope);
> >      }
> >  
> > -    if (misc->pvpanic_port) {
> > -        scope = aml_scope("\\_SB.PCI0.ISA");
> > -
> > -        dev = aml_device("PEVT");
> > -        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> > -
> > -        crs = aml_resource_template();
> > -        aml_append(crs,
> > -            aml_io(AML_DECODE16, misc->pvpanic_port, misc->pvpanic_port, 1, 1)
> > -        );
> > -        aml_append(dev, aml_name_decl("_CRS", crs));
> > -
> > -        aml_append(dev, aml_operation_region("PEOR", AML_SYSTEM_IO,
> > -                                              aml_int(misc->pvpanic_port), 1));
> > -        field = aml_field("PEOR", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
> > -        aml_append(field, aml_named_field("PEPT", 8));
> > -        aml_append(dev, field);
> > -
> > -        /* device present, functioning, decoding, shown in UI */
> > -        aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> > -
> > -        method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
> > -        aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
> > -        aml_append(method, aml_return(aml_local(0)));
> > -        aml_append(dev, method);
> > -
> > -        method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
> > -        aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
> > -        aml_append(dev, method);
> > -
> > -        aml_append(scope, dev);
> > -        aml_append(dsdt, scope);
> > -    }
> > -
> >      sb_scope = aml_scope("\\_SB");
> >      {
> >          Object *pci_host;
> > diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
> > index b84d4d458d..ccec50f61b 100644
> > --- a/hw/misc/pvpanic-isa.c
> > +++ b/hw/misc/pvpanic-isa.c
> > @@ -22,6 +22,7 @@
> >  #include "qom/object.h"
> >  #include "hw/isa/isa.h"
> >  #include "standard-headers/linux/pvpanic.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> >  
> >  OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
> >  
> > @@ -63,6 +64,41 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
> >      isa_register_ioport(d, &ps->mr, s->ioport);
> >  }
> >  
> > +static void build_pvpanic_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
> > +{
> > +    Aml *crs, *field, *method;
> > +    PVPanicISAState *s = PVPANIC_ISA_DEVICE(adev);
> > +    Aml *dev = aml_device("PEVT");
> > +
> > +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> > +
> > +    crs = aml_resource_template();
> > +    aml_append(crs,
> > +        aml_io(AML_DECODE16, s->ioport, s->ioport, 1, 1)
> > +    );
> > +    aml_append(dev, aml_name_decl("_CRS", crs));
> > +
> > +    aml_append(dev, aml_operation_region("PEOR", AML_SYSTEM_IO,
> > +                                          aml_int(s->ioport), 1));
> > +    field = aml_field("PEOR", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
> > +    aml_append(field, aml_named_field("PEPT", 8));
> > +    aml_append(dev, field);
> > +
> > +    /* device present, functioning, decoding, shown in UI */
> > +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> > +
> > +    method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
> > +    aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
> > +    aml_append(method, aml_return(aml_local(0)));
> > +    aml_append(dev, method);
> > +
> > +    method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
> > +    aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
> > +    aml_append(dev, method);
> > +
> > +    aml_append(scope, dev);
> > +}
> > +
> >  static Property pvpanic_isa_properties[] = {
> >      DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
> >      DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
> > @@ -73,10 +109,12 @@ static Property pvpanic_isa_properties[] = {
> >  static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> > +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
> >  
> >      dc->realize = pvpanic_isa_realizefn;
> >      device_class_set_props(dc, pvpanic_isa_properties);
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> > +    adevc->build_dev_aml = build_pvpanic_isa_aml;
> >  }
> >  
> >  static const TypeInfo pvpanic_isa_info = {  
> 
> 
> So this really makes the device depend on ACPI.
> What if the device is also built for a platform without ACPI?
> Looks like it will fail to build.
> 
> E.g. mips has ISA too. What if one was to add pvpanic there?

it turns out meson somehow figures out dependency and pulls in
CONFIG_ACPI implicitly for mips (well and the same for a bunch
of other targets where acpi doesn't have any stake).

> I am not sure how important this is at the moment, but
> I think the APIs should support this cleanly.
> 
> How about an inline function along the lines of:
> 
> acpi_set_build_dev_aml(DeviceClass *dc, ....)

current docs/devel/build-system.rst suggests using
stubs for conditional code (it even uses CONFIG_ACPI
as example of such usage)

> the build function itself is static, so compiler will
> remove it if unused.

what you are essentially suggesting is to make target
in-depended file (that is built once. ex: fdc-isa)
into several target dependent builds (due to dependency
on build_aml_foo() symbol). While stubs allow to keep
file independent by substituting build_aml_foo() with
dummy stub. So I'm not sure we would like go that route.

Anyways, I did try to give it a shot and failed,
or maybe I misunderstood your idea completely 

resistance I've met:
  - CONFIG_ACPI define is poisoned (hacked around it,
    pretty sure in wrong way)

  - couldn't figure out meson.build rule that depends on several symbols yet
    (meson docs suggest it's possble)
      (i.e. add/build new fdc-isa-acpi.c file if both CONFIG_FDC_ISA & CONFIG_ACPI defined)
    we can use only CONFIG_ACPI and hope that linker will discard object file
    as unused if target has ACPI but does not have CONFIG_FDC_ISA (it's still
    lost build time on use-less object).

  - CONFIG_ACPI is not visible for target in-depended devices
          gave up here ...

my ugly attempt is here:
 https://gitlab.com/imammedo/qemu/-/commit/9cb126c903a72582ac2f1643664b06414e25e0af


> > @@ -85,6 +123,10 @@ static const TypeInfo pvpanic_isa_info = {
> >      .instance_size = sizeof(PVPanicISAState),
> >      .instance_init = pvpanic_isa_initfn,
> >      .class_init    = pvpanic_isa_class_init,
> > +    .interfaces = (InterfaceInfo[]) {
> > +        { TYPE_ACPI_DEV_AML_IF },
> > +        { },
> > +    },
> >  };
> >  
> >  static void pvpanic_register_types(void)
> > -- 
> > 2.31.1  
> 


