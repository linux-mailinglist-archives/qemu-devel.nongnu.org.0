Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C3C623604
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 22:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ossqW-0002gw-Ut; Wed, 09 Nov 2022 16:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ossqU-0002gY-R7
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 16:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ossqS-00020L-4R
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 16:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668030170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TdA2fef+AVyhJXVE3vxrfPShYURFeg5S5/ImuosnI04=;
 b=H4kna4ELUT9smYRsjr6v5ZA0MR0AhosffrUUs2oe3u9SGPn8KZ6FuAXjF9IANqjBiogiJ6
 iq8lWuJo6NWxsqgZj96R9nkFJpHk3kb1tZNDSavcuyf3tQHA+V4sfAtevaaHWevOEZEsrx
 xMU/TDS5xpgkINF6zxwnH4/Om3cvsRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-ufizAKsyPZGgl9_ka-L57A-1; Wed, 09 Nov 2022 16:42:49 -0500
X-MC-Unique: ufizAKsyPZGgl9_ka-L57A-1
Received: by mail-wm1-f69.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso1593673wms.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 13:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdA2fef+AVyhJXVE3vxrfPShYURFeg5S5/ImuosnI04=;
 b=RC9orRx1lqFOEekliZAk9nv1jAcX0o786LEhpSnX0rv4duV8S5qweDjmWeymiUV9V+
 l3bjJp3bUWcyw5UHmv4gKrX0EjIC3RGceg4+ITo13gH1RMPe/Nua+e4Mrn55f0GUcdMq
 KgNZVYPnp+gQBXEh95GtHQiB5kiIw4UVVmXqyxoLgsqIlbSxbcQG1t3F8BPbpy2E6Br/
 yGa7yBMFoh/dsFIinzxoDwC6FrpAM4ucjtvGZFPqiJvttFANsRIBQDmnhvCsx/hvXjEd
 W58ycpwxXVMx0jjbhCdzsS7HMfexcDDQBdeWoIQA7k+nlw5SlJQayL1kLTmYs0DVnTWh
 pMQQ==
X-Gm-Message-State: ACrzQf1KfbNlsFkZkBsyIch87+ulhUdHDAWc2B3Zaa0ObEvVe73K6EAt
 ySzFdTBVYmGlnV8ke5J7E8zCVtRl3hb6gbGGgvVXctuz0bXcUheg+PQsD6upitrnoyQW4l6qutx
 55zfvFTX+c2EYXb8=
X-Received: by 2002:a05:600c:a14:b0:3cf:a41d:8418 with SMTP id
 z20-20020a05600c0a1400b003cfa41d8418mr637795wmp.190.1668030167910; 
 Wed, 09 Nov 2022 13:42:47 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5UAzGyVToRKGf2pY3kJc9CAw1hmtUf0RovBalbReWLNOM2htlg+ZdyYRFVqD+IBTksgT7iKw==
X-Received: by 2002:a05:600c:a14:b0:3cf:a41d:8418 with SMTP id
 z20-20020a05600c0a1400b003cfa41d8418mr637792wmp.190.1668030167521; 
 Wed, 09 Nov 2022 13:42:47 -0800 (PST)
Received: from redhat.com ([2.52.23.68]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b002364c77bc96sm14485330wrp.33.2022.11.09.13.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 13:42:46 -0800 (PST)
Date: Wed, 9 Nov 2022 16:42:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL v4 44/83] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
Message-ID: <20221109162607-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-45-mst@redhat.com>
 <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 09, 2022 at 06:39:27PM +0100, Laurent Vivier wrote:
> This one breaks something for me:
> 
> [3/65] Compiling C object libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o
> FAILED: libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o
> clang -m64 -mcx16 -Ilibhw-display-virtio-vga-gl.a.p -I.
> -I../../../Projects/qemu-upstream -Iqapi -Itrace -Iui -Iui/shader
> -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
> -I/usr/include/sysprof-4 -fcolor-diagnostics -Wall -Winvalid-pch -Werror
> -std=gnu11 -O2 -g -isystem
> /home/lvivier/Projects/qemu-upstream/linux-headers -isystem linux-headers
> -iquote . -iquote /home/lvivier/Projects/qemu-upstream -iquote
> /home/lvivier/Projects/qemu-upstream/include -iquote
> /home/lvivier/Projects/qemu-upstream/tcg/i386 -pthread -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
> -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition
> -Wno-tautological-type-limit-compare -Wno-psabi
> -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
> -fsanitize=address -fPIC -DBUILD_DSO -MD -MQ
> libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o -MF
> libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o.d -o
> libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o -c
> ../../../Projects/qemu-upstream/hw/display/acpi-vga.c
> In file included from ../../../Projects/qemu-upstream/hw/display/acpi-vga.c:4:
> In file included from ../../../Projects/qemu-upstream/hw/display/vga_int.h:30:
> In file included from /home/lvivier/Projects/qemu-upstream/include/ui/console.h:4:
> /home/lvivier/Projects/qemu-upstream/include/ui/qemu-pixman.h:12:10: fatal
> error: 'pixman.h' file not found
> #include <pixman.h>
>          ^~~~~~~~~~
> 1 error generated.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:165: run-ninja] Error 1
> make: Leaving directory '/home/lvivier/Objects/qemu-upstream/x86_64'
> 
> Any idea?
> 
> my configure is:
> 
> configure' '--disable-docs' '--target-list=x86_64-softmmu'
> '--enable-modules' '--disable-spice' '--enable-docs'
> 
> path to pixman.h is:
> 
> /usr/include/pixman-1/pixman.h
> 
> Thanks,
> Laurent
> 
> On 11/7/22 23:51, Michael S. Tsirkin wrote:
> > From: Igor Mammedov <imammedo@redhat.com>
> > 
> > NB:
> > We do not expect any functional change in any ACPI tables with this
> > change. It's only a refactoring.
> > 
> > NB2:
> > Some targets (or1k) do not support acpi and CONFIG_ACPI is off for them.
> > However, modules are reused between all architectures so CONFIG_ACPI is
> > on.  For those architectures, dummy stub function definitions help to
> > resolve symbols.  This change uses more of these and so it adds a couple
> > of dummy stub definitions so that symbols for those can be resolved.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > CC: Bernhard Beschow <shentey@gmail.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > Message-Id: <20221107152744.868434-1-ani@anisinha.ca>
> > ---
> >   hw/display/vga_int.h       |  2 ++
> >   hw/acpi/aml-build-stub.c   | 10 ++++++++++
> >   hw/display/acpi-vga-stub.c |  7 +++++++
> >   hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
> >   hw/display/vga-pci.c       |  4 ++++
> >   hw/i386/acpi-build.c       | 26 +-------------------------
> >   hw/display/meson.build     | 17 +++++++++++++++++
> >   7 files changed, 67 insertions(+), 25 deletions(-)
> >   create mode 100644 hw/display/acpi-vga-stub.c
> >   create mode 100644 hw/display/acpi-vga.c
> > 
> > diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> > index 305e700014..330406ad9c 100644
> > --- a/hw/display/vga_int.h
> > +++ b/hw/display/vga_int.h
> > @@ -30,6 +30,7 @@
> >   #include "ui/console.h"
> >   #include "hw/display/bochs-vbe.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> >   #define ST01_V_RETRACE      0x08
> >   #define ST01_DISP_ENABLE    0x01
> > @@ -195,4 +196,5 @@ void pci_std_vga_mmio_region_init(VGACommonState *s,
> >                                     MemoryRegion *subs,
> >                                     bool qext, bool edid);
> > +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope);
> >   #endif
> > diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
> > index 8d8ad1a314..89a8fec4af 100644
> > --- a/hw/acpi/aml-build-stub.c
> > +++ b/hw/acpi/aml-build-stub.c
> > @@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
> >   {
> >   }
> > +Aml *aml_return(Aml *val)
> > +{
> > +    return NULL;
> > +}
> > +
> > +Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag)
> > +{
> > +    return NULL;
> > +}
> > +
> >   Aml *aml_resource_template(void)
> >   {
> >       return NULL;
> > diff --git a/hw/display/acpi-vga-stub.c b/hw/display/acpi-vga-stub.c
> > new file mode 100644
> > index 0000000000..a9b0ecf76d
> > --- /dev/null
> > +++ b/hw/display/acpi-vga-stub.c
> > @@ -0,0 +1,7 @@
> > +#include "qemu/osdep.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> > +#include "vga_int.h"
> > +
> > +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
> > +{
> > +}
> > diff --git a/hw/display/acpi-vga.c b/hw/display/acpi-vga.c
> > new file mode 100644
> > index 0000000000..f0e9ef1fcf
> > --- /dev/null
> > +++ b/hw/display/acpi-vga.c
> > @@ -0,0 +1,26 @@
> > +#include "qemu/osdep.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> > +#include "hw/pci/pci.h"
> > +#include "vga_int.h"
> > +
> > +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
> > +{
> > +    int s3d = 0;
> > +    Aml *method;
> > +
> > +    if (object_dynamic_cast(OBJECT(adev), "qxl-vga")) {
> > +        s3d = 3;
> > +    }
> > +
> > +    method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
> > +    aml_append(method, aml_return(aml_int(0)));
> > +    aml_append(scope, method);
> > +
> > +    method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
> > +    aml_append(method, aml_return(aml_int(0)));
> > +    aml_append(scope, method);
> > +
> > +    method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
> > +    aml_append(method, aml_return(aml_int(s3d)));
> > +    aml_append(scope, method);
> > +}
> > diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> > index 3e5bc259f7..9a91de7ed1 100644
> > --- a/hw/display/vga-pci.c
> > +++ b/hw/display/vga-pci.c
> > @@ -35,6 +35,7 @@
> >   #include "hw/loader.h"
> >   #include "hw/display/edid.h"
> >   #include "qom/object.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> >   enum vga_pci_flags {
> >       PCI_VGA_FLAG_ENABLE_MMIO = 1,
> > @@ -354,11 +355,13 @@ static void vga_pci_class_init(ObjectClass *klass, void *data)
> >   {
> >       DeviceClass *dc = DEVICE_CLASS(klass);
> >       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> > +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
> >       k->vendor_id = PCI_VENDOR_ID_QEMU;
> >       k->device_id = PCI_DEVICE_ID_QEMU_VGA;
> >       dc->vmsd = &vmstate_vga_pci;
> >       set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> > +    adevc->build_dev_aml = build_vga_aml;
> >   }
> >   static const TypeInfo vga_pci_type_info = {
> > @@ -369,6 +372,7 @@ static const TypeInfo vga_pci_type_info = {
> >       .class_init = vga_pci_class_init,
> >       .interfaces = (InterfaceInfo[]) {
> >           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > +        { TYPE_ACPI_DEV_AML_IF },
> >           { },
> >       },
> >   };
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 4f54b61904..26932b4e2c 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -430,7 +430,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >           bool hotpluggbale_slot = false;
> >           bool bridge_in_acpi = false;
> >           bool cold_plugged_bridge = false;
> > -        bool is_vga = false;
> >           if (pdev) {
> >               pc = PCI_DEVICE_GET_CLASS(pdev);
> > @@ -440,8 +439,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >                   continue;
> >               }
> > -            is_vga = pc->class_id == PCI_CLASS_DISPLAY_VGA;
> > -
> >               /*
> >                * Cold plugged bridges aren't themselves hot-pluggable.
> >                * Hotplugged bridges *are* hot-pluggable.
> > @@ -489,28 +486,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> >               aml_append(dev, aml_pci_device_dsm());
> >           }
> > -        if (is_vga) {
> > -            /* add VGA specific AML methods */
> > -            int s3d;
> > -
> > -            if (object_dynamic_cast(OBJECT(pdev), "qxl-vga")) {
> > -                s3d = 3;
> > -            } else {
> > -                s3d = 0;
> > -            }
> > -
> > -            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
> > -            aml_append(method, aml_return(aml_int(0)));
> > -            aml_append(dev, method);
> > -
> > -            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
> > -            aml_append(method, aml_return(aml_int(0)));
> > -            aml_append(dev, method);
> > -
> > -            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
> > -            aml_append(method, aml_return(aml_int(s3d)));
> > -            aml_append(dev, method);
> > -        }
> > +        call_dev_aml_func(DEVICE(pdev), dev);
> >           bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
> >           if (bridge_in_acpi) {
> > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > index adc53dd8b6..7a725ed80e 100644
> > --- a/hw/display/meson.build
> > +++ b/hw/display/meson.build
> > @@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
> >   specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> > +if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> > +    config_all_devices.has_key('CONFIG_VGA_PCI') or
> > +    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
> > +    config_all_devices.has_key('CONFIG_ATI_VGA')
> > +   )
> > +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > +                                      if_false: files('acpi-vga-stub.c'))
> > +endif

Igor what does  CONFIG_ACPI mean? It depends on the target but this
library is target independent. Is this just always built then?

> > +
> >   if config_all_devices.has_key('CONFIG_QXL')
> >     qxl_ss = ss.source_set()
> >     qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
> >                                              pixman, spice])
> > +  qxl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > +                                  if_false: files('acpi-vga-stub.c'))
> >     hw_display_modules += {'qxl': qxl_ss}
> >   endif
> > @@ -52,6 +63,7 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
> >   softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
> > +
> >   if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
> >     virtio_gpu_ss = ss.source_set()
> >     virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
> > @@ -87,14 +99,19 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
> >                       if_true: [files('virtio-vga.c'), pixman])
> >     virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
> >                       if_true: files('vhost-user-vga.c'))
> > +  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > +                                         if_false: files('acpi-vga-stub.c'))
> >     hw_display_modules += {'virtio-vga': virtio_vga_ss}
> >     virtio_vga_gl_ss = ss.source_set()
> >     virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
> >                          if_true: [files('virtio-vga-gl.c'), pixman])
> > +  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> > +                                            if_false: files('acpi-vga-stub.c'))
> >     hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
> >   endif
> >   specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
> > +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
> >   modules += { 'hw-display': hw_display_modules }




Does the following help? It seems like a worthwile cleanup anyway.


diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 330406ad9c..7cf0d11201 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -27,7 +27,6 @@
 
 #include "exec/ioport.h"
 #include "exec/memory.h"
-#include "ui/console.h"
 
 #include "hw/display/bochs-vbe.h"
 #include "hw/acpi/acpi_aml_interface.h"
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6d4e6d9708..688408e048 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -132,6 +132,8 @@ typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
 typedef struct DumpState DumpState;
+typedef struct GraphicHwOps GraphicHwOps;
+typedef struct QEMUCursor QEMUCursor;
 
 /*
  * Pointer types
diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index 692bec91de..7d786653e8 100644
--- a/hw/display/ati_2d.c
+++ b/hw/display/ati_2d.c
@@ -12,6 +12,7 @@
 #include "ati_regs.h"
 #include "qemu/log.h"
 #include "ui/pixel_ops.h"
+#include "ui/console.h"
 
 /*
  * NOTE:
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 2577005d03..4cc3567c69 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -45,6 +45,7 @@
 #include "ui/pixel_ops.h"
 #include "cirrus_vga_internal.h"
 #include "qom/object.h"
+#include "ui/console.h"
 
 /*
  * TODO:
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 96144bd690..84be51670e 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -31,6 +31,7 @@
 #include "hw/isa/isa.h"
 #include "cirrus_vga_internal.h"
 #include "qom/object.h"
+#include "ui/console.h"
 
 #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISACirrusVGAState, ISA_CIRRUS_VGA)
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 46abbc5653..2a5437d803 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -32,6 +32,7 @@
 #include "qemu/timer.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
+#include "ui/console.h"
 #include "qom/object.h"
 
 #define TYPE_ISA_VGA "isa-vga"
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 75dfcedea5..cd2c46776d 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -27,6 +27,7 @@
 #include "hw/sysbus.h"
 #include "hw/display/vga.h"
 #include "hw/qdev-properties.h"
+#include "ui/console.h"
 #include "vga_int.h"
 
 /*
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 9a91de7ed1..df23dbf3a0 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -30,6 +30,7 @@
 #include "migration/vmstate.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
+#include "ui/console.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/loader.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 50ecb1ad02..0cb26a791b 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -31,6 +31,7 @@
 #include "vga_int.h"
 #include "vga_regs.h"
 #include "ui/pixel_ops.h"
+#include "ui/console.h"
 #include "qemu/timer.h"
 #include "hw/xen/xen.h"
 #include "migration/vmstate.h"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index cedbbde522..53949d2539 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -33,6 +33,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "ui/console.h"
 
 #undef VERBOSE
 #define HW_RECT_ACCEL


