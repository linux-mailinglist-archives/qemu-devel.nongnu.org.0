Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0367529C1E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:17:55 +0200 (CEST)
Received: from localhost ([::1]:55404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsOw-0002VQ-MX
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nqsLB-0000yj-JI
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nqsL9-0007oR-KU
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652775238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LzEF+8mIIgH9S4Kx2KLU9EtcvysDYfr3wd21Lk5J80M=;
 b=QQa5F2Qb9KlmbfcliTSzqJqzjrAr3T9rafm3GS9saUmWAHL6mV1EUBB7FWAZKEyQeN+Ydw
 EjK0y3cHxw2p7FiqlFkPf3uG6LLfTgLkp0k5vlNaZNhhu8Wpk3zypLYCocH7zv9Sxjaux3
 r42WQIiSsBVgHV0CCBqcm7ZEOEnQGII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-aanilCvpOiCUgInq_cw-iA-1; Tue, 17 May 2022 04:13:53 -0400
X-MC-Unique: aanilCvpOiCUgInq_cw-iA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2913D1D96CA8;
 Tue, 17 May 2022 08:13:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B512B573C2B;
 Tue, 17 May 2022 08:13:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CC7518003A2; Tue, 17 May 2022 10:13:51 +0200 (CEST)
Date: Tue, 17 May 2022 10:13:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 ani@anisinha.ca, minyard@acm.org, stefanb@linux.vnet.ibm.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH 28/35] acpi: pvpanic-isa: use
 AcpiDevAmlIfClass:build_dev_aml to provide device's AML
Message-ID: <20220517081351.vnx2xryjxason3dd@sirius.home.kraxel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-29-imammedo@redhat.com>
 <20220516163547-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516163547-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Mon, May 16, 2022 at 04:46:29PM -0400, Michael S. Tsirkin wrote:
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

That problem isn't new and we already have a bunch of aml_* stubs
because of that.  I expect it'll work just fine, at worst we'll
have to add a stub or two in case some calls are not covered yet.

take care,
  Gerd


